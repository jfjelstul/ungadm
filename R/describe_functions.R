# Joshua C. Fjelstul, Ph.D.
# ungadm R Package

#' Describe the UNGA-DM datasets
#'
#' @description This function provides descriptions of all of the datasets that
#'   are in the UNGA-DM Database.
#'
#' @return This function returns a tibble containing 5 variables. There is one
#'   observation per dataset in UNGA-DM Database.
#'
#' @param session An object of class \code{undata_app_session} created by
#'   \code{authenticate()}.
#'
#' @examples
#' \dontrun{
#' session <- authenticate(
#'   username = "USERNAME",
#'   password = "PASSWORD"
#' )
#'
#' out <- describe_datasets(
#'   session = session
#' )}
#'
#' @export
describe_datasets <- function(session) {
  route <- get_api_route(dataset = "datasets")
  url <- build_api_url(route = route)
  out <- make_simple_request(session = session, url = url)
  out <- out |>
    dplyr::select(-description_short)
  return(out)
}

#' Describe variables in a UNGA-DM dataset
#'
#' @description This function provides descriptions of all of the variables in a
#'   dataset in the UNGA-DM Database. You have to specify a dataset.
#'
#' @return This function returns a tibble containing 7 variables. There is one
#'   observation per variable in the specified dataset.
#'
#' @param session An object of class \code{ungadm_session} created by
#'   \code{authenticate()}.
#' @param dataset A string. The name of a dataset in the UNGA-DM Database. Run
#'   \code{list_datasets()} to get a list of valid values.
#'
#' @examples
#' \dontrun{
#' session <- authenticate(
#'   username = "USERNAME",
#'   password = "PASSWORD"
#' )
#'
#' out <- describe_variables(
#'   session = session,
#'   dataset = "decisions"
#' )}
#'
#' @export
describe_variables <- function(session, dataset) {
  route <- get_api_route(dataset = "variables")
  url <- build_api_url(route = route, parameters = list(dataset = dataset))
  out <- make_simple_request(session = session, url = url)
  return(out)
}
