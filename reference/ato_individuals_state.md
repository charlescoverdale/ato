# Individual tax data by state or territory

Returns counts and aggregates by state. Thin wrapper around the ATO
"Selected items by state/territory" table.

## Usage

``` r
ato_individuals_state(year = "latest")
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
[`ato_individuals_sex()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_sex.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try(ato_individuals_state(year = "2022-23"))
#> # ato_tbl: ATO individuals by state 2022-23
#> # Source:   https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/1dfcc611-9f62-4679-a4cb-d4c3df8af4b4/download/ts23snapshot07stateindividualsstatepostcodeoccupationstats.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-04-28 19:13 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  a2f3aa6d7bb97fcc...
#> # Rows: 20  Cols: 2
#> 
#>                                              taxation_statistics_2022_23
#> 1                                                      Table 7: Snapshot
#> 2  Key individuals statistics, by state/territory1, 2022–23 income year2
#> 3                                                                   <NA>
#> 4                                                                 Notes:
#> 5                                                                   <NA>
#> 6                                                                   <NA>
#> 7                                                                   <NA>
#> 8                                                                      1
#> 9                                                                      2
#> 10                                                                     3
#> 11                                                                     4
#> 12                                                                     5
#> 13                                                                  <NA>
#> 14                                                              Table 7A
#> 15                                                                  <NA>
#> 16                                                              Table 7B
#> 17                                                                  <NA>
#> 18                                                              Table 7C
#> 19                                                                  <NA>
#> 20                                                              Table 7D
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                                              Totals may not equal the sum of components due to rounding.
#> 6                                                                                                                                                                                                                                                                                                                                                                                                               To meet privacy regulations, some items may be combined with other groups or not included.
#> 7                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <NA>
#> 8                                                                                                                                                                                                                                                                                                                                                                                                          State/territory is based on residential postcodes as stated on the individual tax return forms.
#> 9                                                                                                                                                                                                                                                                                                                               The statistics for the 2022–23 income year were sourced from 2023 individual income tax returns processed by 31 October 2024. The statistics are not necessarily complete.
#> 10                                                                                                                                                                                    Medians and averages are generated using all individuals who reported at the taxable income or loss label or the total income or loss label, whether the value was zero or not. \r\nMedians and averages are generated only for individuals who reported at the salary and wages label where the value was not zero.
#> 11 Occupation is based on 2022–23 Individual income tax return form information. The ATO publishes a yearly Salary and wage occupation codes spreadsheet which are classified based on ANZSCO - Australian and New Zealand Standard Classification of Occupations, 2022.\r\nOccupation codes may apply to more than one occupation and the description may not be listed in this data.\r\nOccupation codes ending with '99' generally cover a wide range of occupations that are not classified elsewhere.
#> 12                                                                                                                                                                                                                                                                                         The top and bottom 10 or ranking is based on average taxable income. The top and bottom 10 postcodes in Tables 7A and 7B only include delivery area postcodes, whereas Table 7D also includes PO box postcodes.
#> 13                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <NA>
#> 14                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Key individuals statistics - Australia
#> 15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <NA>
#> 16                                                                                                                                                                                                                                                                                                                                                                                                                         Top and bottom 10 postcodes based on average taxable income, by state/territory
#> 17                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <NA>
#> 18                                                                                                                                                                                                                                                                                                                                                                                                                                  Occupations, based on average taxable income, for each state/territory
#> 19                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <NA>
#> 20                                                                                                                                                                                                                                                                                                                                                                                                                                                         Taxable income, by state/territory and postcode
options(op)
# }
```
