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
#> # Source:   https://data.gov.au/data/dataset/0aa77454-d0f6-4499-b0a4-88dbdeee95d1/resource/b9227cdf-4c04-492d-bd84-65031adc408e/download/historical-excise-rates-1-september-2026.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-09-19 10:26 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  2d56c36a675be8a8...
#> # Rows: 6  Cols: 95
#> 
#>   tariff_item product units tariff_item_description 46266 46237 46204 46113
#> 1         101    Beer   L/A         Bottled - Light 55.83 55.83 54.74 54.74
#> 2         102    Beer   L/A             Keg - Light 10.57 10.57 10.57 10.57
#> 3         105    Beer   L/A        Bottled - Medium 65.03 65.03 63.75 63.75
#> 4         106    Beer   L/A            Keg - Medium 33.11 33.11 33.11 33.11
#> 5         110    Beer   L/A         Bottled - Heavy 65.03 65.03 63.75 63.75
#> 6         111    Beer   L/A             Keg - Heavy 43.39 43.39 43.39 43.39
#>   46084 46055 45901 45873 45839 45717 45691              45536
#> 1 54.74 54.74 53.72 53.72 52.87 52.87 52.87              52.66
#> 2 10.57 10.57 10.57 10.57 10.57 10.57 10.57              10.53
#> 3 63.75 63.75 62.56 62.56 61.57 61.57 61.57              61.32
#> 4 33.11 33.11 33.11 33.11 33.11 33.11 33.11 32.979999999999997
#> 5 63.75 63.75 62.56 62.56 61.57 61.57 61.57              61.32
#> 6 43.39 43.39 43.39 43.39 43.39 43.39 43.39              43.22
#>                45509 45474 45352 45327 45170 45139 45108 44986 44958
#> 1              52.66 51.63 51.63 51.63 50.72 50.72 49.63 49.63 49.63
#> 2              10.53 10.32 10.32 10.32 10.14 10.14  9.92  9.92  9.92
#> 3              61.32 60.12 60.12 60.12 59.06 59.06 57.79 57.79 57.79
#> 4 32.979999999999997 32.33 32.33 32.33 31.76 31.76 31.08 31.08 31.08
#> 5              61.32 60.12 60.12 60.12 59.06 59.06 57.79 57.79 57.79
#> 6              43.22 42.37 42.37 42.37 41.62 41.62 40.72 40.72 40.72
#>                44833              44805              44774              44743
#> 1              47.86              47.86              47.86              46.02
#> 2               9.57               9.57               9.57 9.1999999999999993
#> 3              55.73              55.73              55.73              53.59
#> 4              29.97              29.97              29.97              28.82
#> 5              55.73              55.73              55.73              53.59
#> 6 39.270000000000003 39.270000000000003 39.270000000000003              37.76
#>                44650              44621              44593              44440
#> 1              46.02              46.02              46.02              45.07
#> 2 9.1999999999999993 9.1999999999999993 9.1999999999999993               9.01
#> 3              53.59              53.59              53.59              52.49
#> 4              28.82              28.82              28.82              28.23
#> 5              53.59              53.59              53.59              52.49
#> 6              37.76              37.76              37.76 36.979999999999997
#>                44410 44378 44257 44228 44075 44046 44013 43891 43864
#> 1              45.07 44.45 44.45 44.45 44.05 44.05 44.05 44.05 44.05
#> 2               9.01  8.89  8.89  8.89  8.81  8.81  8.81  8.81  8.81
#> 3              52.49 51.77 51.77 51.77 51.31 51.31 51.31 51.31 51.31
#> 4              28.23 27.84 27.84 27.84 27.59 27.59 27.59 27.59 27.59
#> 5              52.49 51.77 51.77 51.77 51.31 51.31 51.31 51.31 51.31
#> 6 36.979999999999997 36.47 36.47 36.47 36.14 36.14 36.14 36.14 36.14
#>                43709              43682 43647 43525 43500 43344 43313
#> 1              43.53              43.53 43.27 43.27 43.27 42.84 42.84
#> 2 8.7100000000000009 8.7100000000000009  8.66  8.66  8.66  8.57  8.57
#> 3               50.7               50.7  50.4  50.4  50.4  49.9  49.9
#> 4              27.26              27.26  27.1  27.1  27.1 26.83 26.83
#> 5               50.7               50.7  50.4  50.4  50.4  49.9  49.9
#> 6              35.71              35.71  35.5  35.5  35.5 35.15 35.15
#>                43282              43160              43136 42979 42948 42917
#> 1               42.5               42.5               42.5 41.95 41.95  41.7
#> 2                8.5                8.5                8.5  8.39  8.39  8.34
#> 3               49.5               49.5               49.5 48.86 48.86 48.57
#> 4              26.62              26.62              26.62 26.28 26.28 26.12
#> 5               49.5               49.5               49.5 48.86 48.86 48.57
#> 6 34.869999999999997 34.869999999999997 34.869999999999997 34.42 34.42 34.21
#>   42795 42767              42614              42583              42552
#> 1  41.7  41.7              41.16              41.16              41.08
#> 2  8.34  8.34               8.23               8.23 8.2100000000000009
#> 3 48.57 48.57              47.95              47.95              47.85
#> 4 26.12 26.12              25.78              25.78              25.73
#> 5 48.57 48.57              47.95              47.95              47.85
#> 6 34.21 34.21 33.770000000000003 33.770000000000003 33.700000000000003
#>                42430              42401 42248 42217              42186
#> 1              41.08              41.08 40.75 40.75              40.43
#> 2 8.2100000000000009 8.2100000000000009  8.14  8.14               8.08
#> 3              47.85              47.85 47.47 47.47              47.09
#> 4              25.73              25.73 25.53 25.53              25.33
#> 5              47.85              47.85 47.47 47.47              47.09
#> 6 33.700000000000003 33.700000000000003 33.43 33.43 33.159999999999997
#>                42066              42037 41953 41883 41852 41821 41699 41671
#> 1              40.43              40.43 40.15 40.15 40.15 39.75 39.75 39.75
#> 2               8.08               8.08  8.02  8.02  8.02  7.94  7.94  7.94
#> 3              47.09              47.09 46.76 46.76 46.76  46.3  46.3  46.3
#> 4              25.33              25.33 25.15 25.15 25.15  24.9  24.9  24.9
#> 5              47.09              47.09 46.76 46.76 46.76  46.3  46.3  46.3
#> 6 33.159999999999997 33.159999999999997 32.93 32.93 32.93  32.6  32.6  32.6
#>   41609 41487              41456              41306              41122 41091
#> 1 39.01 39.01 38.700000000000003 38.700000000000003 38.090000000000003 37.86
#> 2  7.79  7.79               7.73               7.73               7.61  7.56
#> 3 45.44  45.4              45.08              45.08              44.37 44.11
#> 4 24.44 24.44              24.25              24.25              23.87 23.73
#> 5 45.44 45.44              45.08              45.08              44.37 44.11
#> 6 31.99 31.99              31.74              31.74              31.24 31.05
#>   40940              40878              40756 40575 40392              40298
#> 1 37.86 37.630000000000003 37.630000000000003 36.71 36.31 35.770000000000003
#> 2  7.56               7.51               7.51  7.33  7.25               7.14
#> 3 44.11              43.85              43.85 42.78 42.31              41.68
#> 4 23.73              23.59              23.59 23.01 22.76              22.42
#> 5 44.11              43.85              43.85 42.78 42.31              41.68
#> 6 31.05              30.86              30.86 30.11 29.78              29.34
#>                40210 40028 39846 39661              39565              39479
#> 1 35.770000000000003 35.24 35.03 34.72 33.770000000000003 33.770000000000003
#> 2               7.14  7.03  6.99  6.93               6.74               6.74
#> 3              41.68 41.06 40.82 40.46              39.36              39.36
#> 4              22.42 22.09 21.96 21.76              21.17              21.17
#> 5              41.68 41.06 40.82 40.46              39.36              39.36
#> 6              29.34 28.91 28.74 28.48               27.7               27.7
#>                39295              39114              38930              38899
#> 1              33.21              32.78 32.520000000000003              31.73
#> 2               6.63               6.54               6.49               6.33
#> 3 38.700000000000003 38.200000000000003               37.9 36.979999999999997
#> 4              20.82              20.55              20.39              19.89
#> 5 38.700000000000003 38.200000000000003               37.9 36.979999999999997
#> 6              27.24              26.89              26.68              26.03
options(op)
# }
```
