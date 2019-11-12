use crate::{TypeCk, TypeCkTrait};
use common::{ErrorKind::*, Loc, LENGTH, BinOp, UnOp, ErrorKind, Ref};
use syntax::ast::*;
use syntax::{ScopeOwner, Symbol, ty::*};
use std::ops::{Deref, DerefMut};
use std::iter;

pub(crate) struct TypePass<'a>(pub TypeCk<'a>);

impl<'a> Deref for TypePass<'a> {
    type Target = TypeCk<'a>;
    fn deref(&self) -> &Self::Target { &self.0 }
}

impl<'a> DerefMut for TypePass<'a> {
    fn deref_mut(&mut self) -> &mut Self::Target { &mut self.0 }
}

impl<'a> TypePass<'a> {
    pub fn program(&mut self, p: &'a Program<'a>) {
        for c in &p.class { self.class_def(c); }
    }

    fn class_def(&mut self, c: &'a ClassDef<'a>) {
        self.cur_class = Some(c);
        self.scoped(ScopeOwner::Class(c), |s|
            for f in &c.field { // in class scope c of self, for all func defs in c:
                if let FieldDef::FuncDef(f) = f {
                    if f.is_abstr() { continue; }  // skip type check for abstract func
                    s.cur_func = Some(f);
                    let ret = s.scoped(ScopeOwner::FuncParam(f), |s|
                        s.block(&f.body.as_ref().unwrap())); // in f's param scope
                    if !ret && f.ret_ty() != Ty::void() { s.issue(f.body.as_ref().unwrap().loc, ErrorKind::NoReturn) }
                };
            });
    }

    fn block(&mut self, b: &'a Block<'a>) -> bool {
        let mut ret = false;
        self.scoped(ScopeOwner::mk_local_block(b), |s| for st in &b.stmt { ret = s.stmt(st); });
        ret
    }

    // return whether this stmt has a return value
    // ** difficulty: how to pass the sym and scope of lvalue into this
    // ** difficulty: how to determine if a scope is accessible? using ranks!
    fn stmt(&mut self, s: &'a Stmt<'a>) -> bool {
        match &s.kind {
            StmtKind::Assign(a) => {
                // todo for lambda scope, check a's assignability
                let ((l, cap_sym_scope), r) = (self.expr(&a.dst), self.expr(&a.src).0);
                if !r.assignable_to(l) { self.issue(s.loc, IncompatibleBinary { l, op: "=", r }) }
                match self.scopes.cur_lambda() {
                    None => if let Some((sym, scope)) = cap_sym_scope { // normal context
                        if sym.is_func() && scope.is_class() {
                            self.issue(s.loc, AssignToMemberMethod(sym.name()))
                        }
                    }
                    Some(cur_lambda) => match cap_sym_scope { // in a lambda context
                        None => {}
                        Some((cap_sym, cap_scope)) => match cap_scope {
                            ScopeOwner::Class(_) => if cap_sym.is_func() {
                                self.issue(s.loc, AssignToMemberMethod(cap_sym.name()))
                            } else {},  // pass
//                            ScopeOwner::Local(Some(_), _s) =>
                            _ =>
                                if self.scopes.rank(&ScopeOwner::LambdaParam(cur_lambda)) < self.scopes.rank(&cap_scope) { // todo can capture scopes outside outmost lambda
//                                    dbg!(s.loc, cap_sym, cap_scope);
//                                    eprintln!();
                                    self.issue(s.loc, AssignToCapturedVar)
                                } else {}
//                            ScopeOwner::Local(None, _s) => unreachable!(), // found sym in lambda expr?
//                            _ => self.issue(s.loc, AssignToCapturedVar)
                        },
                    }
                }
                false
            }
            StmtKind::LocalVarDef(v) => {
                self.cur_var_def = Some(v);
                match &v.syn_ty.kind {
                    SynTyKind::Var => match &v.init {
                        None => unreachable!("var deduction without init expr should be rejected by syntax parser"),
                        Some((_, e)) => {
                            let r = self.expr(e).0;
                            if r.is_void() {
                                self.issue(v.loc, VoidVar(v.name))
                            } else {
                                v.ty.set(r);
                            }
                        }
                    }
                    _ => if let Some((loc, e)) = &v.init {   // with init expr
                        let (l, r) = (v.ty.get(), self.expr(e).0);
                        if !r.assignable_to(l) { self.issue(*loc, IncompatibleBinary { l, op: "=", r }) }
                    }
                }
                self.cur_var_def = None;
                false
            }
            StmtKind::ExprEval(e) => {
                self.expr(e);
                false
            }
            StmtKind::Skip(_) => false,
            StmtKind::If(i) => {
                self.check_bool(&i.cond);
                // `&` is not short-circuit evaluated
                self.block(&i.on_true) & i.on_false.as_ref().map(|b| self.block(b)).unwrap_or(false)
            }
            StmtKind::While(w) => {
                self.check_bool(&w.cond);
                self.loop_cnt += 1;
                self.block(&w.body);
                self.loop_cnt -= 1;
                false
            }
            StmtKind::For(f) => self.scoped(ScopeOwner::mk_local_block(&f.body), |s| {
                s.stmt(&f.init);
                s.check_bool(&f.cond);
                s.stmt(&f.update);
                for st in &f.body.stmt { s.stmt(st); } // not calling block(), because the scope is already opened
                false
            }),
            // return type checking is here
            StmtKind::Return(r) => {
                let actual = r.as_ref().map(|e| self.expr(e).0).unwrap_or(Ty::void());
                match self.scopes.cur_lambda() {
                    None => {  // in normal method body
                        let expect = self.cur_func.unwrap().ret_ty();
                        if !actual.assignable_to(expect) { self.issue(s.loc, ReturnMismatch { actual, expect }) }
                    }
                    Some(l) =>  // in a lambda's body, we gather candidate return ty here
                        l.can_tys.borrow_mut().push(actual)
                }
                actual != Ty::void()
            }
            StmtKind::Print(p) => {
                for (i, e) in p.iter().enumerate() {
                    let ty = self.expr(e).0;
                    if ty != Ty::bool() && ty != Ty::int() && ty != Ty::string() {
                        ty.error_or(|| self.issue(e.loc, BadPrintArg { loc: i as u32 + 1, ty }))
                    }
                }
                false
            }
            StmtKind::Break(_) => {
                if self.loop_cnt == 0 { self.issue(s.loc, BreakOutOfLoop) }
                false
            }
            StmtKind::Block(b) => self.block(b),
        }
    }

    // e.ty is set to the return value
    // returns (expr ty, scope of this expr(for LValue if there is one, else None for RValue))
    fn expr(&mut self, e: &'a Expr<'a>) -> (Ty<'a>, Option<(Symbol<'a>, ScopeOwner<'a>)>) {
        use ExprKind::*;
        let ty_scope = match &e.kind {
            VarSel(v) => self.var_sel(v, e.loc), // may be an LValue
            IndexSel(i) => {  // may be an LValue
                let ((arr, owner), idx) = (self.expr(&i.arr), self.expr(&i.idx).0);
                if idx != Ty::int() { idx.error_or(|| self.issue(e.loc, IndexNotInt)) }
                match arr {
                    Ty { arr, kind } if arr > 0 => (Ty { arr: arr - 1, kind }, owner),
                    e => e.error_or(|| self.issue(i.arr.loc, IndexNotArray)),
                }
            }
            IntLit(_) | ReadInt(_) => (Ty::int(), None),
            BoolLit(_) => (Ty::bool(), None),
            StringLit(_s) => (Ty::string(), None),
            ReadLine(_) => (Ty::string(), None),
            NullLit(_) => (Ty::null(), None),
            Call(c) => {
                let lhs_ty = self.expr(&c.func).0;
                if lhs_ty == Ty::error() { return (Ty::error(), None); }
                c.func_ref.set(self.cur_caller);
                match lhs_ty.kind {
                    TyKind::Func(f) => (self.check_arg_param(&c.arg, f, e.loc), None),    // todo maybe panic!
                    _ => self.issue(e.loc, NotCallable(lhs_ty))
                }
            }
            Unary(u) => {
                let r = self.expr(&u.r).0;
                let (ty, op) = match u.op {
                    UnOp::Neg => (Ty::int(), "-"),
                    UnOp::Not => (Ty::bool(), "!"),
                };
                if r != ty { r.error_or(|| self.issue(e.loc, IncompatibleUnary { op, r })) }
                (ty, None)
            }
            Binary(b) => {
                use BinOp::*;
                let (l, r) = (self.expr(&b.l).0, self.expr(&b.r).0);
                if l == Ty::error() || r == Ty::error() {
                    // not using wildcard match, so that if we add new operators in the future, compiler can tell us
                    match b.op {
                        Add | Sub | Mul | Div | Mod => (Ty::int(), None),
                        And | Or | Eq | Ne | Lt | Le | Gt | Ge => (Ty::bool(), None)
                    }
                } else {
                    let (ret, ok) = match b.op {
                        Add | Sub | Mul | Div | Mod => (Ty::int(), l == Ty::int() && r == Ty::int()),
                        Lt | Le | Gt | Ge => (Ty::bool(), l == Ty::int() && r == Ty::int()),
                        Eq | Ne => (Ty::bool(), l.assignable_to(r) || r.assignable_to(l)),
                        And | Or => (Ty::bool(), l == Ty::bool() && r == Ty::bool())
                    };
                    if !ok { self.issue(e.loc, IncompatibleBinary { l, op: b.op.to_op_str(), r }) }
                    (ret, None)
                }
            }
            This(_) => {
                if self.cur_func.unwrap().static_ { self.issue(e.loc, ThisInStatic) }
                let cur_class = self.cur_class.unwrap();
                (Ty::mk_obj(cur_class), None)
            }
            NewClass(n) => if let Some(c) = self.scopes.lookup_class(n.name) {
                if c.abstr_ { self.issue(e.loc, NewAbstractClass(c.name)) }
                n.class.set(Some(c));
                (Ty::mk_obj(c), None)
            } else { self.issue(e.loc, NoSuchClass(n.name)) },
            NewArray(n) => {
                let len = self.expr(&n.len).0;
                if len != Ty::int() { len.error_or(|| self.issue(n.len.loc, NewArrayNotInt)) }
                (self.ty(&n.elem, true), None)
            }
            ClassTest(c) => {
                let src = self.expr(&c.expr).0;
                if !src.is_object() { src.error_or(|| self.issue(e.loc, NotObject(src))) }
                if let Some(cl) = self.scopes.lookup_class(c.name) {
                    c.class.set(Some(cl));
                    (Ty::bool(), None)
                } else { self.issue(e.loc, NoSuchClass(c.name)) }
            }
            ClassCast(c) => {
                let src = self.expr(&c.expr).0;
                if !src.is_object() { src.error_or(|| self.issue(e.loc, NotObject(src))) }
                if let Some(cl) = self.scopes.lookup_class(c.name) {
                    c.class.set(Some(cl));
                    (Ty::mk_obj(cl), None)
                } else { self.issue(e.loc, NoSuchClass(c.name)) }
            }
            Lambda(l) => {
                let ret_ty = self.scoped(ScopeOwner::LambdaParam(l), |s| {
                    match &l.body {
                        LambdaKind::Block(b) => {
                            // gather all return types in its body
                            let returned = s.block(b);
                            let can_tys = l.can_tys.replace(Default::default());
                            match Ty::sup(&can_tys, &s.alloc.ty) {
                                Err(_) => {
                                    if !returned { s.issue(b.loc, NoReturn) };
                                    s.issue(b.loc, IncompatibleRetTypes)
                                }
                                Ok(ret_ty) => {
                                    if !returned && !ret_ty.is_void() { s.issue::<()>(b.loc, NoReturn); }
                                    ret_ty
                                }
                            }
                        }
                        LambdaKind::Expr(e, inner_s) =>
                            s.scoped(ScopeOwner::Local(None, inner_s), |s| s.expr(e)).0,
                    }
                });
                l.ret_ty.set(Some(ret_ty));
                if ret_ty == Ty::error() { return (Ty::error(), None); }
                // create sinature for l
                let ret_param_ty = iter::once(ret_ty).chain(l.params.iter().map(|v| v.ty.get()));
                let ret_param_ty = self.alloc.ty.alloc_extend(ret_param_ty);
                l.ret_param_ty.set(Some(ret_param_ty));
                l.class.set(self.cur_class);
                (Ty::new(TyKind::Func(ret_param_ty)), None)
            }
        };
        e.ty.set(ty_scope.0);
        ty_scope
    }

    fn var_sel(&mut self, v: &'a VarSel<'a>, loc: Loc) -> (Ty<'a>, Option<(Symbol<'a>, ScopeOwner<'a>)>) {
        // (no owner)not_found_var / ClassName(no field) / (no owner)method => UndeclaredVar
        // object.not_found_var => NoSuchField
        // (no owner)field_var && cur function is static => RefInStatic
        // <not object>.a (e.g.: Class.a, 1.a) / object.method => BadFieldAccess
        // object.field_var, where object's class is not self or any of ancestors => PrivateFieldAccess

        if let Some(owner) = &v.owner { // has owner
            self.cur_used = true;
            let owner = self.expr(owner).0;   // owner check ? ** recurse **
            self.cur_used = false;
            if v.name == LENGTH && owner.is_arr() {  // arr.length()
                self.cur_caller = Some(Callable::Length);
                return (Ty::new(TyKind::Func(&TypeCk::VOID_TO_INT)), None);
            }
            match owner {
                // selecting an object's var or method
                // a.b  |  a.fun
                Ty { arr: 0, kind: TyKind::Object(Ref(c)) } => if let Some(sym) = c.lookup(v.name) {
                    match sym {
                        Symbol::Var(var) => {
                            v.field.set(Some(FieldDef::VarDef(var)));
                            // only allow self & descendents to access field
                            if !self.cur_class.unwrap().extends(c) {
                                self.issue(loc, PrivateFieldAccess { name: var.name, owner })
                            }
                            self.cur_caller = None;
                            (var.ty.get(), var.owner.get().map(|scope| (sym, scope))) // various types of scope owner
                        }
                        Symbol::Func(f) => {  // methods are always public
                            v.field.set(Some(FieldDef::FuncDef(f)));
                            // only allow self & descendents to access field or access static method
                            /*if !f.static_ && !self.cur_class.unwrap().extends(c) {
                                self.issue(loc, PrivateFieldAccess { name: f.name, owner })
                            }*/
                            self.cur_caller = Some(f.into());
                            (Ty::mk_func(f), Some((sym, ScopeOwner::Class(c))))
                        }
                        _ => self.issue(loc, BadFieldAccess { name: v.name, owner }),
                    }
                } else { self.issue(loc, NoSuchField { name: v.name, owner }) },  // symbol not found
                // selecting a static method
                // A.static_fun
                Ty { arr: 0, kind: TyKind::Class(Ref(c)) } => if let Some(sym) = c.lookup(v.name) {
                    match sym {
                        Symbol::Func(f) => if f.static_ {
                            v.field.set(Some(FieldDef::FuncDef(f)));
                            self.cur_caller = Some(f.into());
                            (Ty::mk_func(f), Some((sym, ScopeOwner::Class(c))))
                        } else { self.issue(loc, BadFieldAccess { name: f.name, owner }) }
                        _ => self.issue(loc, BadFieldAccess { name: v.name, owner }) // no static var etc.
                    }
                } else { self.issue(loc, NoSuchField { name: v.name, owner }) },
                e => e.error_or(|| self.issue(loc, BadFieldAccess { name: v.name, owner })),
            }
        } else { // no owner
            // a  |  fun  |  A
            // if this stmt is in an VarDef, it cannot access the variable that is being declared
            if let Some(sym) = self.scopes.lookup_before(v.name, self.cur_var_def.map(|v| v.loc).unwrap_or(loc)) {
                match sym {
                    Symbol::Var(var) => {  // a
                        v.field.set(Some(FieldDef::VarDef(var)));
                        if var.owner.get().unwrap().is_class() {
                            let cur = self.cur_func.unwrap();
                            if cur.static_ {  // static function cannot access class's member var
                                self.issue(loc, RefInStatic { field: v.name, func: cur.name })
                            }
                        }
                        self.cur_caller = None;
                        (var.ty.get(), var.owner.get().map(|scope| (sym, scope))) // various scope owner types
                    }
                    Symbol::Func(f) => {  // fun
                        v.field.set(Some(FieldDef::FuncDef(f)));
                        if !f.static_ {
                            let cur = self.cur_func.unwrap();
                            if cur.static_ {
                                self.issue(loc, RefInStatic { field: v.name, func: cur.name })
                            }
                        }
                        self.cur_caller = Some(f.into());
                        (Ty::mk_func(f), Some((sym, ScopeOwner::Class(f.class.get().unwrap_or_else(|| unreachable!())))))
                    }
                    Symbol::Class(c) if self.cur_used => { (Ty::mk_class(c), None) }
                    _ => self.issue(loc, UndeclaredVar(v.name)),
                }
            } else { self.issue(loc, UndeclaredVar(v.name)) }
        }
    }
}

impl<'a> TypePass<'a> {
    fn check_bool(&mut self, e: &'a Expr<'a>) {
        let ty = self.expr(e).0;
        if ty != Ty::bool() { ty.error_or(|| self.issue(e.loc, TestNotBool)) }
    }

    fn check_arg_param(&mut self, arg: &'a [Expr<'a>], ret_param: &[Ty<'a>], loc: Loc) -> Ty<'a> {
        let (ret, param) = (ret_param[0], &ret_param[1..]);
        if param.len() != arg.len() {
            match self.cur_caller.unwrap_or_else(|| unreachable!("got None cur_caller in check_arg_param")) {
                Callable::FuncDef(f) =>
                    self.issue::<()>(loc, FuncArgCountMismatch { name: f.name, expect: param.len() as u32, actual: arg.len() as u32 }),
                Callable::Lambda(_) =>
                    self.issue(loc, LambdaArgCountMismatch { expect: param.len() as u32, actual: arg.len() as u32 }),
                Callable::Length =>
                    self.issue(loc, LengthWithArgument(arg.len() as u32)),
            };
        }
        for (idx, arg0) in arg.iter().enumerate() {
            let arg = self.expr(arg0).0;
            if let Some(&param) = param.get(idx) {
                if !arg.assignable_to(param) {
                    self.issue(arg0.loc, ArgMismatch { loc: idx as u32 + 1, arg, param })
                }
            }
        }
        ret
    }
}
