import gleam/dynamic.{type DecodeError, type Dynamic, DecodeError}
import gleam/int
import gleam/string

pub fn tuple_size(tuple: t) -> Result(Int, List(DecodeError)) {
  case is_tuple(tuple) {
    True -> Ok(do_tuple_size(tuple))
    False -> Error([DecodeError("Tuple", string.inspect(tuple), [])])
  }
}

pub fn tuple_to_list(tuple: t) -> Result(List(Dynamic), List(DecodeError)) {
  case is_tuple(tuple) {
    True -> Ok(do_tuple_to_list(tuple))
    False -> Error([DecodeError("Tuple", string.inspect(tuple), [])])
  }
}

pub fn tuple_element(tuple: t, index: Int) -> Result(Dynamic, List(DecodeError)) {
  case is_tuple(tuple) {
    True -> {
      let tuple_size = do_tuple_size(tuple)
      case index >= 0 && index < tuple_size {
        True -> Ok(element(index + 1, tuple))
        False ->
          Error([
            DecodeError(
              "Tuple size " <> int.to_string(tuple_size),
              "Desired index " <> int.to_string(index),
              [],
            ),
          ])
      }
    }
    False -> Error([DecodeError("Tuple", string.inspect(tuple), [])])
  }
}

@external(erlang, "erlang", "is_tuple")
@external(javascript, "./gluple_ffi.mjs", "isTuple")
pub fn is_tuple(maybe_tuple: t) -> Bool

@external(erlang, "erlang", "tuple_to_list")
@external(javascript, "./gluple_ffi.mjs", "tupleToList")
fn do_tuple_to_list(maybe_tuple: t) -> List(Dynamic)

@external(erlang, "erlang", "list_to_tuple")
@external(javascript, "./gluple_ffi.mjs", "listToTuple")
pub fn list_to_tuple(list: List(x)) -> Dynamic

@external(erlang, "erlang", "tuple_size")
@external(javascript, "./gluple_ffi.mjs", "tupleSize")
fn do_tuple_size(tuple: t) -> Int

@external(erlang, "erlang", "element")
@external(javascript, "./gluple_ffi.mjs", "element")
fn element(index: Int, tuple: t) -> el

pub fn append1(tuple: #(a), data: b) -> #(a, b) {
  #(tuple.0, data)
}

pub fn append2(tuple: #(a, b), data: c) -> #(a, b, c) {
  #(tuple.0, tuple.1, data)
}

pub fn append3(tuple: #(a, b, c), data: d) -> #(a, b, c, d) {
  #(tuple.0, tuple.1, tuple.2, data)
}

pub fn append4(tuple: #(a, b, c, d), data: e) -> #(a, b, c, d, e) {
  #(tuple.0, tuple.1, tuple.2, tuple.3, data)
}

pub fn append5(tuple: #(a, b, c, d, e), data: f) -> #(a, b, c, d, e, f) {
  #(tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, data)
}

pub fn append6(tuple: #(a, b, c, d, e, f), data: g) -> #(a, b, c, d, e, f, g) {
  #(tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, data)
}

pub fn append7(
  tuple: #(a, b, c, d, e, f, g),
  data: h,
) -> #(a, b, c, d, e, f, g, h) {
  #(tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6, data)
}

pub fn append8(
  tuple: #(a, b, c, d, e, f, g, h),
  data: i,
) -> #(a, b, c, d, e, f, g, h, i) {
  #(
    tuple.0,
    tuple.1,
    tuple.2,
    tuple.3,
    tuple.4,
    tuple.5,
    tuple.6,
    tuple.7,
    data,
  )
}

pub fn append9(
  tuple: #(a, b, c, d, e, f, g, h, i),
  data: j,
) -> #(a, b, c, d, e, f, g, h, i, j) {
  #(
    tuple.0,
    tuple.1,
    tuple.2,
    tuple.3,
    tuple.4,
    tuple.5,
    tuple.6,
    tuple.7,
    tuple.8,
    data,
  )
}

pub fn replace_last1(_: #(a), data: b) -> #(b) {
  #(data)
}

pub fn replace_last2(tuple: #(a, b), data: c) -> #(a, c) {
  #(tuple.0, data)
}

pub fn replace_last3(tuple: #(a, b, c), data: d) -> #(a, b, d) {
  #(tuple.0, tuple.1, data)
}

pub fn replace_last4(tuple: #(a, b, c, d), data: e) -> #(a, b, c, e) {
  #(tuple.0, tuple.1, tuple.2, data)
}

pub fn replace_last5(tuple: #(a, b, c, d, e), data: f) -> #(a, b, c, d, f) {
  #(tuple.0, tuple.1, tuple.2, tuple.3, data)
}

pub fn replace_last6(tuple: #(a, b, c, d, e, f), data: g) -> #(a, b, c, d, e, g) {
  #(tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, data)
}

pub fn replace_last7(
  tuple: #(a, b, c, d, e, f, g),
  data: h,
) -> #(a, b, c, d, e, f, h) {
  #(tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, data)
}

pub fn replace_last8(
  tuple: #(a, b, c, d, e, f, g, h),
  data: i,
) -> #(a, b, c, d, e, f, g, i) {
  #(tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6, data)
}

pub fn replace_last9(
  tuple: #(a, b, c, d, e, f, g, h, i),
  data: j,
) -> #(a, b, c, d, e, f, g, h, j) {
  #(
    tuple.0,
    tuple.1,
    tuple.2,
    tuple.3,
    tuple.4,
    tuple.5,
    tuple.6,
    tuple.7,
    data,
  )
}
