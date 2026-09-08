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
#> # Retrieved: 2026-09-08 07:14 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  a2a05ddfacba0840...
#> # Rows: 6  Cols: 5
#> 
#>                        company_name     abn_acn
#> 1 (UI!) THE URBAN INSTITUTE PTY LTD 95608464535
#> 2        @HOME ARCHITECTURE PTY LTD 53666147271
#> 3                      @PAY PTY LTD 87644546770
#> 4                   02 FARM PTY LTD 42656444674
#> 5                108 DEV CO PTY LTD 96659942060
#> 6     128 TRADING COMPANY PTY. LTD. 72606263656
#>   total_r_d_expenditure_notional_deductions_less_feedstock_adjustments
#> 1                                                               449266
#> 2                                                                70421
#> 3                                                              1074917
#> 4                                                               404507
#> 5                                                               303491
#> 6                                                                38481
#>   total_amended_r_d_expenditure_notional_deductions_less_feedstock_adjustments
#> 1                                                                           NA
#> 2                                                                           NA
#> 3                                                                           NA
#> 4                                                                           NA
#> 5                                                                           NA
#> 6                                                                           NA
#>   income_year
#> 1     2022-23
#> 2     2022-23
#> 3     2022-23
#> 4     2022-23
#> 5     2022-23
#> 6     2022-23
options(op)
# }
```
