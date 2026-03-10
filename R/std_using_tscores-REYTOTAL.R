#' @include std_using_tscores.R
NULL

#' REYTOTAL T-score
#'
#' @param scores `REYTOTAL` scores object
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#'
#' @returns ...
#'
#' @name std_using_tscores-REYTOTAL
S7::method(std_using_tscores, ntrs::REYTOTAL) <- function(
  scores,
  ...,
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
        (10.2048820335 +
          (age * 0.0696731708) +
          (age * age * -0.001441012) +
          (sex * -2.0691847063) +
          (educ * 0.2076286782))) /
        1) +
        0.0000000637336) /
        0.23569807)),
    digits = 0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
