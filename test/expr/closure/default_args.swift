// RUN: %target-parse-verify-swift

func simple_default_args() {
  let _ : (Int) -> Int = {(x : Int = 1) in x+1} // expected-error{{default argument is only permitted for a non-curried function parameter}}
  let _ : () -> Int = {(x : Int = 1) in x+1} // expected-error{{'()' is not a subtype of 'Int'}} expected-error {{default argument is only permitted for a non-curried function parameter}}
  let _ : () -> Int = {(x : Int) in x+1} // expected-error{{'()' is not a subtype of 'Int'}}
}

func func_default_args() {
  func has_default_args(x x: Int = 1) -> Int { return x+1 }
  var _ : (Int) -> Int = has_default_args // okay
  var _ : () -> Int = has_default_args // expected-error{{(x: Int) -> Int' is not convertible to '() -> Int}}
}

