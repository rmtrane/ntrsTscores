out_tmp <- ntrs::std_npsych_scores(
  numeric(0),
  description = "Standardized using T-scores adjusted for age, sex, and education.",
  method = "tscores"
)

test_that("std_using_tscores-REY1REC", {
  raw <- ntrs::REY1REC(8)

  expect_equal(
    scale_scores(raw),
    15
  )

  res <- std_using_tscores(
    raw,
    age = 50,
    sex = 2,
    educ = 12
  )

  out_tmp@scores_subclass <- "REY1REC"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    62
  )
})


test_that("std_using_tscores-REY2REC", {
  raw <- ntrs::REY2REC(7)

  expect_equal(
    scale_scores(raw),
    9
  )

  res <- std_using_tscores(
    raw,
    age = 50,
    sex = 2,
    educ = 12
  )

  out_tmp@scores_subclass <- "REY2REC"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    38
  )
})

test_that("std_using_tscores-REY3REC", {
  raw <- ntrs::REY3REC(12)

  expect_equal(
    scale_scores(raw),
    13
  )

  res <- std_using_tscores(
    raw,
    age = 50,
    sex = 2,
    educ = 12
  )

  out_tmp@scores_subclass <- "REY3REC"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    53
  )
})

test_that("std_using_tscores-REY4REC", {
  raw <- ntrs::REY4REC(15)

  expect_equal(
    scale_scores(raw),
    17
  )

  res <- std_using_tscores(
    raw,
    age = 50,
    sex = 2,
    educ = 12
  )

  out_tmp@scores_subclass <- "REY4REC"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    69
  )
})


test_that("std_using_tscores-REY5REC", {
  raw <- ntrs::REY5REC(1)

  expect_equal(
    scale_scores(raw),
    0
  )

  res <- std_using_tscores(
    raw,
    age = 50,
    sex = 2,
    educ = 12
  )

  out_tmp@scores_subclass <- "REY5REC"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    0
  )
})

test_that("std_using_tscores-REY6REC", {
  raw <- ntrs::REY6REC(12)

  expect_equal(
    scale_scores(raw),
    13
  )

  res <- std_using_tscores(
    raw,
    age = 50,
    sex = 2,
    educ = 12
  )

  out_tmp@scores_subclass <- "REY6REC"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    53
  )
})


test_that("std_using_tscores-REYDREC", {
  raw <- ntrs::REYDREC(10)

  expect_equal(
    scale_scores(raw),
    12
  )

  res <- std_using_tscores(
    raw,
    age = 50,
    sex = 2,
    educ = 12
  )

  out_tmp@scores_subclass <- "REYDREC"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    49
  )
})


test_that("std_using_tscores-REYAREC", {
  raw <- ntrs::REYAREC(ntrs::calc_REYAREC(
    reytcor = ntrs::REYTCOR(13),
    reyfpos = ntrs::REYFPOS(2)
  ))

  expect_equal(
    scale_scores(round(raw)),
    8
  )

  res <- std_using_tscores(
    raw,
    age = 50,
    sex = 2,
    educ = 12
  )

  out_tmp@scores_subclass <- "REYAREC"

  expect_equal(
    res[0],
    out_tmp
  )

  expect_equal(
    as.numeric(res),
    37
  )
})
