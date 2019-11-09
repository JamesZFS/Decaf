use crate::{TypeCk, TypeCkTrait};
use common::{ErrorKind::*, Ref, MAIN_CLASS, MAIN_METHOD, NO_LOC, HashMap, HashSet};
use syntax::{ast::*, ScopeOwner, Symbol, Ty};
use std::{ops::{Deref, DerefMut}, iter};
use hashbrown::hash_map::Entry;

pub(crate) struct SymbolPass<'a>(pub TypeCk<'a>);

// some boilerplate code...
impl<'a> Deref for SymbolPass<'a> {
    type Target = TypeCk<'a>;
    fn deref(&self) -> &Self::Target { &self.0 }
}

impl<'a> DerefMut for SymbolPass<'a> {
    fn deref_mut(&mut self) -> &mut Self::Target { &mut self.0 }
}

impl<'a> SymbolPass<'a> {
    pub fn program(&mut self, p: &'a Program<'a>) {
        // the global scope is already opened, so no need to open it here
        for c in &p.class {
            if let Some(prev) = self.scopes.lookup_class(c.name) {
                self.issue(c.loc, ConflictDeclaration { prev: prev.loc, name: c.name })
            } else {
                self.scopes.declare(Symbol::Class(c));  // declare a class in global scope
            }
        }
        for c in &p.class { // link class deriving relations
            if let Some(p) = c.parent {
                c.parent_ref.set(self.scopes.lookup_class(p));
                if c.parent_ref.get().is_none() { self.issue(c.loc, NoSuchClass(p)) }
            }
        }
        // detect cyclic inheritance
        let mut vis = HashMap::new();
        for (idx, c) in p.class.iter().enumerate() {
            let mut c = *c;
            let mut last = c; // this assignment is useless, the value of `last` never comes from it when used
            loop {
                match vis.entry(Ref(c)) {
                    Entry::Vacant(v) => {
                        v.insert(idx);
                        if let Some(p) = c.parent_ref.get() { (last = c, c = p); } else { break; }
                    }
                    Entry::Occupied(o) => {
                        if *o.get() == idx { self.issue(last.loc, CyclicInheritance) }
                        break;
                    }
                }
            }
        }
        // errors related to inheritance are considered as fatal errors, return after these checks if a error occurred
        if !self.errors.0.is_empty() { return; }
        // start constructing symbol tables within class scopes
        let mut checked = HashSet::new();
        for c in &p.class {
            self.class_def(c, &mut checked);    // scan classes
            if c.name == MAIN_CLASS {
                if c.abstr_ {   // Main class shouldn't be abstract
                    return self.issue(NO_LOC, NoMainClass);
                } else {
                    p.main.set(Some(c));
                }
            }
        }
        // check Main function
        if p.main.get().map(|c| match c.scope.borrow().get(MAIN_METHOD) { // must contains a static main() function
            Some(Symbol::Func(main)) if main.static_ && main.param.is_empty() && main.ret_ty() == Ty::void() => false,
            _ => true
        }).unwrap_or(true) { self.issue(NO_LOC, NoMainClass) }
    }

    fn class_def(&mut self, c: &'a ClassDef<'a>, checked: &mut HashSet<Ref<'a, ClassDef<'a>>>) {
        if !checked.insert(Ref(c)) { return; }  // already scanned
        // scan base class
        if let Some(p) = c.parent_ref.get() {
            self.class_def(p, checked);
            c.unimpl_mthds.borrow_mut().clone_from(&p.unimpl_mthds.borrow()); // init unimplemented methods from base
        }
        self.cur_class = Some(c);
        // scan and scope current class todo why not scope p?
        self.scoped(ScopeOwner::Class(c), |s| for f in &c.field {
            match f {
                FieldDef::FuncDef(f) => s.func_def(f),
                FieldDef::VarDef(v) => s.var_def(v)
            };
        });
        if !c.unimpl_mthds.borrow().is_empty() && !c.abstr_ {
            self.issue(c.loc, BadConcreteClass(c.name))
        }
    }

    fn func_def(&mut self, f: &'a FuncDef<'a>) {
        let ret_ty = self.ty(&f.ret, false);
        self.scoped(ScopeOwner::Param(f), |s| {
            if !f.static_ { s.scopes.declare(Symbol::This(f)); }
            for v in &f.param { s.var_def(v); }
            if let Some(b) = f.body.as_ref() {
                s.block(b); // check block for non-abstract methods
            }
        });
        let ret_param_ty = iter::once(ret_ty).chain(f.param.iter().map(|v| v.ty.get()));
        let ret_param_ty = self.alloc.ty.alloc_extend(ret_param_ty);
        f.ret_param_ty.set(Some(ret_param_ty));
        f.class.set(self.cur_class);
        let ok = if let Some((sym, owner)) = self.scopes.lookup(f.name) {
            match (self.scopes.cur_owner(), owner) {
                (ScopeOwner::Class(c), ScopeOwner::Class(p)) if Ref(c) != Ref(p) => {
                    match sym {
                        Symbol::Func(pf) => {
                            if f.static_ || pf.static_ || (f.is_abstr() && !pf.is_abstr()) {
                                self.issue(f.loc, ConflictDeclaration { prev: pf.loc, name: f.name })
                            } else if !Ty::mk_func(f).assignable_to(Ty::mk_func(pf)) {  // signature mismatch
                                self.issue(f.loc, OverrideMismatch { func: f.name, p: p.name })
                            } else { true }
                        }
                        _ => self.issue(f.loc, ConflictDeclaration { prev: sym.loc(), name: f.name }),
                    }
                }
                _ => self.issue(f.loc, ConflictDeclaration { prev: sym.loc(), name: f.name }),
            }
        } else { true };
        if ok {
            self.scopes.declare(Symbol::Func(f));
            // try implementing or inserting an abstr method to current class
            if f.is_abstr() {   // insert this abstr method into c's abstr method set
                self.cur_class.unwrap().unimpl_mthds.borrow_mut().insert(f.name);
            } else {  // remove
                self.cur_class.unwrap().unimpl_mthds.borrow_mut().remove(f.name);
            }
        }
    } // todo ret_ty and param_ty for lambda function

    fn var_def(&mut self, v: &'a VarDef<'a>) {
        v.ty.set(self.ty(&v.syn_ty, false));
        if v.ty.get() == Ty::void() { self.issue(v.loc, VoidVar(v.name)) }
        // TODO for Var type

        // todo how to open parents' scopes ?
        if self.cur_class.unwrap().name == "B" && v.name == "u" {
            self.scopes.debug_print();
        }
        let ok = if let Some((sym, owner)) = self.scopes.lookup(v.name) {
            match (self.scopes.cur_owner(), owner) {
                (ScopeOwner::Class(c1), ScopeOwner::Class(c2)) if Ref(c1) != Ref(c2) && sym.is_var() =>
                    self.issue(v.loc, OverrideVar(v.name)), // c2 is base of c1
                (ScopeOwner::Class(_), ScopeOwner::Class(_)) | (_, ScopeOwner::Param(_)) | (_, ScopeOwner::Local(_)) =>
                    self.issue(v.loc, ConflictDeclaration { prev: sym.loc(), name: v.name }),   // decaf forbids var shadowing
                _ => true,
            }
        } else { true };    // not found, ok
        if ok {
            v.owner.set(Some(self.scopes.cur_owner()));
            self.scopes.declare(Symbol::Var(v));
        }
    }

    fn block(&mut self, b: &'a Block<'a>) {
        self.scoped(ScopeOwner::Local(b), |s| for st in &b.stmt { s.stmt(st); });
    }

    fn stmt(&mut self, s: &'a Stmt<'a>) {
        match &s.kind {
            StmtKind::LocalVarDef(v) => self.var_def(v),
            StmtKind::If(i) => {
                self.block(&i.on_true);
                if let Some(of) = &i.on_false { self.block(of); }
            }
            StmtKind::While(w) => self.block(&w.body),
            StmtKind::For(f) => self.scoped(ScopeOwner::Local(&f.body), |s| {
                s.stmt(&f.init);
                s.stmt(&f.update);
                for st in &f.body.stmt { s.stmt(st); }
            }),
            StmtKind::Block(b) => self.block(b),
            _ => {}
        };
    }
}