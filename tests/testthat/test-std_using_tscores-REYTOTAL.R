test_that("std_using_tscores-REYTOTAL works", {
  reytotal <- ntrs::REYTOTAL(x = c(25, 55))

  ## From T-score calculator
  expected_values <- c(24, 61)

  expect_equal(
    std_using_tscores(
      reytotal,
      age = c(60, 63),
      sex = c(1, 2),
      educ = c(15, 12)
    ),
    expected_values
  )
})


test_that("std_using_tscores-REYTOTAL fails when missing covariate", {
  reytotal <- ntrs::REYTOTAL(x = 25)

  expect_error(
    std_using_tscores(
      reytotal,
      age = 60
    ),
    "argument.+is missing, with no default"
  )
})
