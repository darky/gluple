pub fn remove_first1(_: #(a)) -> #() {
  #()
}

pub fn remove_first2(tuple: #(a, b)) -> #(b) {
  #(tuple.1)
}

pub fn remove_first3(tuple: #(a, b, c)) -> #(b, c) {
  #(tuple.1, tuple.2)
}

pub fn remove_first4(tuple: #(a, b, c, d)) -> #(b, c, d) {
  #(tuple.1, tuple.2, tuple.3)
}

pub fn remove_first5(tuple: #(a, b, c, d, e)) -> #(b, c, d, e) {
  #(tuple.1, tuple.2, tuple.3, tuple.4)
}

pub fn remove_first6(tuple: #(a, b, c, d, e, f)) -> #(b, c, d, e, f) {
  #(tuple.1, tuple.2, tuple.3, tuple.4, tuple.5)
}

pub fn remove_first7(tuple: #(a, b, c, d, e, f, g)) -> #(b, c, d, e, f, g) {
  #(tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6)
}

pub fn remove_first8(tuple: #(a, b, c, d, e, f, g, h)) -> #(b, c, d, e, f, g, h) {
  #(tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6, tuple.7)
}

pub fn remove_first9(
  tuple: #(a, b, c, d, e, f, g, h, i),
) -> #(b, c, d, e, f, g, h, i) {
  #(tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6, tuple.7, tuple.8)
}
