# gluple

[![Package Version](https://img.shields.io/hexpm/v/gluple)](https://hex.pm/packages/gluple)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/gluple/)

Tuple methods for Gleam

```sh
gleam add gluple
```

```gleam
import gluple

pub fn main() {
  gluple.is_tuple(#(1, 2, 3)) // True

  gluple.tuple_size(#(1, True, "test")) // Ok(3)

  gluple.tuple_element(#("test"), 0) // Ok("test")
}
```

Further documentation can be found at <https://hexdocs.pm/gluple>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```
