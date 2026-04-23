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

#' ATO confidentiality suppression tokens
#'
#' The ATO replaces values with one of these tokens when fewer
#' than ten taxpayers (or fewer than 50 returns for postcode
#' data) fall in a cell. Passing them through `na.strings`
#' ensures numeric columns stay numeric. Seen across the
#' Taxation Statistics, Corporate Tax Transparency, Tax Gaps,
#' and Small Business Benchmarks releases.
#' @noRd
ATO_SUPPRESSION_TOKENS <- c(
  "",
  "NA", "N/A", "N.A.", "n/a", "n.a.",
  "np", "n.p.", "N.P.", "Np",
  "-", "--", ".", "..", "...",
  "*", "**",
  "\u2021", "\u2020"  # double dagger, dagger
)

#' Fetch a CSV and return a tidy data frame
#'
#' ATO CSVs use `"np"` (not published), `"*"`, `"‡"`, and other
#' tokens to suppress cells with fewer than ten taxpayers. These
#' are coerced to `NA` so numeric columns stay numeric; see
#' [ATO_SUPPRESSION_TOKENS].
#' @noRd
ato_fetch_csv <- function(url, ...) {
  file <- ato_download_cached(url)
  df <- utils::read.csv(file, stringsAsFactors = FALSE,
                        check.names = FALSE,
                        na.strings = ATO_SUPPRESSION_TOKENS,
                        ...)
  names(df) <- ato_clean_names(names(df))
  df
}

#' Fetch an XLSX and return a data frame
#'
#' ATO XLSX releases use the same confidentiality-suppression
#' tokens as CSV releases; `readxl::read_excel` is passed `na =
#' ATO_SUPPRESSION_TOKENS` so numeric columns are not silently
#' coerced to character when an `np` cell appears.
#'
#' When `skip` is `NULL` (the default), the helper auto-detects
#' the header row by reading up to 15 rows without headers and
#' finding the first row that looks like a header (three or more
#' non-empty string cells). This handles ATO workbooks that lead
#' with a title or narrative block before the data table.
#' @noRd
ato_fetch_xlsx <- function(url, sheet = 1, skip = NULL) {
  if (!requireNamespace("readxl", quietly = TRUE)) {
    cli::cli_abort(c(
      "The {.pkg readxl} package is required to parse XLSX files."
    ))
  }
  file <- ato_download_cached(url)
  if (is.null(skip)) {
    skip <- ato_detect_header_row(file, sheet = sheet)
  }
  df <- as.data.frame(
    readxl::read_excel(file, sheet = sheet, skip = skip,
                       na = ATO_SUPPRESSION_TOKENS,
                       .name_repair = "minimal"),
    stringsAsFactors = FALSE
  )
  names(df) <- ato_clean_names(names(df))
  df
}

#' Auto-detect the first row of an XLSX sheet that looks like a
#' column-header row
#'
#' Heuristic: reads up to 15 rows without treating any row as a
#' header, then finds the first row where at least three cells
#' are non-empty strings that do not contain newlines (newlines
#' typically appear in narrative-block rows, not headers).
#' Returns the number of rows to skip before the header.
#' @noRd
ato_detect_header_row <- function(file, sheet = 1, max_scan = 15L) {
  probe <- tryCatch(
    readxl::read_excel(file, sheet = sheet, col_names = FALSE,
                       n_max = max_scan, .name_repair = "minimal"),
    error = function(e) NULL
  )
  if (is.null(probe) || nrow(probe) == 0L) return(0L)

  is_string_row <- function(row) {
    vals <- unlist(row, use.names = FALSE)
    vals <- vals[!is.na(vals) & nzchar(as.character(vals))]
    if (length(vals) < 3L) return(FALSE)
    chars <- suppressWarnings(as.character(vals))
    # Header rows frequently contain newlines (e.g. "Individuals\nno.")
    # so do not reject on that. Reject rows that are all-numeric.
    looks_numeric <- suppressWarnings(!any(is.na(as.numeric(chars))))
    !looks_numeric
  }

  for (i in seq_len(nrow(probe))) {
    if (is_string_row(probe[i, , drop = FALSE])) {
      return(i - 1L)
    }
  }
  0L
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
