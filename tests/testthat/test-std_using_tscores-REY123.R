out_tmp <- ntrs::std_npsych_scores(
  numeric(0),
  description = "Standardized using T-scores adjusted for age, sex, and education.",
  method = "tscores"
)

test_that("std_using_tscores-REY123", {
  raw <- REY123(27)

  res <- std_using_tscores(
    raw,
    age = 50,
    sex = 2,
    educ = 12
  )

  out_tmp@scores_subclass <- "REY123"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    53
  )
})
