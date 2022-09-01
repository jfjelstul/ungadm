# Joshua C. Fjelstul, Ph.D.
# ungadm R Package

make_simple_request <- function(session, url, quietly = FALSE) {

  # Message
  if (quietly == FALSE) {
    cat("Connecting to the UNGA-DM Database API...\n")
  }

  # Fetch data
  response <- httr::GET(
    url,
    config = httr::add_headers(authorization = session$token),
    encode = "json"
  )

  # Get response content
  response_content <- rawToChar(response$content)

  # Error handling
  if(response$status_code != 200) {
    stop("API query not successful.")
  }

  # Parse response and coerce to a tibble
  out <- jsonlite::fromJSON(response_content, flatten = TRUE)$results |>
    dplyr::as_tibble()

  # Message
  cat("Response received.\n")

  return(out)
}
