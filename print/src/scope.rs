use common::{IndentPrinter, IgnoreResult, Loc};
use syntax::{ast::*, Scope};
use std::fmt::Write;

pub fn show_scope(s: &Scope, p: &mut IndentPrinter) {
    let mut s = s.iter().map(|(_, &sym)| sym).collect::<Vec<_>>();
    s.sort_unstable_by_key(|x| x.loc());
    if s.is_empty() { write!(p, "<empty>").ignore(); } else { for s in s { write!(p, "{:?}", s).ignore(); } }
}

pub fn program(pr: &Program, p: &mut IndentPrinter) {
    write!(p, "GLOBAL SCOPE:").ignore();
    p.indent(|p| {
        show_scope(&pr.scope.borrow(), p);
        for c in &pr.class { class_def(c, p); }
    });
}

pub fn class_def(c: &ClassDef, p: &mut IndentPrinter) {
    write!(p, "CLASS SCOPE OF '{}':", c.name).ignore();
    p.indent(|p| {
        show_scope(&c.scope.borrow(), p);
        for f in &c.field {
            if let FieldDef::FuncDef(f) = f { func_def(f, p); }
        }
    });
}

pub fn func_def(f: &FuncDef, p: &mut IndentPrinter) {
    write!(p, "FORMAL SCOPE OF '{}':", f.name).ignore();
    p.indent(|p| {
        show_scope(&f.scope.borrow(), p);   // formal scope
        if let Some(ref b) = f.body { block(b, p); } // non-abstract method
    });
}

pub fn lambda_expr(l: &Lambda, p: &mut IndentPrinter) {
    write!(p, "FORMAL SCOPE OF '{}':", l.name).ignore();
    p.indent(|p| {
        show_scope(&l.scope.borrow(), p);   // formal scope
        match &l.body { // local scope
            LambdaKind::Block(b) => block(b, p),
            LambdaKind::Expr(e, s) => {
                write!(p, "LOCAL SCOPE:").ignore();
                p.indent(|p| {
                    show_scope(&s.borrow(), p);
                    expr(e, p); // ** recurse **
                });
            }
        }
    });
}

pub fn block(b: &Block, p: &mut IndentPrinter) {
    write!(p, "LOCAL SCOPE:").ignore();
    p.indent(|p| {
        show_scope(&b.scope.borrow(), p);
        for s in &b.stmt {
            match &s.kind {
                StmtKind::If(i) => {
                    block(&i.on_true, p);
                    if let Some(on_false) = &i.on_false { block(on_false, p); }
                }
                StmtKind::While(w) => block(&w.body, p),
                StmtKind::For(f) => block(&f.body, p),
                StmtKind::Block(b) => block(b, p),
                // lambda expr
                StmtKind::Assign(Assign { dst: _, src }) => expr(src, p),
                StmtKind::LocalVarDef(VarDef { init: Some((_, e)), .. }) => expr(e, p),
                StmtKind::ExprEval(e) => expr(e, p),
                StmtKind::Return(Some(e)) => expr(e, p),
                StmtKind::Print(es) => for e in es { expr(e, p) }
                _ => {}
            }
        }
    });
}

pub fn expr(e: &Expr, p: &mut IndentPrinter) {
    match &e.kind {
        ExprKind::VarSel(VarSel { owner: Some(o), .. }) => expr(o, p),
        ExprKind::IndexSel(IndexSel { arr, idx }) => {
            expr(arr, p);
            expr(idx, p)
        }
        ExprKind::Call(Call { func, arg, .. }) => {
            expr(func, p);
            for x in arg {
                expr(x, p);
            }
        }
        ExprKind::Unary(Unary { op: _, r }) => expr(r, p),
        ExprKind::Binary(Binary { op: _, l, r }) => {
            expr(l, p);
            expr(r, p);
        }
        ExprKind::NewArray(NewArray { elem: _, len }) => expr(len, p),
        ExprKind::ClassTest(ClassTest { expr: e, .. }) => expr(e, p),
        ExprKind::ClassCast(ClassCast { expr: e, .. }) => expr(e, p),
        ExprKind::Lambda(l) => lambda_expr(l, p),   // all we're looking for is lambda expr
        _ => {}
    };
}
