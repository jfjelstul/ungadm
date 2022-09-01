# Joshua C. Fjelstul, Ph.D.
# ungadm R Package

#' Test the API
#'
#' @description This function tests that the UNGA-DM Database API is running.
#'
#' @examples
#' \dontrun{
#' ping_api()}
#'
#' @export
ping_api <- function() {
  url = get_api_address()
  cat("Pinging the UNGA-DM Database API...\n")
  response <- httr::GET(url)
  if(response$status_code != 200) {
    stop("API ping not successful.")
  }
  out <- jsonlite::fromJSON(rawToChar(response$content), flatten = TRUE)
  cat(out$message)
}

run_quietly <- function(x) {
  sink(tempfile())
  on.exit(sink())
  invisible(force(x))
}

get_api_address <- function() {
  "https://www.api.undata.app/"
}

get_api_route <- function(dataset) {
  route <- stringr::str_replace_all(dataset, "_", "-")
  route <- stringr::str_c("database/", route)
  return(route)
}

build_api_url <- function(route = NULL, parameters = NULL) {
  url <- get_api_address()
  if (!is.null(route)) {
    url <- stringr::str_c(url, route)
  }
  if (!is.null(parameters)) {
    parameters_vector <- NULL
    for(i in 1:length(parameters)) {
      new_parameter <- parameters[[i]]
      if (length(parameters) > 1) {
        new_parameter <- stringr::str_c(new_parameter, collapse = ",")
      }
      new_parameter <- stringr::str_c(names(parameters)[i], "=", new_parameter)
      parameters_vector <- c(parameters_vector, new_parameter)
    }
    parameters_string <- stringr::str_c(parameters_vector, collapse = "&")
    url <- stringr::str_c(url, "?", parameters_string)
  }
  return(url)
}

clear_console_line <- function() {
  string <- "\r"
  for(i in 1:50) {
    string <- stringr::str_c(string, " ")
  }
  cat(string)
}
