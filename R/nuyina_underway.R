globalVariables(".data")
.data <- NULL

#' Get the Nuyina underway data
#'
#' Reads the full Nuyina underway data from a cached URL, and queries any data later than the cache returning all in one
#' table in datetime order with duplicates removed.
#'
#' @returns data frame
#' @importFrom arrow read_parquet
#' @importFrom dplyr bind_rows distinct arrange
#' @importFrom vapour vapour_read_fields
#' @importFrom tibble as_tibble
#' @export
#'
#' @examples
#' nuyina_underway()
nuyina_underway <- function() {
  ## read the bulk
  d <- arrow::read_parquet(nuyina_underway_url())
  ## read the rest
  d1 <- tibble::as_tibble(vapour::vapour_read_fields("WFS:https://data.aad.gov.au/geoserver/ows?service=wfs&version=2.0.0&request=GetCapabilities",
                                                     sql = sprintf("SELECT * FROM \"underway:nuyina_underway\" WHERE datetime > '%s'",
                                                                   format(max(d$datetime, "%Y-%m-%dT%H:%M:%SZ")))))


  dplyr::bind_rows(d, d1) |> dplyr::distinct(.data$datetime, .keep_all = TRUE) |> dplyr::arrange(.data$datetime)

}

nuyina_underway_url <- function() {
  "https://github.com/mdsumner/uwy.new/releases/download/v0.0.1/nuyina_underway.parquet"
}
