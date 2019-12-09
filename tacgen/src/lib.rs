mod info;

use syntax::{ast::*, ty::*, ScopeOwner};
use ::tac::{self, *, Tac::{self, *}, Operand::*, Intrinsic::*};
use common::{Ref, MAIN_METHOD, BinOp::*, UnOp::*, IndexMap, HashMap, LENGTH};
use typed_arena::Arena;
use crate::info::*;

struct TacGen<'a> {
    // `reg_num` and `label_num` are manually set at the beginning of every function
    reg_num: u32,
    label_num: u32,
    loop_stk: Vec<u32>,
    // Id & Index will behave differently when they are the lhs of an assignment
    // cur_assign contains the current assign rhs operand, or None if the current handling expr doesn't involve in assign
    cur_assign: Option<Operand>,
    // `*_info` just works like extra fields to those structs, their specific meaning can be found at `struct *Info`
    var_info: HashMap<Ref<'a, VarDef<'a>>, VarInfo>,
    func_info: HashMap<Ref<'a, FuncDef<'a>>, FuncInfo>,
    entry_func_info: HashMap<Ref<'a, FuncDef<'a>>, EntryFuncInfo>,
    len_func_idx: u32,
    // array length function's index in the tac program
    // eg: int() f = fun() => 1;
    class_info: HashMap<Ref<'a, ClassDef<'a>>, ClassInfo<'a>>,
    cur_lambdas: Vec<&'a Lambda<'a>>,
    // lambda stack
    alloc: &'a Arena<TacNode<'a>>,
    tac_program: TacProgram<'a>,
    cur_lambda_idx: u32,
    lambda_tacs: Vec<TacFunc<'a>>, // only for inserting lambdas
}

pub fn work<'a>(p: &'a Program<'a>, alloc: &'a Arena<TacNode<'a>>) -> TacProgram<'a> {
    let tg = TacGen::new(alloc);
    tg.program(p)
}

impl<'a> TacGen<'a> {
    fn new(alloc: &'a Arena<TacNode<'a>>) -> TacGen<'a> {
        TacGen {
            reg_num: 0,
            label_num: 0,
            loop_stk: vec![],
            cur_assign: None,
            var_info: Default::default(),
            func_info: Default::default(),
            entry_func_info: Default::default(),
            len_func_idx: 0,
            class_info: Default::default(),
            cur_lambdas: vec![],
            alloc: alloc,
            tac_program: Default::default(),
            cur_lambda_idx: 0,
            lambda_tacs: Default::default(),
        }
    }

    fn program(mut self, p: &Program<'a>) -> TacProgram<'a> {
        let main_func = p.main.get().unwrap();
        // resolve member fields of all classes, and generate constructors for them
        for (idx, &c) in p.class.iter().enumerate() {
            self.define_str(c.name);
            self.resolve_field(c);
            self.class_info.get_mut(&Ref(c)).unwrap().idx = idx as u32;
            let new = self.build_new(c);
            self.tac_program.func.push(new);
        }
        // generate array's length function:
        self.len_func_idx = self.tac_program.func.len() as u32;
        let len_tac = self.build_length();
        self.tac_program.func.push(len_tac);
        {
            let mut idx = self.tac_program.func.len() as u32; // there are already some `_Xxx._new` functions in self.tac_program.func, so can't start from 0
            for &c in &p.class {
                for &f in &c.field {
                    if let FieldDef::FuncDef(f) = f {
                        self.func_info.get_mut(&Ref(f)).unwrap().idx = idx;
                        idx += 1;
                        // create accompanied entry function info:
                        self.entry_func_info.insert(Ref(f), EntryFuncInfo { idx });
                        idx += 1;
                    }
                }
            }
            self.cur_lambda_idx = idx; // lambda index starts from here
            for &c in &p.class {
                for f in &c.field {
                    if let FieldDef::FuncDef(fd) = f {
                        let func_tac = self.build_func(fd, main_func);
                        self.tac_program.func.push(func_tac);
                        // generate tac of entry function inline:
                        let entry_tac = self.build_func_entry(fd, main_func);
                        self.tac_program.func.push(entry_tac);
                    }
                }
            }
        }
        for &c in &p.class {
            self.tac_program.vtbl.push(tac::VTbl {
                parent: c.parent_ref.get().map(|p| self.class_info[&Ref(p)].idx),
                class: c.name,
                func: self.class_info[&Ref(c)].vtbl.iter().map(|(_, &f)| self.func_info[&Ref(f)].idx).collect(),
            });
        }
        for lambda in self.lambda_tacs { // concatenate lambda functions at last
            self.tac_program.func.push(lambda);
        }
        self.tac_program
    }

    fn block(&mut self, b: &'a Block<'a>, f: &mut TacFunc<'a>) {
        for s in &b.stmt { self.stmt(s, f); }
    }

    fn stmt(&mut self, s: &'a Stmt<'a>, f: &mut TacFunc<'a>) {
        use StmtKind::*;
        match &s.kind {
            Assign(a) => {
                self.cur_assign = Some(self.expr(&a.src, f));
                self.expr(&a.dst, f);
            }
            LocalVarDef(v) => {
                let reg = self.reg();
                self.var_info.insert(Ref(v), VarInfo { off: reg });
                let init = v.init.as_ref().map(|(_, e)| self.expr(e, f)).unwrap_or(Const(0));
                f.push(Tac::Assign { dst: reg, src: [init] });
            }
            ExprEval(e) => { self.expr(e, f); }
            Skip(_) => {}
            If(i) => {
                let before_else = self.label();
                let cond = self.expr(&i.cond, f);
                f.push(Jif { label: before_else, z: true, cond: [cond] });
                self.block(&i.on_true, f);
                if let Some(of) = &i.on_false {
                    let after_else = self.label();
                    f.push(Jmp { label: after_else });
                    f.push(Label { label: before_else });
                    self.block(of, f);
                    f.push(Label { label: after_else });
                } else {
                    f.push(Label { label: before_else });
                }
            }
            While(w) => {
                //   jump before_cond
                // before_body:
                //   body
                // before_cond:
                //   compute cond
                //   if cond jump before_body
                // after_body: (for break's use)
                let (before_cond, before_body, after_body) = (self.label(), self.label(), self.label());
                self.loop_stk.push(after_body);
                f.push(Jmp { label: before_cond });
                f.push(Label { label: before_body });
                self.block(&w.body, f);
                f.push(Label { label: before_cond });
                let cond = self.expr(&w.cond, f);
                f.push(Jif { label: before_body, z: false, cond: [cond] });
                f.push(Label { label: after_body });
                self.loop_stk.pop();
            }
            For(fo) => {
                // init
                //   jump before_cond
                // before_body:
                //   body
                //   update
                // before_cond:
                //   compute cond
                //   if cond jump before_body
                // after_body: (for break's use)
                let (before_cond, before_body, after_body) = (self.label(), self.label(), self.label());
                self.loop_stk.push(after_body);
                self.stmt(&fo.init, f);
                f.push(Jmp { label: before_cond });
                f.push(Label { label: before_body });
                self.block(&fo.body, f);
                self.stmt(&fo.update, f);
                f.push(Label { label: before_cond });
                let cond = self.expr(&fo.cond, f);
                f.push(Jif { label: before_body, z: false, cond: [cond] });
                f.push(Label { label: after_body });
                self.loop_stk.pop();
            }
            Return(r) => {
                let src = r.as_ref().map(|e| [self.expr(e, f)]);
                f.push(Ret { src });
            }
            Print(p) => for e in p {
                let reg = self.expr(e, f);
                f.push(Param { src: [reg] });
                match e.ty.get() {
                    t if t == Ty::int() => { self.intrinsic(_PrintInt, f); }
                    t if t == Ty::bool() => { self.intrinsic(_PrintBool, f); }
                    t if t == Ty::string() => { self.intrinsic(_PrintString, f); }
                    t => unreachable!("Shouldn't meet type {:?} in Print in these phase, type checking should have reported error.", t),
                }
            }
            Break(_) => { f.push(Jmp { label: *self.loop_stk.last().unwrap_or_else(|| unimplemented!()) }); }
            Block(b) => self.block(b, f),
        }
    }

    fn expr(&mut self, e: &'a Expr<'a>, f: &mut TacFunc<'a>) -> Operand {
        use ExprKind::*;
        let assign = self.cur_assign.take();
        match &e.kind {
            VarSel(vs) => self.var_sel(vs, assign, f),
            IndexSel(i) => {
                let (arr, idx) = (self.expr(&i.arr, f), self.expr(&i.idx, f));
                let (ok, len, cmp) = (self.reg(), self.length(arr, f), self.reg());
                let (err, after) = (self.label(), self.label());
                f.push(Bin { op: Ge, dst: ok, lr: [idx, Const(0)] })
                    .push(Bin { op: Lt, dst: cmp, lr: [idx, len] })
                    .push(Bin { op: And, dst: ok, lr: [Reg(ok), Reg(cmp)] })
                    .push(Jif { label: err, z: true, cond: [Reg(ok)] });
                // range check passed if reach here
                let off = self.reg();
                f.push(Bin { op: Mul, dst: off, lr: [idx, Const(INT_SIZE)] })
                    .push(Bin { op: Add, dst: off, lr: [Reg(off), arr] });
                let ret = if let Some(src) = assign {
                    f.push(Store { src_base: [src, Reg(off)], off: 0, hint: MemHint::Arr });
                    Reg(0)
                } else {
                    let dst = self.reg();
                    f.push(Load { dst, base: [Reg(off)], off: 0, hint: MemHint::Arr });
                    Reg(dst)
                };
                f.push(Jmp { label: after });
                self.re(INDEX_OUT_OF_BOUND, f.push(Label { label: err }));
                f.push(Label { label: after });
                ret
            }
            IntLit(i) => Const(*i),
            BoolLit(b) => Const(*b as i32),
            StringLit(s) => {
                let dst = self.reg();
                f.push(LoadStr { dst, s: self.define_str(s) });
                Reg(dst)
            }
            NullLit(_) => Const(0),
            Call(c) => {
                let ft = self.expr(&c.func, f); // TacGen for the functor of the call
                let args = c.arg.iter().map(|a| self.expr(a, f)).collect::<Vec<_>>();
                // reg that stores the return value
                let func_ref = c.func_ref.get().unwrap_or_else(|| unreachable!());
                let ret = if func_ref.ret_some() { Some(self.reg()) } else { None };
                // the entry function point:
                let fp_entry = self.reg();
                f.push(Load { dst: fp_entry, base: [ft], off: 0, hint: MemHint::Immutable });
                f.push(Param { src: [ft] });
                for a in args { f.push(Param { src: [a] }); };
                let hint = CallHint {
                    arg_obj: !func_ref.is_static() || c.arg.iter().any(|a| a.ty.get().is_class()),
                    arg_arr: c.arg.iter().any(|a| a.ty.get().arr > 0),
                };
                f.push(Tac::Call { dst: ret, kind: CallKind::Virtual([Reg(fp_entry)], hint) });
                Reg(ret.unwrap_or(0)) // if ret is None, the result can't be assigned to others, so 0 will not be used
            }
            Unary(u) => {
                let (r, dst) = (self.expr(&u.r, f), self.reg());
                f.push(Un { op: u.op, dst, r: [r] });
                Reg(dst)
            }
            Binary(b) => {
                let (l, r) = (self.expr(&b.l, f), self.expr(&b.r, f));
                match b.op {
                    Eq | Ne if b.l.ty.get() == Ty::string() => {
                        f.push(Param { src: [l] }).push(Param { src: [r] });
                        let dst = self.intrinsic(_StringEqual, f).unwrap_or_else(|| unimplemented!());
                        if b.op == Ne {
                            f.push(Un { op: Not, dst, r: [Reg(dst)] });
                        }
                        Reg(dst)
                    }
                    op => {
                        if let Div | Mod = op {
                            let div0 = self.reg();
                            let after = self.label();
                            f.push(Bin { op: Eq, dst: div0, lr: [r, Const(0)] });
                            f.push(Jif { label: after, z: true, cond: [Reg(div0)] });
                            // raise div0 runtime error:
                            self.re(DIV_BY_ZERO, f);
                            // after:
                            f.push(Label { label: after });
                            if let Const(0) = r {
                                // here we are just avoid tacvm's static check for div by zero
                                return Const(0);
                            }
                        }
                        // execute:
                        let dst = self.reg();
                        f.push(Bin { op, dst, lr: [l, r] });
                        Reg(dst)
                    }
                }
            }
            This(_) => self.this(f),
            ReadInt(_) => Reg(self.intrinsic(_ReadInt, f).unwrap()),
            ReadLine(_) => Reg(self.intrinsic(_ReadLine, f).unwrap()),
            NewClass(n) => {
                let dst = self.reg();
                // by design, a class's new func in functions have the same index as its vtbl in vtbls
                f.push(Tac::Call { dst: Some(dst), kind: CallKind::Static(self.class_info[&Ref(n.class.get().unwrap())].idx, CallHint { arg_obj: false, arg_arr: false }) });
                Reg(dst)
            }
            NewArray(n) => {
                let len = self.expr(&n.len, f);
                let (ok, before_cond, before_body) = (self.label(), self.label(), self.label());
                let (cmp, ptr) = (self.reg(), self.reg());
                f.push(Bin { op: Lt, dst: cmp, lr: [len, Const(0)] })
                    .push(Jif { label: ok, z: true, cond: [Reg(cmp)] });
                self.re(NEW_ARR_NEG, f);
                f.push(Label { label: ok });
                let arr = self.intrinsic(_Alloc, f
                    .push(Bin { op: Mul, dst: ptr, lr: [len, Const(INT_SIZE)] })
                    .push(Bin { op: Add, dst: ptr, lr: [Reg(ptr), Const(INT_SIZE)] }) // now ptr = bytes to allocate
                    .push(Param { src: [Reg(ptr)] })).unwrap();
                f.push(Bin { op: Add, dst: ptr, lr: [Reg(arr), Reg(ptr)] }); // now ptr = end of array
                f.push(Bin { op: Add, dst: arr, lr: [Reg(arr), Const(INT_SIZE)] }); // now arr = begin of array([0])
                f.push(Jmp { label: before_cond }) // loop(reversely), set all to 0
                    .push(Label { label: before_body })
                    .push(Bin { op: Sub, dst: ptr, lr: [Reg(ptr), Const(INT_SIZE)] })
                    .push(Store { src_base: [Const(0), Reg(ptr)], off: 0, hint: MemHint::Arr })
                    .push(Label { label: before_cond })
                    .push(Bin { op: Eq, dst: cmp, lr: [Reg(ptr), Reg(arr)] })
                    .push(Jif { label: before_body, z: true, cond: [Reg(cmp)] }); // when ptr == arr, loop end
                f.push(Store { src_base: [len, Reg(arr)], off: -INT_SIZE, hint: MemHint::Immutable }); // arr[-1] = len
                Reg(arr)
            }
            ClassTest(t) => {
                let obj = self.expr(&t.expr, f);
                self.check_cast(obj, self.class_info[&Ref(t.class.get().unwrap())].idx, f)
            }
            ClassCast(t) => {
                let obj = self.expr(&t.expr, f);
                let check = self.check_cast(obj, self.class_info[&Ref(t.class.get().unwrap())].idx, f);
                let (msg, vtbl, ok) = (self.reg(), self.reg(), self.label());
                f.push(Jif { label: ok, z: false, cond: [check] });
                let s = self.define_str(BAD_CAST1); // borrow checker...
                self.intrinsic(_PrintString, f.push(LoadStr { dst: msg, s }).push(Param { src: [Reg(msg)] }));
                self.intrinsic(_PrintString, f.push(Load { dst: vtbl, base: [obj], off: 0, hint: MemHint::Immutable })
                    .push(Load { dst: msg, base: [Reg(vtbl)], off: INT_SIZE as i32, hint: MemHint::Immutable }).push(Param { src: [Reg(msg)] }));
                let s = self.define_str(BAD_CAST2);
                self.intrinsic(_PrintString, f.push(LoadStr { dst: msg, s }).push(Param { src: [Reg(msg)] }));
                let s = self.define_str(t.name);
                self.intrinsic(_PrintString, f.push(LoadStr { dst: msg, s }).push(Param { src: [Reg(msg)] }));
                let s = self.define_str(BAD_CAST3);
                self.intrinsic(_PrintString, f.push(LoadStr { dst: msg, s }).push(Param { src: [Reg(msg)] }));
                self.intrinsic(_Halt, f);
                f.push(Label { label: ok });
                obj
            }
            Lambda(l) => {
                // generate tac for inner lambda:
                let lambda_tac = self.build_lambda(l);
                self.lambda_tacs.push(lambda_tac);
                // construct lambda functor and return
                let num_cap = l.cap_list.borrow().len() as i32 + l.cap_this.get() as i32;
                let ft = self.intrinsic(_Alloc, f.push(Param { src: [Const((1 + num_cap) * INT_SIZE)] })).unwrap();
                let fp_lambda = self.reg();
                // store fp:
                f.push(LoadFunc { dst: fp_lambda, f: self.cur_lambda_idx })
                    // *(ft + 0) = fp
                    .push(Store { src_base: [Reg(fp_lambda), Reg(ft)], off: 0, hint: MemHint::Immutable });
                // store captured vars:
                match self.cur_lambdas.last().cloned() { // *(ft + 4*n) = cap_n
                    None => { // normal context
                        for (idx, rvd) in l.cap_list.borrow().iter().enumerate() {
                            f.push(Store {
                                src_base: [Reg(self.var_info[rvd].off), Reg(ft)],
                                off: (1 + idx as i32) * INT_SIZE,
                                hint: MemHint::Immutable,
                            });
                        };
                        if l.cap_this.get() { // store `this` as last
                            f.push(Store {
                                src_base: [Reg(0), Reg(ft)],
                                off: num_cap * INT_SIZE,
                                hint: MemHint::Immutable,
                            });
                        }
                    }
                    Some(outer_l) => { // in a lambda context
                        let tmp = self.reg();
                        for (idx, rvd) in l.cap_list.borrow().iter().enumerate() {
                            match outer_l.cap_list.borrow().get_full(rvd) {
                                Some((outer_idx, _)) => { // a nested capture
                                    f.push(Load { // from outer to tmp
                                        dst: tmp,
                                        base: [Reg(0)],
                                        off: (1 + outer_idx as i32) * INT_SIZE,
                                        hint: MemHint::Immutable,
                                    }).push(Store { // from tmp to inner
                                        src_base: [Reg(tmp), Reg(ft)],
                                        off: (1 + idx as i32) * INT_SIZE,
                                        hint: MemHint::Immutable,
                                    });
                                }
                                None => { // a simple capture
                                    f.push(Store {
                                        src_base: [Reg(self.var_info[rvd].off), Reg(ft)],
                                        off: (1 + idx as i32) * INT_SIZE,
                                        hint: MemHint::Immutable,
                                    });
                                }
                            }
                        }
                        if l.cap_this.get() { // store `this` as last
                            assert!(outer_l.cap_this.get());
                            f.push(Load { // from outer to tmp
                                dst: tmp,
                                base: [Reg(0)],
                                off: (1 + outer_l.cap_list.borrow().len() as i32) * INT_SIZE,
                                hint: MemHint::Immutable,
                            }).push(Store {  // from tmp to inner
                                src_base: [Reg(tmp), Reg(ft)],
                                off: num_cap * INT_SIZE,
                                hint: MemHint::Immutable,
                            });
                        }
                    }
                }
                self.cur_lambda_idx += 1;       // register this newly built lambda tac
                Reg(ft) // return the functor
            }
        }
    }

    fn var_sel(&mut self, vs: &'a VarSel<'a>, cur_assign: Option<Operand>, f: &mut TacFunc<'a>) -> Operand {
        if let Some(o) = &vs.owner {  // arr.length()
            if vs.name == LENGTH && o.ty.get().is_arr() {
                let arr = self.expr(o, f);
                return self.length(arr, f);
            }
        }
        match vs.field.get() {
            Some(field_def) => match field_def {
                FieldDef::VarDef(vd) => {
                    let off = self.var_info[&Ref(vd)].off; // may be register id or offset in class
                    match vd.owner.get().unwrap_or_else(|| unreachable!()) {
                        // if we are now in a Lambda scope, the offset is no longer useful
                        ScopeOwner::Local(_, _) | ScopeOwner::FuncParam(_) | ScopeOwner::LambdaParam(_) =>
                            if let Some(src) = cur_assign { // `off` is register
                                // impossible to assign to a captured var
                                f.push(Tac::Assign { dst: off, src: [src] });
                                // the return value won't be used, so just return a meaningless Reg(0), the below Reg(0)s are the same
                                Reg(0)
                            } else { // load or get
                                match self.cur_lambdas.last() {
                                    // in a lambda context, load
                                    Some(l) =>
                                        if let Some((idx, _)) = l.cap_list.borrow().get_full(&Ref(vd)) { // confirm a captured var
                                            // load captured var from functor and return the reg
                                            let dst = self.reg();
                                            f.push(Load {
                                                dst,
                                                base: [Reg(0)], // Reg(0) is the functor's base addr in a lambda context
                                                off: (1 + idx as i32) * INT_SIZE, // offset 0 reserved for ft
                                                hint: MemHint::Immutable,
                                            });
                                            Reg(dst)
                                        } else { Reg(off) } // not a captured var, get
                                    // normal context, get
                                    None => { Reg(off) }
                                }
                            }
                        ScopeOwner::Class(_) => {
                            let owner = vs.owner.as_ref().map(|o| self.expr(o, f)).unwrap_or_else(|| self.this(f));
                            // `off` is the member variable offset in the class
                            if let Some(src) = cur_assign {
                                f.push(Store { src_base: [src, owner], off: off as i32 * INT_SIZE, hint: MemHint::Obj });
                                Reg(0)
                            } else {
                                let dst = self.reg();
                                f.push(Load { dst, base: [owner], off: off as i32 * INT_SIZE, hint: MemHint::Obj });
                                Reg(dst)
                            }
                        }
                        ScopeOwner::Global(_) => unreachable!("Impossible to declare a variable in global scope.")
                    }
                }
                FieldDef::FuncDef(fd) => {
                    assert!(cur_assign.is_none()); // guaranteed by PA2
                    // construct a functor and return
                    // get fp to the function entry addr
                    let fp_entry = self.reg();
                    f.push(LoadFunc { dst: fp_entry, f: self.entry_func_info[&Ref(fd)].idx });

                    if fd.static_ {
                        let ft = self.intrinsic(_Alloc, f.push(Param { src: [Const(1 * INT_SIZE)] })).unwrap();
                        // *(ft + 0) = fp
                        f.push(Store { src_base: [Reg(fp_entry), Reg(ft)], off: 0, hint: MemHint::Immutable });
                        Reg(ft)
                    } else { // non-static
                        // ** recursively visit the owner
                        let owner = vs.owner.as_ref().map(|o| self.expr(o, f)).unwrap_or_else(|| self.this(f));
                        let ft = self.intrinsic(_Alloc, f.push(Param { src: [Const(2 * INT_SIZE)] })).unwrap();
                        // *(ft + 0) = fp
                        f.push(Store { src_base: [Reg(fp_entry), Reg(ft)], off: 0, hint: MemHint::Immutable });
                        // *(ft + 4) = obj_ptr
                        f.push(Store { src_base: [owner, Reg(ft)], off: 1 * INT_SIZE, hint: MemHint::Immutable });
                        Reg(ft)
                    }
                }
            }
            None => Reg(0) // current VarSel is class name, the only possibility is trying to access a static method
            // hence, we return a meaningless Reg(0) since static method's entry won't use obj_ptr
        }
    }

    fn this(&mut self, f: &mut TacFunc<'a>) -> Operand { // get `this` pointer
        match self.cur_lambdas.last().cloned() {
            Some(l) => { // in a lambda context
                assert!(l.cap_this.get());
                let dst = self.reg();
                f.push(Load { // load `this` pointer
                    dst,
                    base: [Reg(0)],
                    off: (1 + l.cap_list.borrow().len() as i32) * INT_SIZE,
                    hint: MemHint::Immutable,
                });
                Reg(dst)
            }
            None => Reg(0), // normal context
        }
    }
}

impl<'a> TacGen<'a> {
    // define a string in str pool and return its id, this id can be used in Tac::LoadStr
    fn define_str(&mut self, s: &'a str) -> u32 { self.tac_program.str_pool.insert_full(s).0 as u32 }

    fn reg(&mut self) -> u32 { (self.reg_num, self.reg_num += 1).0 }

    fn label(&mut self) -> u32 { (self.label_num, self.label_num += 1).0 }

    // if you don't need to modify the returned register, it is more recommended to use Const(i)
    fn int(&mut self, i: i32, f: &mut TacFunc<'a>) -> u32 {
        let dst = self.reg();
        f.push(Tac::Assign { dst, src: [Const(i)] });
        dst
    }

    // perform an intrinsic call, return value is Some if this intrinsic call has return value
    fn intrinsic(&mut self, i: Intrinsic, f: &mut TacFunc<'a>) -> Option<u32> {
        let dst = if i.has_ret() { Some(self.reg()) } else { None };
        f.push(Tac::Call { dst, kind: CallKind::Intrinsic(i) });
        dst
    }

    // read the length of `arr` (caller should guarantee `arr` is really an array)
    fn length(&mut self, arr: Operand, f: &mut TacFunc<'a>) -> Operand {
        // apply for 8 bytes of memory to store the functor
        let ft = self.intrinsic(_Alloc, f.push(Param { src: [Const(2 * INT_SIZE)] })).unwrap();
        let fp_entry = self.reg();
        f.push(LoadFunc { dst: fp_entry, f: self.len_func_idx })
            // store the length fp in offset 0
            .push(Store { src_base: [Reg(fp_entry), Reg(ft)], off: 0, hint: MemHint::Immutable })
            // store the arr pointer in offset 4
            .push(Store { src_base: [arr, Reg(ft)], off: 1 * INT_SIZE, hint: MemHint::Immutable });
        Reg(ft)
    }

    // re is short for for runtime error; this function prints a message and call halt
    fn re(&mut self, msg: &'static str, f: &mut TacFunc<'a>) {
        let src = self.reg();
        let s = self.define_str(msg);
        self.intrinsic(_PrintString, f.push(LoadStr { dst: src, s }).push(Param { src: [Reg(src)] }));
        self.intrinsic(_Halt, f);
    }

    fn check_cast(&mut self, obj: Operand, vtbl_idx: u32, f: &mut TacFunc<'a>) -> Operand {
        // ret = 0
        // while (cur)
        //   ret = (cur == target)
        //   if ret = 1
        //     break
        //   cur = cur->parent
        let (ret, cur, target) = (self.int(0, f), self.reg(), self.reg());
        let (before_cond, after_body) = (self.label(), self.label());
        f.push(LoadVTbl { dst: target, v: vtbl_idx });
        f.push(Load { dst: cur, base: [obj], off: 0, hint: MemHint::Immutable });
        f.push(Label { label: before_cond });
        f.push(Jif { label: after_body, z: true, cond: [Reg(cur)] });
        f.push(Bin { op: Eq, dst: ret, lr: [Reg(cur), Reg(target)] }).push(Jif { label: after_body, z: false, cond: [Reg(ret)] });
        f.push(Load { dst: cur, base: [Reg(cur)], off: 0, hint: MemHint::Immutable });
        f.push(Jmp { label: before_cond });
        f.push(Label { label: after_body });
        Reg(ret)
    }
}

impl<'a> TacGen<'a> {
    // `idx` in ClassInfo & FuncInfo is not determined here, just set them to a meaningless value (0)
    // all functions (static & virtual) are inserted into self.func_info
    // this function relies on the fact that no cyclic inheritance exist, which is guaranteed in typeck
    fn resolve_field(&mut self, c: &'a ClassDef<'a>) {
        if !self.class_info.contains_key(&Ref(c)) { // first resolving
            let (mut field_num, mut vtbl) = if let Some(p) = c.parent_ref.get() {
                self.resolve_field(p);
                let p = &self.class_info[&Ref(p)];
                (p.field_num, p.vtbl.clone())
            } else { (1, IndexMap::default()) };
            for f in &c.field {
                match f {
                    FieldDef::FuncDef(f) => if !f.static_ {
                        if let Some((idx, _, p_f)) = vtbl.get_full_mut(f.name) {
                            // + 2, because 0 is parent vtbl, 1 is class name
                            self.func_info.insert(Ref(f), FuncInfo { off: idx as u32 + 2, idx: 0 });
                            *p_f = f; // override
                        } else {
                            self.func_info.insert(Ref(f), FuncInfo { off: vtbl.len() as u32 + 2, idx: 0 });
                            vtbl.insert(f.name, f);
                        }
                    } else { // static
                        // `off` is useless for static functions
                        self.func_info.insert(Ref(f), FuncInfo { off: 0, idx: 0 });
                    }
                    FieldDef::VarDef(v) => {
                        self.var_info.insert(Ref(v), VarInfo { off: field_num });
                        field_num += 1;
                    }
                }
            }
            self.class_info.insert(Ref(c), ClassInfo { field_num, idx: 0, vtbl });
        }
    }

    fn build_new(&mut self, c: &'a ClassDef<'a>) -> TacFunc<'a> {
        self.reg_num = 0;
        let ClassInfo { field_num, idx, .. } = self.class_info[&Ref(c)];
        let mut f = TacFunc::empty(self.alloc, format!("_{}._new", c.name), 0);
        f.push(Param { src: [Const(field_num as i32 * INT_SIZE)] });
        let ret = self.intrinsic(_Alloc, &mut f).unwrap_or_else(|| unimplemented!());
        let vtbl = self.reg();
        f.push(LoadVTbl { dst: vtbl, v: idx });
        f.push(Store { src_base: [Reg(vtbl), Reg(ret)], off: 0, hint: MemHint::Immutable });
        for i in 1..field_num {
            f.push(Store { src_base: [Const(0), Reg(ret)], off: i as i32 * INT_SIZE, hint: MemHint::Obj });
        }
        f.push(Ret { src: Some([Reg(ret)]) });
        f.reg_num = self.reg_num;
        f
    }

    fn build_length(&mut self) -> TacFunc<'a> {
        let mut f = TacFunc::empty(self.alloc, LENGTH.into(), 0);
        // load array len and return
        f.push(Load { dst: 1, base: [Reg(0)], off: 1 * INT_SIZE, hint: MemHint::Immutable })
            .push(Load { dst: 1, base: [Reg(1)], off: -(INT_SIZE as i32), hint: MemHint::Immutable })
            .push(Ret { src: Some([Reg(1)]) });
        f
    }

    fn build_func(&mut self, fd: &'a FuncDef<'a>, main_func: &'a ClassDef<'a>) -> TacFunc<'a> {
        // handle function definition:
        let c = fd.class.get().unwrap_or_else(|| unreachable!());
        let this = if fd.static_ { 0 } else { 1 }; // Reg(0) stores `this` when in non-static method
        for (idx, p) in fd.param.iter().enumerate() {
            self.var_info.insert(Ref(p), VarInfo { off: idx as u32 + this });
        }
        // these regs are occupied by parameters
        self.reg_num = fd.param.len() as u32 + this;
        self.label_num = 0;
        let name = if Ref(c) == Ref(main_func) && fd.name == MAIN_METHOD { MAIN_METHOD.into() } else { format!("_{}.{}", c.name, fd.name) };
        let mut f = TacFunc::empty(self.alloc, name.clone(), self.reg_num);
        if let Some(b) = &fd.body {
            self.block(b, &mut f);
        } // for abstract method, skip tacgen for its body
        f.reg_num = self.reg_num;
        // add an return at the end of return-void function
        if fd.ret_ty().is_void() { f.push(Tac::Ret { src: None }); }
        f
    }

    fn build_func_entry(&mut self, fd: &'a FuncDef<'a>, main_func: &'a ClassDef<'a>) -> TacFunc<'a> {
        // in the entry function, we lookup in the *VTBL* to determine where we should jump to, instead of making a static call
        let c = fd.class.get().unwrap_or_else(|| unreachable!());
        let this = if fd.static_ { 0 } else { 1 }; // Reg(0) stores `this` when in non-static method
        let name = if Ref(c) == Ref(main_func) && fd.name == MAIN_METHOD { MAIN_METHOD.into() } else { format!("_{}.{}", c.name, fd.name) };
        let name = format!("{}._entry", name);
        self.reg_num = fd.param.len() as u32 + this;
        let mut f = TacFunc::empty(self.alloc, name, self.reg_num);
        let ret = if fd.ret_ty().is_void() { None } else { Some(self.reg()) };
        let hint = CallHint {
            arg_obj: !fd.static_ || fd.param.iter().any(|p| p.ty.get().is_class()),
            arg_arr: fd.param.iter().any(|p| p.ty.get().arr > 0),
        };
        if fd.static_ {
            for i in 1..=fd.param.len() as u32 { f.push(Param { src: [Reg(i)] }); }
            f.push(Tac::Call { dst: ret, kind: CallKind::Static(self.func_info[&Ref(fd)].idx, hint) });
        } else { // non-static
            let this = self.reg();
            f.push(Load { // load `this` pointer
                dst: this,
                base: [Reg(0)], // Reg(0) points to the functor
                off: 1 * INT_SIZE,
                hint: MemHint::Immutable,
            });
            let fp_target = self.reg();
            let off = self.func_info[&Ref(fd)].off;
            f.push(Load { dst: fp_target, base: [Reg(this)], off: 0, hint: MemHint::Immutable }) // load vtbl start addr
                // load target virtual function pointer
                .push(Load { dst: fp_target, base: [Reg(fp_target)], off: off as i32 * INT_SIZE, hint: MemHint::Immutable })
                .push(Param { src: [Reg(this)] });
            for i in 1..=fd.param.len() as u32 { f.push(Param { src: [Reg(i)] }); }
            f.push(Tac::Call { dst: ret, kind: CallKind::Virtual([Reg(fp_target)], hint) });
        }
        f.push(Ret { src: ret.map(|o| [Reg(o)]) });
        f
    }

    fn build_lambda(&mut self, l: &'a Lambda<'a>) -> TacFunc<'a> {
        // keep in mind that Reg(0) is the functor's base address
        // add lambda params into var_info
        let old_reg_num = self.reg_num;
        for (idx, p) in l.params.iter().enumerate() {
            self.var_info.insert(Ref(p), VarInfo { off: 1 + idx as u32 }); // offset 0 reserved for functor
        }
        self.reg_num = 1 + l.params.len() as u32;
        let name = format!("lambda_{}_{}", l.loc.0, l.loc.1); // be careful not to use `@`
        let mut lambda_tac = TacFunc::empty(self.alloc, name, self.reg_num);
        self.cur_lambdas.push(l);
        match &l.body {
            // ** recursively generate
            LambdaKind::Block(b) => {
                self.block(b, &mut lambda_tac);
                if l.ret_ty.get().unwrap().is_void() { lambda_tac.push(Ret { src: None }); }
            },
            LambdaKind::Expr(e, _s) => {
                let ret = self.expr(e, &mut lambda_tac);
                lambda_tac.push(Ret { src: Some([ret]) });
            },
        }
        self.cur_lambdas.pop();
        self.reg_num = old_reg_num; // recover reg_num so that the outer scope will function normally
        lambda_tac
    }
}