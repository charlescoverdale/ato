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
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "taxation-statistics-2022-23".
options(op)
# }
```
