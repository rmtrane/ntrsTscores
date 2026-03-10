#' @include std_using_tscores.R
NULL

#' @export
REY123 <- ntrs::new_npsych_scores(
  "REY123",
  label = "Rey AVLT Trials 1-3 Totals",
  domain = "Memory",
  range = c(0, 45)
)

#' REY123 T-score
#'
#' @param scores `REY123` scores object
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#'
#' @returns ...
#'
#' @name std_using_tscores-REY123
S7::method(std_using_tscores, REY123) <- function(
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
        (10.4083623066 +
          (age * 0.05375762) +
          (age * age * -0.0012667176) +
          (sex * -1.8439550539) +
          (educ * 0.1987705165))) /
        1) -
        0.000000056041) /
        0.23872421)),
    0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
