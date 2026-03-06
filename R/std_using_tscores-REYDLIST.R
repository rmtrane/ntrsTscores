#' @include std_using_tscores.R
NULL

#' REYDLIST T-score
#'
#' @param scores `REYDLIST` scores object
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#'
#' @returns ...
#'
#' @name std_using_tscores-REYDLIST
S7::method(std_using_tscores, ntrs::REYDLIST) <- function(
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
        (8.9167820377 +
          (age * 0.0780069203) +
          (age * age * -0.0013677187) +
          (sex * -1.1375184278) +
          (educ * 0.1914262059))) /
        (2.3996448266 + (age * age * -0.0000533322))) +
        0.000009673809) /
        0.12287159)),
    0
  )

  pmax(pmin(raw_tscore, 100), 0)
}
