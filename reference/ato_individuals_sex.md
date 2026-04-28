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
#> # ato_tbl: ATO individuals by sex 2022-23
#> # Source:   https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a5730d59-1bee-4b74-a8d1-85602230f4e9/download/ts23individual02lodgmentmethodsextaxablestatusstateageyear.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-04-28 19:13 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  38a37cdf675961da...
#> # Rows: 16  Cols: 2
#> 
#>                                                                                                    taxation_statistics_2022_23
#> 1                                                                                                         Table 2: Individuals
#> 2  Selected items, by lodgment method, sex5, taxable status, state/territory1 and age range2, 2010–11 to 2022–23 income years4
#> 3                                                                                                                         <NA>
#> 4                                                                                                                       Notes:
#> 5                                                                                                                         <NA>
#> 6                                                                                                                         <NA>
#> 7                                                                                                                         <NA>
#> 8                                                                                                                            1
#> 9                                                                                                                            2
#> 10                                                                                                                           3
#> 11                                                                                                                           4
#> 12                                                                                                                           5
#> 13                                                                                                                        <NA>
#> 14                                                                                                                    Table 2A
#> 15                                                                                                                        <NA>
#> 16                                                                                                                    Table 2B
#>                                                                                                                                                                                                                                                                                                                                                   
#> 1                                                                                                                                                                                                                                                                                                                                             <NA>
#> 2                                                                                                                                                                                                                                                                                                                                             <NA>
#> 3                                                                                                                                                                                                                                                                                                                                             <NA>
#> 4                                                                                                                                                                                                                                                                                                                                             <NA>
#> 5                                                                                                                                                                                                                                                                                      Totals may not equal the sum of components due to rounding.
#> 6                                                                                                                                                                                                                                                       To meet privacy regulations, some items may be combined with other groups or not included.
#> 7                                                                                                                                                                                                                                                                                                                                             <NA>
#> 8                                                                                                                                                                                                                                                  State/territory is based on residential postcodes as stated on the individual tax return forms.
#> 9                                                                                                       Age range is based on an individuals age as at 30 June at the end of the income year, for example 30 June 2022 for the 2021–22 income year. This is based on the birth date information reported on the individual income tax return form.
#> 10                                                                                                                                                                                                                                   Refers to the label on the individual return form and will not necessarily equal the sum of component labels.
#> 11 The statistics for the 2022–23 income year were sourced from 2022 individual income tax returns processed by 31 October 2024. The statistics are not necessarily complete. Table B includes data processed up to 31 October of the following year. For example, data for the 2017–18 income year includes data processed up to 31 October 2019.
#> 12                                                                                                                                                                                                 Sex is derived from a variety of ATO sources. Where the sex of an individual is unknown or indeterminate, the individual is assumed to be male.
#> 13                                                                                                                                                                                                                                                                                                                                            <NA>
#> 14                                                                                                                                                                                                                                     Selected items, by lodgment method, sex, taxable status, state/territory and age range, 2021–22 income year
#> 15                                                                                                                                                                                                                                                                                                                                            <NA>
#> 16                                                                                                                                                                                                                 Key items, by income year, lodgment method, sex, taxable status, state/territory and age range, 2010–11 to 2021–22 income years
options(op)
# }
```
