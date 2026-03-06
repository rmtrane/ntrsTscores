test_that("std_using_tscores-REY123 works", {
  res <- REY123(27)

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
