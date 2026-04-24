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
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "taxation-statistics-2022-23".
options(op)
# }
```
