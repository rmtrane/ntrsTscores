test_that("std_using_tscores generic alerts when age outside of allowed range", {
  local_reproducible_output()

  expect_message(
    res <- std_using_tscores(ntrs::REYTOTAL(72), age = 25, sex = 1, educ = 15),
    ".+age.+ must be a numeric vector of values between 30 and 91. Values outside this range have been truncated."
  )

  expect_equal(
    res,
    std_using_tscores(ntrs::REYTOTAL(72), age = 30, sex = 1, educ = 15)
  )
})


test_that("std_using_tscores generic alerts when educ outside of allowed range", {
  local_reproducible_output()

  expect_message(
    res <- std_using_tscores(ntrs::REYTOTAL(72), age = 45, sex = 1, educ = 25),
    ".+educ.+ must be a numeric vector of values between 8 and 20. Values outside this range have been truncated."
  )

  expect_equal(
    res,
    std_using_tscores(ntrs::REYTOTAL(72), age = 45, sex = 1, educ = 20)
  )
})


test_that("std_using_tscores generic alerts when age and educ outside of allowed range", {
  local_reproducible_output()

  expect_message(
    std_using_tscores(ntrs::REYTOTAL(72), age = 95, sex = 1, educ = 5),
    ".+age.+ must be a numeric vector of values between 30 and 91. Values outside this range have been truncated."
  )

  expect_message(
    res <- std_using_tscores(ntrs::REYTOTAL(72), age = 95, sex = 1, educ = 5),
    ".+educ.+ must be a numeric vector of values between 8 and 20. Values outside this range have been truncated."
  )

  expect_equal(
    res,
    std_using_tscores(ntrs::REYTOTAL(72), age = 91, sex = 1, educ = 8)
  )
})
