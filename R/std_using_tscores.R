#' Standardize using T-scores
#'
#' @param scores A numeric vector of class `npscyh_scores` with subclass
#' @param age numeric vector with age
#' @param sex numeric vector of `1`'s (male) and `2`'s (female)
#' @param educ numeric vector giving years of education
#' @param ... Unused
#'
#' @returns
#' The standardized value of `scores`, whose exact type depends on the specific S7 method called
#'
#' @export
std_using_tscores <- S7::new_generic(
  "std_using_tscores",
  "scores",
  fun = function(scores, ..., age, sex, educ) {
    ## Note that ... is ignored
    unused_params <- rlang::list2(...)

    if (length(unused_params) > 0) {
      cli::cli_warn(
        "{.arg {names(unused_params)}} {?is/are} not used when standardizing {.cls {S7::S7_class(scores)@name}} using tscores."
      )
    }

    ## Check and adjust covariates
    if (!all(sex %in% c(1, 2, 8, 9, NA))) {
      cli::cli_abort(
        "{.arg sex} must be a numeric vector of {.val 1}'s (male) and {.val 2}'s (female)."
      )
    }
    # Convert to T-score convention (0 = female, 1 = male)
    sex[!sex %in% c(1, 2)] <- NA
    sex <- as.numeric(sex == 1)

    if (!is.numeric(age)) {
      cli::cli_abort(
        "{.arg age} must be a numeric vector"
      )
    }

    if (min(age, na.rm = T) < 30 | max(age, na.rm = T) > 91) {
      cli::cli_alert_warning(
        "{.arg age} must be a numeric vector of values between 30 and 91. Values outside this range have been truncated."
      )

      age <- pmin(pmax(age, 30), 91)
    }

    if (!is.numeric(educ)) {
      cli::cli_abort(
        "{.arg educ} must be a numeric vector"
      )
    }

    if (min(educ, na.rm = T) < 8 | max(educ, na.rm = T) > 20) {
      cli::cli_alert_warning(
        "{.arg educ} must be a numeric vector of values between 8 and 20. Values outside this range have been truncated."
      )

      educ <- pmin(pmax(educ, 8), 20)
    }

    res <- S7::S7_dispatch()

    ntrs::std_npsych_scores(
      res,
      scores_subclass = S7::S7_class(scores)@name,
      description = "Standardized using T-scores adjusted for age, sex, and education.",
      method = "tscores"
    )
  }
)
