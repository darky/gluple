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

pub fn with_append1(tuple: #(a), cb: fn(a) -> b) -> #(a, b) {
  #(tuple.0, cb(tuple.0))
}

pub fn with_append2(tuple: #(a, b), cb: fn(a, b) -> c) -> #(a, b, c) {
  #(tuple.0, tuple.1, cb(tuple.0, tuple.1))
}

pub fn with_append3(tuple: #(a, b, c), cb: fn(a, b, c) -> d) -> #(a, b, c, d) {
  #(tuple.0, tuple.1, tuple.2, cb(tuple.0, tuple.1, tuple.2))
}

pub fn with_append4(
  tuple: #(a, b, c, d),
  cb: fn(a, b, c, d) -> e,
) -> #(a, b, c, d, e) {
  #(tuple.0, tuple.1, tuple.2, tuple.3, cb(tuple.0, tuple.1, tuple.2, tuple.3))
}

pub fn with_append5(
  tuple: #(a, b, c, d, e),
  cb: fn(a, b, c, d, e) -> f,
) -> #(a, b, c, d, e, f) {
  #(
    tuple.0,
    tuple.1,
    tuple.2,
    tuple.3,
    tuple.4,
    cb(tuple.0, tuple.1, tuple.2, tuple.3, tuple.4),
  )
}

pub fn with_append6(
  tuple: #(a, b, c, d, e, f),
  cb: fn(a, b, c, d, e, f) -> g,
) -> #(a, b, c, d, e, f, g) {
  #(
    tuple.0,
    tuple.1,
    tuple.2,
    tuple.3,
    tuple.4,
    tuple.5,
    cb(tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5),
  )
}

pub fn with_append7(
  tuple: #(a, b, c, d, e, f, g),
  cb: fn(a, b, c, d, e, f, g) -> h,
) -> #(a, b, c, d, e, f, g, h) {
  #(
    tuple.0,
    tuple.1,
    tuple.2,
    tuple.3,
    tuple.4,
    tuple.5,
    tuple.6,
    cb(tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6),
  )
}

pub fn with_append8(
  tuple: #(a, b, c, d, e, f, g, h),
  cb: fn(a, b, c, d, e, f, g, h) -> i,
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
    cb(tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6, tuple.7),
  )
}

pub fn with_append9(
  tuple: #(a, b, c, d, e, f, g, h, i),
  cb: fn(a, b, c, d, e, f, g, h, i) -> j,
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
    cb(
      tuple.0,
      tuple.1,
      tuple.2,
      tuple.3,
      tuple.4,
      tuple.5,
      tuple.6,
      tuple.7,
      tuple.8,
    ),
  )
}
