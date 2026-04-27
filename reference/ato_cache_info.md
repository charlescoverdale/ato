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
#> [1] "/tmp/Rtmp4rwvgf"
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
#> 1 bslib-8a92d22979ec96a3105b4f8cbcdeeec5       4096 2026-04-27 20:51:22
#> 2                                downlit       4096 2026-04-27 20:51:25
#> 3                       file1a2f6f46e6f3        435 2026-04-27 20:51:25
#> 4                       file1a2f4d14b4fc        310 2026-04-27 20:51:25
#> 
options(op)
# }
```
