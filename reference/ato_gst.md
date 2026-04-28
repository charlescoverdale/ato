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
#> # Retrieved: 2026-04-28 19:13 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  b0f9b0f583c3d03e...
#> # Rows: 6  Cols: 2
#> 
#>                                      taxation_statistics_2022_23
#> 1                                   Table 4: GST and other taxes
#> 2 Selected GST items, by fine industry2, 2023–24 financial year1
#> 3                                                           <NA>
#> 4                                                         Notes:
#> 5                                                           <NA>
#> 6                                                           <NA>
#>                                                                                                                                     
#> 1                                                                                                                               <NA>
#> 2                                                                                                                               <NA>
#> 3                                                                                                                               <NA>
#> 4                                                                                                                               <NA>
#> 5                                                                        Totals may not equal the sum of components due to rounding.
#> 6 In order to meet privacy regulations, some items may not be included, or data for some groups may be aggregated with other groups.
options(op)
# }
```
