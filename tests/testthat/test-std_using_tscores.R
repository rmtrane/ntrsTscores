test_that("std_using_tscores warns when additional parameters are passed", {
  local_reproducible_output()

  expect_warning(
    std_using_tscores(
      ntrs::REYTOTAL(71),
      age = 90,
      sex = 2,
      educ = 10,
      extra_param = "extra"
    ),
    regexp = ".extra_param. is not used when standardizing.+REYTOTAL.+ using tscores."
  )

  expect_warning(
    std_using_tscores(
      ntrs::REYTOTAL(71),
      age = 90,
      sex = 2,
      educ = 10,
      extra_param_1 = "extra",
      extra_param_2 = "extra2"
    ),
    regexp = ".extra_param_1. and .extra_param_2. are not used when standardizing.+REYTOTAL.+ using tscores."
  )

  expect_warning(
    std_using_tscores(
      ntrs::REYTOTAL(71),
      age = 90,
      sex = 2,
      educ = 10,
      extra_param_1 = "extra",
      extra_param_2 = "extra2",
      extra_param_3 = "extra3"
    ),
    regexp = ".extra_param_1., .extra_param_2., and .extra_param_3. are not used when standardizing.+REYTOTAL.+ using tscores."
  )
})


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

  # expect_message(
  #   std_using_tscores(ntrs::REYTOTAL(72), age = 95, sex = 1, educ = 5),
  #   regexp = ".+age.+ must be a numeric vector of values between 30 and 91. Values outside this range have been truncated.+"
  # )

  # expect_message(
  res <- std_using_tscores(ntrs::REYTOTAL(72), age = 95, sex = 1, educ = 5) #,
  #   ".+educ.+ must be a numeric vector of values between 8 and 20. Values outside this range have been truncated."
  # )

  expect_equal(
    res,
    std_using_tscores(ntrs::REYTOTAL(72), age = 91, sex = 1, educ = 8)
  )
})


test_that("std_using_tscores generic alerts when sex not 1s and 2s", {
  local_reproducible_output()

  expect_error(
    std_using_tscores(ntrs::REYTOTAL(71), age = 92, sex = 3, educ = 10),
    ".+sex.+ must be a numeric vector of"
  )

  expect_error(
    std_using_tscores(ntrs::REYTOTAL(71), age = 92, sex = "male", educ = 10),
    ".+sex.+ must be a numeric vector of"
  )
})


test_that("std_using_tscores generic alerts when age is not numeric", {
  local_reproducible_output()

  expect_error(
    std_using_tscores(ntrs::REYTOTAL(71), age = "92", sex = 2, educ = 10),
    ".+age.+ must be a numeric vector"
  )
})


test_that("std_using_tscores generic alerts when educ is not numeric", {
  local_reproducible_output()

  expect_error(
    std_using_tscores(
      ntrs::REYTOTAL(71),
      age = 90,
      sex = 2,
      educ = "highschool"
    ),
    ".+educ.+ must be a numeric vector"
  )
})
