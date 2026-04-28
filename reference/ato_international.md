# OECD Revenue Statistics comparison

Fetches OECD Revenue Statistics for cross-country tax-to-GDP
benchmarking. Returns tax revenue as percent of GDP by tax category. Use
to contextualise Australian ATO aggregates in cross-country policy
arguments (e.g. OECD average corporate tax-to-GDP, international ranks
for personal income tax).

## Usage

``` r
ato_international(country = "AUS", year = "latest")
```

## Source

OECD Revenue Statistics
<https://www.oecd.org/tax/tax-policy/revenue-statistics.htm>.

## Arguments

- country:

  Country ISO code or name (default `"AUS"`).

- year:

  Four-digit year or `"latest"`.

## Value

An `ato_tbl` with columns `country`, `year`, `tax`, `pct_gdp`.

## Details

Thin wrapper pointing users to `readoecd::` for full OECD API access;
returns a minimal tax-to-GDP slice here for convenience.

## See also

Other specialist:
[`ato_compliance()`](https://charlescoverdale.github.io/ato/reference/ato_compliance.md),
[`ato_division293()`](https://charlescoverdale.github.io/ato/reference/ato_division293.md),
[`ato_fuel_tax_credits()`](https://charlescoverdale.github.io/ato/reference/ato_fuel_tax_credits.md),
[`ato_medicare_levy()`](https://charlescoverdale.github.io/ato/reference/ato_medicare_levy.md),
[`ato_prrt()`](https://charlescoverdale.github.io/ato/reference/ato_prrt.md),
[`ato_rba()`](https://charlescoverdale.github.io/ato/reference/ato_rba.md),
[`ato_state_tax()`](https://charlescoverdale.github.io/ato/reference/ato_state_tax.md),
[`ato_tax_expenditures()`](https://charlescoverdale.github.io/ato/reference/ato_tax_expenditures.md),
[`ato_whm()`](https://charlescoverdale.github.io/ato/reference/ato_whm.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try(ato_international(country = "AUS"))
#> ℹ For full OECD Revenue Statistics access, install readoecd.
#> ℹ This wrapper returns bundled headline tax-to-GDP ratios only.
#> # ato_tbl: OECD tax-to-GDP AUS latest
#> # Source:   https://www.oecd.org/tax/tax-policy/revenue-statistics.htm
#> # Licence:  OECD terms
#> # Retrieved: 2026-04-28 19:14 UTC 
#> # Snapshot: 2026-04-24
#> # Rows: 3  Cols: 4
#> 
#>   country year   tax pct_gdp
#> 1     AUS 2021 total    29.5
#> 2     AUS 2022 total    29.4
#> 3     AUS 2023 total    29.4
options(op)
# }
```
