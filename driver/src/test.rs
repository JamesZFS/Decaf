use driver::*;

fn main() {
//    let task = "abstract3";
//    println!("{:?}", test_one_caught(
//        format!("TestCases/S1/{}.decaf", task),
//        format!("TestCases/S1/out/{}.result", task),
//        format!("TestCases/S1/result/{}.result", task),
//        Pa::Pa1b,
//    ));
    for &path in ["TestCases/S2-rs"].iter() {
        for result in test_all(path, Pa::Pa2).unwrap() {
            println!("{:?}", result);
        }
    }
}
