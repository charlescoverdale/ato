# Corporate Tax Transparency

#' Corporate Tax Transparency (Top 500/Top 1000)
#'
#' Returns the ATO's annual Corporate Tax Transparency release:
#' per-entity total income, taxable income, and tax payable for
#' companies meeting threshold tests (Australian public and
#' foreign-owned corporates above AUD 100m total income, and
#' Australian-owned private companies above AUD 200m total
#' income). Published each November/December.
#'
#' Licensed under CC BY 3.0 Australia (note: different from most
#' Taxation Statistics datasets which are CC BY 2.5 AU).
#'
#' @param year `"YYYY-YY"` (e.g. `"2023-24"`) or `"latest"`.
#' @param entity_type One of `"all"` (default), `"public"`,
#'   `"private"`, `"foreign"`.
#'
#' @return An `ato_tbl` with one row per disclosed entity.
#'
#' @source Australian Taxation Office Corporate Tax Transparency
#'   release. Licensed CC BY 3.0 AU.
#'
#' @family discovery
#' @export
#' @examples
#' \donttest{
#' op <- options(ato.cache_dir = tempdir())
#' try({
#'   top <- ato_top_taxpayers(year = "2023-24")
#'   head(top)
#' })
#' options(op)
#' }
ato_top_taxpayers <- function(year = "latest",
                               entity_type = c("all", "public", "private", "foreign")) {
  entity_type <- match.arg(entity_type)

  if (identical(year, "latest")) {
    pkg <- ato_ckan_package("corporate-transparency")
    resources <- pkg$resources %||% list()
    urls <- vapply(resources, function(r) r$url %||% "", character(1))
    # Prefer most recent year in URL.
    years <- regmatches(urls, regexpr("20[0-9]{2}-[0-9]{2}", urls))
    if (length(years) > 0L) {
      year <- max(years)
    } else {
      year <- "2023-24"
    }
  } else {
    year <- ato_resolve_year(year)
  }

  res <- ato_ckan_resolve("corporate-transparency", year)
  url <- res$url %||% ""
  ext <- tolower(tools::file_ext(url))
  # The XLSX has three sheets: "Information" (metadata, 7 rows),
  # "Income tax details" (the headline data, ~4,000 entities), and
  # "PRRT details" (a handful of petroleum resource rent tax
  # filers). Pick the income tax sheet; fall back to sheet 2 if
  # the name doesn't match (older releases used different names).
  df <- if (ext == "csv") {
    ato_fetch_csv(url)
  } else {
    tryCatch(
      ato_fetch_xlsx(url, sheet = "Income tax details"),
      error = function(e) ato_fetch_xlsx(url, sheet = 2)
    )
  }

  if (entity_type != "all") {
    type_col <- intersect(c("entity_type", "tax_entity_type", "company_type"),
                          names(df))[1]
    if (!is.na(type_col)) {
      pattern <- switch(entity_type,
        public  = "public|listed",
        private = "private|australian.owned",
        foreign = "foreign"
      )
      df <- df[grepl(pattern, tolower(df[[type_col]])), , drop = FALSE]
    }
  }

  rownames(df) <- NULL
  new_ato_tbl(df,
              source = url,
              licence = "CC BY 3.0 AU",
              title = paste0("ATO Corporate Tax Transparency ", year))
}
