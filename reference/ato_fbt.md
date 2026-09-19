# Fringe Benefits Tax statistics

Returns the ATO's annual Fringe Benefits Tax (FBT) Taxation Statistics:
employer counts, gross taxable value, FBT payable, and employee benefit
counts by benefit type and industry. Used by Treasury, PBO, and
researchers evaluating the FBT concession system (electric vehicles,
remote area exemptions, novated leases).

## Usage

``` r
ato_fbt(year = "latest")
```

## Source

Australian Taxation Office FBT Taxation Statistics on data.gov.au.
Licensed CC BY 2.5 AU.

## Arguments

- year:

  Income year in `"YYYY-YY"` form (e.g. `"2022-23"`) or `"latest"`.

## Value

An `ato_tbl`. Monetary values in nominal AUD.

## References

Commonwealth of Australia. *Fringe Benefits Tax Assessment Act 1986*.
Substantive FBT law; ATO rulings (TR series) elaborate taxable-value
methodology.

Australian Taxation Office (annual). *FBT explanatory notes*.
Definitions of reportable benefits, gross-up factors (Type 1 and Type
2), and otherwise-deductible rule.

Treasury (2022). *Electric Car Discount Bill*. Explanatory memorandum
for the EV FBT exemption introduced 1 July 2022.

## See also

Other discovery:
[`ato_catalog()`](https://charlescoverdale.github.io/ato/reference/ato_catalog.md),
[`ato_charities()`](https://charlescoverdale.github.io/ato/reference/ato_charities.md),
[`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md),
[`ato_download()`](https://charlescoverdale.github.io/ato/reference/ato_download.md),
[`ato_excise()`](https://charlescoverdale.github.io/ato/reference/ato_excise.md),
[`ato_help()`](https://charlescoverdale.github.io/ato/reference/ato_help.md),
[`ato_irpd()`](https://charlescoverdale.github.io/ato/reference/ato_irpd.md),
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
  fbt <- ato_fbt(year = "2022-23")
  head(fbt)
})
#> ℹ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> ✔ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> 
#> # ato_tbl: ATO FBT Taxation Statistics 2022-23
#> # Source:   https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/f955281b-8ff6-45a9-a804-bad1b79e7817/download/ts23fbt01selecteditemsbyyear.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-09-19 10:26 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  eb4fa15d3a41fae0...
#> # Rows: 6  Cols: 17
#> 
#>                                      2009_10    2010_11    2011_12    2012_13
#> 1                     Returns no.      72285      74165      73175      76796
#> 2     Type 1 aggregate amount no.      51155      50855      49140      48867
#> 3     Type 1 aggregate amount   $ 2521222582 2576578558 2583608517 2599433802
#> 4     Type 2 aggregate amount no.      15715      15305      15230      15308
#> 5     Type 2 aggregate amount   $ 1232919075 1344736671 1387236497 1703909231
#> 6 Aggregate non-exempt amount no.       1080       1095       1090       1130
#>      2013_14    2014_15    2015_16    2016_17    2017_18    2018_19    2019_20
#> 1      77046      76704      75427      75593      79656      83344      85560
#> 2      47870      46282      44702      43370      43051      42782      42327
#> 3 2561214421 2486069696 2319305412 2231579085 2250036329 2246350569 2206390457
#> 4      15223      15127      14956      14948      15036      15061      15170
#> 5 1984031047 2045038061 2065409089 1994367484 1969336596 2037639655 2096914738
#> 6       1130       1132       1100       1093       1123       1118       1104
#>      2020_21    2021_22    2022_23    2023_24
#> 1      92522     100297     105380     101716
#> 2      41411      42300      42978      41431
#> 3 1666717947 1877466830 2296429831 2387492268
#> 4      14223      14894      15955      16203
#> 5 1956089498 2046466898 2272820933 2557795254
#> 6       1130       1140       1100       1036
options(op)
# }
```
