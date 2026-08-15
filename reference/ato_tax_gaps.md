# Australian tax gaps estimates

Returns the ATO's annual Tax Gap publication: estimates of the
difference between the tax theoretically payable under current law and
the tax actually collected, across each tax type and taxpayer population
(individuals not in business, small business, large corporate, GST,
excise, fuel tax credits, PRRT, superannuation guarantee).

## Usage

``` r
ato_tax_gaps(sheet = 1)
```

## Source

Australian Taxation Office Tax Gaps publication, CC BY 2.5 AU.

## Arguments

- sheet:

  Optional sheet name or index. The workbook contains separate sheets
  for each tax-gap population (e.g. "Large corporate", "Small business",
  "Individuals"). Pass the sheet name to extract a specific population.
  `NULL` (default) returns sheet 1 (overview).

## Value

An `ato_tbl`. Tax-gap estimates are in nominal AUD millions of the
reporting year and typically accompanied by a percentage-gap column.

## Details

The Tax Gap series is used by Treasury (every MYEFO), the Parliamentary
Budget Office, and academic researchers as the headline measure of
revenue integrity.

## References

Australian Taxation Office (annual). *Australian tax gaps – overview*.
Methodology notes on bottom-up, top-down, and random-inquiry approaches
to the tax-gap estimation.

HMRC (annual). *Measuring tax gaps*. Sister methodology paper applied by
HM Revenue and Customs in the UK; the ATO series was partly inspired by
this literature.

Organisation for Economic Co-operation and Development (2017). *Shining
Light on the Shadow Economy: Opportunities and Threats*. Paris.
Synthesises tax-gap measurement practice across OECD member countries.

## See also

Other discovery:
[`ato_catalog()`](https://charlescoverdale.github.io/ato/reference/ato_catalog.md),
[`ato_charities()`](https://charlescoverdale.github.io/ato/reference/ato_charities.md),
[`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md),
[`ato_download()`](https://charlescoverdale.github.io/ato/reference/ato_download.md),
[`ato_excise()`](https://charlescoverdale.github.io/ato/reference/ato_excise.md),
[`ato_fbt()`](https://charlescoverdale.github.io/ato/reference/ato_fbt.md),
[`ato_help()`](https://charlescoverdale.github.io/ato/reference/ato_help.md),
[`ato_irpd()`](https://charlescoverdale.github.io/ato/reference/ato_irpd.md),
[`ato_payg()`](https://charlescoverdale.github.io/ato/reference/ato_payg.md),
[`ato_rdti()`](https://charlescoverdale.github.io/ato/reference/ato_rdti.md),
[`ato_sme_benchmarks()`](https://charlescoverdale.github.io/ato/reference/ato_sme_benchmarks.md),
[`ato_top_taxpayers()`](https://charlescoverdale.github.io/ato/reference/ato_top_taxpayers.md),
[`ato_vttc()`](https://charlescoverdale.github.io/ato/reference/ato_vttc.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  gaps <- ato_tax_gaps()
  head(gaps)
})
#> ℹ Downloading <https://data.gov.au/data/dataset/f627f458-7d5a-450d-9f62-45d6983…
#> ✔ Downloading <https://data.gov.au/data/dataset/f627f458-7d5a-450d-9f62-45d6983…
#> 
#> # ato_tbl: ATO Tax Gaps (sheet: 1)
#> # Source:   https://data.gov.au/data/dataset/f627f458-7d5a-450d-9f62-45d6983961da/resource/59a43b92-26d9-451e-822a-ab437f5a4742/download/australian-tax-gaps-2025-publication.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-08-15 17:27 UTC 
#> # SHA-256:  107fd0e9e1e0b9e0...
#> # Rows: 6  Cols: 25
#> 
#>   program_population  program_type                   tax_type data_type
#> 1            Alcohol Transactional Alcohol Excise (Beer only)      Main
#> 2            Alcohol Transactional Alcohol Excise (Beer only)      Main
#> 3            Alcohol Transactional Alcohol Excise (Beer only)      Main
#> 4            Alcohol Transactional Alcohol Excise (Beer only)      Main
#> 5     Alcohol Excise Transactional            Indirect Excise      Main
#> 6     Alcohol Excise Transactional            Indirect Excise      Main
#>   publish_year reliability financial_year population theoretical_liability_m
#> 1         2015         Low        2008-09         NA                2500.000
#> 2         2015         Low        2009-10         NA                2000.000
#> 3         2015         Low        2010-11         NA                2000.000
#> 4         2015         Low        2011-12         NA                2000.000
#> 5         2020 Medium (16)        2015-16       6116                5936.183
#> 6         2020 Medium (16)        2016-17       6313                5932.585
#>   assured_amount_m voluntary_amounts_m amendments_m net_gap_m
#> 1               NA            2495.000           NA     5.000
#> 2               NA            1990.000           NA    10.000
#> 3               NA            1980.000           NA    20.000
#> 4               NA            1980.000           NA    20.000
#> 5               NA            5367.742        3.258   565.183
#> 6               NA            5360.711        3.489   568.385
#>   unreported_amount_m non_detection_m non_pursuable_debt_m gross_gap net_gap
#> 1                  NA              NA                   NA        NA   0.002
#> 2                  NA              NA                   NA        NA   0.005
#> 3                  NA              NA                   NA        NA   0.010
#> 4                  NA              NA                   NA        NA   0.010
#> 5             562.183              NA                  3.0     0.096   0.095
#> 6             566.585              NA                  1.8     0.096   0.096
#>   voluntary_performance overall_performance tax_expected_to_be_collected_m
#> 1                 0.998               0.998                             NA
#> 2                 0.995               0.995                             NA
#> 3                 0.990               0.990                             NA
#> 4                 0.990               0.990                             NA
#> 5                 0.904               0.905                             NA
#> 6                 0.904               0.904                             NA
#>   gross_gap_m shadow_economy_m tax_impact_of_hidden_wages_ind_gap_m
#> 1          NA               NA                                   NA
#> 2          NA               NA                                   NA
#> 3          NA               NA                                   NA
#> 4          NA               NA                                   NA
#> 5          NA               NA                                   NA
#> 6          NA               NA                                   NA
#>   tax_impact_of_hidden_wages_sb_gap_m
#> 1                                  NA
#> 2                                  NA
#> 3                                  NA
#> 4                                  NA
#> 5                                  NA
#> 6                                  NA
options(op)
# }
```
