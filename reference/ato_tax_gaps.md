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
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■                 
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> ℹ Downloading <https://data.gov.au/data/dataset/f627f458-7d5a-450d-9f62-45d6983…
#> ✔ Downloading <https://data.gov.au/data/dataset/f627f458-7d5a-450d-9f62-45d6983…
#> 
#> # ato_tbl: ATO Tax Gaps (sheet: 1)
#> # Source:   https://data.gov.au/data/dataset/f627f458-7d5a-450d-9f62-45d6983961da/resource/59a43b92-26d9-451e-822a-ab437f5a4742/download/australian-tax-gaps-2024-publication.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-04-28 19:14 UTC 
#> # SHA-256:  35a8fec971481e27...
#> # Rows: 6  Cols: 1
#> 
#>   australian_tax_gapsthe_tax_gap_is_an_estimate_of_the_difference_between_the_amount_the_ato_collects_and_what_we_would_have_collected_if_every_taxpayer_was_fully_compliant_with_tax_law_this_file_includes_current_and_historical_tax_gap_estimates_publis ...
#> 1                                                                                                                                                                                                                                           \r\nMore information
#> 2                                                                                                                                                                                                                                     Australian Taxation Office
#> 3                                                                                                                                                                                                                                 Australian tax gaps - overview
#> 4                                                                                                                                                                                                                                       Tax gap research program
#> 5                                                                                                                                                                                                                    Principles and approaches to measuring gaps
#> 6                                                                                                                                                                                                For feedback or inquiries please email us at: Taxgap@ato.gov.au
options(op)
# }
```
