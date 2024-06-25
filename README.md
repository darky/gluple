# gluple

[![Package Version](https://img.shields.io/hexpm/v/gluple)](https://hex.pm/packages/gluple)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/gluple/)

Tuple methods for Gleam

```sh
gleam add gluple
```

```gleam
import gluple/reflect as gr
import gluple/addition as ga
import gluple/transform as gt
import gluple/removal as grm

pub fn main() {
  gr.is_tuple(#(1, 2, 3)) // True

  gr.tuple_size(#(1, True, "test")) // Ok(3)

  gr.tuple_element(#("test"), 0) // Ok(dynamic.from("test"))

  gr.tuple_to_list(#(1, 2, 3)) // Ok([dynamic.from(1), dynamic.from(2), dynamic.from(3)])

  gr.list_to_tuple([1, 2, 3]) // dynamic.from(#(1, 2, 3))

  ga.append2(#(1, True), "test") // #(1, True, "test")

  {
    use _n, _b, <- ga.with_append2(#(1, True))
    "test"
  } // #(1, True, "test")

  gt.replace_last2(#(1, True), "test") // #(1, "test")

  {
    use _n, _b, <- ga.with_replace2(#(1, True))
    "test"
  } // #(1, "test")

  #(1, True) |> grm.remove_first2 // #(True)
}
```

Further documentation can be found at <https://hexdocs.pm/gluple>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```
