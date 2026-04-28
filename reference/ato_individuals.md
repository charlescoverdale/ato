# Individual Taxation Statistics snapshot

Returns the Individuals Table 1 snapshot: aggregate counts, total
income, taxable income, tax payable, and deductions across all
individual returns (roughly 14 million per year). The snapshot is the
headline table; for finer cuts use the dedicated functions:

- [`ato_individuals_postcode()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_postcode.md)
  for geographic breakdowns,

- [`ato_individuals_occupation()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_occupation.md)
  for occupation × sex × income-range detail, or

- [`ato_download()`](https://charlescoverdale.github.io/ato/reference/ato_download.md)
  with a custom `pattern` for specific Tables 2 to 27 (age, sex, state,
  industry, source of income, deductions, offsets, CGT, non-residents).

## Usage

``` r
ato_individuals(year = "latest")
```

## Source

Australian Taxation Office Taxation Statistics
<https://www.ato.gov.au/about-ato/research-and-statistics/>. Licensed CC
BY 2.5 AU.

## Arguments

- year:

  Year in `"YYYY-YY"` form (e.g. `"2022-23"`) or `"latest"`. `"latest"`
  resolves to the most recently published release (currently 2022-23).

## Value

An `ato_tbl` with one row per aggregate line-item and columns for count
and amount in nominal AUD.

## Details

Monetary values are nominal AUD of the reporting year. Use
`inflateR::inflate()` or the ABS CPI series if you need real-term
comparisons.

## See also

Other individuals:
[`ato_individuals_age()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_age.md),
[`ato_individuals_occupation()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_occupation.md),
[`ato_individuals_postcode()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_postcode.md),
[`ato_individuals_sex()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_sex.md),
[`ato_individuals_state()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_state.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  ind <- ato_individuals(year = "2022-23")
  head(ind)
})
#> ℹ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> ✔ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> 
#> # ato_tbl: ATO individuals snapshot 2022-23
#> # Source:   https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a5931887-8d4f-48a8-89ab-571ca0d56bc7/download/ts23snapshot01historicalratesofpersonalincometax.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-04-28 19:13 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  2e0efce4b93d9257...
#> # Rows: 6  Cols: 6
#> 
#>                                                        s_d          
#> 1   0 100 <NA>             Nil         +    1 d for each £ <NA> <NA>
#> 2 100 150 <NA> 0    8  4 +     6 d for each £ over     100 <NA> <NA>
#> 3 150 200 <NA>   1  13  4 +   11 d for each £ over     150 <NA> <NA>
#> 4 200 250 <NA>   3  19  2 +   16 d for each £ over     200 <NA> <NA>
#> 5 250 300 <NA>   7   5 10 +   21 d for each £ over     250 <NA> <NA>
#> 6 300 400 <NA>  11  13  4 +   26 d for each £ over     300 <NA> <NA>
options(op)
# }
```
