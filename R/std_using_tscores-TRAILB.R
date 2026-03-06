#' @include std_using_tscores.R
NULL

#' TRAILB T-score
#'
#' @param scores `TRAILB` scores object
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#'
#' @returns ...
#'
#' @name std_using_tscores-TRAILB
S7::method(std_using_tscores, ntrs::TRAILB) <- function(
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
        (8.85967150966154 +
          (age * 0.10252077910469) +
          (age * age * -0.00183370870098) +
          (sex * -0.34041423893386) +
          (educ * 0.21407076945498))) /
        1) -
        0.000000000007059292) /
        0.234111975138344)),
    0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
