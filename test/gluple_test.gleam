import gleam/dynamic
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
  |> should.equal(Error("Non tuple passed: 123"))
}

pub fn tuple_element_test() {
  gluple.tuple_element(#("test"), 0)
  |> should.equal(Ok("test"))
}

pub fn tuple_not_exists_element_test() {
  gluple.tuple_element(#("test"), 1)
  |> should.equal(Error("Tuple index out of range; tuple size: 1, index: 1"))
}

pub fn tuple_to_list_test() {
  gluple.tuple_to_list(#(1, 2, 3))
  |> should.equal(Ok([dynamic.from(1), dynamic.from(2), dynamic.from(3)]))
}

pub fn tuple_to_list_on_non_tuple_test() {
  gluple.tuple_to_list(123)
  |> should.equal(Error("Non tuple passed: 123"))
}
