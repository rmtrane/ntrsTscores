.onLoad <- function(...) {
  S7::methods_register()

  ntrs::set_std_defaults(REY123(), method = "tscores")
}
