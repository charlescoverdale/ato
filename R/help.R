# Study and Training Support Loans

#' Study and Training Support Loan data (HELP, AASL, VSL)
#'
#' Returns aggregate statistics on Australia's three main
#' education-loan schemes:
#' - **HELP** (Higher Education Loan Program, ~3m borrowers,
#'   AUD 80bn+ outstanding debt)
#' - **AASL** (Australian Apprenticeship Support Loans,
#'   previously Trade Support Loans)
#' - **VSL** (VET Student Loans, vocational education loans)
#'
#' Headline covers: new loans by income range, outstanding debt
#' by age and gender, repayment rates, median debt on entry.
#' Used by Treasury (PBO costings of HELP indexation changes)
#' and education policy researchers.
#'
#' @param scheme One of `"help"` (default), `"aasl"`, or `"vsl"`.
#'
#' @return An `ato_tbl`. All dollar values in nominal AUD.
#'
#' @source Australian Taxation Office Study and Training Support
#'   Loans statistics. Licensed CC BY 2.5 AU.
#'
#' @family discovery
#' @export
#' @examples
#' \donttest{
#' op <- options(ato.cache_dir = tempdir())
#' try({
#'   help <- ato_help(scheme = "help")
#'   head(help)
#' })
#' options(op)
#' }
ato_help <- function(scheme = c("help", "aasl", "vsl")) {
  scheme <- match.arg(scheme)
  pattern <- switch(scheme,
    help = "help-statistics",
    aasl = "aasl-statistics",
    vsl  = "vsl-statistics"
  )
  res <- ato_ckan_resolve("higher-education-loan-program-help", pattern)
  url <- res$url %||% ""
  df <- ato_fetch_xlsx(url, sheet = 1)
  rownames(df) <- NULL
  new_ato_tbl(df,
              source = url,
              licence = "CC BY 2.5 AU",
              title = paste0("ATO ", toupper(scheme), " statistics"))
}
