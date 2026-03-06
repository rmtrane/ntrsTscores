test_that("scale_scores errors when not npsych_scores", {
  local_reproducible_output()

  expect_error(
    scale_scores(c(1, 2)),
    ".+scores.+ must be of class.+npsych_scores.+, but is of class"
  )
})

test_that("scale_scores errors when subclass not appropriate", {
  local_reproducible_output()

  expect_error(
    scale_scores(ntrs::MOCATOTS()),
    "The subclass of .+scores.+ must be one of"
  )
})
