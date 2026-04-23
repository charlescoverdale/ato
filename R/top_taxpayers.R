# Corporate Tax Transparency

#' Corporate Tax Transparency
#'
#' Returns the ATO's annual Corporate Tax Transparency release,
#' mandated by Part 5-25 of the *Taxation Administration Act
#' 1953*. Covers every Australian public company, foreign-owned
#' company, or Australian-owned private company above the
#' AUD 100 million total-income threshold (the private-company
#' threshold was lowered from AUD 200 million to AUD 100 million
#' for the 2022-23 income year onwards, making all three
#' categories uniform). The 2023-24 release was published 1
#' October 2025 and covered 4,110 entities.
#'
#' The underlying XLSX has three sheets:
#' - **Information** (cover/metadata, ~7 rows).
#' - **Income tax details** (the headline dataset, ~4,000
#'   entities: total income, taxable income, tax payable).
#' - **PRRT details** (petroleum resource rent tax filers,
#'   typically 10-20 entities).
#'
#' Licensed under **CC BY 3.0 Australia** (the Corporate Tax
#' Transparency and Voluntary Tax Transparency Code releases use
#' CC BY 3.0 AU; most other Taxation Statistics use CC BY 2.5 AU).
#'
#' @param year `"YYYY-YY"` (e.g. `"2023-24"`) or `"latest"`.
#' @param entity_type One of `"all"` (default), `"public"`,
#'   `"private"`, or `"foreign"`. Matches the CTT `Entity type`
#'   column values `"Australian public"`, `"Australian private"`,
#'   `"Foreign-owned"`.
#' @param sheet One of `"income_tax"` (default, the ~4,000-entity
#'   income-tax sheet) or `"prrt"` (petroleum resource rent tax
#'   filers, typically 10-20 entities).
#'
#' @return An `ato_tbl` with one row per disclosed entity. All
#'   monetary values are nominal AUD of the reporting year.
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
#'   # Petroleum resource rent tax sheet
#'   prrt <- ato_top_taxpayers(year = "2023-24", sheet = "prrt")
#'   head(prrt)
#' })
#' options(op)
#' }
ato_top_taxpayers <- function(year = "latest",
                               entity_type = c("all", "public", "private", "foreign"),
                               sheet = c("income_tax", "prrt")) {
  entity_type <- match.arg(entity_type)
  sheet <- match.arg(sheet)

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
  sheet_name <- switch(sheet,
    income_tax = "Income tax details",
    prrt       = "PRRT details"
  )
  sheet_fallback <- switch(sheet, income_tax = 2, prrt = 3)

  df <- if (ext == "csv") {
    ato_fetch_csv(url)
  } else {
    tryCatch(
      ato_fetch_xlsx(url, sheet = sheet_name),
      error = function(e) ato_fetch_xlsx(url, sheet = sheet_fallback)
    )
  }

  if (entity_type != "all") {
    type_col <- intersect(c("entity_type", "tax_entity_type", "company_type"),
                          names(df))[1]
    if (!is.na(type_col)) {
      # CTT column values: "Australian public", "Australian
      # private", "Foreign-owned". Match the substantive token
      # only; the dead "australian.owned" branch from the prior
      # implementation matched nothing (no such string appears in
      # the CTT data).
      pattern <- switch(entity_type,
        public  = "public",
        private = "private",
        foreign = "foreign"
      )
      df <- df[grepl(pattern, tolower(df[[type_col]])), , drop = FALSE]
    }
  }

  rownames(df) <- NULL
  new_ato_tbl(df,
              source = url,
              licence = "CC BY 3.0 AU",
              title = paste0("ATO Corporate Tax Transparency ", year,
                              " (", sheet, ")"))
}
