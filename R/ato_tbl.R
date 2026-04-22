# ato_tbl S3 class with provenance header

#' @noRd
new_ato_tbl <- function(df, source = NULL, licence = "CC BY 2.5 AU",
                        retrieved = Sys.time(), title = NULL) {
  stopifnot(is.data.frame(df))
  attr(df, "ato_source") <- source
  attr(df, "ato_licence") <- licence
  attr(df, "ato_retrieved") <- retrieved
  attr(df, "ato_title") <- title
  class(df) <- c("ato_tbl", class(df))
  df
}

#' Print an ato_tbl
#'
#' Prints a provenance header (title, source, licence, retrieval
#' time, dimensions) followed by the data frame.
#'
#' @param x An `ato_tbl` object.
#' @param ... Passed to the next print method.
#' @return Invisibly returns `x`.
#' @export
#' @examples
#' x <- data.frame(postcode = "2000", taxable_income = 82000)
#' x <- structure(x, ato_title = "Demo", ato_source = "https://data.gov.au",
#'                ato_licence = "CC BY 2.5 AU", ato_retrieved = Sys.time(),
#'                class = c("ato_tbl", "data.frame"))
#' print(x)
print.ato_tbl <- function(x, ...) {
  title <- attr(x, "ato_title") %||% "ATO data"
  source <- attr(x, "ato_source") %||% "https://data.gov.au"
  licence <- attr(x, "ato_licence") %||% "CC BY 2.5 AU"
  retrieved <- attr(x, "ato_retrieved")
  retrieved_str <- if (!is.null(retrieved)) {
    format(retrieved, "%Y-%m-%d %H:%M %Z")
  } else {
    "-"
  }

  cat("# ato_tbl: ", title, "\n", sep = "")
  cat("# Source:   ", source, "\n", sep = "")
  cat("# Licence:  ", licence, "\n", sep = "")
  cat("# Retrieved:", retrieved_str, "\n")
  cat("# Rows: ", formatC(nrow(x), big.mark = ",", format = "d"),
      "  Cols: ", ncol(x), "\n", sep = "")
  cat("\n")

  y <- x
  class(y) <- setdiff(class(y), "ato_tbl")
  print(y, ...)
  invisible(x)
}
