# Joshua C. Fjelstul, Ph.D.
# ungadm R Package

#' List the UNGA-DM datasets
#'
#' @description This function lists all of the datasets that are in the UNGA-DM
#'   Database. A number of functions in the \code{ungadm} package have a
#'   \code{dataset} argument. The values returned by \code{list_datasets()} are
#'   valid for this argument.
#'
#' @return This function returns a string vector containing the names of the
#'   datasets in the UNGA-DM Database.
#'
#' @param session An object of class \code{ungadm_session} created by
#'   \code{authenticate()}.
#'
#' @examples
#' \dontrun{
#' session <- authenticate(
#'   username = "USERNAME",
#'   password = "PASSWORD"
#' )
#'
#' out <- list_datasets(
#'   session = session
#' )}
#'
#' @export
list_datasets <- function(session) {
  out <- describe_datasets(session)
  out <- out$dataset
  return(out)
}

#' List variables in a UNGA-DM dataset
#'
#' @description This function lists all of the variables in a dataset in the
#'   UNGA-DM Database. You have to specify a dataset.
#'
#' @return This function returns a string vector containing the names of the
#'   variables in the specified dataset.
#'
#' @param session An object of class \code{ungadm_session} created by
#'   \code{authenticate()}.
#' @param dataset A string. The name of a dataset in the UNGA-DM Database Run
#'   \code{list_datasets()} to get a list of valid values.
#'
#' @examples
#' \dontrun{
#' session <- authenticate(
#'   username = "USERNAME",
#'   password = "PASSWORD"
#' )
#'
#' out <- list_variables(
#'   session = session,
#'   dataset = "decisions"
#' )}
#'
#' @export
list_variables <- function(session, dataset) {
  out <- describe_variables(session, dataset)
  out <- out$variable
  return(out)
}
