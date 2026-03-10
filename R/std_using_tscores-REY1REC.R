#' @include std_using_tscores.R
NULL

#' REY1REC T-score
#'
#' @param scores `REY1REC` scores object
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#'
#' @returns ...
#'
#' @name std_using_tscores-REYTOTAL
S7::method(std_using_tscores, ntrs::REY1REC) <- function(
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
        (10.5554207904 +
          (age * 0.03615998) +
          (age * age * -0.0009181852) +
          (sex * -1.2432854518) +
          (educ * 0.1518778446))) /
        1) -
        0.0000001305326) /
        0.26867547)),
    0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
