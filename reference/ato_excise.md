# Excise and fuel tax credit rates and clearances

Returns ATO excise data, covering four sub-releases:

- **beer** : beer clearances summary (volumes by product class)

- **spirits** : spirits and other excisable beverages clearances

- **excise_rates** : historical excise rate schedule (all excise
  categories, quarterly indexed rates)

- **ftc_rates** : historical Fuel Tax Credit rates

## Usage

``` r
ato_excise(table = c("excise_rates", "ftc_rates", "beer", "spirits"))
```

## Source

Australian Taxation Office excise data. Licensed CC BY 2.5 AU.

## Arguments

- table:

  One of `"beer"`, `"spirits"`, `"excise_rates"` (default), or
  `"ftc_rates"`.

## Value

An `ato_tbl`. Rates are in AUD per litre (or per kg for tobacco);
volumes are in megalitres or similar.

## References

Commonwealth of Australia. *Excise Act 1901*; *Excise Tariff Act 1921*;
*Fuel Tax Act 2006*.

Australian Taxation Office (annual). *Excise data: methodology and
indexation notes*. Excise rates are indexed to the Consumer Price Index
twice a year (February and August) for most commodities.

Productivity Commission (2016). *Migrant Intake into Australia* (for
tobacco excise distributional analysis); *Harmful Drinking* inquiry (for
alcohol excise distributional analysis).

## See also

Other discovery:
[`ato_catalog()`](https://charlescoverdale.github.io/ato/reference/ato_catalog.md),
[`ato_charities()`](https://charlescoverdale.github.io/ato/reference/ato_charities.md),
[`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md),
[`ato_download()`](https://charlescoverdale.github.io/ato/reference/ato_download.md),
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
  rates <- ato_excise("excise_rates")
  head(rates)
})
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "excise-data".
options(op)
# }
```
