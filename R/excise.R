# Excise and Fuel Tax Credits

#' Excise and fuel tax credit rates and clearances
#'
#' Returns ATO excise data, covering four sub-releases:
#' - **beer** — beer clearances summary (volumes by product class)
#' - **spirits** — spirits and other excisable beverages clearances
#' - **excise_rates** — historical excise rate schedule (all
#'   excise categories, quarterly indexed rates)
#' - **ftc_rates** — historical Fuel Tax Credit rates
#'
#' @param table One of `"beer"`, `"spirits"`, `"excise_rates"`
#'   (default), or `"ftc_rates"`.
#'
#' @return An `ato_tbl`. Rates are in AUD per litre (or per kg
#'   for tobacco); volumes are in megalitres or similar.
#'
#' @source Australian Taxation Office excise data.
#'   Licensed CC BY 2.5 AU.
#'
#' @family discovery
#' @export
#' @examples
#' \donttest{
#' op <- options(ato.cache_dir = tempdir())
#' try({
#'   rates <- ato_excise("excise_rates")
#'   head(rates)
#' })
#' options(op)
#' }
ato_excise <- function(table = c("excise_rates", "ftc_rates",
                                  "beer", "spirits")) {
  table <- match.arg(table)
  pattern <- switch(table,
    excise_rates = "historical-excise-rates|excise-rates",
    ftc_rates    = "historical-ftc-rates|ftc-rates",
    beer         = "beer-clearance",
    spirits      = "spirits|other-excisable-beverage"
  )
  res <- ato_ckan_resolve(ATO_PACKAGE_IDS$excise, pattern)
  url <- res$url %||% ""
  df <- ato_fetch_xlsx(url, sheet = 1)
  rownames(df) <- NULL
  new_ato_tbl(df,
              source = url,
              licence = "CC BY 2.5 AU",
              title = paste0("ATO Excise data (", table, ")"))
}
