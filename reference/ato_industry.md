# Industry aggregates across entity types

Derived helper that returns an ANZSIC industry breakdown based on either
individual, company, or all entities for the year.

## Usage

``` r
ato_industry(
  year = "latest",
  entity = c("company", "individual", "all"),
  anzsic = NULL
)
```

## Source

Australian Taxation Office Taxation Statistics. Licensed CC BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

- entity:

  One of `"individual"`, `"company"` (default), or `"all"`.

- anzsic:

  Optional substring filter on industry name.

## Value

An `ato_tbl`.

## See also

Other gst:
[`ato_gst()`](https://charlescoverdale.github.io/ato/reference/ato_gst.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  i <- ato_industry(year = "2022-23", entity = "company",
                    anzsic = "manufacturing")
  head(i)
})
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "taxation-statistics-2022-23".
options(op)
# }
```
