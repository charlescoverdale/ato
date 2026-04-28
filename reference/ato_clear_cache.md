# Clear the ato cache

Deletes all locally cached files. The next call to any data function
will re-download.

## Usage

``` r
ato_clear_cache()
```

## Value

Invisibly returns `NULL`.

## See also

Other configuration:
[`ato_cache_info()`](https://charlescoverdale.github.io/ato/reference/ato_cache_info.md),
[`ato_meta()`](https://charlescoverdale.github.io/ato/reference/ato_meta.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
ato_clear_cache()
#> Removed 4 cached files from /tmp/RtmpiVpGVb.
options(op)
# }
```
