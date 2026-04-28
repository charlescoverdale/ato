# R&D Tax Incentive claimants

Returns the annual "Report of data about Research and Development Tax
Incentive entities": claimants, claimed expenditure, refundable and
non-refundable tax offsets by industry and company size. Treasury and
DISR use this series to evaluate the R&D Tax Incentive programme, which
is the largest single element of Australia's business innovation policy
(AUD 2 billion+ per year).

## Usage

``` r
ato_rdti(year = "latest")
```

## Source

Australian Taxation Office Research and Development Tax Incentive
report. Licensed CC BY 2.5 AU.

## Arguments

- year:

  Income year in `"YYYY-YY"` form (e.g. `"2022-23"`) or `"latest"`.
  Current releases cover 2021-22 and 2022-23.

## Value

An `ato_tbl` with one row per entity (or aggregated cell, depending on
the release schema). Monetary values in nominal AUD.

## References

Commonwealth of Australia. *Income Tax Assessment Act 1997*, Division
355 (Research and Development Tax Incentive).

Department of Industry, Science and Resources and Australian Taxation
Office (annual). *R&DTI Transparency Report*. Jointly administered
programme methodology.

Ferris, B., Finkel, A. and Fraser, J. (2016). *Review of the R&D Tax
Incentive*. Australian Government review (the "Three Fs review")
informing subsequent programme design.

Organisation for Economic Co-operation and Development (annual). *R&D
Tax Incentives Database*. International comparator data for R&D tax
expenditures.

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
[`ato_sme_benchmarks()`](https://charlescoverdale.github.io/ato/reference/ato_sme_benchmarks.md),
[`ato_tax_gaps()`](https://charlescoverdale.github.io/ato/reference/ato_tax_gaps.md),
[`ato_top_taxpayers()`](https://charlescoverdale.github.io/ato/reference/ato_top_taxpayers.md),
[`ato_vttc()`](https://charlescoverdale.github.io/ato/reference/ato_vttc.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  rdti <- ato_rdti(year = "2022-23")
  head(rdti)
})
#> ℹ Downloading <https://data.gov.au/data/dataset/7c356598-b048-4c1e-862f-c936041…
#> ✔ Downloading <https://data.gov.au/data/dataset/7c356598-b048-4c1e-862f-c936041…
#> 
#> # ato_tbl: ATO R&D Tax Incentive 2022-23
#> # Source:   https://data.gov.au/data/dataset/7c356598-b048-4c1e-862f-c936041e3d81/resource/e9c059c8-a801-4068-844e-9d4ee84a1d81/download/report-of-information-about-research-and-development-tax-incentive-entities.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-04-28 19:14 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  a2a05ddfacba0840...
#> # Rows: 3  Cols: 1
#> 
#>                                                                                                                                                                                                                                                                      research_and_development_tax_transparency_report_of_data_about_research_and_development_tax_incentive_entities
#> 1 This annual report contains data about Research and Development (R&D) tax incentive claims reported by companies for the 2022-23 income year. This report also includes amendments from previously published companies, along with information from late lodging companies for the 2021-22 income year that were not available by the cut-off date to produce the 2021-22 report.
#> 2                                                                                                                                                                                                            This report is intended to be read in conjunction with guidance material available from the link below which provides context around the data included in this report.
#> 3                                                                                                                                                                                                                                                                                                  R&D tax incentive transparency reports | Australian Taxation Office (ato.gov.au)
options(op)
# }
```
