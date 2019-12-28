use driver::*;
use std::io::{BufReader, BufWriter};
use std::{io, fs};
use common::IgnoreResult;

fn main() {
    let test_single = false;
    let only_run_tacvm = false;

    if test_single {
        let task = "lambda-0";
        if only_run_tacvm {
            let p = fs::read_to_string(format!("TestCases/S4/out/{}.tac", task)).unwrap();
            tacvm::work(&p, 100_000, 1000, true, true,
                        Box::new(BufReader::new(io::stdin())),
                        Box::new(BufWriter::new(io::stdout())),
                        Box::new(BufWriter::new(io::stderr())),
            ).ignore();
        }
        else {
            println!("{:?}", test_one_caught(
                format!("TestCases/S4/{}.decaf", task),
                format!("TestCases/S4/out/{}.result", task),
                format!("TestCases/S4/result/{}.result", task),
                Pa::Pa3,
            ));
        }
    } else {
        for &path in ["TestCases/S4"].iter() {
            for result in test_all(path, Pa::Pa3).unwrap() {
                println!("{:?}", result);
            }
        }
    }
}
