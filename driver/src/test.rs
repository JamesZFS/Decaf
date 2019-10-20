use driver::*;

fn main() {
    for &path in ["TestCases/S1", "TestCases/S1-LL"].iter() {
        for result in test_all(path, Pa::Pa1b).unwrap() {
            println!("{:?}", result);
        }
    }
}
