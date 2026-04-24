# Express an aggregate per capita using ABS ERP

Express an aggregate per capita using ABS ERP

## Usage

``` r
ato_per_capita(x, year, erp = NULL)
```

## Arguments

- x:

  Numeric vector of aggregate values (same length as `year`).

- year:

  Character vector of financial years.

- erp:

  Optional override: data frame with columns `financial_year` and
  `erp_june_australia_thousands`.

## Value

Numeric vector of per-capita values (same units as `x` per person).

## Details

Divides the input by Estimated Resident Population at 30 June of the
financial year's end (a stock measure). For flow-style measures where a
mid-year-average population is preferable, substitute a custom `erp =`
argument. ERP is ABS's preferred population-denominator concept for
per-capita economic statistics (see cat. 3101.0 methodology).

## References

Australian Bureau of Statistics (2024). *National, State and Territory
Population*. Catalogue 3101.0.

## See also

Other harmonisation:
[`ato_crosswalk()`](https://charlescoverdale.github.io/ato/reference/ato_crosswalk.md),
[`ato_deflate()`](https://charlescoverdale.github.io/ato/reference/ato_deflate.md),
[`ato_harmonise()`](https://charlescoverdale.github.io/ato/reference/ato_harmonise.md),
[`ato_reconcile()`](https://charlescoverdale.github.io/ato/reference/ato_reconcile.md),
[`ato_schema_map()`](https://charlescoverdale.github.io/ato/reference/ato_schema_map.md),
[`ato_to_taxstats()`](https://charlescoverdale.github.io/ato/reference/ato_to_taxstats.md)

## Examples

``` r
# Income tax per person, 2022-23 FBO headline
ato_per_capita(316.4e9, "2022-23")
#> [1] 11877.77
```
