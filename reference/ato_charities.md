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
#> ℹ Downloading <https://data.gov.au/data/dataset/4be150cc-8f84-46b8-8c61-55ff1d4…
#> ✔ Downloading <https://data.gov.au/data/dataset/4be150cc-8f84-46b8-8c61-55ff1d4…
#> 
#> # ato_tbl: ATO charity / DGR statistics 2021-22
#> # Source:   https://data.gov.au/data/dataset/4be150cc-8f84-46b8-8c61-55ff1d48a700/resource/35bd310b-2c57-47d2-9bad-501095a66345/download/ts22charities01refundablefrankingcredits.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-09-08 07:13 UTC 
#> # SHA-256:  83afd3ab09d70031...
#> # Rows: 6  Cols: 24
#> 
#>            refund_ranges       2001_02  2002_03  2003_04  2004_05  2005_06
#> 1                   <NA> <NA>       NA       NA       NA       NA       NA
#> 2       a. Under $10,000  no.     1765     2140     1995     1920     1945
#> 3                   <NA>    $  3155218  4607630  4476899  5008137  5437626
#> 4  b. $10,000 - $100,000  no.      450      570      670      845      975
#> 5                   <NA>    $ 15092808 18380176 21767907 28364638 33482376
#> 6 c. $100,000 - $500,000  no.      100      115      140      215      285
#>    2006_07  2007_08  2008_09  2009_10  2010_11  2011_12  2012_13  2013_14
#> 1       NA       NA       NA       NA       NA       NA       NA       NA
#> 2     2055     2230     2300     2470     2970     2420     2610     2715
#> 3  5301008  5957700  6973601  7678647  8126188 -9899729 -3128793  6439063
#> 4     1135     1245     1380     1445     1495     1670     1680     1715
#> 5 37852963 42353744 45274089 47558139 48936969 58523193 55765846 56857348
#> 6      315      355      325      335      295      465      410      405
#>    2014_15  2015_16  2016_17  2017_18  2018_19  2019_20  2020_21  2021_22
#> 1       NA       NA       NA       NA       NA       NA       NA       NA
#> 2     2424     2513     2604     2716     3275     2397     2944     3125
#> 3  4921609  6851425  8824712  9150824  9946889  8909484 10428662 10696563
#> 4     1634     1855     1932     2122     2159     2337     2233     1904
#> 5 53653549 61530052 65072023 70489305 71782829 82548277 73709814 58662402
#> 6      392      494      482      548      541      698      504      328
#>    2022_23
#> 1       NA
#> 2     2154
#> 3  7972534
#> 4     2350
#> 5 87404004
#> 6      704
options(op)
# }
```
