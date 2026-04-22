# Company Taxation Statistics

#' Company Taxation Statistics by industry
#'
#' Returns the Company Table 4 (key items by ANZSIC industry).
#' Coverage includes total income, tax payable, net tax, and
#' turnover-band counts at the 2-digit ANZSIC subdivision level.
#'
#' @param year `"YYYY-YY"` or `"latest"`.
#' @param industry Optional substring filter on industry name.
#'
#' @return An `ato_tbl` with one row per industry.
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
#'   c <- ato_companies(year = "2022-23", industry = "mining")
#'   head(c)
#' })
#' options(op)
#' }
ato_companies <- function(year = "latest", industry = NULL) {
  id <- ato_ts_package_id(year)
  res <- ato_ckan_resolve(id, "company04|company_04|company.*industry")
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
              title = paste0("ATO companies by industry ", year))
}
