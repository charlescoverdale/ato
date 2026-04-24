# Fetch CKAN metadata for an ATO dataset

Returns structured metadata for any ATO dataset on data.gov.au: title,
notes, licence, last-modified timestamp, resource count, and all
resource URLs. Useful for detecting silent updates before clearing the
cache, or for auditing what version of data you have.

## Usage

``` r
ato_meta(x)
```

## Arguments

- x:

  Either an `ato_tbl` (as returned by any `ato_*` data function) or a
  character CKAN package ID / slug (e.g.
  `"taxation-statistics-2022-23"`, `"corporate-transparency"`).

## Value

A list with elements:

- `id`: CKAN package slug

- `title`: human-readable title

- `notes`: dataset description (truncated to 400 chars)

- `licence`: licence title

- `metadata_modified`: ISO timestamp of last CKAN update

- `n_resources`: number of downloadable files

- `resource_urls`: character vector of all resource URLs

## See also

Other configuration:
[`ato_cache_info()`](https://charlescoverdale.github.io/ato/reference/ato_cache_info.md),
[`ato_clear_cache()`](https://charlescoverdale.github.io/ato/reference/ato_clear_cache.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  # By package ID
  m <- ato_meta("taxation-statistics-2022-23")
  m$metadata_modified

  # From an ato_tbl
  tbl <- ato_individuals(year = "2022-23")
  ato_meta(tbl)
})
#> Error in ato_ckan_package(x) : 
#>   Package not found: "taxation-statistics-2022-23".
options(op)
# }
```
