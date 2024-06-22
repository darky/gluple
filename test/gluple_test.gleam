import gleam/dynamic.{DecodeError}
import gleeunit
import gleeunit/should
import gluple

pub fn main() {
  gleeunit.main()
}

pub fn is_tuple_true_test() {
  gluple.is_tuple(#())
  |> should.equal(True)
}

pub fn is_tuple_false_test() {
  gluple.is_tuple(123)
  |> should.equal(False)
}

pub fn tuple_size_non_zero_test() {
  gluple.tuple_size(#(1, True, "test"))
  |> should.equal(Ok(3))
}

pub fn tuple_size_zero_test() {
  gluple.tuple_size(#())
  |> should.equal(Ok(0))
}

pub fn tuple_size_on_non_tuple_test() {
  gluple.tuple_size(123)
  |> should.equal(Error([DecodeError("Tuple", "123", [])]))
}

pub fn tuple_element_test() {
  gluple.tuple_element(#("test"), 0)
  |> should.equal(Ok(dynamic.from("test")))
}

pub fn tuple_not_exists_element_test() {
  gluple.tuple_element(#("test"), 1)
  |> should.equal(Error([DecodeError("Tuple size 1", "Desired index 1", [])]))
}

pub fn tuple_to_list_test() {
  gluple.tuple_to_list(#(1, 2, 3))
  |> should.equal(Ok([dynamic.from(1), dynamic.from(2), dynamic.from(3)]))
}

pub fn tuple_to_list_on_non_tuple_test() {
  gluple.tuple_to_list(123)
  |> should.equal(Error([DecodeError("Tuple", "123", [])]))
}

pub fn list_to_tuple_test() {
  gluple.list_to_tuple([1, 2, 3])
  |> should.equal(dynamic.from(#(1, 2, 3)))
}

pub fn append1_test() {
  gluple.append1(#(1), "test")
  |> should.equal(#(1, "test"))
}

pub fn append2_test() {
  gluple.append2(#(1, True), "test")
  |> should.equal(#(1, True, "test"))
}

pub fn append3_test() {
  gluple.append3(#(1, True, 1.1), "test")
  |> should.equal(#(1, True, 1.1, "test"))
}

pub fn append4_test() {
  gluple.append4(#(1, True, 1.1, Nil), "test")
  |> should.equal(#(1, True, 1.1, Nil, "test"))
}

pub fn append5_test() {
  gluple.append5(#(1, True, 1.1, Nil, 0), "test")
  |> should.equal(#(1, True, 1.1, Nil, 0, "test"))
}

pub fn append6_test() {
  gluple.append6(#(1, True, 1.1, Nil, 0, False), "test")
  |> should.equal(#(1, True, 1.1, Nil, 0, False, "test"))
}

pub fn append7_test() {
  gluple.append7(#(1, True, 1.1, Nil, 0, False, 2.2), "test")
  |> should.equal(#(1, True, 1.1, Nil, 0, False, 2.2, "test"))
}

pub fn append8_test() {
  gluple.append8(#(1, True, 1.1, Nil, 0, False, 2.2, Nil), "test")
  |> should.equal(#(1, True, 1.1, Nil, 0, False, 2.2, Nil, "test"))
}

pub fn append9_test() {
  gluple.append9(#(1, True, 1.1, Nil, 0, False, 2.2, Nil, 3), "test")
  |> should.equal(#(1, True, 1.1, Nil, 0, False, 2.2, Nil, 3, "test"))
}

pub fn replace_last1_test() {
  gluple.replace_last1(#(1), "test")
  |> should.equal(#("test"))
}

pub fn replace_last2_test() {
  gluple.replace_last2(#(1, Nil), "test")
  |> should.equal(#(1, "test"))
}

pub fn replace_last3_test() {
  gluple.replace_last3(#(1, True, Nil), "test")
  |> should.equal(#(1, True, "test"))
}

pub fn replace_last4_test() {
  gluple.replace_last4(#(1, True, 1.1, Nil), "test")
  |> should.equal(#(1, True, 1.1, "test"))
}

pub fn replace_last5_test() {
  gluple.replace_last5(#(1, True, 1.1, 2, Nil), "test")
  |> should.equal(#(1, True, 1.1, 2, "test"))
}

pub fn replace_last6_test() {
  gluple.replace_last6(#(1, True, 1.1, 2, False, Nil), "test")
  |> should.equal(#(1, True, 1.1, 2, False, "test"))
}

pub fn replace_last7_test() {
  gluple.replace_last7(#(1, True, 1.1, 2, False, 2.2, Nil), "test")
  |> should.equal(#(1, True, 1.1, 2, False, 2.2, "test"))
}

pub fn replace_last8_test() {
  gluple.replace_last8(#(1, True, 1.1, 2, False, 2.2, "str", Nil), "test")
  |> should.equal(#(1, True, 1.1, 2, False, 2.2, "str", "test"))
}

pub fn replace_last9_test() {
  gluple.replace_last9(#(1, True, 1.1, 2, False, 2.2, "str", 3, Nil), "test")
  |> should.equal(#(1, True, 1.1, 2, False, 2.2, "str", 3, "test"))
}
