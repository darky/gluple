import gleam/dynamic
import gleam/dynamic/decode.{DecodeError}
import gleeunit
import gleeunit/should
import gluple/addition as ga
import gluple/reflect as gr
import gluple/removal as grm
import gluple/transform as gt

pub fn main() {
  gleeunit.main()
}

pub fn is_tuple_true_test() {
  gr.is_tuple(#())
  |> should.equal(True)
}

pub fn is_tuple_false_test() {
  gr.is_tuple(123)
  |> should.equal(False)
}

pub fn tuple_size_non_zero_test() {
  gr.tuple_size(#(1, True, "test"))
  |> should.equal(Ok(3))
}

pub fn tuple_size_zero_test() {
  gr.tuple_size(#())
  |> should.equal(Ok(0))
}

pub fn tuple_size_on_non_tuple_test() {
  gr.tuple_size(123)
  |> should.equal(Error([DecodeError("Tuple", "123", [])]))
}

pub fn tuple_element_test() {
  gr.tuple_element(#("test"), 0)
  |> should.equal(Ok(dynamic.string("test")))
}

pub fn tuple_not_exists_element_test() {
  gr.tuple_element(#("test"), 1)
  |> should.equal(Error([DecodeError("Tuple size 1", "Desired index 1", [])]))
}

pub fn tuple_to_list_test() {
  gr.tuple_to_list(#(1, 2, 3))
  |> should.equal(Ok([dynamic.int(1), dynamic.int(2), dynamic.int(3)]))
}

pub fn tuple_to_list_on_non_tuple_test() {
  gr.tuple_to_list(123)
  |> should.equal(Error([DecodeError("Tuple", "123", [])]))
}

pub fn list_to_tuple_test() {
  gr.list_to_tuple([1, 2, 3])
  |> should.equal(
    dynamic.array([dynamic.int(1), dynamic.int(2), dynamic.int(3)]),
  )
}

pub fn append1_test() {
  ga.append1(#(1), "test")
  |> should.equal(#(1, "test"))
}

pub fn append2_test() {
  ga.append2(#(1, True), "test")
  |> should.equal(#(1, True, "test"))
}

pub fn append3_test() {
  ga.append3(#(1, True, 1.1), "test")
  |> should.equal(#(1, True, 1.1, "test"))
}

pub fn append4_test() {
  ga.append4(#(1, True, 1.1, Nil), "test")
  |> should.equal(#(1, True, 1.1, Nil, "test"))
}

pub fn append5_test() {
  ga.append5(#(1, True, 1.1, Nil, 0), "test")
  |> should.equal(#(1, True, 1.1, Nil, 0, "test"))
}

pub fn append6_test() {
  ga.append6(#(1, True, 1.1, Nil, 0, False), "test")
  |> should.equal(#(1, True, 1.1, Nil, 0, False, "test"))
}

pub fn append7_test() {
  ga.append7(#(1, True, 1.1, Nil, 0, False, 2.2), "test")
  |> should.equal(#(1, True, 1.1, Nil, 0, False, 2.2, "test"))
}

pub fn append8_test() {
  ga.append8(#(1, True, 1.1, Nil, 0, False, 2.2, Nil), "test")
  |> should.equal(#(1, True, 1.1, Nil, 0, False, 2.2, Nil, "test"))
}

pub fn append9_test() {
  ga.append9(#(1, True, 1.1, Nil, 0, False, 2.2, Nil, 3), "test")
  |> should.equal(#(1, True, 1.1, Nil, 0, False, 2.2, Nil, 3, "test"))
}

pub fn with_append1_test() {
  ga.with_append1(#(1), fn(n) {
    n |> should.equal(1)
    "test"
  })
  |> should.equal(#(1, "test"))
}

pub fn with_append2_test() {
  ga.with_append2(#(1, True), fn(n, b) {
    n |> should.equal(1)
    b |> should.equal(True)
    "test"
  })
  |> should.equal(#(1, True, "test"))
}

pub fn with_append3_test() {
  ga.with_append3(#(1, True, 1.1), fn(n, b, f) {
    n |> should.equal(1)
    b |> should.equal(True)
    f |> should.equal(1.1)
    "test"
  })
  |> should.equal(#(1, True, 1.1, "test"))
}

pub fn with_append4_test() {
  ga.with_append4(#(1, True, 1.1, Nil), fn(n, b, f, nl) {
    n |> should.equal(1)
    b |> should.equal(True)
    f |> should.equal(1.1)
    nl |> should.equal(Nil)
    "test"
  })
  |> should.equal(#(1, True, 1.1, Nil, "test"))
}

pub fn with_append5_test() {
  ga.with_append5(#(1, True, 1.1, Nil, 0), fn(n, b, f, nl, n2) {
    n |> should.equal(1)
    b |> should.equal(True)
    f |> should.equal(1.1)
    nl |> should.equal(Nil)
    n2 |> should.equal(0)
    "test"
  })
  |> should.equal(#(1, True, 1.1, Nil, 0, "test"))
}

pub fn with_append6_test() {
  ga.with_append6(#(1, True, 1.1, Nil, 0, False), fn(n, b, f, nl, n2, b2) {
    n |> should.equal(1)
    b |> should.equal(True)
    f |> should.equal(1.1)
    nl |> should.equal(Nil)
    n2 |> should.equal(0)
    b2 |> should.equal(False)
    "test"
  })
  |> should.equal(#(1, True, 1.1, Nil, 0, False, "test"))
}

pub fn with_append7_test() {
  ga.with_append7(
    #(1, True, 1.1, Nil, 0, False, 2.2),
    fn(n, b, f, nl, n2, b2, f2) {
      n |> should.equal(1)
      b |> should.equal(True)
      f |> should.equal(1.1)
      nl |> should.equal(Nil)
      n2 |> should.equal(0)
      b2 |> should.equal(False)
      f2 |> should.equal(2.2)
      "test"
    },
  )
  |> should.equal(#(1, True, 1.1, Nil, 0, False, 2.2, "test"))
}

pub fn with_append8_test() {
  ga.with_append8(
    #(1, True, 1.1, Nil, 0, False, 2.2, Nil),
    fn(n, b, f, nl, n2, b2, f2, nl2) {
      n |> should.equal(1)
      b |> should.equal(True)
      f |> should.equal(1.1)
      nl |> should.equal(Nil)
      n2 |> should.equal(0)
      b2 |> should.equal(False)
      f2 |> should.equal(2.2)
      nl2 |> should.equal(Nil)
      "test"
    },
  )
  |> should.equal(#(1, True, 1.1, Nil, 0, False, 2.2, Nil, "test"))
}

pub fn with_append9_test() {
  ga.with_append9(
    #(1, True, 1.1, Nil, 0, False, 2.2, Nil, 3),
    fn(n, b, f, nl, n2, b2, f2, nl2, n3) {
      n |> should.equal(1)
      b |> should.equal(True)
      f |> should.equal(1.1)
      nl |> should.equal(Nil)
      n2 |> should.equal(0)
      b2 |> should.equal(False)
      f2 |> should.equal(2.2)
      nl2 |> should.equal(Nil)
      n3 |> should.equal(3)
      "test"
    },
  )
  |> should.equal(#(1, True, 1.1, Nil, 0, False, 2.2, Nil, 3, "test"))
}

pub fn replace_last1_test() {
  gt.replace_last1(#(1), "test")
  |> should.equal(#("test"))
}

pub fn replace_last2_test() {
  gt.replace_last2(#(1, Nil), "test")
  |> should.equal(#(1, "test"))
}

pub fn replace_last3_test() {
  gt.replace_last3(#(1, True, Nil), "test")
  |> should.equal(#(1, True, "test"))
}

pub fn replace_last4_test() {
  gt.replace_last4(#(1, True, 1.1, Nil), "test")
  |> should.equal(#(1, True, 1.1, "test"))
}

pub fn replace_last5_test() {
  gt.replace_last5(#(1, True, 1.1, 2, Nil), "test")
  |> should.equal(#(1, True, 1.1, 2, "test"))
}

pub fn replace_last6_test() {
  gt.replace_last6(#(1, True, 1.1, 2, False, Nil), "test")
  |> should.equal(#(1, True, 1.1, 2, False, "test"))
}

pub fn replace_last7_test() {
  gt.replace_last7(#(1, True, 1.1, 2, False, 2.2, Nil), "test")
  |> should.equal(#(1, True, 1.1, 2, False, 2.2, "test"))
}

pub fn replace_last8_test() {
  gt.replace_last8(#(1, True, 1.1, 2, False, 2.2, "str", Nil), "test")
  |> should.equal(#(1, True, 1.1, 2, False, 2.2, "str", "test"))
}

pub fn replace_last9_test() {
  gt.replace_last9(#(1, True, 1.1, 2, False, 2.2, "str", 3, Nil), "test")
  |> should.equal(#(1, True, 1.1, 2, False, 2.2, "str", 3, "test"))
}

pub fn with_replace_last1_test() {
  gt.with_replace_last1(#(1), fn(n) {
    n |> should.equal(1)
    "test"
  })
  |> should.equal(#("test"))
}

pub fn with_replace_last2_test() {
  gt.with_replace_last2(#(1, True), fn(n, b) {
    n |> should.equal(1)
    b |> should.equal(True)
    "test"
  })
  |> should.equal(#(1, "test"))
}

pub fn with_replace_last3_test() {
  gt.with_replace_last3(#(1, True, 1.1), fn(n, b, f) {
    n |> should.equal(1)
    b |> should.equal(True)
    f |> should.equal(1.1)
    "test"
  })
  |> should.equal(#(1, True, "test"))
}

pub fn with_replace_last4_test() {
  gt.with_replace_last4(#(1, True, 1.1, 2), fn(n, b, f, n2) {
    n |> should.equal(1)
    b |> should.equal(True)
    f |> should.equal(1.1)
    n2 |> should.equal(2)
    "test"
  })
  |> should.equal(#(1, True, 1.1, "test"))
}

pub fn with_replace_last5_test() {
  gt.with_replace_last5(#(1, True, 1.1, 2, False), fn(n, b, f, n2, b2) {
    n |> should.equal(1)
    b |> should.equal(True)
    f |> should.equal(1.1)
    n2 |> should.equal(2)
    b2 |> should.equal(False)
    "test"
  })
  |> should.equal(#(1, True, 1.1, 2, "test"))
}

pub fn with_replace_last6_test() {
  gt.with_replace_last6(#(1, True, 1.1, 2, False, 2.2), fn(n, b, f, n2, b2, f2) {
    n |> should.equal(1)
    b |> should.equal(True)
    f |> should.equal(1.1)
    n2 |> should.equal(2)
    b2 |> should.equal(False)
    f2 |> should.equal(2.2)
    "test"
  })
  |> should.equal(#(1, True, 1.1, 2, False, "test"))
}

pub fn with_replace_last7_test() {
  gt.with_replace_last7(
    #(1, True, 1.1, 2, False, 2.2, "str"),
    fn(n, b, f, n2, b2, f2, s) {
      n |> should.equal(1)
      b |> should.equal(True)
      f |> should.equal(1.1)
      n2 |> should.equal(2)
      b2 |> should.equal(False)
      f2 |> should.equal(2.2)
      s |> should.equal("str")
      "test"
    },
  )
  |> should.equal(#(1, True, 1.1, 2, False, 2.2, "test"))
}

pub fn with_replace_last8_test() {
  gt.with_replace_last8(
    #(1, True, 1.1, 2, False, 2.2, "str", Nil),
    fn(n, b, f, n2, b2, f2, s, nl) {
      n |> should.equal(1)
      b |> should.equal(True)
      f |> should.equal(1.1)
      n2 |> should.equal(2)
      b2 |> should.equal(False)
      f2 |> should.equal(2.2)
      s |> should.equal("str")
      nl |> should.equal(Nil)
      "test"
    },
  )
  |> should.equal(#(1, True, 1.1, 2, False, 2.2, "str", "test"))
}

pub fn with_replace_last9_test() {
  gt.with_replace_last9(
    #(1, True, 1.1, 2, False, 2.2, "str", Nil, 3),
    fn(n, b, f, n2, b2, f2, s, nl, n3) {
      n |> should.equal(1)
      b |> should.equal(True)
      f |> should.equal(1.1)
      n2 |> should.equal(2)
      b2 |> should.equal(False)
      f2 |> should.equal(2.2)
      s |> should.equal("str")
      nl |> should.equal(Nil)
      n3 |> should.equal(3)
      "test"
    },
  )
  |> should.equal(#(1, True, 1.1, 2, False, 2.2, "str", Nil, "test"))
}

pub fn remove_first1_test() {
  #(1) |> grm.remove_first1 |> should.equal(#())
}

pub fn remove_first2_test() {
  #(1, True) |> grm.remove_first2 |> should.equal(#(True))
}

pub fn remove_first3_test() {
  #(1, True, 1.1) |> grm.remove_first3 |> should.equal(#(True, 1.1))
}

pub fn remove_first4_test() {
  #(1, True, 1.1, 2) |> grm.remove_first4 |> should.equal(#(True, 1.1, 2))
}

pub fn remove_first5_test() {
  #(1, True, 1.1, 2, False)
  |> grm.remove_first5
  |> should.equal(#(True, 1.1, 2, False))
}

pub fn remove_first6_test() {
  #(1, True, 1.1, 2, False, 2.2)
  |> grm.remove_first6
  |> should.equal(#(True, 1.1, 2, False, 2.2))
}

pub fn remove_first7_test() {
  #(1, True, 1.1, 2, False, 2.2, 3)
  |> grm.remove_first7
  |> should.equal(#(True, 1.1, 2, False, 2.2, 3))
}

pub fn remove_first8_test() {
  #(1, True, 1.1, 2, False, 2.2, 3, "test")
  |> grm.remove_first8
  |> should.equal(#(True, 1.1, 2, False, 2.2, 3, "test"))
}

pub fn remove_first9_test() {
  #(1, True, 1.1, 2, False, 2.2, 3, "test", Nil)
  |> grm.remove_first9
  |> should.equal(#(True, 1.1, 2, False, 2.2, 3, "test", Nil))
}
