use crate::{ClassDef, FuncDef, Lambda};
use common::{Loc, Ref};
use std::fmt;
use std::fmt::{Formatter, Error};
use typed_arena::Arena;

#[derive(Eq, PartialEq)]
pub enum SynTyKind<'a> {
    Int,
    Bool,
    String,
    Void,
    Var,
    // local variable ty deduction
    Named(&'a str),
    FunType((Box<SynTy<'a>>, Vec<SynTy<'a>>)),  // ret, params
}

#[derive(Eq, PartialEq)]
pub struct SynTy<'a> {
    pub loc: Loc,
    pub arr: u32,
    pub kind: SynTyKind<'a>,
}

impl<'a> SynTy<'a> {
    pub fn is_func_type(&self) -> bool {
        match self.kind {
            SynTyKind::FunType(_) => true,
            _ => false
        }
    }
    pub fn fill_innermost_ret_type(&mut self, ty: SynTy<'a>) {
        let mut ptr = self;
        loop {
            ptr.loc = ty.loc;
            if let SynTyKind::FunType(ref mut ft) = ptr.kind {
                ptr = &mut ft.0; // goto ret
            } else {
                break;
            }
        }   // until ptr is not a funtype
        ptr.kind = ty.kind;
    }
    pub fn get_innermost_ret_type(&mut self) -> &mut SynTy<'a> {
        let mut ptr = self;
        while let SynTyKind::FunType(ref mut ft) = ptr.kind {
            ptr = &mut ft.0;
        }
        ptr
    }
}

#[derive(Clone, Copy, Eq, PartialEq)]
pub enum TyKind<'a> {
    Int,
    Bool,
    String,
    Void,
    Error,
    Null,
    // `Object` is `class A a` <- this `a`
    Object(Ref<'a, ClassDef<'a>>),
    // `Class` is `Class A { }` <- this `A`
    Class(Ref<'a, ClassDef<'a>>),
    // [0] = ret, [1..] = param
    Func(&'a [Ty<'a>]),
}

impl Default for TyKind<'_> {
    fn default() -> Self { TyKind::Error }
}

// arr > 0 <-> is array, for error/void type, arr can only be 0
#[derive(Clone, Copy, Eq, PartialEq, Default)]
pub struct Ty<'a> {
    pub arr: u32,
    pub kind: TyKind<'a>,
}

pub struct FailToDetermineTy;  // thrown when failing to deduce the sup/inf ty of multiple tys

impl<'a> Ty<'a> {
    // make a type with array dimension = 0
    pub const fn new(kind: TyKind<'a>) -> Ty<'a> { Ty { arr: 0, kind } }

    // like Errors::issue, it can save some typing by returning a default value
    pub fn error_or<T: Default>(self, mut f: impl FnMut() -> T) -> T {
        if self == Ty::error() { T::default() } else { f() }
    }

    pub fn assignable_to(&self, rhs: Ty<'a>) -> bool {
        // self <: rhs
        use TyKind::*;
        match (self.kind, rhs.kind) {
            (Error, _) | (_, Error) => true,
            _ => self.arr == rhs.arr && match (self.kind, rhs.kind) {
                (Int, Int) | (Bool, Bool) | (String, String) | (Void, Void) => true,
                (Object(c1), Object(Ref(c2))) => c1.extends(c2),
                (Null, Object(_)) => true,
                (Null, Null) => true,
                (Func(rp1), Func(rp2)) => {
                    let (r1, p1, r2, p2) = (&rp1[0], &rp1[1..], &rp2[0], &rp2[1..]);
                    r1.assignable_to(*r2) && p1.len() == p2.len() && p1.iter().zip(p2.iter()).all(|(p1, p2)| p2.assignable_to(*p1))
                }
                _ => false,
            }
        }
    }

    // find minimal super ty of given types
    pub fn sup(tys: &Vec<Ty<'a>>, allocator: &'a Arena<Ty<'a>>) -> Result<Ty<'a>, FailToDetermineTy> {
        use TyKind::*;
        if tys.is_empty() { return Ok(Ty::void()); };
        // preprocess: filter out all error tys
        let mut has_error = false;
        let tys = tys.iter().filter(|t| if t.is_err() {
            has_error = true;
            false
        } else { true }).collect::<Vec<_>>();
        let has_error = has_error;
        if tys.is_empty() { return Ok(Ty::error()); }

        // then check all arr dims
        let arr = tys[0].arr;
        if !tys.iter().skip(1).all(|t| t.arr == arr) { return Err(FailToDetermineTy); }

        // then filter out all null types
        let mut has_null = false;
        let tys = tys.into_iter().filter(|&t| if t.kind.is_null() {
            has_null = true;
            false
        } else { true }).collect::<Vec<_>>();
        let has_null = has_null;

        // now process remaining tys
        let mut it = tys.into_iter();
        match it.next() {
            None => match (has_error, has_null) { // just discuss prefix tys
                (_, true) => Ok(Ty { arr, kind: Null }),
                (true, false) => Ok(Ty::error()),
                (false, false) => unreachable!()  // means an empty candidate list
            }
            Some(tk) => { // compute remaining ty
                match tk.kind { // rem_ty == None means conflict occurs
                    Int | Bool | String | Void =>
                        if has_null { Err(FailToDetermineTy) } else if it.all(|ti| ti.assignable_to(*tk)) { Ok(*tk) } else { Err(FailToDetermineTy) }
                    Object(_) => {
                        // pre check
                        if !it.clone().all(|tj| tj.kind.is_object()) { return Err(FailToDetermineTy); }
                        // find lowest common parent class
                        let mut p = tk.clone();
                        loop {
                            if it.clone().all(|ti| ti.assignable_to(p)) {
                                return Ok(p);
                            } else {
                                p.kind = match p.kind.parent_class_ref() {
                                    Some(c) => Object(Ref(c)),
                                    None => return Err(FailToDetermineTy) // p has no parent
                                }
                            }
                        }
                    }
                    Func(f) => if has_null { Err(FailToDetermineTy) } else {
                        // pre check function form
                        let same_form = it.clone().all(|ti| if let Func(fi) = ti.kind {
                            fi.len() == f.len()
                        } else { false });
                        if !same_form { return Err(FailToDetermineTy); }
                        let it = std::iter::once(tk).chain(it); // concat tk
                        // r = sup(r1, r2, ..., rn)
                        let r = it.clone().map(|tj| tj.to_func()[0]).collect::<Vec<_>>();
                        // ** recursively solve **
                        let r = Ty::sup(&r, allocator)?;

                        let mut res = vec![r];
                        // ti = inf(s1i, s2i, ..., snj)
                        for i in 1..f.len() {
                            let si = it.clone().map(|tj| tj.to_func()[i]/* Sji */).collect::<Vec<_>>();
                            // ** recursively solve **
                            let ti = Ty::inf(&si, allocator)?;
                            res.push(ti);
                        }
                        let ret_param = allocator.alloc_extend(res.into_iter());
                        let res = Ty { arr, kind: Func(ret_param) };
                        Ok(res)
                    }
                    _ => unreachable!(),
                }
            }
        }
    }

    // find maximal inferior ty of given types
    pub fn inf(tys: &Vec<Ty<'a>>, allocator: &'a Arena<Ty<'a>>) -> Result<Ty<'a>, FailToDetermineTy> {
        use TyKind::*;
        if tys.is_empty() { return Ok(Ty::void()); };
        // preprocess: if an error occurs, just return error ty
        if tys.iter().any(|t| t.is_err()) { return Ok(Ty::error()); }

        // then check all arr dims
        let arr = tys[0].arr;
        if !tys.iter().skip(1).all(|t| t.arr == arr) { return Err(FailToDetermineTy); }

        // now process remaining tys
        let mut it = tys.into_iter();
        let tk = it.next().unwrap_or_else(|| unreachable!());
        match tk.kind { // rem_ty == None means conflict occurs
            Int | Bool | String | Void =>
                if it.all(|ti| ti.assignable_to(*tk)) { Ok(*tk) } else { Err(FailToDetermineTy) }
            Object(_) | Null => {
                // pre check
                if !it.clone().all(|tj| tj.kind.is_null() || tj.kind.is_object()) { return Err(FailToDetermineTy); }
                let it = std::iter::once(tk).chain(it); // concat tk
                // find highest child class (i.e. one of the given tys!)
                match it.clone().filter(|&ti|
                    it.clone().all(|tj| tj == ti || ti.assignable_to(*tj))).next() {
                    None => Err(FailToDetermineTy),
                    Some(t) => Ok(*t)
                }
            }
            Func(f) => {
                // pre check function form
                let same_form = it.clone().all(|ti| if let Func(fi) = ti.kind {
                    fi.len() == f.len()
                } else { false });
                if !same_form { return Err(FailToDetermineTy); }
                let it = std::iter::once(tk).chain(it); // concat tk
                // r = sup(r1, r2, ..., rn)
                let r = it.clone().map(|tj| tj.to_func()[0]).collect::<Vec<_>>();
                // ** recursively solve **
                let r = Ty::inf(&r, allocator)?;

                let mut res = vec![r];
                // ti = inf(s1i, s2i, ..., snj)
                for i in 1..f.len() {
                    let si = it.clone().map(|tj| tj.to_func()[i]/* Sji */).collect::<Vec<_>>();
                    // ** recursively solve **
                    let ti = Ty::sup(&si, allocator)?;
                    res.push(ti);
                }
                let ret_param = allocator.alloc_extend(res.into_iter());
                let res = Ty { arr, kind: Func(ret_param) };
                Ok(res)
            }
            _ => unreachable!(),
        }
    }

    // why don't use const items?
    // it seems that const items can only have type Ty<'static>, which can NOT be casted to Ty<'a>
    pub const fn error() -> Ty<'a> { Ty::new(TyKind::Error) }

    pub const fn null() -> Ty<'a> { Ty::new(TyKind::Null) }

    pub const fn int() -> Ty<'a> { Ty::new(TyKind::Int) }

    pub const fn bool() -> Ty<'a> { Ty::new(TyKind::Bool) }

    pub const fn void() -> Ty<'a> { Ty::new(TyKind::Void) }

    pub const fn string() -> Ty<'a> { Ty::new(TyKind::String) }

    pub fn mk_obj(c: &'a ClassDef<'a>) -> Ty<'a> { Ty::new(TyKind::Object(Ref(c))) }

    pub fn mk_class(c: &'a ClassDef<'a>) -> Ty<'a> { Ty::new(TyKind::Class(Ref(c))) }

    pub fn mk_func(f: &'a FuncDef<'a>) -> Ty<'a> { Ty::new(TyKind::Func(f.ret_param_ty.get().unwrap())) }

    pub fn mk_lambda(l: &'a Lambda<'a>) -> Ty<'a> { Ty::new(TyKind::Func(l.ret_param_ty.get().unwrap_or_else(|| unimplemented!("lambda missing ret_param_ty")))) }

    // if you want something like `is_void()`, just use `== Ty::void()`
    pub fn is_arr(&self) -> bool { self.arr > 0 }

    pub fn is_func(&self) -> bool { self.arr == 0 && if let TyKind::Func(_) = self.kind { true } else { false } }

    pub fn is_class(&self) -> bool { self.arr == 0 && if let TyKind::Class(_) = self.kind { true } else { false } }

    pub fn is_object(&self) -> bool { self.arr == 0 && if let TyKind::Object(_) = self.kind { true } else { false } }

    pub fn is_void(&self) -> bool { self.kind == TyKind::Void }

    pub fn is_null(&self) -> bool { self.kind == TyKind::Null }

    pub fn is_err(&self) -> bool { self.kind == TyKind::Error }

    pub fn is_basic(&self) -> bool {
        match self.kind {
            TyKind::Int | TyKind::Bool | TyKind::String | TyKind::Void => true,
            _ => false
        }
    }

    pub fn to_func(&self) -> &'a [Ty<'a>] {
        match self.kind {
            TyKind::Func(f) => f,
            _ => panic!("`{:?}` is not a function", self)
        }
    }
}

impl<'a> TyKind<'a> {
    pub fn parent_class_ref(&self) -> Option<&'a ClassDef<'a>> {
        match self {
            TyKind::Object(o) => o.parent_ref.get(),
            TyKind::Class(c) => c.parent_ref.get(),
            _ => panic!("TyKind `{:?}` is not a class type!", self)
        }
    }

    pub fn is_func(&self) -> bool { if let TyKind::Func(_) = self { true } else { false } }
    pub fn is_class(&self) -> bool { if let TyKind::Class(_) = self { true } else { false } }
    pub fn is_object(&self) -> bool { if let TyKind::Object(_) = self { true } else { false } }
    pub fn is_void(&self) -> bool { *self == TyKind::Void }
    pub fn is_null(&self) -> bool { *self == TyKind::Null }
    pub fn is_err(&self) -> bool { *self == TyKind::Error }
    pub fn is_basic(&self) -> bool {
        match self {
            TyKind::Int | TyKind::Bool | TyKind::String | TyKind::Void => true,
            _ => false
        }
    }
}

impl fmt::Debug for TyKind<'_> {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result<(), Error> {
        match self {
            TyKind::Int => write!(f, "int"),
            TyKind::Bool => write!(f, "bool"),
            TyKind::String => write!(f, "string"),
            TyKind::Void => write!(f, "void"),
            TyKind::Error => write!(f, "error"), // we don't expect to reach this case in printing scope info
            TyKind::Null => write!(f, "null"),
            TyKind::Object(c) | TyKind::Class(c) => write!(f, "class {}", c.name),
            TyKind::Func(ret_param) => {
                let (ret, param) = (ret_param[0], &ret_param[1..]);
                write!(f, "{:?}(", ret)?;
                for (idx, p) in param.iter().enumerate() {
                    write!(f, "{:?}{}", p, if idx + 1 == param.len() { "" } else { ", " })?;
                }
                write!(f, ")")
            }
        }?;
        Ok(())
    }
}

impl fmt::Debug for Ty<'_> {
    fn fmt(&self, f: &mut fmt::Formatter) -> Result<(), fmt::Error> {
        write!(f, "{:?}", self.kind)?;
        for _ in 0..self.arr { write!(f, "[]")?; }
        Ok(())
    }
}
