# Print the ATO -\> taxstats schema map

Convenience accessor for the bundled column-name mapping.

## Usage

``` r
ato_schema_map()
```

## Value

A data frame with columns `ato_aggregate` and `taxstats_microdata`.

## See also

Other harmonisation:
[`ato_crosswalk()`](https://charlescoverdale.github.io/ato/reference/ato_crosswalk.md),
[`ato_deflate()`](https://charlescoverdale.github.io/ato/reference/ato_deflate.md),
[`ato_harmonise()`](https://charlescoverdale.github.io/ato/reference/ato_harmonise.md),
[`ato_per_capita()`](https://charlescoverdale.github.io/ato/reference/ato_per_capita.md),
[`ato_reconcile()`](https://charlescoverdale.github.io/ato/reference/ato_reconcile.md),
[`ato_to_taxstats()`](https://charlescoverdale.github.io/ato/reference/ato_to_taxstats.md)

## Examples

``` r
head(ato_schema_map())
#>          ato_aggregate     taxstats_microdata
#> 1 total_income_or_loss            Tot_inc_amt
#> 2         total_income            Tot_inc_amt
#> 3       taxable_income         Taxable_Income
#> 4              net_tax Tax_free_threshold_amt
#> 5          tax_payable       Tax_assessed_amt
#> 6        medicare_levy          Medicare_levy
```
