# Charity and deductible gift recipient data

Returns the ATO's data on income tax-exempt entities and Deductible Gift
Recipients (DGRs): entity counts, income, expenditure, and gift
deductions by charity subtype and state. Covers public benevolent
institutions, health promotion charities, environmental organisations,
and other DGR categories.

## Usage

``` r
ato_charities(year = "latest")
```

## Source

Australian Taxation Office charity statistics on data.gov.au. Licensed
CC BY 2.5 AU.

## Arguments

- year:

  Income year in `"YYYY-YY"` form (e.g. `"2021-22"`) or `"latest"`.

## Value

An `ato_tbl`. Monetary values in nominal AUD.

## Details

Used by Treasury (charity tax expenditure estimates), researchers
studying the non-profit sector, and civil society policy analysts.

## See also

Other discovery:
[`ato_catalog()`](https://charlescoverdale.github.io/ato/reference/ato_catalog.md),
[`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md),
[`ato_download()`](https://charlescoverdale.github.io/ato/reference/ato_download.md),
[`ato_excise()`](https://charlescoverdale.github.io/ato/reference/ato_excise.md),
[`ato_fbt()`](https://charlescoverdale.github.io/ato/reference/ato_fbt.md),
[`ato_help()`](https://charlescoverdale.github.io/ato/reference/ato_help.md),
[`ato_irpd()`](https://charlescoverdale.github.io/ato/reference/ato_irpd.md),
[`ato_payg()`](https://charlescoverdale.github.io/ato/reference/ato_payg.md),
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
  ch <- ato_charities(year = "2021-22")
  head(ch)
})
#> Error in ato_charities(year = "2021-22") : 
#>   Could not find a charity / DGR package on data.gov.au.
#> ℹ Browse: <https://data.gov.au/data/organization/australiantaxationoffice>
options(op)
# }
```
