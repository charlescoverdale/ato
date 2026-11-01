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
#> [1] "/tmp/Rtmpr3AAwJ"
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
#> 1 bslib-7db53ff92ec092c0dbca0588320fd109       4096 2026-11-01 14:03:26
#> 2                                downlit       4096 2026-11-01 14:03:29
#> 3                       file19993610243d        434 2026-11-01 14:03:29
#> 4                       file19997b66785b        277 2026-11-01 14:03:29
#> 
options(op)
# }
```
