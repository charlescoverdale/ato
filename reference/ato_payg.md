# PAYG withholding data

Returns the ATO's Pay As You Go (PAYG) withholding data: employer
counts, total withholding amounts, and employee counts by industry and
state. Used by researchers studying labour market taxation, wage growth,
and employer compliance.

## Usage

``` r
ato_payg(year = "latest")
```

## Source

Australian Taxation Office PAYG withholding data on data.gov.au.
Licensed CC BY 2.5 AU.

## Arguments

- year:

  Income year in `"YYYY-YY"` form (e.g. `"2022-23"`) or `"latest"`.

## Value

An `ato_tbl`. Monetary values in nominal AUD.

## See also

Other discovery:
[`ato_catalog()`](https://charlescoverdale.github.io/ato/reference/ato_catalog.md),
[`ato_charities()`](https://charlescoverdale.github.io/ato/reference/ato_charities.md),
[`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md),
[`ato_download()`](https://charlescoverdale.github.io/ato/reference/ato_download.md),
[`ato_excise()`](https://charlescoverdale.github.io/ato/reference/ato_excise.md),
[`ato_fbt()`](https://charlescoverdale.github.io/ato/reference/ato_fbt.md),
[`ato_help()`](https://charlescoverdale.github.io/ato/reference/ato_help.md),
[`ato_irpd()`](https://charlescoverdale.github.io/ato/reference/ato_irpd.md),
[`ato_rdti()`](https://charlescoverdale.github.io/ato/reference/ato_rdti.md),
[`ato_sme_benchmarks()`](https://charlescoverdale.github.io/ato/reference/ato_sme_benchmarks.md),
[`ato_tax_gaps()`](https://charlescoverdale.github.io/ato/reference/ato_tax_gaps.md),
[`ato_top_taxpayers()`](https://charlescoverdale.github.io/ato/reference/ato_top_taxpayers.md),
[`ato_vttc()`](https://charlescoverdale.github.io/ato/reference/ato_vttc.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  payg <- ato_payg(year = "2022-23")
  head(payg)
})
#> ℹ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> ✔ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> 
#> # ato_tbl: ATO PAYG withholding 2022-23
#> # Source:   https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/db302f15-59e7-409f-807a-82c808e1d04e/download/ts23payg01payasyougowitholding.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-09-19 10:27 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  e38a7df80538703b...
#> # Rows: 6  Cols: 6
#> 
#>     year1 entity_type                      broad_industry2 withholder_type3
#> 1 2010–11   Companies a. Agriculture, Forestry and Fishing            Large
#> 2 2010–11   Companies a. Agriculture, Forestry and Fishing           Medium
#> 3 2010–11   Companies a. Agriculture, Forestry and Fishing            Small
#> 4 2010–11   Companies                            b. Mining            Large
#> 5 2010–11   Companies                            b. Mining           Medium
#> 6 2010–11   Companies                            b. Mining            Small
#>   clients_no      paygw
#> 1        107  435887418
#> 2       3537  358024692
#> 3       5837   73324091
#> 4        505 5288532146
#> 5       2056  516111203
#> 6       1233   42913188
options(op)
# }
```
