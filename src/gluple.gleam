import gleam/int
import gleam/string

@external(erlang, "erlang", "is_tuple")
@external(javascript, "./gluple_ffi.mjs", "isTuple")
pub fn is_tuple(maybe_tuple: t) -> Bool

pub fn tuple_size(tuple: t) -> Result(Int, String) {
  case is_tuple(tuple) {
    True -> Ok(do_tuple_size(tuple))
    False -> Error("Non tuple passed: " <> string.inspect(tuple))
  }
}

pub fn tuple_element(tuple: t, index: Int) -> Result(el, String) {
  case is_tuple(tuple) {
    True -> {
      let tuple_size = do_tuple_size(tuple)
      case index >= 0 && index < tuple_size {
        True -> Ok(element(index + 1, tuple))
        False ->
          Error(
            "Tuple index out of range; tuple size: "
            <> int.to_string(tuple_size)
            <> ", index: "
            <> int.to_string(index),
          )
      }
    }
    False -> Error("Non tuple passed: " <> string.inspect(tuple))
  }
}

@external(erlang, "erlang", "tuple_size")
@external(javascript, "./gluple_ffi.mjs", "tupleSize")
fn do_tuple_size(tuple: t) -> Int

@external(erlang, "erlang", "element")
@external(javascript, "./gluple_ffi.mjs", "element")
fn element(index: Int, tuple: t) -> el
