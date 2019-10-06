use driver::*;

fn main() {
  for result in test_all("TestCases/S1", Pa::Pa1a).unwrap() {
    println!("{:?}", result);
  }
}
