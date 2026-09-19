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
#> [1] "/tmp/RtmpzSxoHo"
#> 
#> $n_files
#> [1] 4
#> 
#> $size_bytes
#> [1] 8903
#> 
#> $size_human
#> [1] "8.7 KB"
#> 
#> $files
#>                                     name size_bytes            modified
#> 1 bslib-e9b2b13fa612f50d23e4850d93d60d01       4096 2026-09-19 10:25:46
#> 2                                downlit       4096 2026-09-19 10:25:48
#> 3                       file19ea505ffa5a        434 2026-09-19 10:25:48
#> 4                       file19ea3d36f46e        277 2026-09-19 10:25:48
#> 
options(op)
# }
```
