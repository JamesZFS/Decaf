use driver::*;

fn main() {
    let task = "lambda-return-error-3";
    println!("{:?}", test_one_caught(
        format!("TestCases/S2-rs/{}.decaf", task),
        format!("TestCases/S2-rs/out/{}.result", task),
        format!("TestCases/S2-rs/result/{}.result", task),
        Pa::Pa2,
    ));
//    for &path in ["TestCases/S2-rs"].iter() {
//        for result in test_all(path, Pa::Pa2).unwrap() {
//            println!("{:?}", result);
//        }
//    }
}
