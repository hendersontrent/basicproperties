test_that("feature calculations work", {

  y <- arima.sim(model = list(ar = 0.8), n = 1000)
  outs <- get_properties(y)

  expect_equal(21, nrow(outs))
})
