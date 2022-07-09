test_that("dots works", {
  x <- dots(shp = suffolk, cols = pop_white)
  expect_true(inherits(x, 'ggplot'))
})
