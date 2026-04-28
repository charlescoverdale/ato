# Voluntary Tax Transparency Code disclosures

Returns the ATO's Voluntary Tax Transparency Code (VTTC) disclosures:
large private companies that voluntarily publish tax information beyond
the Corporate Tax Transparency mandate. Covers total income, taxable
income, tax payable, and effective tax rate for each disclosing entity.

## Usage

``` r
ato_vttc(year = "latest")
```

## Source

Australian Taxation Office Voluntary Tax Transparency Code disclosures
on data.gov.au. Licensed CC BY 3.0 AU.

## Arguments

- year:

  Income year in `"YYYY-YY"` form (e.g. `"2022-23"`) or `"latest"`.

## Value

An `ato_tbl`. Monetary values in nominal AUD.

## Details

The VTTC complements
[`ato_top_taxpayers()`](https://charlescoverdale.github.io/ato/reference/ato_top_taxpayers.md)
(which covers mandatory CTT disclosures for entities above AUD 100m
total income). VTTC signatories may be below or above the CTT threshold.

Licensed under **CC BY 3.0 Australia** (same as CTT data).

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
[`ato_payg()`](https://charlescoverdale.github.io/ato/reference/ato_payg.md),
[`ato_rdti()`](https://charlescoverdale.github.io/ato/reference/ato_rdti.md),
[`ato_sme_benchmarks()`](https://charlescoverdale.github.io/ato/reference/ato_sme_benchmarks.md),
[`ato_tax_gaps()`](https://charlescoverdale.github.io/ato/reference/ato_tax_gaps.md),
[`ato_top_taxpayers()`](https://charlescoverdale.github.io/ato/reference/ato_top_taxpayers.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  vttc <- ato_vttc(year = "2022-23")
  head(vttc)
})
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■                 
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> Error in ato_ckan_resolve(pkg_id, year) : 
#>   No resource in "voluntary-tax-transparency-code" matches "2022-23".
#> ℹ Available: "List of Voluntary Tax Transparency Code (VTTC) reports published
#>   by signatories."
options(op)
# }
```
