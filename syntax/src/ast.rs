use crate::{ty::*, symbol::*};
use common::{Loc, Ref, BinOp, UnOp, HashSet};
use typed_arena::Arena;
use std::cell::{Cell, RefCell};

#[derive(Default)]
pub struct ASTAlloc<'a> {
    pub(crate) class: Arena<ClassDef<'a>>,
    pub(crate) func: Arena<FuncDef<'a>>,
    pub(crate) var: Arena<VarDef<'a>>,
    pub(crate) program: Arena<Program<'a>>,
}

// all Cell<Option<ref to ast node>> in `Program` and statements are initialized in symbol_pass.rs
// all ... in expressions are initialized in type_pass.rs

pub struct Program<'a> {
    pub class: Vec<&'a ClassDef<'a>>,
    pub main: Cell<Option<&'a ClassDef<'a>>>,
    pub scope: RefCell<Scope<'a>>,
}

pub struct ClassDef<'a> {
    pub abstr_: bool,
    // whether it's an abstract class
    pub loc: Loc,
    pub name: &'a str,
    pub parent: Option<&'a str>,
    pub field: Vec<FieldDef<'a>>,
    pub parent_ref: Cell<Option<&'a ClassDef<'a>>>,
    pub scope: RefCell<Scope<'a>>,
    pub unimpl_mthds: RefCell<HashSet<&'a str>>, // unimplemented methods
}

impl<'a> ClassDef<'a> {
    pub fn extends(&self, rhs: &ClassDef<'a>) -> bool {
//        print!("🤔 checking if {:?} extends {:?} ", self.name, rhs.name);
        let mut c = self;
        loop {
            if Ref(c) == Ref(rhs) { break true; }
            if let Some(p) = c.parent_ref.get() { c = p; } else { break false; }
        }
    }

    // will recursively lookup in all its parent
    pub fn lookup(&self, name: &str) -> Option<Symbol<'a>> {
        let mut c = self;
        loop {
            match c.scope.borrow().get(name) {
                Some(&symbol) => break Some(symbol),
                None => match c.parent_ref.get() {
                    Some(p) => c = p,
                    None => break None,
                }
            }
        }
    }
}

#[derive(derive_more::From, Copy, Clone)]
pub enum FieldDef<'a> {
    FuncDef(&'a FuncDef<'a>),
    VarDef(&'a VarDef<'a>),
}

impl FieldDef<'_> {
    pub fn loc(&self) -> Loc {
        match self {
            FieldDef::FuncDef(f) => f.loc,
            FieldDef::VarDef(v) => v.loc
        }
    }
}

pub struct FuncDef<'a> {
    pub loc: Loc,
    pub name: &'a str,
    pub ret: SynTy<'a>,
    pub param: Vec<&'a VarDef<'a>>,
    pub static_: bool,
    pub body: Option<Block<'a>>,
    // when body is None => it's an abstract method
    // placing ret and param ty in one slice is mainly to some space, especially the size of struct Ty
    // [0] is ret_ty, [1..] is parm_ty
    pub ret_param_ty: Cell<Option<&'a [Ty<'a>]>>,
    // `class` will always be set during typeck (no matter whether it is static)
    pub class: Cell<Option<&'a ClassDef<'a>>>,
    pub scope: RefCell<Scope<'a>>,
}

impl<'a> FuncDef<'a> {
    pub fn ret_ty(&self) -> Ty<'a> { self.ret_param_ty.get().unwrap()[0] }

    pub fn is_abstr(&self) -> bool {
        match self.body {
            None => true,
            Some(_) => false,
        }
    }
}

pub struct VarDef<'a> {
    pub loc: Loc,
    pub name: &'a str,
    pub syn_ty: SynTy<'a>,
    // if this is in an ClassDef, `init` must be None
    // if `syn_ty` is `Var` (not in the basic framework), `init` must be Some
    pub init: Option<(Loc, Expr<'a>)>,
    pub ty: Cell<Ty<'a>>,
    pub owner: Cell<Option<ScopeOwner<'a>>>,
}

impl<'a> VarDef<'a> {
    pub fn init(&self) -> Option<&Expr<'a>> { self.init.as_ref().map(|(_, e)| e) }
}

pub struct Stmt<'a> {
    pub loc: Loc,
    pub kind: StmtKind<'a>,
}

#[derive(derive_more::From)]
pub enum StmtKind<'a> {
    // below 4 are Simple
    Assign(Assign<'a>),
    LocalVarDef(&'a VarDef<'a>),
    ExprEval(Expr<'a>),
    Skip(Skip),
    // rust-clippy tells me this variant's size is too big, use a Box to wrap it
    If(Box<If<'a>>),
    While(While<'a>),
    For(For<'a>),
    Return(Option<Expr<'a>>),
    Print(Vec<Expr<'a>>),
    Break(Break),
    Block(Block<'a>),
}

pub struct Assign<'a> {
    pub dst: Expr<'a>,
    pub src: Expr<'a>,
}

pub struct Block<'a> {
    pub loc: Loc,
    pub stmt: Vec<Stmt<'a>>,
    pub scope: RefCell<Scope<'a>>,
}

pub struct If<'a> {
    pub cond: Expr<'a>,
    pub on_true: Block<'a>,
    pub on_false: Option<Block<'a>>,
}

pub struct While<'a> {
    pub cond: Expr<'a>,
    pub body: Block<'a>,
}

pub struct For<'a> {
    pub init: Box<Stmt<'a>>,
    pub cond: Expr<'a>,
    pub update: Box<Stmt<'a>>,
    pub body: Block<'a>,
}

pub struct Expr<'a> {
    pub loc: Loc,
    pub ty: Cell<Ty<'a>>,
    pub kind: ExprKind<'a>,
}

#[derive(derive_more::From)]
pub enum ExprKind<'a> {
    VarSel(VarSel<'a>),
    // maybe callable
    IndexSel(IndexSel<'a>),
    IntLit(i32),
    BoolLit(bool),
    StringLit(&'a str),
    NullLit(NullLit),
    Call(Call<'a>),
    Unary(Unary<'a>),
    Binary(Binary<'a>),
    This(This),
    ReadInt(ReadInt),
    ReadLine(ReadLine),
    NewClass(NewClass<'a>),
    NewArray(NewArray<'a>),
    ClassTest(ClassTest<'a>),
    ClassCast(ClassCast<'a>),
    Lambda(Lambda<'a>), // callable
}

pub struct Lambda<'a> {
    pub loc: Loc,
    pub name: String,
    pub params: Vec<&'a VarDef<'a>>,
    pub ret_ty: Cell<Option<Ty<'a>>>,
    pub can_tys: RefCell<Vec<Ty<'a>>>,
    // candidate types
    pub body: LambdaKind<'a>,
    // [0] is ret_ty, [1..] is parm_ty
    pub ret_param_ty: Cell<Option<&'a [Ty<'a>]>>,
    // `class` will always be set during typeck (no matter whether it is static)
    pub class: Cell<Option<&'a ClassDef<'a>>>,
    pub scope: RefCell<Scope<'a>>,
}

pub enum LambdaKind<'a> {
    Block(Box<Block<'a>>),
    Expr(Box<Expr<'a>>, RefCell<Scope<'a>>), // if this is a expr-lambda, it should contain a local scope
}

pub struct VarSel<'a> {
    pub owner: Option<Box<Expr<'a>>>,
    pub name: &'a str,
    pub field: Cell<Option<FieldDef<'a>>>,
}

pub struct IndexSel<'a> {
    pub arr: Box<Expr<'a>>,
    pub idx: Box<Expr<'a>>,
}

pub struct Call<'a> {
    // hint: there are 2 places using `func` as VarSel, and there are 2 unimplemented!() respectively
    pub func: Box<Expr<'a>>,
    pub arg: Vec<Expr<'a>>,
    pub func_ref: Cell<Option<Callable<'a>>>,
}

#[derive(Copy, Clone, derive_more::From)]
pub enum Callable<'a> {
    // type of Call expr's lhs
    FuncDef(&'a FuncDef<'a>),
    Lambda(&'a [Ty<'a>]),
    // ret_param
    Functor(&'a VarDef<'a>),
    Length,
}

impl<'a> Callable<'a> {
    pub fn ret_some(&self) -> bool { // return a non-void type?
        match self {
            Callable::FuncDef(fd) => { !fd.ret_ty().is_void() }
            Callable::Lambda(ret_param) => { !ret_param[0].is_void() }
            Callable::Functor(ft) => { !ft.ty.get().is_void() }
            Callable::Length => { true }
        }
    }

    pub fn is_static(&self) -> bool {
        match self {
            Callable::FuncDef(fd) => { fd.static_ }
            Callable::Lambda(_) => { false }
            Callable::Functor(_) => { false }
            Callable::Length => { true }
        }
    }
}

pub struct Binary<'a> {
    pub op: BinOp,
    pub l: Box<Expr<'a>>,
    pub r: Box<Expr<'a>>,
}

pub struct Unary<'a> {
    pub op: UnOp,
    pub r: Box<Expr<'a>>,
}

pub struct NewClass<'a> {
    pub name: &'a str,
    pub class: Cell<Option<&'a ClassDef<'a>>>,
}

pub struct NewArray<'a> {
    pub elem: SynTy<'a>,
    pub len: Box<Expr<'a>>,
}

pub struct ClassTest<'a> {
    pub expr: Box<Expr<'a>>,
    pub name: &'a str,
    pub class: Cell<Option<&'a ClassDef<'a>>>,
}

pub struct ClassCast<'a> {
    pub name: &'a str,
    pub expr: Box<Expr<'a>>,
    pub class: Cell<Option<&'a ClassDef<'a>>>,
}

// some unit struct, they exist just to make match pattern consistent(all patterns are like Xxx(x))
pub struct Skip;

pub struct Break;

pub struct NullLit;

pub struct This;

pub struct ReadInt;

pub struct ReadLine;
