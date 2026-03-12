#' @include std_using_tscores.R
NULL

#' REYAREC T-score
#'
#' @param scores `REYAREC` scores object
#' @inheritParams std_using_tscores
#'
#' @returns ...
#'
#' @name std_using_tscores-REYAREC
S7::method(std_using_tscores, ntrs::REYAREC) <- function(
  scores,
  ...,
  age,
  sex,
  educ
) {
  raw_scores <- as.numeric(scores)

  ## SS scores
  ss_scores <- scale_scores(round(scores))

  raw_tscore <- round(
    (50 +
      ((((ss_scores -
        (10.7915054797 +
          (age * 0.016399595) +
          (age * age * -0.00054882) +
          (sex * -1.8832719513) +
          (educ * 0.1180746912))) /
        1) +
        0.0000001925238) /
        0.29155771)),
    0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
