# Individual tax data by sex

Returns counts and aggregates split by sex. Thin wrapper around the ATO
"Selected items by sex" table.

## Usage

``` r
ato_individuals_sex(year = "latest")
```

## Source

Australian Taxation Office Taxation Statistics Individuals. Licensed CC
BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"`, `"latest"`, or a vector of years.

## Value

An `ato_tbl`.

## References

Australian Taxation Office (annual). *Taxation Statistics: Individuals
explanatory notes*. Age-range breakdowns use the taxpayer's reported
date of birth at lodgement; sex is self-reported on the return.

## See also

Other individuals:
[`ato_individuals()`](https://charlescoverdale.github.io/ato/reference/ato_individuals.md),
[`ato_individuals_age()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_age.md),
[`ato_individuals_occupation()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_occupation.md),
[`ato_individuals_postcode()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_postcode.md),
[`ato_individuals_state()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_state.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try(ato_individuals_sex(year = "2022-23"))
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "taxation-statistics-2022-23".
options(op)
# }
```
