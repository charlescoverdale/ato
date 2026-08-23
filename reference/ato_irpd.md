# International Related Party Dealings (IRPD)

Returns the ATO's International Related Party Dealings data, which
captures intra-group cross-border payments and receivables reported by
Australian corporate taxpayers. Core dataset for BEPS and
transfer-pricing research, transfer pricing risk assessment, and
multinational tax analysis.

## Usage

``` r
ato_irpd(year = "latest", table = 1L)
```

## Source

Australian Taxation Office International Related Party Dealings release.
Licensed CC BY 2.5 AU.

## Arguments

- year:

  Income year in `"YYYY-YY"` form (e.g. `"2023-24"`) or `"latest"`.

- table:

  Integer 1, 2, or 3. Default `1`.

## Value

An `ato_tbl`. Monetary values in nominal AUD.

## Details

The IRPD data is published as a separate CKAN package per income year
(2019-20 through 2023-24). Each annual package contains three tables:

- **Table 1** : IRPD totals from 2015-16 to the current year

- **Table 2** : IRPDs by jurisdiction

- **Table 3** : Index of chart data

## References

Organisation for Economic Co-operation and Development (2015). *Transfer
Pricing Documentation and Country-by-Country Reporting, Action 13: 2015
Final Report*. OECD/G20 Base Erosion and Profit Shifting Project, Paris.
[doi:10.1787/9789264241480-en](https://doi.org/10.1787/9789264241480-en)

Commonwealth of Australia. *Income Tax Assessment Act 1997*, Subdivision
815-B (Transfer Pricing); *Multinational Anti-Avoidance Law* (MAAL) and
*Diverted Profits Tax*.

Australian Taxation Office (annual). *International Dealings Schedule
(IDS) instructions*. Reporting framework underlying the IRPD dataset.

## See also

Other discovery:
[`ato_catalog()`](https://charlescoverdale.github.io/ato/reference/ato_catalog.md),
[`ato_charities()`](https://charlescoverdale.github.io/ato/reference/ato_charities.md),
[`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md),
[`ato_download()`](https://charlescoverdale.github.io/ato/reference/ato_download.md),
[`ato_excise()`](https://charlescoverdale.github.io/ato/reference/ato_excise.md),
[`ato_fbt()`](https://charlescoverdale.github.io/ato/reference/ato_fbt.md),
[`ato_help()`](https://charlescoverdale.github.io/ato/reference/ato_help.md),
[`ato_payg()`](https://charlescoverdale.github.io/ato/reference/ato_payg.md),
[`ato_rdti()`](https://charlescoverdale.github.io/ato/reference/ato_rdti.md),
[`ato_sme_benchmarks()`](https://charlescoverdale.github.io/ato/reference/ato_sme_benchmarks.md),
[`ato_tax_gaps()`](https://charlescoverdale.github.io/ato/reference/ato_tax_gaps.md),
[`ato_top_taxpayers()`](https://charlescoverdale.github.io/ato/reference/ato_top_taxpayers.md),
[`ato_vttc()`](https://charlescoverdale.github.io/ato/reference/ato_vttc.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  by_jurisdiction <- ato_irpd(year = "2023-24", table = 2)
  head(by_jurisdiction)
})
#> ℹ Downloading <https://data.gov.au/data/dataset/cee66e72-94aa-436a-b4ed-b186204…
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■                 
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> ℹ Downloading <https://data.gov.au/data/dataset/cee66e72-94aa-436a-b4ed-b186204…
#> ✔ Downloading <https://data.gov.au/data/dataset/cee66e72-94aa-436a-b4ed-b186204…
#> 
#> # ato_tbl: ATO IRPD 2023-24 (Table 2)
#> # Source:   https://data.gov.au/data/dataset/cee66e72-94aa-436a-b4ed-b186204a443a/resource/cd82e606-3131-49d3-962e-5d18ad83f748/download/table_2_irpds_by_jurisdiction_2017-2024.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-08-23 17:36 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  b41894d320ec379c...
#> # Rows: 6  Cols: 6
#> 
#>   country_jurisdiction income_year expenditure1no expenditure revenue1_no
#> 1              Algeria     2017–18              5      356004           6
#> 2              Algeria     2023–24              5       43233           5
#> 3               Angola     2016–17              9    14497346          22
#> 4               Angola     2017–18              9     2742601          15
#> 5               Angola     2018–19             10     6445177          19
#> 6               Angola     2019–20             10     2867773          16
#>    revenue
#> 1   776186
#> 2    98159
#> 3 21043038
#> 4 13511348
#> 5 12134017
#> 6 16249781
options(op)
# }
```
