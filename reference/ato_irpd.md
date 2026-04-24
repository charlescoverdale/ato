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
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "international-related-party-dealings".
options(op)
# }
```
