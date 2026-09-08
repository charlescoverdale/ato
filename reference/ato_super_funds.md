# Superannuation fund aggregates

Returns Taxation Statistics Super Funds tables or Self-Managed
Superannuation Fund ('SMSF') aggregates, depending on `type`.

## Usage

``` r
ato_super_funds(year = "latest", type = c("apra", "smsf", "all"))
```

## Source

Australian Taxation Office Taxation Statistics Super Funds tables + SMSF
statistical overview. Licensed CC BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

- type:

  One of `"apra"` (APRA-regulated funds, default), `"smsf"` (SMSF
  statistical overview), or `"all"`.

## Value

An `ato_tbl`.

## References

Australian Taxation Office (annual). *Taxation Statistics: Super funds
and SMSF explanatory notes*. Distinguishes reporting populations:
APRA-regulated large funds, SMSFs, and Pooled Superannuation Trusts.

Australian Prudential Regulation Authority (annual). *Annual
Superannuation Bulletin*. Complementary APRA-regulated fund statistics.

Commonwealth of Australia. *Superannuation Industry (Supervision) Act
1993* (SIS Act); *Superannuation Guarantee (Administration) Act 1992*
(SGAA).

Productivity Commission (2018). *Superannuation: Assessing Efficiency
and Competitiveness*. Inquiry report.

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  s <- ato_super_funds(year = "2022-23", type = "apra")
  head(s)
})
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■                 
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> ℹ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> ℹ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> ✔ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> 
#> # ato_tbl: ATO super funds 2022-23 (apra)
#> # Source:   https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a286ac7c-9adb-444b-9bb1-ef2814552f21/download/ts23fund01aprasbyyear.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-09-08 07:14 UTC 
#> # SHA-256:  747be0b20c119aba...
#> # Rows: 6  Cols: 36
#> 
#>                                       1989_90 1990_91 1991_92 1992_93 1993_94
#> 1 APRA regulated and other funds  no.   90975   76895   81200   89415   98660
#> 2                           <NA> <NA>    <NA>    <NA>    <NA>    <NA>    <NA>
#> 3                  Paper returns  no.      na      na      na      na      na
#> 4             Electronic returns  no.      na      na      na      na      na
#> 5                          Total  no.      na      na      na      na      na
#> 6                           <NA> <NA>    <NA>    <NA>    <NA>    <NA>    <NA>
#>   1994_95 1995_96 1996_97 1997_98 1998_99 1999_2000 2000_01 2001_02 2002_03
#> 1  106925  128105  150210  172655  190405     41985   14825   13070   12290
#> 2    <NA>    <NA>    <NA>    <NA>    <NA>      <NA>    <NA>    <NA>    <NA>
#> 3      na      na      na      na      na        na      na      na      na
#> 4      na      na      na      na      na        na      na      na      na
#> 5      na      na      na      na      na        na      na      na      na
#> 6    <NA>    <NA>    <NA>    <NA>    <NA>      <NA>    <NA>    <NA>    <NA>
#>   2003_04 2004_05 2005_06 2006_07 2007_08 2008_09 2009_10 2010_11 2011_12
#> 1   10510    9330    8240    7180    5765    5015    4545    4145    3724
#> 2    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>
#> 3      na      na      na      na      na      na      na     380     239
#> 4      na      na      na      na      na      na      na    3765    3485
#> 5      na      na      na      na      na      na      na    4145    3724
#> 6    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>
#>   2012_13 2013_14 2014_15 2015_16 2016_17 2017_18 2018_19 2019_20 2020_21
#> 1    3414    3140    2836    2624    2411    2241    2056    1848    1708
#> 2    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>
#> 3     166     122     110     102      96      93      71      59      43
#> 4    3248    3018    2726    2522    2315    2148    1985    1789    1665
#> 5    3414    3140    2836    2624    2411    2241    2056    1848    1708
#> 6    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>    <NA>
#>   2021_22 2022_23
#> 1    1559    1354
#> 2    <NA>    <NA>
#> 3      40      30
#> 4    1519    1324
#> 5    1559    1354
#> 6    <NA>    <NA>
options(op)
# }
```
