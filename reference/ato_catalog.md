# ATO dataset catalogue

Returns a summary of all datasets published by the Australian Taxation
Office on data.gov.au. Each row is a CKAN "package" with an id (slug),
title, licence, modification date, and resource count.

## Usage

``` r
ato_catalog(q = NULL)
```

## Source

'data.gov.au' CKAN endpoint
<https://data.gov.au/data/organization/australiantaxationoffice>.

## Arguments

- q:

  Optional free-text filter (CKAN Solr query). `NULL` returns the full
  ATO catalogue.

## Value

An `ato_tbl` with one row per dataset.

## See also

Other discovery:
[`ato_charities()`](https://charlescoverdale.github.io/ato/reference/ato_charities.md),
[`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md),
[`ato_download()`](https://charlescoverdale.github.io/ato/reference/ato_download.md),
[`ato_excise()`](https://charlescoverdale.github.io/ato/reference/ato_excise.md),
[`ato_fbt()`](https://charlescoverdale.github.io/ato/reference/ato_fbt.md),
[`ato_help()`](https://charlescoverdale.github.io/ato/reference/ato_help.md),
[`ato_irpd()`](https://charlescoverdale.github.io/ato/reference/ato_irpd.md),
[`ato_payg()`](https://charlescoverdale.github.io/ato/reference/ato_payg.md),
[`ato_rdti()`](https://charlescoverdale.github.io/ato/reference/ato_rdti.md),
[`ato_sme_benchmarks()`](https://charlescoverdale.github.io/ato/reference/ato_sme_benchmarks.md),
[`ato_tax_gaps()`](https://charlescoverdale.github.io/ato/reference/ato_tax_gaps.md),
[`ato_top_taxpayers()`](https://charlescoverdale.github.io/ato/reference/ato_top_taxpayers.md),
[`ato_vttc()`](https://charlescoverdale.github.io/ato/reference/ato_vttc.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  cat <- ato_catalog()
  head(cat[, c("id", "title", "licence")])
})
#> Error in ato_ckan_search(q = q, rows = 200L) : 
#>   CKAN search failed (HTTP 403).
options(op)
# }
```
