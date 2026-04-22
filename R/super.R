# Superannuation Taxation Statistics

#' Superannuation fund aggregates
#'
#' Returns Taxation Statistics Super Funds tables or Self-Managed
#' Superannuation Fund ('SMSF') aggregates, depending on `type`.
#'
#' @param year `"YYYY-YY"` or `"latest"`.
#' @param type One of `"apra"` (APRA-regulated funds, default),
#'   `"smsf"` (SMSF statistical overview), or `"all"`.
#'
#' @return An `ato_tbl`.
#'
#' @source Australian Taxation Office Taxation Statistics Super
#'   Funds tables + SMSF statistical overview. Licensed CC BY 2.5 AU.
#'
#' @family super
#' @export
#' @examples
#' \donttest{
#' op <- options(ato.cache_dir = tempdir())
#' try({
#'   s <- ato_super_funds(year = "2022-23", type = "apra")
#'   head(s)
#' })
#' options(op)
#' }
ato_super_funds <- function(year = "latest",
                             type = c("apra", "smsf", "all")) {
  type <- match.arg(type)
  if (type == "smsf") {
    res <- ato_ckan_resolve("self-managed-superannuation-funds",
                            "annual|overview|smsf")
    url <- res$url %||% ""
    df <- ato_fetch_xlsx(url, sheet = 1)
    return(new_ato_tbl(df,
                        source = url,
                        licence = "CC BY 2.5 AU",
                        title = "ATO SMSF annual overview"))
  }

  id <- ato_ts_package_id(year)
  pattern <- if (type == "apra") "superfunds0[1-4]|super_fund|super-fund" else "super"
  res <- ato_ckan_resolve(id, pattern)
  url <- res$url %||% ""
  df <- ato_fetch_xlsx(url, sheet = 1)
  rownames(df) <- NULL
  new_ato_tbl(df,
              source = url,
              licence = "CC BY 2.5 AU",
              title = paste0("ATO super funds ", year, " (", type, ")"))
}
