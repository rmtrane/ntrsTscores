#' @include std_using_tscores.R
NULL

#' REY2REC T-score
#'
#' @param scores `REY2REC` scores object
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#'
#' @returns ...
#'
#' @name std_using_tscores-REYTOTAL
S7::method(std_using_tscores, ntrs::REY2REC) <- function(
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
        (10.2054872384 +
          (age * 0.0513655747) +
          (age * age * -0.0011932848) +
          (sex * -1.765163908) +
          (educ * 0.1919280336))) /
        1) -
        0.0000000448036) /
        0.25613384)),
    0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
