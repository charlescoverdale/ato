# State and territory tax revenue (ABS 5506.0)

Fetches the ABS Taxation Revenue collection (cat. 5506.0), which gives
land tax, payroll tax, stamp duty, motor vehicle taxes, and other state
taxes by jurisdiction. Needed for complete-tax-system analysis alongside
ATO Commonwealth data.

## Usage

``` r
ato_state_tax(year = "latest")
```

## Source

Australian Bureau of Statistics, Taxation Revenue, catalogue 5506.0
<https://www.abs.gov.au/statistics/economy/government/taxation-revenue-australia>.
Licensed CC BY 4.0.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

## Value

An `ato_tbl`.

## See also

Other specialist:
[`ato_compliance()`](https://charlescoverdale.github.io/ato/reference/ato_compliance.md),
[`ato_division293()`](https://charlescoverdale.github.io/ato/reference/ato_division293.md),
[`ato_fuel_tax_credits()`](https://charlescoverdale.github.io/ato/reference/ato_fuel_tax_credits.md),
[`ato_international()`](https://charlescoverdale.github.io/ato/reference/ato_international.md),
[`ato_medicare_levy()`](https://charlescoverdale.github.io/ato/reference/ato_medicare_levy.md),
[`ato_prrt()`](https://charlescoverdale.github.io/ato/reference/ato_prrt.md),
[`ato_rba()`](https://charlescoverdale.github.io/ato/reference/ato_rba.md),
[`ato_tax_expenditures()`](https://charlescoverdale.github.io/ato/reference/ato_tax_expenditures.md),
[`ato_whm()`](https://charlescoverdale.github.io/ato/reference/ato_whm.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try(ato_state_tax(year = "latest"))
#> Warning: ABS 5506.0 is HTML-paginated; no direct CSV endpoint.
#> ℹ Fetch the XLSX release from
#>   <https://www.abs.gov.au/statistics/economy/government/taxation-revenue-australia/latest-release>
#>   manually,
#> ℹ then pass the local path to `ato_download()` or `ato_fetch_xlsx()`.
#> # ato_tbl: ABS 5506.0 State tax latest
#> # Source:   https://www.abs.gov.au/statistics/economy/government/taxation-revenue-australia/latest-release
#> # Licence:  CC BY 4.0
#> # Retrieved: 2026-04-27 20:51 UTC 
#> # Rows: 0  Cols: 4
#> 
#> [1] jurisdiction      tax_type          value_aud_million year             
#> <0 rows> (or 0-length row.names)
options(op)
# }
```
