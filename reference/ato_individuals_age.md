# Individual tax data by age range

Returns Taxation Statistics Individuals Table 2 (approximately): counts,
total income, taxable income, and tax payable by age range and (usually)
sex. Age ranges are 5-year bands for most of working life plus wider
bands at the tails.

## Usage

``` r
ato_individuals_age(year = "latest", sex = c("all", "male", "female"))
```

## Source

Australian Taxation Office Taxation Statistics Individuals. Licensed CC
BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"`, `"latest"`, or a vector of years.

- sex:

  One of `"all"` (default), `"male"`, or `"female"`.

## Value

An `ato_tbl`.

## References

Australian Taxation Office (annual). *Taxation Statistics: Individuals
explanatory notes*. Age-range breakdowns use the taxpayer's reported
date of birth at lodgement; sex is self-reported on the return.

## See also

Other individuals:
[`ato_individuals()`](https://charlescoverdale.github.io/ato/reference/ato_individuals.md),
[`ato_individuals_occupation()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_occupation.md),
[`ato_individuals_postcode()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_postcode.md),
[`ato_individuals_sex()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_sex.md),
[`ato_individuals_state()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_state.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try(ato_individuals_age(year = "2022-23", sex = "female"))
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "taxation-statistics-2022-23".
options(op)
# }
```
