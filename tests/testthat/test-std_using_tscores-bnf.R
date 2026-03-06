test_that("std_using_tscores-ANIMALS", {
  res <- ntrs::ANIMALS(34)

  expect_equal(
    scale_scores(res),
    17
  )

  expect_equal(
    std_using_tscores(
      res,
      age = 62,
      sex = 1,
      educ = 18
    ),
    71
  )
})

test_that("std_using_tscores-VEG", {
  res <- ntrs::VEG(13)

  expect_equal(
    scale_scores(res),
    10
  )

  expect_equal(
    std_using_tscores(
      res,
      age = 62,
      sex = 1,
      educ = 18
    ),
    50
  )
})

test_that("std_using_tscores-TRAILA", {
  res <- ntrs::TRAILA(80)

  expect_equal(
    scale_scores(res),
    3
  )

  expect_equal(
    std_using_tscores(
      res,
      age = 62,
      sex = 1,
      educ = 18
    ),
    17
  )
})


test_that("std_using_tscores-TRAILB", {
  res <- ntrs::TRAILB(120)

  expect_equal(
    scale_scores(res),
    7
  )

  expect_equal(
    std_using_tscores(
      res,
      age = 62,
      sex = 1,
      educ = 18
    ),
    30
  )
})
