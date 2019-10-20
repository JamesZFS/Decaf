use driver::*;

fn main() {
  for result in test_all("TestCases/S1-LL", Pa::Pa1b).unwrap() {
    println!("{:?}", result);
  }
}
