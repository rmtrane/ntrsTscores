#' @include std_using_tscores.R
NULL

#' REYDREC T-score
#'
#' @param scores `REYDREC` scores object
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#'
#' @returns ...
#'
#' @name std_using_tscores-REYDREC
S7::method(std_using_tscores, ntrs::REYDREC) <- function(
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
        (12.4118437425 +
          (age * -0.0016432817) +
          (age * age * -0.0007027918) +
          (sex * -1.8612455591) +
          (educ * 0.1380628944))) /
        1) +
        0.0000001024411) /
        0.25299505)),
    0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
