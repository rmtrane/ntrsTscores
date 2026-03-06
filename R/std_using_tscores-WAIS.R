#' @include std_using_tscores.R
NULL

#' WAIS T-score
#'
#' @param scores `WAIS` scores object
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#'
#' @returns ...
#'
#' @name std_using_tscores-WAIS
S7::method(std_using_tscores, ntrs::WAIS) <- function(
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
        (10.4001940064776 +
          (age * 0.05326215846983) +
          (age * age * -0.00139236442346) +
          (sex * -1.48870140551039) +
          (educ * 0.22978169555851))) /
        1) -
        0.000000000002652906) /
        0.229279033159529)),
    0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
