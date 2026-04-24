# Harmonise column names in a multi-year ATO panel

ATO renames columns across annual releases; a stacked panel from
`ato_individuals_postcode(year = c("2020-21", "2021-22"))` may have
inconsistent names like `total_income` vs `total_income_or_loss`.
`ato_harmonise()` renames columns to the first variant in
`ATO_COL_VARIANTS` so panels are join-ready.

## Usage

``` r
ato_harmonise(df)
```

## Arguments

- df:

  A data frame (typically an `ato_tbl` with `year` column from a
  multi-year call).

## Value

A data frame with harmonised names. `ato_tbl` class and provenance
attributes are preserved.

## Details

Unknown columns are left alone. Columns that collide after renaming
(because two variants map to the same canonical name) emit a warning;
the first column wins.

## See also

Other harmonisation:
[`ato_crosswalk()`](https://charlescoverdale.github.io/ato/reference/ato_crosswalk.md),
[`ato_deflate()`](https://charlescoverdale.github.io/ato/reference/ato_deflate.md),
[`ato_per_capita()`](https://charlescoverdale.github.io/ato/reference/ato_per_capita.md),
[`ato_reconcile()`](https://charlescoverdale.github.io/ato/reference/ato_reconcile.md),
[`ato_schema_map()`](https://charlescoverdale.github.io/ato/reference/ato_schema_map.md),
[`ato_to_taxstats()`](https://charlescoverdale.github.io/ato/reference/ato_to_taxstats.md)

## Examples

``` r
df <- data.frame(postcode = "2000",
                 total_income_or_loss = 100,
                 state_territory = "NSW")
ato_harmonise(df)
#>   postcode total_income_or_loss state
#> 1     2000                  100   NSW
```
