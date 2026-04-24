# Remap an ato_tbl to the taxstats microdata column schema

Takes an `ato_tbl` with aggregate column names (produced by any `ato_*`
function) and renames columns to match the `taxstats` (or `taxstats2`)
2% microdata sample schema used by Hugh Parsonage's DRAT package.
Enables consistent variable definitions when moving between aggregate
views and microdata prototyping.

## Usage

``` r
ato_to_taxstats(df, direction = c("to_taxstats", "from_taxstats"))
```

## Arguments

- df:

  An `ato_tbl` or data frame.

- direction:

  `"to_taxstats"` (default, aggregate -\> microdata) or
  `"from_taxstats"` (microdata -\> aggregate).

## Value

A data frame with renamed columns. `ato_tbl` class and provenance
attributes preserved.

## Details

The bundled schema map
([`ato_schema_map()`](https://charlescoverdale.github.io/ato/reference/ato_schema_map.md))
mirrors the column names from Parsonage's `taxstats` and `taxstats2`
packages, which in turn use the ATO Individual Sample File variable
names. Because `taxstats` is DRAT-distributed and not on CRAN, this
function imposes the mapping as a static table rather than
programmatically introspecting the `taxstats` namespace. Re-check the
bundled map against the `taxstats` NAMESPACE when the ATO publishes a
revised Sample File schema.

Unknown columns pass through unchanged. Use
[`ato_harmonise`](https://charlescoverdale.github.io/ato/reference/ato_harmonise.md)
first if the input panel has drift in source column names.

## References

Parsonage, H. (2019). *taxstats: 2 per cent Individual Sample File from
the Australian Taxation Office*. R package (DRAT).
<https://github.com/HughParsonage/taxstats>

Parsonage, H. (2024). *grattan: Perform Common Quantitative Tasks for
Australian Analysts*. R package version 2026.1.1.
<https://cran.r-project.org/package=grattan>

Australian Taxation Office (2024). *Taxation Statistics: Individual
Sample File documentation*.

## See also

Other harmonisation:
[`ato_crosswalk()`](https://charlescoverdale.github.io/ato/reference/ato_crosswalk.md),
[`ato_deflate()`](https://charlescoverdale.github.io/ato/reference/ato_deflate.md),
[`ato_harmonise()`](https://charlescoverdale.github.io/ato/reference/ato_harmonise.md),
[`ato_per_capita()`](https://charlescoverdale.github.io/ato/reference/ato_per_capita.md),
[`ato_reconcile()`](https://charlescoverdale.github.io/ato/reference/ato_reconcile.md),
[`ato_schema_map()`](https://charlescoverdale.github.io/ato/reference/ato_schema_map.md)

## Examples

``` r
df <- data.frame(postcode = "2000", taxable_income = 80000,
                 medicare_levy = 1600)
ato_to_taxstats(df)
#>   Postcode Taxable_Income Medicare_levy
#> 1     2000          80000          1600
```
