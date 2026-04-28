# Superannuation fund aggregates

Returns Taxation Statistics Super Funds tables or Self-Managed
Superannuation Fund ('SMSF') aggregates, depending on `type`.

## Usage

``` r
ato_super_funds(year = "latest", type = c("apra", "smsf", "all"))
```

## Source

Australian Taxation Office Taxation Statistics Super Funds tables + SMSF
statistical overview. Licensed CC BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

- type:

  One of `"apra"` (APRA-regulated funds, default), `"smsf"` (SMSF
  statistical overview), or `"all"`.

## Value

An `ato_tbl`.

## References

Australian Taxation Office (annual). *Taxation Statistics: Super funds
and SMSF explanatory notes*. Distinguishes reporting populations:
APRA-regulated large funds, SMSFs, and Pooled Superannuation Trusts.

Australian Prudential Regulation Authority (annual). *Annual
Superannuation Bulletin*. Complementary APRA-regulated fund statistics.

Commonwealth of Australia. *Superannuation Industry (Supervision) Act
1993* (SIS Act); *Superannuation Guarantee (Administration) Act 1992*
(SGAA).

Productivity Commission (2018). *Superannuation: Assessing Efficiency
and Competitiveness*. Inquiry report.

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  s <- ato_super_funds(year = "2022-23", type = "apra")
  head(s)
})
#> ℹ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> ✔ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> 
#> # ato_tbl: ATO super funds 2022-23 (apra)
#> # Source:   https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a286ac7c-9adb-444b-9bb1-ef2814552f21/download/ts23fund01aprasbyyear.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-04-28 19:14 UTC 
#> # SHA-256:  c274d3cbbe6a6a14...
#> # Rows: 6  Cols: 2
#> 
#>                                                                  taxation_statistics_2022_23
#> 1                                                                             Table 1: Funds
#> 2 Selected items, for APRA regulated and other funds, for income years 1989–90 to 2022–231,5
#> 3                                                                                       <NA>
#> 4                                                                                     Notes:
#> 5                                                                                       <NA>
#> 6                                                                                       <NA>
#>                                                                                             
#> 1                                                                                       <NA>
#> 2                                                                                       <NA>
#> 3                                                                                       <NA>
#> 4                                                                                       <NA>
#> 5                                Totals may not equal the sum of components due to rounding.
#> 6 To meet privacy regulations, some items may be combined with other groups or not included.
options(op)
# }
```
