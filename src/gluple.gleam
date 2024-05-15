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
