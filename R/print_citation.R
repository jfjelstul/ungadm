# Joshua C. Fjelstul, Ph.D.
# ungadm R Package

#' Print the citations for the UNGA-DM Database
#'
#' This function generates the recommended citations for the UNGA-DM Database.
#' You have to provide a version number.
#'
#' @param version A string. A version number in the format \code{#.#}, such as
#'   \code{0.1}.
#'
#' @examples
#' \dontrun{
#' print_citation(version = "0.1")}
#'
#' @export
print_citation <- function(version) {
  cat("\n")
  cat("Please cite our working paper, the database, and the R package.\n", sep = "")
  cat("\n")
  cat("The working paper:\n")
  cat("\n")
  cat("Fjelstul, Joshua C., Simon Hug, and Christopher Kilby. 2022. \"Decision-Making in the United Nations General Assembly: A Comprehensive Database of Resolutions, Decisions, and Votes.\" Villanova School of Business Economics and Statistics Working Paper Series No. 56. URL: https://EconPapers.repec.org/RePEc:vil:papers:56.\n")
  cat("\n")
  cat("The database:\n")
  cat("\n")
  cat(stringr::str_c("Fjelstul, Joshua C., Simon Hug, and Christopher Kilby. 2022. The United Nations General Assembly Decision-Making (UNGA-DM) Database. Version ", version, ". URL: https://www.undata.app.\n"))
  cat("\n")
  cat("The R package:\n")
  cat("\n")
  cat("Joshua C. Fjelstul (2022). ungadm: An R Interface to the API for the United Nations General Assembly Decision-Making (UNGA-DM) Database. R package version ", as.character(packageVersion("ungadm")), ". https://github.com/jfjelstul/ungadm.\n", sep = "")
}
