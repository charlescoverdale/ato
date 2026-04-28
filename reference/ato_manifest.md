# Return the session manifest of fetched ATO datasets

Every call to a data function
([`ato_individuals()`](https://charlescoverdale.github.io/ato/reference/ato_individuals.md),
[`ato_companies()`](https://charlescoverdale.github.io/ato/reference/ato_companies.md),
etc.) appends one row to the session manifest, recording URL, dataset
title, CKAN resource and package IDs where resolvable, SHA-256 of the
cached file, size, retrieval timestamp, and the snapshot pin set via
[`ato_snapshot()`](https://charlescoverdale.github.io/ato/reference/ato_snapshot.md).
Duplicate URLs within a session are deduplicated (last fetch wins).

## Usage

``` r
ato_manifest(format = c("df", "yaml", "json"))
```

## Arguments

- format:

  One of `"df"` (default, tidy data frame), `"yaml"`, or `"json"`.

## Value

A data frame, YAML string, or JSON string depending on `format`.

## Details

Attach the output to your paper's appendix, deposit it to Zenodo with
[`ato_deposit_zenodo()`](https://charlescoverdale.github.io/ato/reference/ato_deposit_zenodo.md)
to mint a DOI, or export with
[`ato_manifest_write()`](https://charlescoverdale.github.io/ato/reference/ato_manifest_write.md)
for CI artefacts.

## See also

Other reproducibility:
[`ato_deposit_zenodo()`](https://charlescoverdale.github.io/ato/reference/ato_deposit_zenodo.md),
[`ato_manifest_clear()`](https://charlescoverdale.github.io/ato/reference/ato_manifest_clear.md),
[`ato_manifest_write()`](https://charlescoverdale.github.io/ato/reference/ato_manifest_write.md),
[`ato_sha256()`](https://charlescoverdale.github.io/ato/reference/ato_sha256.md),
[`ato_snapshot()`](https://charlescoverdale.github.io/ato/reference/ato_snapshot.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
ato_manifest_clear()
ato_snapshot("2026-04-24")
try(ato_individuals(year = "2022-23"))
#> # ato_tbl: ATO individuals snapshot 2022-23
#> # Source:   https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a5931887-8d4f-48a8-89ab-571ca0d56bc7/download/ts23snapshot01historicalratesofpersonalincometax.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-04-28 19:14 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  2e0efce4b93d9257...
#> # Rows: 99  Cols: 6
#> 
#>                                                                                    
#> 1                                                                                 0
#> 2                                                                               100
#> 3                                                                               150
#> 4                                                                               200
#> 5                                                                               250
#> 6                                                                               300
#> 7                                                                               400
#> 8                                                                               500
#> 9                                                                               600
#> 10                                                                              700
#> 11                                                                              800
#> 12                                                                              900
#> 13                                                                             1000
#> 14                                                                             1200
#> 15                                                                             1400
#> 16                                                                             1600
#> 17                                                                             1800
#> 18                                                                             2000
#> 19                                                                             2400
#> 20                                                                             2800
#> 21                                                                             3200
#> 22                                                                             3600
#> 23                                                                             4000
#> 24                                                                             4400
#> 25                                                                             5000
#> 26                                                                             6000
#> 27                                                                             8000
#> 28                                                                            10000
#> 29                                                                    Tax threshold
#> 30                                                                             <NA>
#> 31                      Further tax and contribution in respect of property income:
#> 32                                                            Total Taxable income:
#> 33                                                                         Not less
#> 34                                                                             than
#> 35                                                                                £
#> 36                                                                                0
#> 37                                                                              100
#> 38                                                                             1000
#> 39                                                                             4000
#> 40                                                                             6000
#> 41                                                                            10000
#> 42                                                                             <NA>
#> 43                                    Further tax and contribution is not payable -
#> 44                                                                             <NA>
#> 45                                                                             <NA>
#> 46                                                                             <NA>
#> 47                                                                             <NA>
#> 48                                                                             <NA>
#> 49 Where the taxable income from all sources does not exceed £1000, the further tax
#> 50 and contribution is limited to 1s. in the £1 on the excess of the taxable income
#> 51                                                                       over £400.
#> 52                                                                             <NA>
#> 53                                                            Dependant Deductions:
#> 54                                                     Spouse, daughter/housekeeper
#> 55                                                                      Housekeeper
#> 56                                                            Parent, parent-in-law
#> 57                                                                 Invalid relative
#> 58                                                                             <NA>
#> 59                                                                           NOTE :
#> 60                                                                             <NA>
#> 61                                                                             <NA>
#> 62                                                                             <NA>
#> 63                                                                             <NA>
#> 64                                                                             <NA>
#> 65                                                                             <NA>
#> 66                                                                             <NA>
#> 67                                              Zone and Overseas Locality Rebates:
#> 68                                                                             <NA>
#> 69                                                                             <NA>
#> 70                                                                             <NA>
#> 71                                                                             <NA>
#> 72                                                                Overseas forces :
#> 73                                                                             <NA>
#> 74                                                                             <NA>
#> 75                                                          Notional Child Rebates:
#> 76                                          One child under 16, not being a student
#> 77                                   Each other child under 16, not being a student
#> 78                                                                    Student child
#> 79                                                                             <NA>
#> 80                                                                             <NA>
#> 81                                                 General Concessional Deductions:
#> 82                                                                             <NA>
#> 83                                          (1) Medical expenses including optical,
#> 84                                                               therapeutical, etc
#> 85                                                                             <NA>
#> 86                                                              (2) Dental expenses
#> 87                                                                             <NA>
#> 88                                                                             <NA>
#> 89                                                                             <NA>
#> 90                                                             (3) Funeral expenses
#> 91                                                                             <NA>
#> 92                                            (4) Life assurance and superannuation
#> 93                                                                             <NA>
#> 94                                                           (5) Education expenses
#> 95                                                                             <NA>
#> 96                                                         (6) Rates and land taxes
#> 97                                                                             <NA>
#> 98                                       (7) Payments to medical and hospital funds
#> 99                                                                             <NA>
#>                                                                            
#> 1                                                                       100
#> 2                                                                       150
#> 3                                                                       200
#> 4                                                                       250
#> 5                                                                       300
#> 6                                                                       400
#> 7                                                                       500
#> 8                                                                       600
#> 9                                                                       700
#> 10                                                                      800
#> 11                                                                      900
#> 12                                                                     1000
#> 13                                                                     1200
#> 14                                                                     1400
#> 15                                                                     1600
#> 16                                                                     1800
#> 17                                                                     2000
#> 18                                                                     2400
#> 19                                                                     2800
#> 20                                                                     3200
#> 21                                                                     3600
#> 22                                                                     4000
#> 23                                                                     4400
#> 24                                                                     5000
#> 25                                                                     6000
#> 26                                                                     8000
#> 27                                                                    10000
#> 28                                                                     over
#> 29                                                                     <NA>
#> 30                                                                     <NA>
#> 31                                                                     <NA>
#> 32                                                                     <NA>
#> 33                                                                 Not more
#> 34                                                                     than
#> 35                                                                        £
#> 36                                                                      100
#> 37                                                                     1000
#> 38                                                                     4000
#> 39                                                                     6000
#> 40                                                                    10000
#> 41                                                                     over
#> 42                                                                     <NA>
#> 43                                                                     <NA>
#> 44    where the taxable income from property is £100 or less - irrespective
#> 45                           of the amount of the total taxable income; and
#> 46   where the total taxable income is £400 or less even though the taxable
#> 47                                       income from property exceeds £100.
#> 48                                                                     <NA>
#> 49                                                                     <NA>
#> 50                                                                     <NA>
#> 51                                                                     <NA>
#> 52                                                                     <NA>
#> 53                                                                     <NA>
#> 54                                                                     <NA>
#> 55                                                                     <NA>
#> 56                                                                     <NA>
#> 57                                                                     <NA>
#> 58                                                                     <NA>
#> 59   If a dependant derives separate net income, the deduction is reduced -
#> 60 a. For spouse or daughter/housekeeper - by £2 for every £1 that separate
#> 61                                                  net income exceeds £52.
#> 62      b. For parent/parent-in-law - by the amount of separate net income.
#> 63         c. For invalid relative - by the amount of pension or government
#> 64           assistance plus £2 for every £1 that other income exceeds £52.
#> 65                                                                     <NA>
#> 66                                                                     <NA>
#> 67                                                                     <NA>
#> 68                                                                 Zone A :
#> 69                                                                     <NA>
#> 70                                                                 Zone B :
#> 71                                                                     <NA>
#> 72                                                                     <NA>
#> 73                                                                     <NA>
#> 74                                                                     <NA>
#> 75                                                                     <NA>
#> 76                                                                     <NA>
#> 77                                                                     <NA>
#> 78                                                                     <NA>
#> 79                                                                     <NA>
#> 80                                                                     <NA>
#> 81                                                                     <NA>
#> 82                                                                     <NA>
#> 83                                                                     <NA>
#> 84                                                                     <NA>
#> 85                                                                     <NA>
#> 86                                                                     <NA>
#> 87                                                                     <NA>
#> 88                                                                     <NA>
#> 89                                                                     <NA>
#> 90                                                                     <NA>
#> 91                                                                     <NA>
#> 92                                                                     <NA>
#> 93                                                                     <NA>
#> 94                                                                     <NA>
#> 95                                                                     <NA>
#> 96                                                                     <NA>
#> 97                                                                     <NA>
#> 98                                                                     <NA>
#> 99                                                                     <NA>
#>                                                     s_d     
#> 1  <NA>                 Nil         +    1 d for each £ <NA>
#> 2  <NA>     0    8  4 +     6 d for each £ over     100 <NA>
#> 3  <NA>       1  13  4 +   11 d for each £ over     150 <NA>
#> 4  <NA>       3  19  2 +   16 d for each £ over     200 <NA>
#> 5  <NA>       7   5 10 +   21 d for each £ over     250 <NA>
#> 6  <NA>      11  13  4 +   26 d for each £ over     300 <NA>
#> 7  <NA>      22  10  0 +   32 d for each £ over     400 <NA>
#> 8  <NA>      35  16  8 +   38 d for each £ over     500 <NA>
#> 9  <NA>      51  13  4 +   44 d for each £ over     600 <NA>
#> 10 <NA>     70    0  0 +   48 d for each £ over     700 <NA>
#> 11 <NA>     90    0  0 +   52 d for each £ over     800 <NA>
#> 12 <NA>     111  13  4 +   56 d for each £ over     900 <NA>
#> 13 <NA>     135    0  0 +   64 d for each £ over   1000 <NA>
#> 14 <NA>     188    6  8 +   72 d for each £ over   1200 <NA>
#> 15 <NA>     248    6  8 +   80 d for each £ over   1400 <NA>
#> 16 <NA>     315    0  0 +   88 d for each £ over   1600 <NA>
#> 17 <NA>     388    6  8 +   96 d for each £ over   1800 <NA>
#> 18 <NA>      468    6  8 + 104 d for each £ over   2000 <NA>
#> 19 <NA>       641  13  4 + 112 d for each £ over   2400 <NA>
#> 20 <NA>      828    6  8 + 120 d for each £ over   2800 <NA>
#> 21 <NA>     1028    6  8 + 128 d for each £ over   3200 <NA>
#> 22 <NA>      1241  13  4 + 136 d for each £ over   3600 <NA>
#> 23 <NA>     1468    6  8 + 144 d for each £ over   4000 <NA>
#> 24 <NA>     1708    6  8 + 152 d for each £ over   4400 <NA>
#> 25 <NA>     2088    6  8 + 160 d for each £ over   5000 <NA>
#> 26 <NA>     2755    0  0 + 168 d for each £ over   6000 <NA>
#> 27 <NA>     4155    0  0 + 176 d for each £ over   8000 <NA>
#> 28 <NA>       5621  13  4 + 180 d for each £ over 10000 <NA>
#> 29 £105                                            <NA> <NA>
#> 30 <NA>                                            <NA> <NA>
#> 31 <NA>                                            <NA> <NA>
#> 32 <NA> Further tax and contribution on property income <NA>
#> 33 <NA>                                            <NA> <NA>
#> 34 <NA>                                            <NA> <NA>
#> 35 <NA>                                          £ s.d. <NA>
#> 36 <NA>                                             Nil <NA>
#> 37 <NA>                Nil          +    8 d for each £ <NA>
#> 38 <NA>       30    0  0 +  16 d for each £ over   1000 <NA>
#> 39 <NA>     230    0  0 +    8 d for each £ over   4000 <NA>
#> 40 <NA>      296  13  4 +    4 d for each £ over   6000 <NA>
#> 41 <NA>          363    6  8 +    (no rate over £10000) <NA>
#> 42 <NA>                                            <NA> <NA>
#> 43 <NA>                                            <NA> <NA>
#> 44 <NA>                                            <NA> <NA>
#> 45 <NA>                                            <NA> <NA>
#> 46 <NA>                                            <NA> <NA>
#> 47 <NA>                                            <NA> <NA>
#> 48 <NA>                                            <NA> <NA>
#> 49 <NA>                                            <NA> <NA>
#> 50 <NA>                                            <NA> <NA>
#> 51 <NA>                                            <NA> <NA>
#> 52 <NA>                                            <NA> <NA>
#> 53 <NA>                                            <NA> <NA>
#> 54 <NA>                                            <NA> £104
#> 55 <NA>                                            <NA> £104
#> 56 <NA>                                            <NA> £104
#> 57 <NA>                                            <NA>  £78
#> 58 <NA>                                            <NA> <NA>
#> 59 <NA>                                            <NA> <NA>
#> 60 <NA>                                            <NA> <NA>
#> 61 <NA>                                            <NA> <NA>
#> 62 <NA>                                            <NA> <NA>
#> 63 <NA>                                            <NA> <NA>
#> 64 <NA>                                            <NA> <NA>
#> 65 <NA>                                            <NA> <NA>
#> 66 <NA>                                            <NA> <NA>
#> 67 <NA>                                            <NA> <NA>
#> 68 £120                                            <NA> <NA>
#> 69 <NA>                                            <NA> <NA>
#> 70  £20                                            <NA> <NA>
#> 71 <NA>                                            <NA> <NA>
#> 72 £120                                            <NA> <NA>
#> 73 <NA>                                            <NA> <NA>
#> 74 <NA>                                            <NA> <NA>
#> 75 <NA>                                            <NA> <NA>
#> 76 <NA>                                            <NA>  £78
#> 77 <NA>                                            <NA>  £52
#> 78 <NA>                                            <NA>  £78
#> 79 <NA>                                            <NA> <NA>
#> 80 <NA>                                            <NA> <NA>
#> 81 <NA>                                            <NA> <NA>
#> 82 <NA>                                            <NA> <NA>
#> 83 <NA>                                            <NA> <NA>
#> 84 <NA>                                            <NA> <NA>
#> 85 <NA>                                            <NA> <NA>
#> 86 <NA>                                            <NA> <NA>
#> 87 <NA>                                            <NA> <NA>
#> 88 <NA>                                            <NA> <NA>
#> 89 <NA>                                            <NA> <NA>
#> 90 <NA>                                            <NA> <NA>
#> 91 <NA>                                            <NA> <NA>
#> 92 <NA>                                            <NA> <NA>
#> 93 <NA>                                            <NA> <NA>
#> 94 <NA>                                            <NA> <NA>
#> 95 <NA>                                            <NA> <NA>
#> 96 <NA>                                            <NA> <NA>
#> 97 <NA>                                            <NA> <NA>
#> 98 <NA>                                            <NA> <NA>
#> 99 <NA>                                            <NA> <NA>
#>                                        
#> 1                                  <NA>
#> 2                                  <NA>
#> 3                                  <NA>
#> 4                                  <NA>
#> 5                                  <NA>
#> 6                                  <NA>
#> 7                                  <NA>
#> 8                                  <NA>
#> 9                                  <NA>
#> 10                                 <NA>
#> 11                                 <NA>
#> 12                                 <NA>
#> 13                                 <NA>
#> 14                                 <NA>
#> 15                                 <NA>
#> 16                                 <NA>
#> 17                                 <NA>
#> 18                                 <NA>
#> 19                                 <NA>
#> 20                                 <NA>
#> 21                                 <NA>
#> 22                                 <NA>
#> 23                                 <NA>
#> 24                                 <NA>
#> 25                                 <NA>
#> 26                                 <NA>
#> 27                                 <NA>
#> 28                                 <NA>
#> 29                                 <NA>
#> 30                                 <NA>
#> 31                                 <NA>
#> 32                                 <NA>
#> 33                                 <NA>
#> 34                                 <NA>
#> 35                                 <NA>
#> 36                                 <NA>
#> 37                                 <NA>
#> 38                                 <NA>
#> 39                                 <NA>
#> 40                                 <NA>
#> 41                                 <NA>
#> 42                                 <NA>
#> 43                                 <NA>
#> 44                                 <NA>
#> 45                                 <NA>
#> 46                                 <NA>
#> 47                                 <NA>
#> 48                                 <NA>
#> 49                                 <NA>
#> 50                                 <NA>
#> 51                                 <NA>
#> 52                                 <NA>
#> 53                                 <NA>
#> 54                                 <NA>
#> 55                                 <NA>
#> 56                                 <NA>
#> 57                                 <NA>
#> 58                                 <NA>
#> 59                                 <NA>
#> 60                                 <NA>
#> 61                                 <NA>
#> 62                                 <NA>
#> 63                                 <NA>
#> 64                                 <NA>
#> 65                                 <NA>
#> 66                                 <NA>
#> 67                                 <NA>
#> 68                                 <NA>
#> 69                                 <NA>
#> 70                                 <NA>
#> 71                                 <NA>
#> 72                                 <NA>
#> 73                                 <NA>
#> 74                                 <NA>
#> 75                                 <NA>
#> 76                                 <NA>
#> 77                                 <NA>
#> 78                                 <NA>
#> 79                                 <NA>
#> 80                                 <NA>
#> 81                                 <NA>
#> 82                               Limits
#> 83                                 <NA>
#> 84    £100 each taxpayer and dependants
#> 85                                 <NA>
#> 86 £20 for each taxpayer and dependant,
#> 87 but included in the £100 for medical
#> 88                             expenses
#> 89                                 <NA>
#> 90                 £30 each bereavement
#> 91                                 <NA>
#> 92                                 £200
#> 93                                 <NA>
#> 94                                  Nil
#> 95                                 <NA>
#> 96                             No limit
#> 97                                 <NA>
#> 98       Included in the £200 limit set
#> 99                   for Life Assurance
ato_manifest()
#>                                                                                                                                                                                  url
#> 1 https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/a5931887-8d4f-48a8-89ab-571ca0d56bc7/download/ts23snapshot01historicalratesofpersonalincometax.xlsx
#>   title resource_id package_id licence
#> 1  <NA>        <NA>       <NA>    <NA>
#>                                                             sha256 size_bytes
#> 1 2e0efce4b93d9257930ac7c1a0d6cda5aacb9849fdd1139ad4910559ce4510ec     535864
#>                  retrieved snapshot_date r_version ato_version
#> 1 2026-04-28T19:14:01+0000    2026-04-24     4.6.0       0.1.0
options(op)
# }
```
