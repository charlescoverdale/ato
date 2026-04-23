# Individuals Taxation Statistics

#' @noRd
ato_ts_package_id <- function(year) {
  if (identical(year, "latest")) {
    result <- ato_ckan_search(q = "taxation-statistics", rows = 50L)
    ids <- vapply(result$results, function(p) p$name %||% "", character(1))
    ids <- ids[grepl("^taxation-statistics-[0-9]{4}-[0-9]{2}$", ids)]
    if (length(ids) == 0L) {
      cli::cli_abort("Could not find any Taxation Statistics packages.")
    }
    ids <- sort(ids, decreasing = TRUE)
    return(ids[1L])
  }
  yr <- ato_resolve_year(year)
  paste0("taxation-statistics-", yr)
}

#' Individual Taxation Statistics snapshot
#'
#' Returns the Individuals Table 1 snapshot: aggregate counts,
#' total income, taxable income, tax payable, and deductions
#' across all individual returns (roughly 14 million per year).
#' The snapshot is the headline table; for finer cuts use the
#' dedicated functions:
#' - [ato_individuals_postcode()] for geographic breakdowns,
#' - [ato_individuals_occupation()] for occupation × sex × income-range
#'   detail, or
#' - [ato_download()] with a custom `pattern` for specific
#'   Tables 2 to 27 (age, sex, state, industry, source of income,
#'   deductions, offsets, CGT, non-residents).
#'
#' Monetary values are nominal AUD of the reporting year. Use
#' `inflateR::inflate()` or the ABS CPI series if you need
#' real-term comparisons.
#'
#' @param year Year in `"YYYY-YY"` form (e.g. `"2022-23"`) or
#'   `"latest"`. `"latest"` resolves to the most recently
#'   published release (currently 2022-23).
#'
#' @return An `ato_tbl` with one row per aggregate line-item and
#'   columns for count and amount in nominal AUD.
#'
#' @source Australian Taxation Office Taxation Statistics
#'   <https://www.ato.gov.au/about-ato/research-and-statistics/>.
#'   Licensed CC BY 2.5 AU.
#'
#' @family individuals
#' @export
#' @examples
#' \donttest{
#' op <- options(ato.cache_dir = tempdir())
#' try({
#'   ind <- ato_individuals(year = "2022-23")
#'   head(ind)
#' })
#' options(op)
#' }
ato_individuals <- function(year = "latest") {
  id <- ato_ts_package_id(year)
  res <- ato_ckan_resolve(id, "individual(s)?01|individual_01|snapshot")
  url <- res$url %||% ""
  df <- ato_fetch_xlsx(url, sheet = 1)
  rownames(df) <- NULL
  new_ato_tbl(df,
              source = url,
              licence = "CC BY 2.5 AU",
              title = paste0("ATO individuals snapshot ", year))
}

#' Individual tax data by postcode
#'
#' Returns the Individuals Table 6 (or standalone postcode
#' dataset): taxable income, tax payable, and return counts by
#' 4-digit postcode. Headline dataset for income-distribution
#' journalism.
#'
#' **Privacy suppression.** The ATO suppresses postcodes with
#' fewer than 50 returns; those cells are returned as `NA` after
#' parsing (the package maps `"np"`, `"*"`, and similar tokens
#' to `NA` so numeric columns stay numeric). Small or remote
#' postcodes will be silently missing from the output.
#'
#' Monetary values are nominal AUD of the reporting year. Use
#' `inflateR::inflate()` for real-term series.
#'
#' @param year `"YYYY-YY"` or `"latest"`.
#' @param state Optional character vector of state codes (e.g.
#'   `"NSW"`, `c("VIC", "QLD")`).
#' @param postcode Optional character vector of 4-digit postcodes.
#'
#' @return An `ato_tbl` with one row per postcode, including
#'   state, return count, total income, taxable income, and tax
#'   payable. Schema drifts year to year (SA3/SA4 columns present
#'   from 2017 onwards).
#'
#' @source Australian Taxation Office Taxation Statistics
#'   postcode release. Licensed CC BY 2.5 AU.
#'
#' @family individuals
#' @export
#' @examples
#' \donttest{
#' op <- options(ato.cache_dir = tempdir())
#' try({
#'   p <- ato_individuals_postcode(year = "2022-23", state = "NSW")
#'   head(p)
#' })
#' options(op)
#' }
ato_individuals_postcode <- function(year = "latest", state = NULL,
                                      postcode = NULL) {
  id <- ato_ts_package_id(year)
  res <- ato_ckan_resolve(id, "postcode")
  url <- res$url %||% ""
  df <- ato_fetch_xlsx(url, sheet = 1)

  if (!is.null(state)) {
    state_col <- intersect(c("state", "state_territory"), names(df))[1]
    if (!is.na(state_col)) {
      df <- df[toupper(df[[state_col]]) %in% toupper(state), , drop = FALSE]
    }
  }
  if (!is.null(postcode)) {
    pc_col <- intersect(c("postcode", "post_code"), names(df))[1]
    if (!is.na(pc_col)) {
      df <- df[as.character(df[[pc_col]]) %in% as.character(postcode), , drop = FALSE]
    }
  }
  rownames(df) <- NULL
  new_ato_tbl(df,
              source = url,
              licence = "CC BY 2.5 AU",
              title = paste0("ATO individuals by postcode ", year))
}

#' Individual tax data by occupation
#'
#' Returns the Individuals Table 14 (occupation by sex by taxable
#' income range). Around 1,000 occupations classified by ANZSCO
#' with aggregate counts, total income, taxable income, and tax
#' payable. The ATO migrated from ANZSCO 2013 to ANZSCO 2021
#' across the 2022-23 release; cross-year joins on occupation
#' name or code must account for the recode.
#'
#' @param year `"YYYY-YY"` or `"latest"`.
#' @param occupation Optional substring filter (case-insensitive)
#'   applied to the occupation description column.
#' @param sex One of `"all"` (default), `"male"`, or `"female"`.
#'   Rows with sex recorded as `"Not stated"` are dropped when
#'   filtering to male or female. Short forms `"m"`/`"f"` are
#'   accepted.
#'
#' @return An `ato_tbl` with one row per occupation-sex-income
#'   combination. Monetary values in nominal AUD of the reporting
#'   year.
#'
#' @source Australian Taxation Office Taxation Statistics.
#'   Licensed CC BY 2.5 AU.
#'
#' @family individuals
#' @export
#' @examples
#' \donttest{
#' op <- options(ato.cache_dir = tempdir())
#' try({
#'   occ <- ato_individuals_occupation(year = "2022-23",
#'                                     occupation = "economist")
#'   head(occ)
#' })
#' options(op)
#' }
ato_individuals_occupation <- function(year = "latest", occupation = NULL,
                                        sex = c("all", "male", "female", "m", "f")) {
  sex <- match.arg(sex)
  # Normalise short forms
  sex <- switch(sex, m = "male", f = "female", sex)

  id <- ato_ts_package_id(year)
  res <- ato_ckan_resolve(id, "occupation|individual(s)?14|individual_14")
  url <- res$url %||% ""
  df <- ato_fetch_xlsx(url, sheet = 1)

  if (!is.null(occupation)) {
    occ_col <- intersect(c("occupation", "occupation_description"), names(df))[1]
    if (!is.na(occ_col)) {
      pattern <- paste(tolower(occupation), collapse = "|")
      df <- df[grepl(pattern, tolower(df[[occ_col]])), , drop = FALSE]
    }
  }
  if (sex != "all") {
    sex_col <- intersect(c("sex", "gender"), names(df))[1]
    if (!is.na(sex_col)) {
      # Match full token to avoid dropping "Not stated" silently
      # and to handle prefix-equal values robustly.
      keep <- tolower(df[[sex_col]]) == sex
      df <- df[keep, , drop = FALSE]
    }
  }
  rownames(df) <- NULL
  new_ato_tbl(df,
              source = url,
              licence = "CC BY 2.5 AU",
              title = paste0("ATO individuals by occupation ", year))
}
