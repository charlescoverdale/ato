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
#> ℹ Downloading <https://data.gov.au/data/dataset/591b444b-be7f-4121-8252-119a9fe…
#> ✔ Downloading <https://data.gov.au/data/dataset/591b444b-be7f-4121-8252-119a9fe…
#> 
#> # ato_tbl: ATO Small Business Benchmarks 2023-24
#> # Source:   https://data.gov.au/data/dataset/591b444b-be7f-4121-8252-119a9fe07c19/resource/db3ab8b7-e029-48de-8e7a-c61532e25496/download/small-business-benchmarks-2023-24-data.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-04-28 19:14 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  84925348cc6abfdb...
#> # Rows: 6  Cols: 16
#> 
#>   small_business_benchmarkskey_benchmark_ratios_based_on_2023_24_financial_year_databusinesstype
#> 1                                           Air conditioning, refrigeration and heating services
#> 2                                                 Alarm systems installation - fire and security
#> 3                                                                         Architectural services
#> 4                                                                 Automotive electrical services
#> 5                                                                   Bakeries and hot bread shops
#> 6                                                                  Barber and men's hairdressing
#>   total_expenses_low_turnover_range_minimum
#> 1                                      0.54
#> 2                                      0.53
#> 3                                      0.29
#> 4                                      0.58
#> 5                                      0.69
#> 6                                      0.43
#>   total_expenses_low_turnover_range_maximum
#> 1                                      0.73
#> 2                                      0.71
#> 3                                      0.56
#> 4                                      0.74
#> 5                                      0.81
#> 6                                      0.61
#>   total_expenses_medium_turnover_range_minimum
#> 1                                         0.65
#> 2                                         0.59
#> 3                                         0.40
#> 4                                         0.65
#> 5                                         0.75
#> 6                                         0.65
#>   total_expenses_medium_turnover_range_maximum
#> 1                                         0.78
#> 2                                         0.76
#> 3                                         0.65
#> 4                                         0.80
#> 5                                         0.86
#> 6                                         0.81
#>   total_expenses_high_turnover_range_minimum
#> 1                                       0.79
#> 2                                       0.76
#> 3                                       0.61
#> 4                                       0.79
#> 5                                       0.82
#> 6                                         NA
#>   total_expenses_high_turnover_range_maximum
#> 1                                       0.89
#> 2                                       0.87
#> 3                                       0.79
#> 4                                       0.87
#> 5                                       0.90
#> 6                                         NA
#>   cost_of_sales_low_turnover_range_minimum
#> 1                                       NA
#> 2                                       NA
#> 3                                       NA
#> 4                                     0.28
#> 5                                     0.31
#> 6                                       NA
#>   cost_of_sales_low_turnover_range_maximum
#> 1                                       NA
#> 2                                       NA
#> 3                                       NA
#> 4                                     0.42
#> 5                                     0.38
#> 6                                       NA
#>   cost_of_sales_medium_turnover_range_minimum
#> 1                                          NA
#> 2                                          NA
#> 3                                          NA
#> 4                                        0.33
#> 5                                        0.34
#> 6                                          NA
#>   cost_of_sales_medium_turnover_range_maximum
#> 1                                          NA
#> 2                                          NA
#> 3                                          NA
#> 4                                        0.43
#> 5                                        0.39
#> 6                                          NA
#>   cost_of_sales_high_turnover_range_minimum
#> 1                                        NA
#> 2                                        NA
#> 3                                        NA
#> 4                                      0.37
#> 5                                      0.29
#> 6                                        NA
#>   cost_of_sales_high_turnover_range_maximum  low_turnover_range
#> 1                                        NA  $50,000 - $150,000
#> 2                                        NA  $50,000 - $150,000
#> 3                                        NA $135,000 - $220,000
#> 4                                      0.46  $50,000 - $250,000
#> 5                                      0.36  $65,000 - $400,000
#> 6                                        NA  $65,000 - $150,000
#>   medium_turnover_range high_turnover_range
#> 1   $150,001 - $600,000  More than $600,000
#> 2   $150,001 - $600,000  More than $600,000
#> 3   $220,001 - $400,000  More than $400,000
#> 4   $250,001 - $750,000  More than $750,000
#> 5   $400,001 - $750,000  More than $750,000
#> 6    More than $150,000                <NA>
options(op)
# }
```
