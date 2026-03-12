test_that("std_using_tscores-REY1REC works", {
  res <- ntrs::REY1REC(8)

  expect_equal(
    scale_scores(res),
    15
  )

  expect_equal(
    std_using_tscores(
      res,
      age = 50,
      sex = 2,
      educ = 12
    ),
    62
  )
})


test_that("std_using_tscores-REY2REC works", {
  res <- ntrs::REY2REC(7)

  expect_equal(
    scale_scores(res),
    9
  )

  expect_equal(
    std_using_tscores(
      res,
      age = 50,
      sex = 2,
      educ = 12
    ),
    38
  )
})

test_that("std_using_tscores-REY3REC works", {
  res <- ntrs::REY3REC(12)

  expect_equal(
    scale_scores(res),
    13
  )

  expect_equal(
    std_using_tscores(
      res,
      age = 50,
      sex = 2,
      educ = 12
    ),
    53
  )
})

test_that("std_using_tscores-REY4REC works", {
  res <- ntrs::REY4REC(15)

  expect_equal(
    scale_scores(res),
    17
  )

  expect_equal(
    std_using_tscores(
      res,
      age = 50,
      sex = 2,
      educ = 12
    ),
    69
  )
})


test_that("std_using_tscores-REY5REC works", {
  res <- ntrs::REY5REC(1)

  expect_equal(
    scale_scores(res),
    0
  )

  expect_equal(
    std_using_tscores(
      res,
      age = 50,
      sex = 2,
      educ = 12
    ),
    0
  )
})

test_that("std_using_tscores-REY6REC works", {
  res <- ntrs::REY6REC(12)

  expect_equal(
    scale_scores(res),
    13
  )

  expect_equal(
    std_using_tscores(
      res,
      age = 50,
      sex = 2,
      educ = 12
    ),
    53
  )
})


test_that("std_using_tscores-REYDREC works", {
  res <- ntrs::REYDREC(10)

  expect_equal(
    scale_scores(res),
    12
  )

  expect_equal(
    std_using_tscores(
      res,
      age = 50,
      sex = 2,
      educ = 12
    ),
    49
  )
})


test_that("std_using_tscores-REYAREC works", {
  res <- ntrs::REYAREC(ntrs::calc_REYAREC(
    reytcor = ntrs::REYTCOR(13),
    reyfpos = ntrs::REYFPOS(2)
  ))

  expect_equal(
    scale_scores(round(res)),
    8
  )

  expect_equal(
    std_using_tscores(
      res,
      age = 50,
      sex = 2,
      educ = 12
    ),
    37
  )
})
