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

#' Individual Taxation Statistics: snapshot or detailed table
#'
#' Returns the Individuals Table 1 snapshot (aggregate counts,
#' taxable income, tax payable, deductions) by default. Pass
#' `table = "all"` to concatenate all per-year Individuals tables
#' in long form (large).
#'
#' @param year Year in `"YYYY-YY"` form (e.g. `"2022-23"`) or
#'   `"latest"`.
#' @param table One of `"snapshot"` (Individuals Table 1, default)
#'   or `"all"`.
#'
#' @return An `ato_tbl`.
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
ato_individuals <- function(year = "latest", table = c("snapshot", "all")) {
  table <- match.arg(table)
  id <- ato_ts_package_id(year)
  pattern <- if (table == "snapshot") {
    "individual(s)?01|individual_01|snapshot"
  } else {
    "individual(s)?[0-9]{2}"
  }
  res <- ato_ckan_resolve(id, pattern)
  url <- res$url %||% ""
  df <- ato_fetch_xlsx(url, sheet = 1)
  rownames(df) <- NULL
  new_ato_tbl(df,
              source = url,
              licence = "CC BY 2.5 AU",
              title = paste0("ATO individuals ", year, " (", table, ")"))
}

#' Individual tax data by postcode
#'
#' Returns the Individuals Table 6 (or standalone postcode
#' dataset): taxable income, tax payable, and return counts by
#' 4-digit postcode. Headline dataset for income-distribution
#' journalism.
#'
#' @param year `"YYYY-YY"` or `"latest"`.
#' @param state Optional character vector of state codes.
#' @param postcode Optional character vector of 4-digit postcodes.
#'
#' @return An `ato_tbl` with one row per postcode.
#'
#' @source Australian Taxation Office Individual Sample File,
#'   Taxation Statistics postcode release. Licensed CC BY 2.5 AU.
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
#' income range). Roughly 1,000 occupations with aggregate
#' counts, taxable income, and tax payable.
#'
#' @param year `"YYYY-YY"` or `"latest"`.
#' @param occupation Optional substring filter (case-insensitive).
#' @param sex One of `"all"` (default), `"m"`, or `"f"`.
#'
#' @return An `ato_tbl` with one row per occupation-income-sex combo.
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
                                        sex = c("all", "m", "f")) {
  sex <- match.arg(sex)
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
      keep <- toupper(substr(df[[sex_col]], 1L, 1L)) == toupper(sex)
      df <- df[keep, , drop = FALSE]
    }
  }
  rownames(df) <- NULL
  new_ato_tbl(df,
              source = url,
              licence = "CC BY 2.5 AU",
              title = paste0("ATO individuals by occupation ", year))
}
