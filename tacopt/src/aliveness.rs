use crate::bb::{FuncBB, BB};
use crate::flow::{Flow, FlowElem};
use crate::flow;
use tac::Operand::Reg;
use bitset::traits::*;

pub fn work(f: &mut FuncBB) {
    assert!(f.param_num <= f.reg_num);
    // flow through all BBs, compute LiveOut(B)s
    let mut flow_solver = Flow::<flow::Or>::new(f.bb.len(), f.reg_num as usize);
    // init bitset
    // for each BB: def, live_use, live_out =init= {}, live_in =init= live_use
    for (i, bb) in f.bb.iter().enumerate() {
        let FlowElem { gen: luse, kill: def, in_: _lout, out: lin } = flow_solver.get(i);
        compute_def_use(bb, def, luse);
        lin.bsor(luse);
    }
    // solve flow equation
    flow_solver.solve(f.bb.iter().enumerate().map(|(idx, bb)| bb.next_with_entry(idx)));
    // for each BB, scan backward, compute LiveOut(S) incrementally
    // and eliminate dead codes at the same time
    for (i, bb) in f.bb.iter_mut().enumerate() {
        let FlowElem { gen: _luse, kill: _def, in_: lout, out: _lin } = flow_solver.get(i);
        do_optimize(bb, lout);
    }
}

fn compute_def_use(bb: &BB, def: &mut [u32], luse: &mut [u32]) {
    for tac_node in bb.iter() {
        let tac = tac_node.tac.get();
        let (refs, dst) = tac.rw();
        // use_S - U def
        for op in refs {
            if let Reg(reg) = *op {
                if !def.bsget(reg) {
                    luse.bsset(reg);
                }
            }
        }
        // update def
        if let Some(reg) = dst {
            def.bsset(reg);
        }
    }
    if let Some(reg) = bb.next_r() {
        if !def.bsget(reg) {
            luse.bsset(reg);
        }
    }
}

fn do_optimize(bb: &mut BB, lout: &mut [u32]) {
    // don't forget to update the jif/jump/ret statement first:
    if let Some(used) = bb.next_r() {
        lout.bsset(used);
    }
    for tac_node in bb.iter().rev() { // iter backward
    use tac::Tac::*;
        let tac = tac_node.tac.get();
        let (refs, dst) = tac.rw();
        // possibly delete this tac
        let removed = match tac {
            Call { dst: Some(dst), kind } => // with side effects: a = call XXX -> call XXX
                if !lout.bsget(dst) {
                    tac_node.tac.set(Call { dst: None, kind });
                    for op in refs {
                        if let Reg(used) = *op {
                            lout.bsset(used);
                        }
                    }
                    continue;
                } else { false }
            ,
            _ =>
                if let Some(dst) = dst {
                    if !lout.bsget(dst) { // unused definition, delete this tac
                        bb.del(tac_node);
                        true
                    } else { false }
                } else { false }
        };
        // update lout: f_s(x) = (x - def_s) U use_s
        if !removed {
            if let Some(dst) = dst {
                lout.bsdel(dst);
            }
            for op in refs {
                if let Reg(used) = *op {
                    lout.bsset(used);
                }
            }
        }
    }
}
