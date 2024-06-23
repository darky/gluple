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
