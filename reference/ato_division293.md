# Division 293 tax assessments (high-income super contributions)

Returns Division 293 tax data: number of assessments, average Division
293 liability, and distribution by income band. Division 293 applies an
extra 15% tax on concessional super contributions for individuals with
combined income plus low-tax super contributions above AUD 250,000.
Central to retirement-income reform analysis (e.g. Grattan's "Better
Super" proposals).

## Usage

``` r
ato_division293(year = "latest")
```

## Source

Australian Taxation Office Taxation Statistics Individuals. Licensed CC
BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

## Value

An `ato_tbl`.

## Details

Published as part of the Individuals Taxation Statistics (Table 3b in
recent releases).

## References

Commonwealth of Australia. *Income Tax Assessment Act 1997*, Division
293. Extra 15 per cent tax on concessional super contributions for
high-income earners.

Daley, J., Coates, B. and Wood, D. (2018). *Money in retirement: more
than enough*. Grattan Institute. Uses Division 293 distributional data
in reform analysis.

## See also

Other specialist:
[`ato_compliance()`](https://charlescoverdale.github.io/ato/reference/ato_compliance.md),
[`ato_fuel_tax_credits()`](https://charlescoverdale.github.io/ato/reference/ato_fuel_tax_credits.md),
[`ato_international()`](https://charlescoverdale.github.io/ato/reference/ato_international.md),
[`ato_medicare_levy()`](https://charlescoverdale.github.io/ato/reference/ato_medicare_levy.md),
[`ato_prrt()`](https://charlescoverdale.github.io/ato/reference/ato_prrt.md),
[`ato_rba()`](https://charlescoverdale.github.io/ato/reference/ato_rba.md),
[`ato_state_tax()`](https://charlescoverdale.github.io/ato/reference/ato_state_tax.md),
[`ato_tax_expenditures()`](https://charlescoverdale.github.io/ato/reference/ato_tax_expenditures.md),
[`ato_whm()`](https://charlescoverdale.github.io/ato/reference/ato_whm.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try(ato_division293(year = "2022-23"))
#> ℹ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> ✔ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> 
#> # ato_tbl: ATO Division 293 2022-23
#> # Source:   https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a7f8226a-af03-431a-80f3-cdca85a9d63e/download/ts23individual03sextaxablestatusagerangetaxableincomerange.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-04-28 19:13 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  ad75d24e07f2aad7...
#> # Rows: 16  Cols: 2
#> 
#>                                                                                       taxation_statistics_2022_23
#> 1                                                                                            Table 3: Individuals
#> 2  Selected items, by sex4, taxable status, age range3 and taxable income range, 2010–11 to 2022–23 income years1
#> 3                                                                                                            <NA>
#> 4                                                                                                          Notes:
#> 5                                                                                                            <NA>
#> 6                                                                                                            <NA>
#> 7                                                                                                            <NA>
#> 8                                                                                                               1
#> 9                                                                                                               2
#> 10                                                                                                              3
#> 11                                                                                                              4
#> 12                                                                                                              5
#> 13                                                                                                           <NA>
#> 14                                                                                                       Table 3A
#> 15                                                                                                           <NA>
#> 16                                                                                                       Table 3B
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   <NA>
#> 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   <NA>
#> 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   <NA>
#> 4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   <NA>
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                                                            Totals may not equal the sum of components due to rounding.
#> 6                                                                                                                                                                                                                                                                                                                                                                                                                             To meet privacy regulations, some items may be combined with other groups or not included.
#> 7                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   <NA>
#> 8                                                                                                                                                                   The statistics for the 2022–23 income year were sourced from 2023 individual income tax returns processed by 31 October 2024. The statistics are not necessarily complete. \r\nTable 3B includes data processed up to 31 October of the following year. For example, data for the 2018–19 income year includes data processed up to 31 October 2020.
#> 9                                                                                                                                                                                                                                                                                                                                                                                                          Refers to the label on the individual return form and will not necessarily equal the sum of component labels.
#> 10                                                                                                                                                                                                                                                                            Age range is based on an individuals age as at 30 June at the end of the income year, for example 30 June 2020 for the 2019–20 income year. This is based on the birth date information reported on the individual income tax return form.
#> 11                                                                                                                                                                                                                                                                                                                                                                       Sex is derived from a variety of ATO sources. Where the sex of an individual is unknown or indeterminate, the individual is assumed to be male.
#> 12 Tax bracket refers to the taxable income ranges that determine the tax rate applied to an individual for a particular income year. \r\nFor example, the 2022–23 tax brackets are as follows:\r\nBracket 1: $18,200 or less\r\nBracket 2: $18,201 to $45,000\r\nBracket 3: $45,001 to $120,000\r\nBracket 4: $120,001 to $180,000\r\nBracket 5: $180,001 or more\r\n\r\n'All ranges' refers to individuals that belong to small groups which are aggregated together to protect privacy and are not reported elswhere.
#> 13                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  <NA>
#> 14                                                                                                                                                                                                                                                                                                                                                                                                                       Selected items, by sex, taxable status, age range and taxable income range, 2022–23 income year
#> 15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  <NA>
#> 16                                                                                                                                                                                                                                                                                                                                                                                                   Key items, by income year, sex, taxable status, age range and taxable income range, 2010–11 to 2022–23 income years
options(op)
# }
```
