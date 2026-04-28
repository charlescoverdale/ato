# Petroleum Resource Rent Tax (PRRT) annual data

Returns PRRT revenue and assessments. PRRT is a 40% tax on the profits
of offshore petroleum projects; revenues are volatile and
project-specific. Key dataset for resource-tax reform analysis.

## Usage

``` r
ato_prrt(year = "latest")
```

## Source

Australian Taxation Office Taxation Statistics Company. Licensed CC BY
2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

## Value

An `ato_tbl`.

## References

Commonwealth of Australia. *Petroleum Resource Rent Tax Assessment Act
1987*. Enabling legislation for the 40 per cent rent tax on offshore
petroleum projects.

Callaghan, M. (2017). *Review of the Petroleum Resource Rent Tax*.
Treasury-commissioned review; reference for PRRT-reform analysis.

## See also

Other specialist:
[`ato_compliance()`](https://charlescoverdale.github.io/ato/reference/ato_compliance.md),
[`ato_division293()`](https://charlescoverdale.github.io/ato/reference/ato_division293.md),
[`ato_fuel_tax_credits()`](https://charlescoverdale.github.io/ato/reference/ato_fuel_tax_credits.md),
[`ato_international()`](https://charlescoverdale.github.io/ato/reference/ato_international.md),
[`ato_medicare_levy()`](https://charlescoverdale.github.io/ato/reference/ato_medicare_levy.md),
[`ato_rba()`](https://charlescoverdale.github.io/ato/reference/ato_rba.md),
[`ato_state_tax()`](https://charlescoverdale.github.io/ato/reference/ato_state_tax.md),
[`ato_tax_expenditures()`](https://charlescoverdale.github.io/ato/reference/ato_tax_expenditures.md),
[`ato_whm()`](https://charlescoverdale.github.io/ato/reference/ato_whm.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try(ato_prrt(year = "2022-23"))
#> ℹ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> ℹ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> ✔ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> 
#> # ato_tbl: ATO PRRT 2022-23
#> # Source:   https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/0986a5c1-dd83-46a6-b665-31b82f854a89/download/ts23gst05prrtbyyear.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-04-28 19:14 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  94889ad05c9238cb...
#> # Rows: 7  Cols: 2
#> 
#>                                  taxation_statistics_2022_23
#> 1 Table 5: GST and other taxes – Petroleum resource rent tax
#> 2        Selected items: 1990–91 to 2023–24 financial years1
#> 3                                                       <NA>
#> 4                                                     Notes:
#> 5                                                       <NA>
#> 6                                                       <NA>
#> 7                                                          1
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          <NA>
#> 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          <NA>
#> 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          <NA>
#> 4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          <NA>
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Totals may not equal the sum of components due to rounding.
#> 6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          <NA>
#> 7 The statistics for the 1990–91 to 1998–99 financial years were sourced from the latest available Petroleum resource rent tax returns. \r\nThe statistics for the 1999–2000 to 2011–12 financial years were sourced from the Petroleum resource rent tax returns processed by 31 October of the year following the end of the financial year. \r\nThe statistics for the 2012–13 to 2022–23 financial years were sourced from the PRRT returns processed by 20 January 2024.\r\nThe statistics for the 2023-24 financial year was sourced from the PRRT returns processed by 11 February 2025.
options(op)
# }
```
