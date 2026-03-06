#' @include std_using_tscores.R
NULL

#' ANIMALS T-score
#'
#' @param scores `ANIMALS` scores object
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#'
#' @returns ...
#'
#' @name std_using_tscores-ANIMALS
S7::method(std_using_tscores, ntrs::ANIMALS) <- function(
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
        (6.87650447809604 +
          (age * 0.08074860956743) +
          (age * age * -0.00124305406725) +
          (sex * -0.05459425948988) +
          (educ * 0.24868871078244))) /
        1) -
        0.00000000000734296) /
        0.266972646133392)),
    0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
