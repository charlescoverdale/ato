# Voluntary Tax Transparency Code disclosures

Returns the ATO's Voluntary Tax Transparency Code (VTTC) disclosures:
large private companies that voluntarily publish tax information beyond
the Corporate Tax Transparency mandate. Covers total income, taxable
income, tax payable, and effective tax rate for each disclosing entity.

## Usage

``` r
ato_vttc(year = "latest")
```

## Source

Australian Taxation Office Voluntary Tax Transparency Code disclosures
on data.gov.au. Licensed CC BY 3.0 AU.

## Arguments

- year:

  Income year in `"YYYY-YY"` form (e.g. `"2022-23"`) or `"latest"`.

## Value

An `ato_tbl`. Monetary values in nominal AUD.

## Details

The VTTC complements
[`ato_top_taxpayers()`](https://charlescoverdale.github.io/ato/reference/ato_top_taxpayers.md)
(which covers mandatory CTT disclosures for entities above AUD 100m
total income). VTTC signatories may be below or above the CTT threshold.

Licensed under **CC BY 3.0 Australia** (same as CTT data).

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
[`ato_tax_gaps()`](https://charlescoverdale.github.io/ato/reference/ato_tax_gaps.md),
[`ato_top_taxpayers()`](https://charlescoverdale.github.io/ato/reference/ato_top_taxpayers.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  vttc <- ato_vttc(year = "2022-23")
  head(vttc)
})
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■                 
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> ℹ VTTC is published as a single all-years register, not per-year files.
#> ℹ Returning the full register; filter it yourself if you need one year.
#> ℹ Downloading <https://data.gov.au/data/dataset/f71709a8-2eeb-4592-ad1f-443f7f5…
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■                 
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> ℹ Downloading <https://data.gov.au/data/dataset/f71709a8-2eeb-4592-ad1f-443f7f5…
#> ✔ Downloading <https://data.gov.au/data/dataset/f71709a8-2eeb-4592-ad1f-443f7f5…
#> 
#> # ato_tbl: ATO VTTC disclosures (all years)
#> # Source:   https://data.gov.au/data/dataset/f71709a8-2eeb-4592-ad1f-443f7f520186/resource/e44e9729-30f5-4764-848e-f060f5099277/download/20260731_ttc_notifications.xlsx
#> # Licence:  CC BY 3.0 AU
#> # Retrieved: 2026-08-23 17:37 UTC 
#> # SHA-256:  f3841f6c0c379e94...
#> # Rows: 6  Cols: 9
#> 
#>                   signatory_name         abn business_size
#> 1 ACCIONA AGUA AUSTRALIA PTY LTD 84128531742         Large
#> 2 ACCIONA AGUA AUSTRALIA PTY LTD 84128531742         Large
#> 3 ACCIONA AGUA AUSTRALIA PTY LTD 84128531742         Large
#> 4 ACCIONA AGUA AUSTRALIA PTY LTD 84128531742         Large
#> 5 ACCIONA AGUA AUSTRALIA PTY LTD 84128531742         Large
#> 6 ACCIONA AGUA AUSTRALIA PTY LTD 84128531742         Large
#>   signatory_income_year_ending origin_of_ultimate_parent_company_or_fund
#> 1                   2017-12-31                                   Foreign
#> 2                   2018-12-31                                   Foreign
#> 3                   2019-12-31                                   Foreign
#> 4                   2020-12-31                                   Foreign
#> 5                   2021-12-31                                   Foreign
#> 6                   2022-12-31                                   Foreign
#>   disclosure_type details_last_updated notification_originally_received
#> 1      Part A & B           2018-12-20                       2018-12-20
#> 2      Part A & B           2019-12-05                       2019-12-05
#> 3      Part A & B           2021-04-23                       2021-04-22
#> 4      Part A & B           2022-01-21                       2022-01-21
#> 5      Part A & B           2023-05-09                       2023-05-01
#> 6      Part A & B           2023-10-19                       2023-10-19
#>   links_to_published_reports_as_provided_by_the_signatory_links_are_maintained_by_the_signatories_not_the_ato_where_multiple_hyperlinks_exist_for_the_same_year_copy_the_links_to_your_browser_to_access_the_report
#> 1                                                                                                                                                      https://www.acciona.com.au/our-purpose/corporate-governance/
#> 2                                                                                                                                                      https://www.acciona.com.au/our-purpose/corporate-governance/
#> 3                                                                                                                                                      https://www.acciona.com.au/our-purpose/corporate-governance/
#> 4                                                                                                                                                      https://www.acciona.com.au/our-purpose/corporate-governance/
#> 5                                                                                                                                                      https://www.acciona.com.au/our-purpose/corporate-governance/
#> 6                                                                                                                                                      https://www.acciona.com.au/our-purpose/corporate-governance/
options(op)
# }
```
