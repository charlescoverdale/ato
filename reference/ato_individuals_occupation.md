# Individual tax data by occupation

Returns the Individuals Table 14 (occupation by sex by taxable income
range). Around 1,000 occupations classified by ANZSCO with aggregate
counts, total income, taxable income, and tax payable. The ATO migrated
from ANZSCO 2013 to ANZSCO 2021 across the 2022-23 release; cross-year
joins on occupation name or code must account for the recode.

## Usage

``` r
ato_individuals_occupation(
  year = "latest",
  occupation = NULL,
  sex = c("all", "male", "female", "m", "f")
)
```

## Source

Australian Taxation Office Taxation Statistics. Licensed CC BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"`, `"latest"`, or a vector of years for a multi-year panel
  (e.g. `c("2020-21", "2021-22", "2022-23")`).

- occupation:

  Optional substring filter (case-insensitive) applied to the occupation
  description column.

- sex:

  One of `"all"` (default), `"male"`, or `"female"`. Rows with sex
  recorded as `"Not stated"` are dropped when filtering to male or
  female. Short forms `"m"`/`"f"` are accepted.

## Value

An `ato_tbl` with one row per occupation-sex-income combination.
Multi-year queries add a `year` column. Monetary values in nominal AUD
of the reporting year.

## Details

**Classification break.** Releases from 2022-23 onwards use ANZSCO 2021;
earlier releases use ANZSCO 2013. A warning is emitted when the
requested year(s) are at or after this boundary, or when a multi-year
request spans it.

## See also

Other individuals:
[`ato_individuals()`](https://charlescoverdale.github.io/ato/reference/ato_individuals.md),
[`ato_individuals_age()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_age.md),
[`ato_individuals_postcode()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_postcode.md),
[`ato_individuals_sex()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_sex.md),
[`ato_individuals_state()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_state.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  occ <- ato_individuals_occupation(year = "2022-23",
                                    occupation = "economist")
  head(occ)
  # Multi-year panel
  panel <- ato_individuals_occupation(year = c("2021-22", "2022-23"),
                                      occupation = "nurse")
})
#> Warning: 2022-23 uses ANZSCO 2021 occupation codes.
#> ℹ Releases before 2022-23 use ANZSCO 2013.
#> ℹ Cross-year occupation joins need a concordance recode.
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "taxation-statistics-2022-23".
options(op)
# }
```
