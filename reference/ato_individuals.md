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

  Year in `"YYYY-YY"` form (e.g. `"2023-24"`) or `"latest"`. `"latest"`
  is resolved against the live CKAN catalogue at call time, so it tracks
  new ATO releases without a package update. As at August 2026 it
  resolves to 2023-24.

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
#> # Source:   https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/f4a2a02f-92ca-49b4-bf4f-990e2226b687/download/ts23individual01byyear.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-09-19 10:26 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  043e3fb9d7abd41e...
#> # Rows: 6  Cols: 47
#> 
#>           selected_items1     1978_79 1979_80 1980_81 1981_82 1982_83 1983_84
#> 1             Individuals no. 6487440 6972725 7330715 7283495 8263255 7604885
#> 2     Taxable individuals no. 5208120 5662415 5998375 5954875 6863065 6338015
#> 3 Non-taxable individuals no. 1279320 1310310 1332340 1328625 1400190 1266865
#> 4                   Males no.      na      na      na      na      na      na
#> 5                 Females no.      na      na      na      na      na      na
#> 6             Unknown sex no.      na      na      na      na      na      na
#>   1984_85 1985_86 1986_87 1987_88 1988_89 1989_90 1990_91 1991_92 1992_93
#> 1 7813965 8200615 8343795 8874210 9257035 9421815 9330715 9288825 9272970
#> 2 6546545 6966075 7181865 7629455 7906140 8074690 7800250 7660355 7661770
#> 3 1267420 1234540 1161930 1244760 1350890 1347130 1530470 1628470 1611200
#> 4      na 4626495 4647105 4914610 5082160 5158160 5099715 5076135 5070630
#> 5      na 3574115 3696690 3959605 4174875 4263660 4231005 4212690 4202340
#> 6      na      na      na      na      na      na      na      na      na
#>   1993_94 1994_95  1995_96  1996_97  1997_98  1998_99 1999_2000  2000_01
#> 1 9391090 9619010 10188615 10271135 10317585 10364730  10751410 10933145
#> 2 7609300 7861135  8406025  8557900  8643240  8485225   9074345  8948110
#> 3 1781790 1757875  1782590  1713235  1674345  1879510   1677060  1985030
#> 4 5125870 5219020  5514450  5530600  5557600  5570765   5772065  5834230
#> 5 4265220 4399990  4674165  4740530  4759985  4793965   4979345  5098915
#> 6      na      na       na       na       na       na        na       na
#>    2001_02  2002_03  2003_04  2004_05  2005_06  2006_07  2007_08  2008_09
#> 1 11093975 11350160 11662875 11946065 12208760 12562515 12994080 12908185
#> 2  9064090  9241690  9442995  9723380  9920200  9850200 10083420  9582260
#> 3  2029885  2108475  2219875  2222685  2288560  2712315  2910660  3325920
#> 4  5878660  5963295  6089255  6223025  6344865  6523110  6760940  6680150
#> 5  5215315  5386865  5573620  5723040  5863895  6039405  6233135  6228030
#> 6       na       na       na       na       na       na       na       na
#>    2009_10  2010_11  2011_12  2012_13  2013_14  2014_15  2015_16  2016_17
#> 1 13049455 13275055 13366780 13405941 13651048 13967366 14337401 14741536
#> 2  9537600  9815520 10203645  9867053 10094991 10357365 10584639 10874723
#> 3  3511860  3459530  3163135  3538884  3556057  3610001  3752762  3866813
#> 4  6755450  6873630  6981476  7013950  7122657  7264970  7426987  7600300
#> 5  6294005  6401425  6385304  6391991  6528391  6702396  6910414  7141236
#> 6       na       na       na       na       na       na       na       na
#>    2017_18  2018_19  2019_20  2020_21  2021_22  2022_23
#> 1 15127836 15571381 15842477 16043882 16160962 16108843
#> 2 11270674 11478095 11805093 12160576 12114579 12647729
#> 3  3857162  4093286  4037384  3883306  4046383  3461114
#> 4  7783610  7981631  8087960  8147162  8181677  8124272
#> 5  7344226  7586313  7749482  7890161  7971593  7976058
#> 6       na     3437     5035     6559     7692     8513
options(op)
# }
```
