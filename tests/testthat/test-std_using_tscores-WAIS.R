out_tmp <- ntrs::std_npsych_scores(
  numeric(0),
  description = "Standardized using T-scores adjusted for age, sex, and education.",
  method = "tscores"
)

test_that("std_using_tscores-WAIS", {
  raw <- ntrs::WAIS(83)

  expect_equal(
    scale_scores(raw),
    18
  )

  res <- std_using_tscores(
    raw,
    age = 62,
    sex = 1,
    educ = 18
  )

  out_tmp@scores_subclass <- "WAIS"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    81
  )
})
