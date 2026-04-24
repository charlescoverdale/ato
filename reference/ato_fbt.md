# Fringe Benefits Tax statistics

Returns the ATO's annual Fringe Benefits Tax (FBT) Taxation Statistics:
employer counts, gross taxable value, FBT payable, and employee benefit
counts by benefit type and industry. Used by Treasury, PBO, and
researchers evaluating the FBT concession system (electric vehicles,
remote area exemptions, novated leases).

## Usage

``` r
ato_fbt(year = "latest")
```

## Source

Australian Taxation Office FBT Taxation Statistics on data.gov.au.
Licensed CC BY 2.5 AU.

## Arguments

- year:

  Income year in `"YYYY-YY"` form (e.g. `"2022-23"`) or `"latest"`.

## Value

An `ato_tbl`. Monetary values in nominal AUD.

## References

Commonwealth of Australia. *Fringe Benefits Tax Assessment Act 1986*.
Substantive FBT law; ATO rulings (TR series) elaborate taxable-value
methodology.

Australian Taxation Office (annual). *FBT explanatory notes*.
Definitions of reportable benefits, gross-up factors (Type 1 and Type
2), and otherwise-deductible rule.

Treasury (2022). *Electric Car Discount Bill*. Explanatory memorandum
for the EV FBT exemption introduced 1 July 2022.

## See also

Other discovery:
[`ato_catalog()`](https://charlescoverdale.github.io/ato/reference/ato_catalog.md),
[`ato_charities()`](https://charlescoverdale.github.io/ato/reference/ato_charities.md),
[`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md),
[`ato_download()`](https://charlescoverdale.github.io/ato/reference/ato_download.md),
[`ato_excise()`](https://charlescoverdale.github.io/ato/reference/ato_excise.md),
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
  fbt <- ato_fbt(year = "2022-23")
  head(fbt)
})
#> Error in ato_ckan_search(q = "fringe-benefits-tax", rows = 10L) : 
#>   CKAN search failed (HTTP 403).
options(op)
# }
```
