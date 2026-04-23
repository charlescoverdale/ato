# Company Taxation Statistics

#' Company Taxation Statistics
#'
#' Returns the annual Company Taxation Statistics tables. The
#' Company release ships tables covering entity type, turnover
#' band, industry, taxable status, source of income, and
#' expense deductions. Pick the table that matches your
#' question:
#'
#' - **snapshot** (T1): aggregate counts, total income, net tax
#'   across all companies (~1m entities)
#' - **key_items_by_size** (T2): net tax by company size band
#' - **entity_type** (T3): split by public/private/co-operative
#' - **industry** (T4, default): key items by 2-digit ANZSIC
#'   subdivision
#' - **industry_by_size** (T5): industry × turnover band
#' - **sub_industry** (T6): 4-digit ANZSIC class detail
#' - **taxable_status** (T7): items by taxable status
#' - **source** (T8): source of income
#' - **expenses** (T9): expense and deduction categories
#'
#' Kate Griffiths' 2023 Grattan corporate tax paper used T2 and
#' T3 cuts; these are now reachable by name.
#'
#' @param year `"YYYY-YY"` or `"latest"`.
#' @param table One of `"snapshot"`, `"key_items_by_size"`,
#'   `"entity_type"`, `"industry"` (default), `"industry_by_size"`,
#'   `"sub_industry"`, `"taxable_status"`, `"source"`, or
#'   `"expenses"`.
#' @param industry Optional substring filter on industry name
#'   (applied only when the fetched table has an industry
#'   column).
#'
#' @return An `ato_tbl`. Monetary values in nominal AUD of the
#'   reporting year.
#'
#' @source Australian Taxation Office Taxation Statistics Company
#'   Tables. Licensed CC BY 2.5 AU.
#'
#' @family companies
#' @export
#' @examples
#' \donttest{
#' op <- options(ato.cache_dir = tempdir())
#' try({
#'   # Snapshot
#'   s <- ato_companies(year = "2022-23", table = "snapshot")
#'   head(s)
#'   # Mining subset of industry detail
#'   m <- ato_companies(year = "2022-23", industry = "mining")
#'   head(m)
#' })
#' options(op)
#' }
ato_companies <- function(year = "latest",
                           table = c("industry",
                                     "snapshot",
                                     "key_items_by_size",
                                     "entity_type",
                                     "industry_by_size",
                                     "sub_industry",
                                     "taxable_status",
                                     "source",
                                     "expenses"),
                           industry = NULL) {
  table <- match.arg(table)
  id <- ato_ts_package_id(year)

  # Company tables are filenamed ts23company01*, ts23company02*,
  # etc. The table → resource mapping varies slightly across
  # years; the patterns below cover the common cases.
  pattern <- switch(table,
    snapshot          = "company01|company_01",
    key_items_by_size = "company02|company_02",
    entity_type       = "company03|company_03",
    industry          = "company04|company_04|company.*industry",
    industry_by_size  = "company05|company_05",
    sub_industry      = "company06|company_06",
    taxable_status    = "company07|company_07",
    source            = "company08|company_08",
    expenses          = "company09|company_09"
  )
  res <- ato_ckan_resolve(id, pattern)
  url <- res$url %||% ""
  df <- ato_fetch_xlsx(url, sheet = 1)

  if (!is.null(industry)) {
    ind_col <- intersect(c("industry", "industry_description",
                            "broad_industry", "anzsic_industry"),
                          names(df))[1]
    if (!is.na(ind_col)) {
      pattern <- paste(tolower(industry), collapse = "|")
      df <- df[grepl(pattern, tolower(df[[ind_col]])), , drop = FALSE]
    }
  }
  rownames(df) <- NULL
  new_ato_tbl(df,
              source = url,
              licence = "CC BY 2.5 AU",
              title = paste0("ATO companies ", year, " (", table, ")"))
}
