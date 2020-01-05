use driver::*;
use std::io::{BufReader, BufWriter};
use std::{io, fs};
use common::IgnoreResult;

fn main() {
    let test_single = true;
    let only_run_tacvm = false;

    if test_single {
        let task = "sort";
        if only_run_tacvm {
            let p = fs::read_to_string(format!("TestCases/S5/out/{}.tac", task)).unwrap();
            tacvm::work(&p, 10_000_000, 1000, true, true,
                        Box::new(BufReader::new(io::stdin())),
                        Box::new(BufWriter::new(io::stdout())),
                        Box::new(BufWriter::new(io::stderr())),
            ).ignore();
        }
        else {
            println!("{:?}", test_one_caught(
                format!("TestCases/S5/{}.decaf", task),
                format!("TestCases/S5/out/{}.result", task),
                format!("TestCases/S5/result/{}.result", task),
                Pa::Pa4,
            ));
        }
    } else {
        for &path in ["TestCases/S5"].iter() {
            for result in test_all(path, Pa::Pa5).unwrap() {
                println!("{:?}", result);
            }
        }
    }
}
