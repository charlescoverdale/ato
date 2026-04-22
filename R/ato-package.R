#' ato: Australian Taxation Office Data
#'
#' Tidy R access to Australian Taxation Office ('ATO') Taxation
#' Statistics and related datasets via the 'data.gov.au' CKAN API.
#'
#' @section Main function families:
#' - [ato_catalog()], [ato_download()]: discovery and generic
#'   resource access.
#' - [ato_individuals()], [ato_individuals_postcode()],
#'   [ato_individuals_occupation()]: individual tax return items.
#' - [ato_companies()]: company tax by industry and turnover.
#' - [ato_super_funds()]: APRA-regulated super funds and SMSFs.
#' - [ato_top_taxpayers()]: Corporate Tax Transparency release.
#' - [ato_gst()], [ato_industry()]: GST and industry aggregates.
#' - [ato_cache_info()], [ato_clear_cache()]: cache management.
#'
#' @section Data source:
#' Taxation Statistics are published annually by the ATO on
#' <https://www.ato.gov.au/about-ato/research-and-statistics/> and
#' mirrored at <https://data.gov.au/data/organization/australiantaxationoffice>.
#' Most datasets are licensed under Creative Commons Attribution 2.5
#' Australia; Corporate Tax Transparency is CC BY 3.0 Australia.
#'
#' @keywords internal
#' @concept Australian tax
#' @concept taxation statistics
#' @concept income distribution
"_PACKAGE"
