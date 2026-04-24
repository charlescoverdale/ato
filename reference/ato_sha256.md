# Compute the SHA-256 digest of a file

Wraps [`tools::md5sum()`](https://rdrr.io/r/tools/md5sum.html) style
behaviour for SHA-256 via the `digest` package when available, or falls
back to a pure-R implementation via
[`tools::md5sum()`](https://rdrr.io/r/tools/md5sum.html) + file length
as a weaker check. For integrity work PBO/Grattan-grade, install the
`digest` package (Suggests).

## Usage

``` r
ato_sha256(file)
```

## Arguments

- file:

  Path to a local file.

## Value

A length-1 character string (hex digest), or `NA` if the file does not
exist.

## See also

Other reproducibility:
[`ato_deposit_zenodo()`](https://charlescoverdale.github.io/ato/reference/ato_deposit_zenodo.md),
[`ato_manifest()`](https://charlescoverdale.github.io/ato/reference/ato_manifest.md),
[`ato_manifest_clear()`](https://charlescoverdale.github.io/ato/reference/ato_manifest_clear.md),
[`ato_manifest_write()`](https://charlescoverdale.github.io/ato/reference/ato_manifest_write.md),
[`ato_snapshot()`](https://charlescoverdale.github.io/ato/reference/ato_snapshot.md)

## Examples

``` r
f <- tempfile()
writeLines("hello", f)
ato_sha256(f)
#> [1] "5891b5b522d5df086d0ff0b110fbd9d21bb4fc7163af34d08286a2e846f6be03"
```
