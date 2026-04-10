out_tmp <- ntrs::std_npsych_scores(
  numeric(0),
  description = "Standardized using T-scores adjusted for age, sex, and education.",
  method = "tscores"
)

test_that("std_using_tscores-ANIMALS", {
  raw <- ntrs::ANIMALS(34)

  expect_equal(
    scale_scores(raw),
    17
  )

  res <- std_using_tscores(
    raw,
    age = 62,
    sex = 1,
    educ = 18
  )

  out_tmp@scores_subclass <- "ANIMALS"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    71
  )
})

test_that("std_using_tscores-VEG", {
  raw <- ntrs::VEG(13)

  expect_equal(
    scale_scores(raw),
    10
  )

  res <- std_using_tscores(
    raw,
    age = 62,
    sex = 1,
    educ = 18
  )

  out_tmp@scores_subclass <- "VEG"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    50
  )
})

test_that("std_using_tscores-TRAILA", {
  raw <- ntrs::TRAILA(80)

  expect_equal(
    scale_scores(raw),
    3
  )

  res <- std_using_tscores(
    raw,
    age = 62,
    sex = 1,
    educ = 18
  )

  out_tmp@scores_subclass <- "TRAILA"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    17
  )
})


test_that("std_using_tscores-TRAILB", {
  raw <- ntrs::TRAILB(120)

  expect_equal(
    scale_scores(raw),
    7
  )

  res <- std_using_tscores(
    raw,
    age = 62,
    sex = 1,
    educ = 18
  )

  out_tmp@scores_subclass <- "TRAILB"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    30
  )
})
