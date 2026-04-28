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
#> ℹ Downloading <https://data.gov.au/data/dataset/0aa77454-d0f6-4499-b0a4-88dbdee…
#> ✔ Downloading <https://data.gov.au/data/dataset/0aa77454-d0f6-4499-b0a4-88dbdee…
#> 
#> # ato_tbl: ATO Excise data (excise_rates)
#> # Source:   https://data.gov.au/data/dataset/0aa77454-d0f6-4499-b0a4-88dbdeee95d1/resource/b9227cdf-4c04-492d-bd84-65031adc408e/download/historical-excise-rates-1-april-2026.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-04-28 19:13 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  23f8d4653dc5e837...
#> # Rows: 6  Cols: 2
#> 
#>   historical_excise_rates_1965_through_to_29_september_2022
#> 1                                                      <NA>
#> 2                                              Excise rates
#> 3                                                      <NA>
#> 4                                              Tariff Items
#> 5                                   Historical excise rates
#> 6                                        Petroleum pre 2000
#>                                                                  
#> 1                                                            <NA>
#> 2                                 Excise rates, July 2006 onwards
#> 3                                                            <NA>
#> 4         Conversion of historical to current tariff item numbers
#> 5           Historical excise rates, August 2000 to February 2006
#> 6 Historical petroleum excise rates, pre August 2000 back to 1972
options(op)
# }
```
