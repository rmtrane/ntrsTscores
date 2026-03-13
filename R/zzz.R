.onLoad <- function(...) {
  S7::methods_register()
}

.onAttach <- function(...) {
  ntrs::set_std_defaults(REY123(), method = "tscores")
}
