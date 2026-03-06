#' @include std_using_tscores.R
NULL

REY2REC <- ntrs::new_npsych_scores(
  name = "REY2REC",
  label = "Rey AVLT (Immediate) Trial 2 Total recall",
  range = c(0, 15),
  codes = c(
    "Not assessed, optional" = 88,
    "Physical problem" = 95,
    "Cognitive/behavior problem" = 96,
    "Other problem" = 97,
    "Verbal refusal" = 98,
    "Not available: UDS form submitted did not collect data in this way, or a skip pattern precludes response to this question" = -4
  )
)

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
S7::method(std_using_tscores, REY2REC) <- function(
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
