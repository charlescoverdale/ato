# Pin or inspect the session snapshot date

Call once at the top of an analysis script to declare the vintage of ATO
data you intend to use. Every subsequent `ato_*` fetch records this date
in the `ato_tbl` provenance header, in
[`ato_manifest()`](https://charlescoverdale.github.io/ato/reference/ato_manifest.md)
entries, and in
[`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md)
output. Combined with SHA-256 integrity (see
[`ato_sha256()`](https://charlescoverdale.github.io/ato/reference/ato_sha256.md)
and
[`ato_manifest()`](https://charlescoverdale.github.io/ato/reference/ato_manifest.md)),
this gives a reproducible audit trail acceptable for PBO or
Grattan-style published work.

## Usage

``` r
ato_snapshot(date)
```

## Arguments

- date:

  ISO `"YYYY-MM-DD"` character, `Date`, or `POSIXct`. Pass `NULL` to
  clear.

## Value

Invisibly, the new pinned date (as `Date`), or `NULL`.

## Details

If called with no arguments, returns the current pin (or `NULL` if
unset).

## See also

Other reproducibility:
[`ato_deposit_zenodo()`](https://charlescoverdale.github.io/ato/reference/ato_deposit_zenodo.md),
[`ato_manifest()`](https://charlescoverdale.github.io/ato/reference/ato_manifest.md),
[`ato_manifest_clear()`](https://charlescoverdale.github.io/ato/reference/ato_manifest_clear.md),
[`ato_manifest_write()`](https://charlescoverdale.github.io/ato/reference/ato_manifest_write.md),
[`ato_sha256()`](https://charlescoverdale.github.io/ato/reference/ato_sha256.md)

## Examples

``` r
ato_snapshot("2026-04-24")
ato_snapshot()
#> [1] "2026-04-24"
ato_snapshot(NULL)
```
