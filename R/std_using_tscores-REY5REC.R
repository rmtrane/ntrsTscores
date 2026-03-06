#' @include std_using_tscores.R
NULL

#' REY5REC T-score
#'
#' @param scores `REY5REC` scores object
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#'
#' @returns ...
#'
#' @name std_using_tscores-REY5REC
S7::method(std_using_tscores, ntrs::REY5REC) <- function(
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
        (9.9952872306 +
          (age * 0.0622550674) +
          (age * age * -0.0012837374) +
          (sex * -1.9754640301) +
          (educ * 0.1870905944))) /
        1) -
        0.0000000482041) /
        0.24516225)),
    0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
