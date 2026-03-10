#' @include std_using_tscores.R
NULL

#' VEG T-score
#'
#' @param scores `VEG` scores object
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#'
#' @returns ...
#'
#' @name std_using_tscores-VEG
S7::method(std_using_tscores, ntrs::VEG) <- function(
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
        (7.16653336860412 +
          (age * 0.10966408817646) +
          (age * age * -0.001273599434) +
          (sex * -2.40105493155836) +
          (educ * 0.18750751554837))) /
        (1.3818783104 + (sqrt(educ) * 0.1861728454))) +
        0.000215448881490048) /
        0.126225678816071)),
    0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
