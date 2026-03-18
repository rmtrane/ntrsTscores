out_tmp <- ntrs::std_npsych_scores(
  numeric(0),
  description = "Standardized using T-scores adjusted for age, sex, and education.",
  method = "tscores"
)

test_that("std_using_tscores-REYDLIST", {
  raw <- ntrs::REYDLIST(5)

  res <- std_using_tscores(
    raw,
    age = 50,
    sex = 2,
    educ = 12
  )

  out_tmp@scores_subclass <- "REYDLIST"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    48
  )
})
