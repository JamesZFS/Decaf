use driver::*;
use std::io::{BufReader, BufWriter};
use std::{io, fs};
use std::fs::File;

fn main() {
    let test_single = true;
    let only_run_tacvm = false;
    let task = "lambda-2";

    if test_single {
        if only_run_tacvm {
            let p = fs::read_to_string(format!("TestCases/S3/out/{}.tac", task)).unwrap();
            tacvm::work(&p, 100_000, 1000, true, true,
                        Box::new(BufReader::new(io::stdin())),
                        Box::new(BufWriter::new(io::stdout())),
                        Box::new(BufWriter::new(File::create(format!("TestCases/S3/out/{}.info", task)).unwrap())),
            ).unwrap();
        }
        else {
            println!("{:?}", test_one_caught(
                format!("TestCases/S3/{}.decaf", task),
                format!("TestCases/S3/out/{}.result", task),
                format!("TestCases/S3/result/{}.result", task),
                Pa::Pa3,
            ));
        }
    } else {
        for &path in ["TestCases/S2-rs"].iter() {
            for result in test_all(path, Pa::Pa2).unwrap() {
                println!("{:?}", result);
            }
        }
    }
}
