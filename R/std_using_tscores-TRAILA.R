#' @include std_using_tscores.R
NULL

#' TRAILA T-score
#'
#' @param scores `TRAILA` scores object
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#'
#' @returns ...
#'
#' @name std_using_tscores-TRAILA
S7::method(std_using_tscores, ntrs::TRAILA) <- function(
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
        (11.0207516012657 +
          (age * 0.07794875829736) +
          (age * age * -0.00161923144463) +
          (sex * -0.43860175484993) +
          (educ * 0.11486703322575))) /
        1) +
        0.000000000019508923) /
        0.246976245644101)),
    0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
