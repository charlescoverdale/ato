# Internal helpers

#' @noRd
`%||%` <- function(x, y) if (is.null(x)) y else x

#' @noRd
ato_format_bytes <- function(x) {
  if (is.na(x) || x < 1024) return(paste0(x, " B"))
  units <- c("KB", "MB", "GB", "TB")
  for (i in seq_along(units)) {
    x <- x / 1024
    if (x < 1024 || i == length(units)) {
      return(sprintf("%.1f %s", x, units[i]))
    }
  }
}

#' Clean column names to snake_case
#' @noRd
ato_clean_names <- function(x) {
  x <- tolower(x)
  x <- gsub("[^a-z0-9]+", "_", x)
  x <- gsub("^_+|_+$", "", x)
  x <- gsub("_+", "_", x)
  x
}

#' Fetch a CSV and return a tidy data frame
#' @noRd
ato_fetch_csv <- function(url, ...) {
  file <- ato_download_cached(url)
  df <- utils::read.csv(file, stringsAsFactors = FALSE,
                        check.names = FALSE,
                        na.strings = c("", "NA", "N/A", "-", "."),
                        ...)
  names(df) <- ato_clean_names(names(df))
  df
}

#' Fetch an XLSX and return a data frame
#' @noRd
ato_fetch_xlsx <- function(url, sheet = 1, skip = 0) {
  if (!requireNamespace("readxl", quietly = TRUE)) {
    cli::cli_abort(c(
      "The {.pkg readxl} package is required to parse XLSX files."
    ))
  }
  file <- ato_download_cached(url)
  df <- as.data.frame(
    readxl::read_excel(file, sheet = sheet, skip = skip,
                       .name_repair = "minimal"),
    stringsAsFactors = FALSE
  )
  names(df) <- ato_clean_names(names(df))
  df
}

#' Convert a user-supplied year string to the ATO Taxation Statistics slug
#'
#' Users can pass year in a few forms:
#' - "2022-23"  (canonical)
#' - "2022/23"
#' - "2022-2023"
#' - 2022 (numeric — interpreted as starting year)
#' - "latest" (resolved against the catalogue)
#'
#' Returns the canonical "YYYY-YY" slug used in CKAN package names.
#' @noRd
ato_resolve_year <- function(year) {
  if (is.numeric(year)) {
    start <- as.integer(year)
    return(sprintf("%d-%02d", start, (start + 1L) %% 100L))
  }
  if (identical(year, "latest")) return(year)
  year <- gsub("[/.]", "-", year)
  m <- regmatches(year, regexec("^([0-9]{4})-?([0-9]{2,4})$", year))[[1]]
  if (length(m) == 3L) {
    start <- as.integer(m[2])
    end <- as.integer(m[3]) %% 100L
    return(sprintf("%d-%02d", start, end))
  }
  cli::cli_abort("Could not parse year {.val {year}}. Use format like '2022-23' or 2022.")
}
