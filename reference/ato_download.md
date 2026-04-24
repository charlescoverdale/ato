# Download a resource from an ATO dataset

Low-level helper for arbitrary CKAN resources. Resolves the package by
id (slug) and picks the first resource matching `pattern`, or the first
resource if `pattern` is `NULL`.

## Usage

``` r
ato_download(
  id,
  pattern = NULL,
  parse = c("auto", "csv", "xlsx", "none"),
  sheet = 1
)
```

## Arguments

- id:

  CKAN package id (e.g. `"taxation-statistics-2022-23"` or
  `"corporate-transparency"`).

- pattern:

  Optional regex applied to the resource filename and name.

- parse:

  One of `"auto"` (default), `"csv"`, `"xlsx"`, or `"none"` (returns the
  cached file path).

- sheet:

  For XLSX resources: sheet index or name.

## Value

Either a file path (`parse = "none"`) or an `ato_tbl`.

## See also

Other discovery:
[`ato_catalog()`](https://charlescoverdale.github.io/ato/reference/ato_catalog.md),
[`ato_charities()`](https://charlescoverdale.github.io/ato/reference/ato_charities.md),
[`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md),
[`ato_excise()`](https://charlescoverdale.github.io/ato/reference/ato_excise.md),
[`ato_fbt()`](https://charlescoverdale.github.io/ato/reference/ato_fbt.md),
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
  cat <- ato_download("corporate-transparency",
                      pattern = "2023",
                      parse = "csv")
})
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "corporate-transparency".
options(op)
# }
```
