#' @include std_using_tscores.R
NULL

#' REY4REC T-score
#'
#' @param scores `REY4REC` scores object
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#'
#' @returns ...
#'
#' @name std_using_tscores-REY4REC
S7::method(std_using_tscores, ntrs::REY4REC) <- function(
  scores,
  age,
  sex,
  educ
) {
  raw_scores <- as.numeric(scores)

  ## SS scores
  ss_scores <- scale_scores(scores)

  raw_tscore <- round(
    (50 +
      ((((ss_scores -
        (10.3271703981 +
          (age * 0.0637213583) +
          (age * age * -0.0013266346) +
          (sex * -1.9598250972) +
          (educ * 0.1859304791))) /
        1) -
        0.00000020833) /
        0.24650622)),
    0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
