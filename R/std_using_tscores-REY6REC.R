#' @include std_using_tscores.R
NULL

#' REY6REC T-score
#'
#' @param scores `REY6REC` scores object
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#'
#' @returns ...
#'
#' @name std_using_tscores-REY6REC
S7::method(std_using_tscores, ntrs::REY6REC) <- function(
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
        (11.7981182251 +
          (age * 0.0154689603) +
          (age * age * -0.000851734) +
          (sex * -1.6396477808) +
          (educ * 0.1436500033))) /
        1) +
        0.0000000285607) /
        0.25404381)),
    0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
