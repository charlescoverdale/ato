# Individual tax data by postcode

Returns the Individuals Table 6 (or standalone postcode dataset):
taxable income, tax payable, and return counts by 4-digit postcode.
Headline dataset for income-distribution journalism.

## Usage

``` r
ato_individuals_postcode(year = "latest", state = NULL, postcode = NULL)
```

## Source

Australian Taxation Office Taxation Statistics postcode release.
Licensed CC BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`. Pass a vector of years (e.g.
  `c("2020-21", "2021-22", "2022-23")` or `2018:2022`) to stack multiple
  years with a `year` column added to the output. Useful for time-series
  analysis.

- state:

  Optional character vector of state codes (e.g. `"NSW"`,
  `c("VIC", "QLD")`).

- postcode:

  Optional character vector of 4-digit postcodes.

## Value

An `ato_tbl` with one row per postcode (or per postcode per year for
multi-year queries), including state, return count, total income,
taxable income, and tax payable. Schema drifts year to year (SA3/SA4
columns present from 2017 onwards).

## Details

**Privacy suppression.** The ATO suppresses postcodes with fewer than 50
returns; those cells are returned as `NA` after parsing (the package
maps `"np"`, `"*"`, and similar tokens to `NA` so numeric columns stay
numeric). Small or remote postcodes will be silently missing from the
output.

Monetary values are nominal AUD of the reporting year. Use
`inflateR::inflate()` for real-term series.

## References

Atkinson, A.B. and Leigh, A. (2007). "The Distribution of Top Incomes in
Australia." *Economic Record*, 83(262), 247-261.
[doi:10.1111/j.1475-4932.2007.00412.x](https://doi.org/10.1111/j.1475-4932.2007.00412.x)

Burkhauser, R.V., Hahn, M.H. and Wilkins, R. (2015). "Measuring top
incomes using tax record data: a cautionary tale from Australia."
*Journal of Economic Inequality*, 13(2), 181-205.
[doi:10.1007/s10888-014-9281-z](https://doi.org/10.1007/s10888-014-9281-z)

## See also

Other individuals:
[`ato_individuals()`](https://charlescoverdale.github.io/ato/reference/ato_individuals.md),
[`ato_individuals_age()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_age.md),
[`ato_individuals_occupation()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_occupation.md),
[`ato_individuals_sex()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_sex.md),
[`ato_individuals_state()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_state.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  # Single year
  p <- ato_individuals_postcode(year = "2022-23", state = "NSW")
  head(p)
  # Multi-year stack with year column
  panel <- ato_individuals_postcode(year = c("2020-21", "2021-22"),
                                    state = "NSW")
})
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "taxation-statistics-2022-23".
options(op)
# }
```
