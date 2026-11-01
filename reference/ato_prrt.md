# Petroleum Resource Rent Tax (PRRT) annual data

Returns PRRT revenue and assessments. PRRT is a 40% tax on the profits
of offshore petroleum projects; revenues are volatile and
project-specific. Key dataset for resource-tax reform analysis.

## Usage

``` r
ato_prrt(year = "latest")
```

## Source

Australian Taxation Office Taxation Statistics Company. Licensed CC BY
2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

## Value

An `ato_tbl`.

## References

Commonwealth of Australia. *Petroleum Resource Rent Tax Assessment Act
1987*. Enabling legislation for the 40 per cent rent tax on offshore
petroleum projects.

Callaghan, M. (2017). *Review of the Petroleum Resource Rent Tax*.
Treasury-commissioned review; reference for PRRT-reform analysis.

## See also

Other specialist:
[`ato_compliance()`](https://charlescoverdale.github.io/ato/reference/ato_compliance.md),
[`ato_division293()`](https://charlescoverdale.github.io/ato/reference/ato_division293.md),
[`ato_fuel_tax_credits()`](https://charlescoverdale.github.io/ato/reference/ato_fuel_tax_credits.md),
[`ato_international()`](https://charlescoverdale.github.io/ato/reference/ato_international.md),
[`ato_medicare_levy()`](https://charlescoverdale.github.io/ato/reference/ato_medicare_levy.md),
[`ato_rba()`](https://charlescoverdale.github.io/ato/reference/ato_rba.md),
[`ato_state_tax()`](https://charlescoverdale.github.io/ato/reference/ato_state_tax.md),
[`ato_tax_expenditures()`](https://charlescoverdale.github.io/ato/reference/ato_tax_expenditures.md),
[`ato_whm()`](https://charlescoverdale.github.io/ato/reference/ato_whm.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try(ato_prrt(year = "2022-23"))
#> ℹ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■                 
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> ℹ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…

#> ✔ Downloading <https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a…
#> 
#> # ato_tbl: ATO PRRT 2022-23
#> # Source:   https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/0986a5c1-dd83-46a6-b665-31b82f854a89/download/ts23gst05prrtbyyear.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-11-01 14:04 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  94889ad05c9238cb...
#> # Rows: 24  Cols: 36
#> 
#>                                     x1   x2    1990_91    1991_92    1992_93
#> 1                         PRRT returns  no.          7          7          7
#> 2                 PRRT projects, total  no.         NA         NA         NA
#> 3       Projects with a PRRT liability  no.         NA         NA         NA
#> 4                                 <NA> <NA>         NA         NA         NA
#> 5                  Assessable receipts <NA> 4631141900 3979287094 4106839827
#> 6                                 <NA> <NA>         NA         NA         NA
#> 7          Expenditure-Class 2 General    $  588999028  722061087  680309373
#> 8      Expenditure-Class 2 Exploration    $   30006374   50493535   62654227
#> 9             Expenditure-Resource Tax    $         NA         NA         NA
#> 10    Expenditure-Acquired Exploration    $         NA         NA         NA
#> 11           Expenditure-Starting Base    $         NA         NA         NA
#> 12                   Expenditure-Other    $  131978210   96622572  108947940
#> 13                   Expenditure-Total    $  750983612  869177194  851911540
#> 14                                <NA> <NA>         NA         NA         NA
#> 15 Transferred expenditure-Section 45A    $   99435334   50450918   33436954
#> 16 Transferred expenditure-Section 45B    $   26682398   44051636   94578129
#> 17       Transferred expenditure-Total    $  126117732   94502554  128015083
#> 18                                <NA> <NA>         NA         NA         NA
#> 19                      Taxable profit    $ 3948421121 3219945979 3363249304
#> 20           Carry forward expenditure    $  194380565  204338633  236336100
#> 21                   Offshore projects    $         NA         NA         NA
#> 22                    Onshore projects    $         NA         NA         NA
#> 23                                <NA> <NA>         NA         NA         NA
#> 24  PRRT tax payable on taxable profit    $ 1579368448 1287978392 1345299722
#>       1993_94    1994_95    1995_96    1996_97    1997_98      1998_99
#> 1          10         10         12         15         18         19.0
#> 2          NA         NA         NA         NA         NA           NA
#> 3          NA         NA         NA         NA         NA           NA
#> 4          NA         NA         NA         NA         NA           NA
#> 5  3451078588 3621288258 3330899771 4185535717 3559311474 2542185378.0
#> 6          NA         NA         NA         NA         NA           NA
#> 7  1074719419 1553470381 1367744325 1860720848 2032267274 2181799146.0
#> 8   147509370  187702519  357986593  320988126  390007300  465005053.0
#> 9          NA         NA         NA         NA         NA           NA
#> 10         NA         NA         NA         NA         NA           NA
#> 11         NA         NA         NA         NA         NA           NA
#> 12  345335271  106245128  119441242   85432128  118860769  130460492.0
#> 13 1567564060 1847418028 1845172160 2267141102 2541135343 2777264691.0
#> 14         NA         NA         NA         NA         NA           NA
#> 15   50718612   47328736   85806464  256505280   78797968  168489376.5
#> 16   37491480   38695462    9313863    9995757          0     678296.5
#> 17   88210091   86024199   95120327  266501037   78797968  169167673.0
#> 18         NA         NA         NA         NA         NA           NA
#> 19 2422387830 2050745335 2029575970 2846592442 2188073248  909572574.0
#> 20  627083393  362899304  638968686 1194698864 1248695085 1313819560.0
#> 21         NA         NA         NA         NA         NA           NA
#> 22         NA         NA         NA         NA         NA           NA
#> 23         NA         NA         NA         NA         NA           NA
#> 24  968955132  820298134  811830388 1138636977  875229299  363829029.6
#>       1999_00    2000_01    2001_02    2002_03    2003_04    2004_05    2005_06
#> 1          30         28         26         33         33         34         46
#> 2          NA         NA         NA         NA         NA         NA         NA
#> 3          NA         NA         NA         NA         NA         NA         NA
#> 4          NA         NA         NA         NA         NA         NA         NA
#> 5  6440803867 9344215439 6397999903 6282646009 5277465986 5877146583 8155026021
#> 6          NA         NA         NA         NA         NA         NA         NA
#> 7  3804740772 2272883454 1523926674 1418981897 1418018448 2221368483 3410939175
#> 8   889374400 1103568564  439570038  329380239  283961592  220987565  711308767
#> 9          NA         NA         NA         NA         NA         NA         NA
#> 10         NA         NA         NA         NA         NA         NA         NA
#> 11         NA         NA         NA         NA         NA         NA         NA
#> 12  510369268  517059268  453693810  551937269  668899404  869094455 1045557802
#> 13 5204484440 3893511286 2417190522 2300299405 2370879444 3311450502 5167805745
#> 14         NA         NA         NA         NA         NA         NA         NA
#> 15   65541677 1367300729  778477512  774729238  561119400  289879480  484794342
#> 16  109847043  203885270  113515023   84086331  126630215  195480576   88627105
#> 17  175388720 1571185999  891992536  858815569  687749613  485360057  573421447
#> 18         NA         NA         NA         NA         NA         NA         NA
#> 19 3474679759 5101993781 3843537660 4083345039 3189009069 3764585523 4991389430
#> 20 2413749052 1222475625  754720814  959814005  970172141 1684249499 2577590661
#> 21         NA         NA         NA         NA         NA         NA         NA
#> 22         NA         NA         NA         NA         NA         NA         NA
#> 23         NA         NA         NA         NA         NA         NA         NA
#> 24 1389871904 2040797512 1537415063 1633338015 1275603628 1505834210 1996555772
#>       2006_07     2007_08     2008_09     2009_10     2010_11     2011_12
#> 1          42          57          64          71          71          75
#> 2          NA          NA          NA          NA          NA          NA
#> 3          NA          NA          NA          NA          NA          NA
#> 4          NA          NA          NA          NA          NA          NA
#> 5  9005172560 11480901781 10456130052  9802979792 12049216170 12709133186
#> 6          NA          NA          NA          NA          NA          NA
#> 7  4862180404  7842862315  8267609525 14165121527 15062910317 21515170782
#> 8   318409752   959411456  1212115764  1624832015  1648810460  2170149241
#> 9          NA          NA          NA          NA          NA          NA
#> 10         NA          NA          NA          NA          NA          NA
#> 11         NA          NA          NA          NA          NA          NA
#> 12  379510502   230640480   183366858   362079890   505642174   925111630
#> 13 5560100658  9032914251  9663092147 16152033432 17217362951 24610431653
#> 14         NA          NA          NA          NA          NA          NA
#> 15  355621922   546059988   575659437   636720577   845027833   854681549
#> 16  637342300   585993608   815786283   457880483   730903263  1659356890
#> 17  992964222  1132053596  1391445720  1094601060  1575931096  2514038439
#> 18         NA          NA          NA          NA          NA          NA
#> 19 4418859532  4857884913  4102574371  3150914061  2618018812  3961144721
#> 20 1966751851  3541950979  4700982185 10594568761  9362096688 18376481627
#> 21         NA          NA          NA          NA          NA          NA
#> 22         NA          NA          NA          NA          NA          NA
#> 23         NA          NA          NA          NA          NA          NA
#> 24 1767543813  1943153965  1641029748  1260365624  1047207525  1584457888
#>         2012_13      2013_14      2014_15      2015_16      2016_17
#> 1           155          147          149          147          143
#> 2            59           60           62           63           60
#> 3             9            9            8            7            7
#> 4            NA           NA           NA           NA           NA
#> 5   26445663061  29845929244  25588736769  20471050343  22906648102
#> 6            NA           NA           NA           NA           NA
#> 7   63047077237  79391143607  94588647423 126068563852 162821222075
#> 8    5534746263   8064801037  10551956240  17504599384  23022012956
#> 9    6241977407   6891010235   5945561198   5065557218   5643496200
#> 10   8388729004  10054133839  13522342144  15106783063  15955647171
#> 11  65855494821  78591054153  83888085328  91217127270  94534710231
#> 12    392945800    359320903    446232265   1044845530   1127492318
#> 13 149460970532 183351463774 208942824598 256007476317 303104580951
#> 14           NA           NA           NA           NA           NA
#> 15    559687493    433899608    473713082    298260527    110875320
#> 16    873414278    799614546    308451291    281734907    422373127
#> 17   1433101771   1233514154    782164373    579995434    533248447
#> 18           NA           NA           NA           NA           NA
#> 19   3229176717   4566462789   3119293888   2496075922   2564297493
#> 20 127677585959 159305511475 187255546088 238612497326 283305342910
#> 21  62867029734  73733563793  81589003958 118355885144 155008815289
#> 22  64810556225  85571947682 105666542130 120256612182 128296527621
#> 23           NA           NA           NA           NA           NA
#> 24   1291670680   1826585111   1247717549    998430365   1025719101
#>         2017_18      2018_19      2019_20      2020_21      2021_22
#> 1           148          101           90           90           85
#> 2            65           39           33           33           33
#> 3             6            8            8            6            9
#> 4            NA           NA           NA           NA           NA
#> 5   30309408985  35835319426  32650362123  24042981012  48993360979
#> 6            NA           NA           NA           NA           NA
#> 7  207461670936 200344848219 185564955090 179359181943 185945979512
#> 8   32015872762  38012501737  43037286113  45549989802  49870456949
#> 9    6678593079   5479101990   2882897996   2190677894   4964526821
#> 10  17689389838    112031420           NA           NA           NA
#> 11  98549131879  75693192537  77163594120  74825344454  78192721476
#> 12   1350491493   1325965021   1367455193   1371340452   1564822906
#> 13 363745149987 320967640924 310016188512 303296534545 320538507664
#> 14           NA           NA           NA           NA           NA
#> 15    112746806    192046372    111452769     25917255    403284869
#> 16    226030299    606696132    253691565     88325594     86634997
#> 17    338777105    798742504    365144334    114242849    489919866
#> 18           NA           NA           NA           NA           NA
#> 19   3016753795   2597312030   2425471813   2317691949   4992001165
#> 20 336791271902 288528376027 280156442537 281685488333 277027067895
#> 21 198055530585 262650560578           NA           NA           NA
#> 22 138735741317  25877815449           NA           NA           NA
#> 23           NA           NA           NA           NA           NA
#> 24   1206701517   1038924810    970188723    927076777   1996800458
#>         2022_23      2023_24
#> 1            86           81
#> 2            33           32
#> 3             8           10
#> 4            NA           NA
#> 5   55110954170  46179505670
#> 6            NA           NA
#> 7  179338176418 166797868591
#> 8   56239518412  63925912644
#> 9    7959924380   3494950154
#> 10           NA           NA
#> 11  83758877075  88994299347
#> 12   1716594877   2273915039
#> 13 329013091162 325486945775
#> 14           NA           NA
#> 15     24932665      8445154
#> 16    206334593    168169043
#> 17    231267258    176614197
#> 18           NA           NA
#> 19   4667643709   3144616515
#> 20 278801047959 282628670817
#> 21           NA           NA
#> 22           NA           NA
#> 23           NA           NA
#> 24   1867057478   1483251276
options(op)
# }
```
