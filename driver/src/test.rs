use driver::*;

fn main() {
    let test_single = false;
    if test_single {
//        let task = "abstract-1";
        let task = "test-call";
        println!("{:?}", test_one_caught(
            format!("TestCases/S3/{}.decaf", task),
            format!("TestCases/S3/out/{}.result", task),
            format!("TestCases/S3/result/{}.result", task),
            Pa::Pa3,
        ));
    } else {
        for &path in ["TestCases/S3"].iter() {
            for result in test_all(path, Pa::Pa3).unwrap() {
                println!("{:?}", result);
            }
        }
    }
}
