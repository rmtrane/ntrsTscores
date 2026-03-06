test_that("std_using_tscores-WAIS works", {
  res <- ntrs::WAIS(83)

  expect_equal(
    scale_scores(res),
    18
  )

  expect_equal(
    std_using_tscores(
      res,
      age = 62,
      sex = 1,
      educ = 18
    ),
    81
  )
})
