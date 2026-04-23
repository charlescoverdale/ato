# Citation helper

#' Cite an ato_tbl (or URL) in BibTeX and plain-text form
#'
#' Returns a citation suitable for footnotes, papers, and
#' Treasury-grade briefs. Uses the provenance attributes
#' attached to every `ato_tbl`: source URL, licence, retrieval
#' date, and title.
#'
#' @param x Either an `ato_tbl` (as returned by any `ato_*` data
#'   function) or a character URL pointing to an ATO data.gov.au
#'   resource.
#' @param style One of `"text"` (default, plain-text footnote),
#'   `"bibtex"`, or `"apa"`.
#'
#' @return A character string. For `style = "bibtex"`, a complete
#'   `@misc{}` entry.
#'
#' @family discovery
#' @export
#' @examples
#' x <- data.frame(a = 1)
#' x <- structure(x,
#'   ato_source = "https://data.gov.au/data/dataset/example.xlsx",
#'   ato_licence = "CC BY 2.5 AU",
#'   ato_retrieved = as.POSIXct("2026-04-23 00:00:00", tz = "UTC"),
#'   ato_title = "ATO individuals 2022-23",
#'   class = c("ato_tbl", "data.frame"))
#'
#' ato_cite(x)
#' ato_cite(x, style = "bibtex")
#' ato_cite(x, style = "apa")
ato_cite <- function(x, style = c("text", "bibtex", "apa")) {
  style <- match.arg(style)

  if (is.character(x) && length(x) == 1L) {
    src <- x
    licence <- "CC BY 2.5 AU"
    retrieved <- Sys.time()
    title <- basename(x)
  } else if (inherits(x, "ato_tbl")) {
    src <- attr(x, "ato_source") %||% ""
    licence <- attr(x, "ato_licence") %||% "CC BY 2.5 AU"
    retrieved <- attr(x, "ato_retrieved") %||% Sys.time()
    title <- attr(x, "ato_title") %||% "ATO data"
  } else {
    cli::cli_abort(
      "{.arg x} must be an {.cls ato_tbl} or a character URL."
    )
  }

  date_str <- format(as.Date(retrieved), "%Y-%m-%d")
  year <- format(as.Date(retrieved), "%Y")

  switch(style,
    text = sprintf(
      "Australian Taxation Office. %s. Retrieved %s from %s. Licensed under %s.",
      title, date_str, src, licence
    ),
    apa = sprintf(
      "Australian Taxation Office. (%s). %s [Data set]. data.gov.au. %s",
      year, title, src
    ),
    bibtex = sprintf(
      "@misc{ato_%s,\n  author = {{Australian Taxation Office}},\n  title  = {{%s}},\n  year   = {%s},\n  note   = {Retrieved %s; licensed under %s},\n  url    = {%s}\n}",
      gsub("[^a-z0-9]+", "_", tolower(title)),
      title, year, date_str, licence, src
    )
  )
}
