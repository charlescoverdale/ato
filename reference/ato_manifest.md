# Return the session manifest of fetched ATO datasets

Every call to a data function
([`ato_individuals()`](https://charlescoverdale.github.io/ato/reference/ato_individuals.md),
[`ato_companies()`](https://charlescoverdale.github.io/ato/reference/ato_companies.md),
etc.) appends one row to the session manifest, recording URL, dataset
title, CKAN resource and package IDs where resolvable, SHA-256 of the
cached file, size, retrieval timestamp, and the snapshot pin set via
[`ato_snapshot()`](https://charlescoverdale.github.io/ato/reference/ato_snapshot.md).
Duplicate URLs within a session are deduplicated (last fetch wins).

## Usage

``` r
ato_manifest(format = c("df", "yaml", "json"))
```

## Arguments

- format:

  One of `"df"` (default, tidy data frame), `"yaml"`, or `"json"`.

## Value

A data frame, YAML string, or JSON string depending on `format`.

## Details

Attach the output to your paper's appendix, deposit it to Zenodo with
[`ato_deposit_zenodo()`](https://charlescoverdale.github.io/ato/reference/ato_deposit_zenodo.md)
to mint a DOI, or export with
[`ato_manifest_write()`](https://charlescoverdale.github.io/ato/reference/ato_manifest_write.md)
for CI artefacts.

## See also

Other reproducibility:
[`ato_deposit_zenodo()`](https://charlescoverdale.github.io/ato/reference/ato_deposit_zenodo.md),
[`ato_manifest_clear()`](https://charlescoverdale.github.io/ato/reference/ato_manifest_clear.md),
[`ato_manifest_write()`](https://charlescoverdale.github.io/ato/reference/ato_manifest_write.md),
[`ato_sha256()`](https://charlescoverdale.github.io/ato/reference/ato_sha256.md),
[`ato_snapshot()`](https://charlescoverdale.github.io/ato/reference/ato_snapshot.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
ato_manifest_clear()
ato_snapshot("2026-04-24")
try(ato_individuals(year = "2022-23"))
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "taxation-statistics-2022-23".
ato_manifest()
#>  [1] url           title         resource_id   package_id    licence      
#>  [6] sha256        size_bytes    retrieved     snapshot_date r_version    
#> [11] ato_version  
#> <0 rows> (or 0-length row.names)
options(op)
# }
```
