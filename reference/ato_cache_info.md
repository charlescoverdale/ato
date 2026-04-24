# Inspect the local ato cache

Inspect the local ato cache

## Usage

``` r
ato_cache_info()
```

## Value

A list with `dir`, `n_files`, `size_bytes`, `size_human`, and `files`.

## See also

Other configuration:
[`ato_clear_cache()`](https://charlescoverdale.github.io/ato/reference/ato_clear_cache.md),
[`ato_meta()`](https://charlescoverdale.github.io/ato/reference/ato_meta.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
ato_cache_info()
#> $dir
#> [1] "/tmp/RtmpKR27IU"
#> 
#> $n_files
#> [1] 4
#> 
#> $size_bytes
#> [1] 8937
#> 
#> $size_human
#> [1] "8.7 KB"
#> 
#> $files
#>                                     name size_bytes            modified
#> 1 bslib-246362e7e3ff6191071d5f9b40ba8d62       4096 2026-04-24 13:44:32
#> 2                                downlit       4096 2026-04-24 13:44:35
#> 3                       file198e4fbcb449        435 2026-04-24 13:44:35
#> 4                       file198e39854f3f        310 2026-04-24 13:44:35
#> 
options(op)
# }
```
