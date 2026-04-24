# Write the session manifest to a file

Writes the manifest to a file in the requested format. Call at the end
of an analysis script; commit the manifest alongside the paper for full
reproducibility.

## Usage

``` r
ato_manifest_write(path, format = c("auto", "csv", "yaml", "json"))
```

## Arguments

- path:

  Output file path. Extension determines format if `format = "auto"`:
  `.csv` to CSV, `.yaml`/`.yml` to YAML, `.json` to JSON.

- format:

  One of `"auto"` (infer from extension), `"csv"`, `"yaml"`, or
  `"json"`.

## Value

Invisibly, the absolute path to the written file.

## See also

Other reproducibility:
[`ato_deposit_zenodo()`](https://charlescoverdale.github.io/ato/reference/ato_deposit_zenodo.md),
[`ato_manifest()`](https://charlescoverdale.github.io/ato/reference/ato_manifest.md),
[`ato_manifest_clear()`](https://charlescoverdale.github.io/ato/reference/ato_manifest_clear.md),
[`ato_sha256()`](https://charlescoverdale.github.io/ato/reference/ato_sha256.md),
[`ato_snapshot()`](https://charlescoverdale.github.io/ato/reference/ato_snapshot.md)

## Examples

``` r
# \donttest{
p <- tempfile(fileext = ".csv")
ato_manifest_clear()
ato_manifest_write(p)
# }
```
