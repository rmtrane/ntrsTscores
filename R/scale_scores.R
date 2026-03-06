#' Scale Scores
#'
#' @description
#' Get the scaled scores used in the T-scores.
#'
#' @param scores An object of class `npsych_scores`.
#'
#' @returns
#' A numeric value. The function will error if `scores` is not of class
#' `npsych_scores` or if its subclass is not one of `names(ss)`.
#'
#' @export
scale_scores <- function(scores) {
  if (!S7::S7_inherits(scores, ntrs::npsych_scores)) {
    cli::cli_abort(
      "{.arg scores} must be of class {.cls npsych_scores}, but is of class {.cls {class(scores)}}."
    )
  }

  subclass <- S7::S7_class(scores)@name

  if (!subclass %in% names(ss)) {
    cli::cli_abort(
      "The subclass of {.arg scores} must be one of {.cls {names(ss)}}."
    )
  }

  unname(ss[[subclass]][as.character(scores)])
}
