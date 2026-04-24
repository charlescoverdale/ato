# Deflate nominal AUD to real AUD

Converts a numeric vector of nominal AUD figures indexed by financial
year to real AUD of a chosen base year using the bundled ABS CPI series
(annual, All Groups Australia, 2011-12 = 1.0). For the user's `inflateR`
workflow in non-Australian contexts, bundle a matching CPI series and
call this with a custom `cpi =` argument.

## Usage

``` r
ato_deflate(x, year, base = "2022-23", cpi = NULL)
```

## Arguments

- x:

  Numeric vector of nominal AUD values.

- year:

  Character vector of financial years for each entry in `x`, in
  `"YYYY-YY"` form. Must be the same length as `x`.

- base:

  Base financial year for real terms (default `"2022-23"`).

- cpi:

  Optional override: a data frame with columns `financial_year` and
  `cpi_all_groups_australia`. Default uses the bundled ABS series.

## Value

Numeric vector of real AUD values in base-year prices.

## Details

Uses proportional (Laspeyres-style) adjustment: \\real = nominal \times
(CPI\_{base} / CPI\_{source})\\. The bundled CPI is the ABS annual All
Groups Australia index published in cat. 6401.0, rebased so that 2011-12
= 1.000. This is the standard rebasing used in most Australian
time-series work and is consistent with ABS System of National Accounts
methodology (cat. 5204.0).

The formula is exact for a chain-linked index after 1949 (when the ABS
CPI was introduced) and approximate for earlier values that rely on
Commonwealth Statistician retail-price series. Use a custom `cpi =`
argument if you need a different deflator (e.g. GDP deflator, wage price
index, or industry-specific PPI).

## References

Australian Bureau of Statistics (2024). *Consumer Price Index,
Australia: Concepts, Sources and Methods*. Catalogue 6461.0.

Australian Bureau of Statistics (2024). *Consumer Price Index,
Australia*. Catalogue 6401.0.

Diewert, W.E. (1998). "Index Number Issues in the Consumer Price Index."
*Journal of Economic Perspectives*, 12(1), 47-58.
[doi:10.1257/jep.12.1.47](https://doi.org/10.1257/jep.12.1.47)

## See also

Other harmonisation:
[`ato_crosswalk()`](https://charlescoverdale.github.io/ato/reference/ato_crosswalk.md),
[`ato_harmonise()`](https://charlescoverdale.github.io/ato/reference/ato_harmonise.md),
[`ato_per_capita()`](https://charlescoverdale.github.io/ato/reference/ato_per_capita.md),
[`ato_reconcile()`](https://charlescoverdale.github.io/ato/reference/ato_reconcile.md),
[`ato_schema_map()`](https://charlescoverdale.github.io/ato/reference/ato_schema_map.md),
[`ato_to_taxstats()`](https://charlescoverdale.github.io/ato/reference/ato_to_taxstats.md)

## Examples

``` r
ato_deflate(c(100, 100, 100),
            year = c("2012-13", "2017-18", "2022-23"),
            base = "2022-23")
#> [1] 130.6785 119.0860 100.0000
```
