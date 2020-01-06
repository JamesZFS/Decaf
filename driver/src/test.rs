use driver::*;

fn main() {
    let test_single = false;

    if test_single {
        let task = "zfs";
        println!("{:?}", test_one_caught(
            format!("TestCases/S5/{}.decaf", task),
            format!("TestCases/S5/out/{}.result", task),
            format!("TestCases/S5/result/{}.result", task),
            Pa::Pa5,
        ));
    } else {
        for &path in ["TestCases/S5"].iter() {
            for result in test_all(path, Pa::Pa5).unwrap() {
                println!("{:?}", result);
            }
        }
    }
}
