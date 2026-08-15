# GST and activity statement ratios

Returns the Taxation Statistics GST tables (T1-T5) or the Activity
Statement Ratios (A1-A5) for the requested year.

## Usage

``` r
ato_gst(year = "latest", table = c("overview", "state", "industry", "ratios"))
```

## Source

Australian Taxation Office Taxation Statistics. Licensed CC BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

- table:

  One of `"overview"` (default, GST T1), `"state"` (GST by state),
  `"industry"` (GST by ANZSIC), or `"ratios"` (Activity Statement
  Ratios).

## Value

An `ato_tbl`.

## References

Australian Taxation Office (annual). *Taxation Statistics: GST and
Activity Statement Ratios explanatory notes*.

Commonwealth of Australia. *A New Tax System (Goods and Services Tax)
Act 1999*. Enabling legislation for the 10 per cent value-added tax
introduced 1 July 2000.

Productivity Commission (2018). *Horizontal Fiscal Equalisation*.
Background reference on the GST distribution formula across states.

## See also

Other gst:
[`ato_industry()`](https://charlescoverdale.github.io/ato/reference/ato_industry.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  g <- ato_gst(year = "2022-23", table = "industry")
  head(g)
})
#> ℹ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> ✔ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> 
#> # ato_tbl: ATO GST 2022-23 (industry)
#> # Source:   https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/678e9689-38b9-49ae-b149-58378e5bf8f1/download/ts23gst04byindustry.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-08-15 17:27 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  b0f9b0f583c3d03e...
#> # Rows: 6  Cols: 7
#> 
#>                        broad_industry2                           fine_industry2
#> 1 A. Agriculture, Forestry and Fishing  011 Nursery and Floriculture Production
#> 2 A. Agriculture, Forestry and Fishing       012 Mushroom and Vegetable Growing
#> 3 A. Agriculture, Forestry and Fishing           013 Fruit and Tree Nut Growing
#> 4 A. Agriculture, Forestry and Fishing 014 Sheep, Beef Cattle and Grain Farming
#> 5 A. Agriculture, Forestry and Fishing                   015 Other Crop Growing
#> 6 A. Agriculture, Forestry and Fishing                 016 Dairy Cattle Farming
#>   gst_records_no_3 gross_gst_payable input_tax_credits
#> 1             3033         227336270         194494967
#> 2             4874         106962347         447412588
#> 3            10264         248478755         835402253
#> 4            97297        5958111511        5362720345
#> 5             6125         599950489         492579919
#> 6             5955         745010758         601682320
#>   deferred_gst_payments_on_imports    net_gst
#> 1                           406502   33247805
#> 2                          1217550 -339232691
#> 3                          6232079 -580691419
#> 4                          1233428  596624594
#> 5                          7360205  114730775
#> 6                                0  143328438
options(op)
# }
```
