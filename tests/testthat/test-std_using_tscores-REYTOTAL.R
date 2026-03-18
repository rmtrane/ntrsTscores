out_tmp <- ntrs::std_npsych_scores(
  numeric(0),
  description = "Standardized using T-scores adjusted for age, sex, and education.",
  method = "tscores"
)

test_that("std_using_tscores-REYTOTAL", {
  raw <- ntrs::REYTOTAL(x = c(25, 55))

  res <- std_using_tscores(
    raw,
    age = c(60, 63),
    sex = c(1, 2),
    educ = c(15, 12)
  )

  out_tmp@scores_subclass <- "REYTOTAL"

  expect_equal(
    res[0],
    out_tmp
  )

  ## From T-score calculator
  expect_equal(
    as.numeric(res),
    c(24, 61)
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
