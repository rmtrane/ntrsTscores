test_that("std_using_tscores-REYDLIST works", {
  res <- ntrs::REYDLIST(5)

  expect_equal(
    std_using_tscores(
      res,
      age = 50,
      sex = 2,
      educ = 12
    ),
    48
  )
})
