# Small Business Benchmarks

Returns the ATO's Small Business Benchmarks: industry-specific
performance ranges (cost of sales / turnover, total expenses / turnover,
labour / turnover, etc.) derived from small-business income tax returns.
Used by the ATO to identify outlier taxpayers, by small-business
advisors for comparative analysis, and by tax integrity researchers.

## Usage

``` r
ato_sme_benchmarks(year = "latest")
```

## Source

Australian Taxation Office Small Business Benchmarks. Licensed CC BY 2.5
AU.

## Arguments

- year:

  Income year in `"YYYY-YY"` form (e.g. `"2023-24"`) or `"latest"`.
  Releases available from 2016-17 onwards.

## Value

An `ato_tbl` with one row per (industry, turnover band, ratio)
combination. Ratios are percentages.

## See also

Other discovery:
[`ato_catalog()`](https://charlescoverdale.github.io/ato/reference/ato_catalog.md),
[`ato_charities()`](https://charlescoverdale.github.io/ato/reference/ato_charities.md),
[`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md),
[`ato_download()`](https://charlescoverdale.github.io/ato/reference/ato_download.md),
[`ato_excise()`](https://charlescoverdale.github.io/ato/reference/ato_excise.md),
[`ato_fbt()`](https://charlescoverdale.github.io/ato/reference/ato_fbt.md),
[`ato_help()`](https://charlescoverdale.github.io/ato/reference/ato_help.md),
[`ato_irpd()`](https://charlescoverdale.github.io/ato/reference/ato_irpd.md),
[`ato_payg()`](https://charlescoverdale.github.io/ato/reference/ato_payg.md),
[`ato_rdti()`](https://charlescoverdale.github.io/ato/reference/ato_rdti.md),
[`ato_tax_gaps()`](https://charlescoverdale.github.io/ato/reference/ato_tax_gaps.md),
[`ato_top_taxpayers()`](https://charlescoverdale.github.io/ato/reference/ato_top_taxpayers.md),
[`ato_vttc()`](https://charlescoverdale.github.io/ato/reference/ato_vttc.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  bm <- ato_sme_benchmarks(year = "2023-24")
  head(bm)
})
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "small-business-benchmarks".
options(op)
# }
```
