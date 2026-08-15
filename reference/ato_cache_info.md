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
#> [1] "/tmp/RtmpNi5SgA"
#> 
#> $n_files
#> [1] 4
#> 
#> $size_bytes
#> [1] 8936
#> 
#> $size_human
#> [1] "8.7 KB"
#> 
#> $files
#>                                     name size_bytes            modified
#> 1 bslib-e9b2b13fa612f50d23e4850d93d60d01       4096 2026-08-15 19:05:51
#> 2                                downlit       4096 2026-08-15 19:05:54
#> 3                       file190e53a6fb75        434 2026-08-15 19:05:54
#> 4                       file190e5f6cecf3        310 2026-08-15 19:05:54
#> 
options(op)
# }
```
