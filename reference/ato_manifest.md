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
#> # Source:   https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/f4a2a02f-92ca-49b4-bf4f-990e2226b687/download/ts23individual01byyear.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-08-23 17:36 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  043e3fb9d7abd41e...
#> # Rows: 844  Cols: 47
#> 
#>                                                                                                                                                  selected_items1
#> 1                                                                                                                                                    Individuals
#> 2                                                                                                                                            Taxable individuals
#> 3                                                                                                                                        Non-taxable individuals
#> 4                                                                                                                                                          Males
#> 5                                                                                                                                                        Females
#> 6                                                                                                                                                    Unknown sex
#> 7                                                                                                                                                      Residents
#> 8                                                                                                                                                  Non-residents
#> 9                                                                                                                                                           <NA>
#> 10                                                                                                                      Number of individuals by state/territory
#> 11                                                                                                                                                           NSW
#> 12                                                                                                                                                           VIC
#> 13                                                                                                                                                           QLD
#> 14                                                                                                                                                            WA
#> 15                                                                                                                                                            SA
#> 16                                                                                                                                                           TAS
#> 17                                                                                                                                                           ACT
#> 18                                                                                                                                                            NT
#> 19                                                                                                                                           Overseas or unknown
#> 20                                                                                                                                                      Overseas
#> 21                                                                                                                                                       Unknown
#> 22                                                                                                                                                          <NA>
#> 23                                                                                                                      Number of individuals by lodgment method
#> 24                                                                                                                                             Tax agent returns
#> 25                                                                                                                                                 MyTax returns
#> 26                                                                                                                                   Other self-preparer returns
#> 27                                                                                                                                                 e-tax returns
#> 28                                                                                                                                                          <NA>
#> 29                                                                                                                                  Number of individuals by age
#> 30                                                                                                                                                      Under 18
#> 31                                                                                                                                                       18 - 24
#> 32                                                                                                                                                       25 - 29
#> 33                                                                                                                                                       30 - 34
#> 34                                                                                                                                                       35 - 39
#> 35                                                                                                                                                       40 - 44
#> 36                                                                                                                                                       45 - 49
#> 37                                                                                                                                                       50 - 54
#> 38                                                                                                                                                       55 - 59
#> 39                                                                                                                                                       60 - 64
#> 40                                                                                                                                                       65 - 69
#> 41                                                                                                                                                       70 - 74
#> 42                                                                                                                                                   75 and over
#> 43                                                                                                                                                          <NA>
#> 44                                                                                                                                        ATO calculated amounts
#> 45                                                                                                                                         Tax on taxable income
#> 46                                                                                                                                         Tax on taxable income
#> 47                                                                                                                                             Complementary tax
#> 48                                                                                                                                             Complementary tax
#> 49                                                                                                                                                 Medicare levy
#> 50                                                                                                                                                 Medicare levy
#> 51                                                                                                                                       Medicare levy surcharge
#> 52                                                                                                                                       Medicare levy surcharge
#> 53                                                                                                                                 Total Medicare levy liability
#> 54                                                                                                                                 Total Medicare levy liability
#> 55                                                                                                                                                       Net tax
#> 56                                                                                                                                                       Net tax
#> 57                                                                                                                                    Estimated business net tax
#> 58                                                                                                                                    Estimated business net tax
#> 59                                                                                                                                Estimated non-business net tax
#> 60                                                                                                                                Estimated non-business net tax
#> 61                                                                                                                            Estimated tax on net capital gains
#> 62                                                                                                                            Estimated tax on net capital gains
#> 63                                                                                                                                 HELP compulsory repayment due
#> 64                                                                                                                                 HELP compulsory repayment due
#> 65                                                                                                                      HELP Australian compulsory repayment due
#> 66                                                                                                                      HELP Australian compulsory repayment due
#> 67                                                                                                                   HELP overseas levy compulsory repayment due
#> 68                                                                                                                   HELP overseas levy compulsory repayment due
#> 69                                                                                                  Student financial supplement scheme compulsory repayment due
#> 70                                                                                                  Student financial supplement scheme compulsory repayment due
#> 71                                                                                                                   Trade support loan compulsory repayment due
#> 72                                                                                                                   Trade support loan compulsory repayment due
#> 73                                                                                                     Trade support loan overseas levy compulsory repayment due
#> 74                                                                                                     Trade support loan overseas levy compulsory repayment due
#> 75                                                                                 Vocational education and training student loan (VSL) compulsory repayment due
#> 76                                                                                 Vocational education and training student loan (VSL) compulsory repayment due
#> 77                                                                   Vocational education and training student loan (VSL) overseas levy compulsory repayment due
#> 78                                                                   Vocational education and training student loan (VSL) overseas levy compulsory repayment due
#> 79                                                                                                                 Student support loan compulsory repayment due
#> 80                                                                                                                 Student support loan compulsory repayment due
#> 81                                                                                                         ABSTUDY student support loan compulsory repayment due
#> 82                                                                                                         ABSTUDY student support loan compulsory repayment due
#> 83                                                                                                                                                          <NA>
#> 84                                                                                                                                                        Income
#> 85                                                                                                                                               Salary or wages
#> 86                                                                                                                                               Salary or wages
#> 87                                                                                                                             Tax withheld from salary or wages
#> 88                                                                                                                             Tax withheld from salary or wages
#> 89                                                                                                               Allowances, earnings, tips, director’s fees etc
#> 90                                                                                                               Allowances, earnings, tips, director’s fees etc
#> 91                                                                                                Employer lump sum payments - Amount A in lump sum payments box
#> 92                                                                                                Employer lump sum payments - Amount A in lump sum payments box
#> 93                                                                                          Employer lump sum payments - 5% of amount B in lump sum payments box
#> 94                                                                                          Employer lump sum payments - 5% of amount B in lump sum payments box
#> 95                                                                             Employment termination payments (ETP) - taxable component - code excluded payment
#> 96                                                                             Employment termination payments (ETP) - taxable component - code excluded payment
#> 97                                                                       Employment termination payments (ETP) - taxable component - code excluded split payment
#> 98                                                                       Employment termination payments (ETP) - taxable component - code excluded split payment
#> 99                                                                         Employment termination payments (ETP) - taxable component - code non-excluded payment
#> 100                                                                        Employment termination payments (ETP) - taxable component - code non-excluded payment
#> 101                                                                  Employment termination payments (ETP) - taxable component - code non-excluded split payment
#> 102                                                                  Employment termination payments (ETP) - taxable component - code non-excluded split payment
#> 103                                                                               Employment termination payments (ETP) - taxable component - ETP death benefits
#> 104                                                                               Employment termination payments (ETP) - taxable component - ETP death benefits
#> 105                                                                 Employment termination payments (ETP) - taxable component - ETP death benefits not dependant
#> 106                                                                 Employment termination payments (ETP) - taxable component - ETP death benefits not dependant
#> 107                                                                                         Employment termination payments (ETP) - taxable component - multiple
#> 108                                                                                         Employment termination payments (ETP) - taxable component - multiple
#> 109                                                                 Employment termination payments (ETP) - taxable component - transitional termination payment
#> 110                                                                 Employment termination payments (ETP) - taxable component - transitional termination payment
#> 111                                                                                            Employment termination payments (ETP) - taxable component (total)
#> 112                                                                                            Employment termination payments (ETP) - taxable component (total)
#> 113                                                             Australian Government allowances and payments like newstart, youth allowance and austudy payment
#> 114                                                             Australian Government allowances and payments like newstart, youth allowance and austudy payment
#> 115                                                                                                                Australian Government pensions and allowances
#> 116                                                                                                                Australian Government pensions and allowances
#> 117                                                                   Australian annuities and superannuation income streams - taxable component - taxed element
#> 118                                                                   Australian annuities and superannuation income streams - taxable component - taxed element
#> 119                                                                 Australian annuities and superannuation income streams - taxable component - untaxed element
#> 120                                                                 Australian annuities and superannuation income streams - taxable component - untaxed element
#> 121                                         Australian annuities and superannuation income streams - Assessable amount from capped defined benefit income stream
#> 122                                         Australian annuities and superannuation income streams - Assessable amount from capped defined benefit income stream
#> 123                                               Australian annuities and superannuation income streams - lump sum in arrears taxable component - taxed element
#> 124                                               Australian annuities and superannuation income streams - lump sum in arrears taxable component - taxed element
#> 125                                             Australian annuities and superannuation income streams - lump sum in arrears taxable component - untaxed element
#> 126                                             Australian annuities and superannuation income streams - lump sum in arrears taxable component - untaxed element
#> 127                                                                                       Australian superannuation lump sum payments - taxed element - multiple
#> 128                                                                                       Australian superannuation lump sum payments - taxed element - multiple
#> 129                                                                           Australian superannuation lump sum payments - taxed element - single death benefit
#> 130                                                                           Australian superannuation lump sum payments - taxed element - single death benefit
#> 131                                                                                        Australian superannuation lump sum payments - taxed element - unknown
#> 132                                                                                        Australian superannuation lump sum payments - taxed element - unknown
#> 133                                                                                          Australian superannuation lump sum payments - taxed element (total)
#> 134                                                                                          Australian superannuation lump sum payments - taxed element (total)
#> 135                                                                                     Australian superannuation lump sum payments - untaxed element - multiple
#> 136                                                                                     Australian superannuation lump sum payments - untaxed element - multiple
#> 137                                                                         Australian superannuation lump sum payments - untaxed element - single death benefit
#> 138                                                                         Australian superannuation lump sum payments - untaxed element - single death benefit
#> 139                                                                                      Australian superannuation lump sum payments - untaxed element - unknown
#> 140                                                                                      Australian superannuation lump sum payments - untaxed element - unknown
#> 141                                                                                        Australian superannuation lump sum payments - untaxed element (total)
#> 142                                                                                        Australian superannuation lump sum payments - untaxed element (total)
#> 143                                                                                                                          Attributed personal services income
#> 144                                                                                                                          Attributed personal services income
#> 145                                                                                                                                                         <NA>
#> 146                                                                                                                                               Gross interest
#> 147                                                                                                                                               Gross interest
#> 148                                                                                                         Tax file number amounts withheld from gross interest
#> 149                                                                                                         Tax file number amounts withheld from gross interest
#> 150                                                                                                                                 Dividends - unfranked amount
#> 151                                                                                                                                 Dividends - unfranked amount
#> 152                                                                                                                                   Dividends - franked amount
#> 153                                                                                                                                   Dividends - franked amount
#> 154                                                                                                                                  Dividends - franking credit
#> 155                                                                                                                                  Dividends - franking credit
#> 156                                                                                                              Tax file number amounts withheld from dividends
#> 157                                                                                                              Tax file number amounts withheld from dividends
#> 158                                                                        Employee share schemes - discount from taxed upfront schemes - eligible for reduction
#> 159                                                                        Employee share schemes - discount from taxed upfront schemes - eligible for reduction
#> 160                                                                    Employee share schemes - discount from taxed upfront schemes - not eligible for reduction
#> 161                                                                    Employee share schemes - discount from taxed upfront schemes - not eligible for reduction
#> 162                                                                                                      Employee share schemes - discount from deferral schemes
#> 163                                                                                                      Employee share schemes - discount from deferral schemes
#> 164                                                                                                           Employee share schemes - total assessable discount
#> 165                                                                                                           Employee share schemes - total assessable discount
#> 166                                                                                                 Employee share schemes - TFN amounts withheld from discounts
#> 167                                                                                                 Employee share schemes - TFN amounts withheld from discounts
#> 168                                                                                                            Employee share schemes - foreign source discounts
#> 169                                                                                                            Employee share schemes - foreign source discounts
#> 170                                                                                                            Total supplement income or loss (itemised below)2
#> 171                                                                                                            Total supplement income or loss (itemised below)2
#> 172                                                                                                          Excess concessional contributions amount for income
#> 173                                                                                                          Excess concessional contributions amount for income
#> 174                                                                                                        Excess non-concessional contributions earnings amount
#> 175                                                                                                        Excess non-concessional contributions earnings amount
#> 176                                                                                                                                        Total Income or Loss2
#> 177                                                                                                                                        Total Income or Loss2
#> 178                                                                                                                                                         <NA>
#> 179                                                                                                                                                   Deductions
#> 180                                                                                                              Work related car expenses - cents per kilometre
#> 181                                                                                                              Work related car expenses - cents per kilometre
#> 182                                                                                                                          Work related car expenses - logbook
#> 183                                                                                                                          Work related car expenses - logbook
#> 184                                                 Work related car expenses - motorcycle, taxi, hire car, vehicle over 1 tonne, carrying >9 or more passengers
#> 185                                                 Work related car expenses - motorcycle, taxi, hire car, vehicle over 1 tonne, carrying >9 or more passengers
#> 186                                                                                                                       Work related car expenses - code blank
#> 187                                                                                                                       Work related car expenses - code blank
#> 188                                                                                                                            Work related car expenses (total)
#> 189                                                                                                                            Work related car expenses (total)
#> 190                                                                                                                                 Work related travel expenses
#> 191                                                                                                                                 Work related travel expenses
#> 192                                                                       Work related uniform/clothing, laundry and dry cleaning expenses - protective clothing
#> 193                                                                       Work related uniform/clothing, laundry and dry cleaning expenses - protective clothing
#> 194                                                                   Work related uniform/clothing, laundry and dry cleaning expenses - compulsory work uniform
#> 195                                                                   Work related uniform/clothing, laundry and dry cleaning expenses - compulsory work uniform
#> 196                                                               Work related uniform/clothing, laundry and dry cleaning expenses - non-compulsory work uniform
#> 197                                                               Work related uniform/clothing, laundry and dry cleaning expenses - non-compulsory work uniform
#> 198                                                              Work related uniform/clothing, laundry and dry cleaning expenses - occupation-specific clothing
#> 199                                                              Work related uniform/clothing, laundry and dry cleaning expenses - occupation-specific clothing
#> 200                                                                                Work related uniform/clothing, laundry and dry cleaning expenses - code blank
#> 201                                                                                Work related uniform/clothing, laundry and dry cleaning expenses - code blank
#> 202                                                                                     Work related uniform/clothing, laundry and dry cleaning expenses (total)
#> 203                                                                                     Work related uniform/clothing, laundry and dry cleaning expenses (total)
#> 204                                                                                        Work related self-education expenses - maintaining or improving skill
#> 205                                                                                        Work related self-education expenses - maintaining or improving skill
#> 206                                                                           Work related self-education expenses - study leading to increased income from work
#> 207                                                                           Work related self-education expenses - study leading to increased income from work
#> 208                                                                                                                 Work related self-education expenses - other
#> 209                                                                                                                 Work related self-education expenses - other
#> 210                                                                                                                 Work related self-education expenses - blank
#> 211                                                                                                                 Work related self-education expenses - blank
#> 212                                                                                                                 Work related self-education expenses (total)
#> 213                                                                                                                 Work related self-education expenses (total)
#> 214                                                                                                                                  Other work related expenses
#> 215                                                                                                                                  Other work related expenses
#> 216                                                                                                                                  Total work related expenses
#> 217                                                                                                                                  Total work related expenses
#> 218                                                                                                                                     Low value pool deduction
#> 219                                                                                                                                     Low value pool deduction
#> 220                                                                                                                                          Interest deductions
#> 221                                                                                                                                          Interest deductions
#> 222                                                                                                                                          Dividend deductions
#> 223                                                                                                                                          Dividend deductions
#> 224                                                                                                                                           Gifts or donations
#> 225                                                                                                                                           Gifts or donations
#> 226                                                                                                                                 Cost of managing tax affairs
#> 227                                                                                                                                 Cost of managing tax affairs
#> 228                                                                                                   Cost of managing tax affairs - Interest charged by the ATO
#> 229                                                                                                   Cost of managing tax affairs - Interest charged by the ATO
#> 230                                                                                                              Cost of managing tax affairs - Litigation costs
#> 231                                                                                                              Cost of managing tax affairs - Litigation costs
#> 232                                                                          Cost of managing tax affairs - Other expenses incurred in managing your tax affairs
#> 233                                                                          Cost of managing tax affairs - Other expenses incurred in managing your tax affairs
#> 234                                                                                                                Total supplement deductions (itemised below)2
#> 235                                                                                                                Total supplement deductions (itemised below)2
#> 236                                                                                                                                            Total Deductions2
#> 237                                                                                                                                            Total Deductions2
#> 238                                                                                                                                                         <NA>
#> 239                                                                                                                  Total income or loss less total deductions2
#> 240                                                                                                                  Total income or loss less total deductions2
#> 241                                                                                                                  Total income or loss less total deductions2
#> 242                                                                                                                                                         <NA>
#> 243                                                                                                                                                       Losses
#> 244                                                     Tax losses of earlier income years - Primary production losses carried forward from earlier income years
#> 245                                                     Tax losses of earlier income years - Primary production losses carried forward from earlier income years
#> 246                                                 Tax losses of earlier income years - Non-primary production losses carried forward from earlier income years
#> 247                                                 Tax losses of earlier income years - Non-primary production losses carried forward from earlier income years
#> 248                                                                         Tax losses of earlier income years carried forward from earlier income years (total)
#> 249                                                                         Tax losses of earlier income years carried forward from earlier income years (total)
#> 250                                                                      Tax losses of earlier income years - Primary production losses claimed this income year
#> 251                                                                      Tax losses of earlier income years - Primary production losses claimed this income year
#> 252                                                                  Tax losses of earlier income years - Non-primary production losses claimed this income year
#> 253                                                                  Tax losses of earlier income years - Non-primary production losses claimed this income year
#> 254                                                                                          Tax losses of earlier income years claimed this income year (total)
#> 255                                                                                          Tax losses of earlier income years claimed this income year (total)
#> 256                                                                                                                                                         <NA>
#> 257                                                                                                                                      Taxable income or loss2
#> 258                                                                                                                                      Taxable income or loss2
#> 259                                                                                                                                      Taxable income or loss2
#> 260                                                                                                                                                         <NA>
#> 261                                                                                                                                    Taxable income (not loss)
#> 262                                                                                                                                    Taxable income (not loss)
#> 263                                                                                                                                                         <NA>
#> 264                                                                                                                                 Tax offsets - on tax returns
#> 265                                                                                                                            Seniors and pensioners tax offset
#> 266                                                                                                                            Seniors and pensioners tax offset
#> 267                                                                                                                    Australian super income stream tax offset
#> 268                                                                                                                    Australian super income stream tax offset
#> 269                                                                                                               Total supplement tax offsets (itemised below)2
#> 270                                                                                                               Total supplement tax offsets (itemised below)2
#> 271                                                                                                                                                         <NA>
#> 272                                                                                                                                Tax offsets  - ATO calculated
#> 273                                                                                                                              Life assurance bonus tax offset
#> 274                                                                                                                              Life assurance bonus tax offset
#> 275                                                                                                                                        Low income tax offset
#> 276                                                                                                                                        Low income tax offset
#> 277                                                                                                                             Low and middle income tax offset
#> 278                                                                                                                             Low and middle income tax offset
#> 279                                                                                                                     Excess concessional contributions offset
#> 280                                                                                                                     Excess concessional contributions offset
#> 281                                                                                                                 Excess non-concessional contributions offset
#> 282                                                                                                                 Excess non-concessional contributions offset
#> 283                                                                                                                                         Averaging tax offset
#> 284                                                                                                                                         Averaging tax offset
#> 285                                                                                                   Commonwealth of Australia benefits and payments tax offset
#> 286                                                                                                   Commonwealth of Australia benefits and payments tax offset
#> 287                                                                                                                    Employment termination payment tax offset
#> 288                                                                                                                    Employment termination payment tax offset
#> 289                                                                                                                             Small business income tax offset
#> 290                                                                                                                             Small business income tax offset
#> 291                                                                                                                       Lump sum payment in arrears tax offset
#> 292                                                                                                                       Lump sum payment in arrears tax offset
#> 293                                                                                                                                                         <NA>
#> 294                                                                                                                                             Main tax credits
#> 295                                                                                                                                          Total tax withheld2
#> 296                                                                                                                                          Total tax withheld2
#> 297                                                                                                                       Credit for PAYG income tax instalments
#> 298                                                                                                                       Credit for PAYG income tax instalments
#> 299                                                                                                                                                         <NA>
#> 300                                                                                                                                     Private health insurance
#> 301                                                                                                                         People with private health insurance
#> 302                                                                                        Private health insurance - your Australian Government rebate received
#> 303                                                                                        Private health insurance - your Australian Government rebate received
#> 304                                                                                                  Private health insurance rebate credited (rebate increased)
#> 305                                                                                                  Private health insurance rebate credited (rebate increased)
#> 306                                                                                                   Excess private health reduction or refund (rebate reduced)
#> 307                                                                                                   Excess private health reduction or refund (rebate reduced)
#> 308                                                                                                                        Total private health insurance rebate
#> 309                                                                                                                        Total private health insurance rebate
#> 310                                                                                                                                                         <NA>
#> 311                                                                                                                                    Tax payable or refundable
#> 312                                                                                                                                                  Tax payable
#> 313                                                                                                                                                  Tax payable
#> 314                                                                                                                                               Tax refundable
#> 315                                                                                                                                               Tax refundable
#> 316                                                                                                                                    Tax payable or refundable
#> 317                                                                                                                                    Tax payable or refundable
#> 318                                                                                                                                                         <NA>
#> 319                                                                                                                                                  Adjustments
#> 320                                                                                                           Under 18 income - all income taxed at normal rates
#> 321                                                                                                           Under 18 income - all income taxed at normal rates
#> 322                                                                              Under 18 income - income shown at Item A1 Label J will be taxed at normal rates
#> 323                                                                              Under 18 income - income shown at Item A1 Label J will be taxed at normal rates
#> 324                                                                          Under 18 income - income at Label J taxed at normal rates and turned 18 during year
#> 325                                                                          Under 18 income - income at Label J taxed at normal rates and turned 18 during year
#> 326                                                                                                                                      Under 18 income (total)
#> 327                                                                                                                                      Under 18 income (total)
#> 328                                                                       Government super contributions - Income from investment, partnership and other sources
#> 329                                                                       Government super contributions - Income from investment, partnership and other sources
#> 330                                                                                   Government super contributions - Other income from employment and business
#> 331                                                                                   Government super contributions - Other income from employment and business
#> 332                                                                                       Government super contributions - Other deductions from business income
#> 333                                                                                       Government super contributions - Other deductions from business income
#> 334                                                                                                                             Working holiday maker net income
#> 335                                                                                                                             Working holiday maker net income
#> 336                                                                                                                                                         <NA>
#> 337                                                                                                                                                 Income tests
#> 338                                                     Total reportable fringe benefits amounts - Employers exempt from FBT under section 57A of the FBTAA 1986
#> 339                                                     Total reportable fringe benefits amounts - Employers exempt from FBT under section 57A of the FBTAA 1986
#> 340                                                 Total reportable fringe benefits amounts - Employers not exempt from FBT under section 57A of the FBTAA 1986
#> 341                                                 Total reportable fringe benefits amounts - Employers not exempt from FBT under section 57A of the FBTAA 1986
#> 342                                                                                                                      Total reportable fringe benefits amount
#> 343                                                                                                                      Total reportable fringe benefits amount
#> 344                                                                                                             Reportable employer superannuation contributions
#> 345                                                                                                             Reportable employer superannuation contributions
#> 346                                                                                                                                 Tax-free government pensions
#> 347                                                                                                                                 Tax-free government pensions
#> 348                                                                                                                                        Target foreign income
#> 349                                                                                                                                        Target foreign income
#> 350                                                                                                                                Net financial investment loss
#> 351                                                                                                                                Net financial investment loss
#> 352                                                                                                                                     Net rental property loss
#> 353                                                                                                                                     Net rental property loss
#> 354                                                                                                                                       Child support you paid
#> 355                                                                                                                                       Child support you paid
#> 356                                                                                                                                                         <NA>
#> 357                                                                                                                                        Supplementary section
#> 358                                                                                                                 Partnerships and trusts - primary production
#> 359                                                                                                 Distribution from partnerships - primary production – profit
#> 360                                                                                                 Distribution from partnerships - primary production – profit
#> 361                                                                                                   Distribution from partnerships - primary production – loss
#> 362                                                                                                   Distribution from partnerships - primary production – loss
#> 363                                                                                                  Distribution from partnerships - primary production (total)
#> 364                                                                                                  Distribution from partnerships - primary production (total)
#> 365                                                                                                Share of net income from trusts - primary production – profit
#> 366                                                                                                Share of net income from trusts - primary production – profit
#> 367                                                                                                  Share of net income from trusts - primary production – loss
#> 368                                                                                                  Share of net income from trusts - primary production – loss
#> 369                                                                                                 Share of net income from trusts - primary production (total)
#> 370                                                                                                 Share of net income from trusts - primary production (total)
#> 371                        Landcare operations and deduction for decline in value of water facility, fencing asset and fodder storage asset - primary production
#> 372                        Landcare operations and deduction for decline in value of water facility, fencing asset and fodder storage asset - primary production
#> 373         Other deductions relating to amounts shown at N and L - primary production - all of the amount consists of prior year deferred non-commercial losses
#> 374         Other deductions relating to amounts shown at N and L - primary production - all of the amount consists of prior year deferred non-commercial losses
#> 375        Other deductions relating to amounts shown at N and L - primary production - part of the amount consists of prior year deferred non-commercial losses
#> 376        Other deductions relating to amounts shown at N and L - primary production - part of the amount consists of prior year deferred non-commercial losses
#> 377        Other deductions relating to amounts shown at N and L - primary production - none of the amount consists of prior year deferred non-commercial losses
#> 378        Other deductions relating to amounts shown at N and L - primary production - none of the amount consists of prior year deferred non-commercial losses
#> 379                                                                           Other deductions relating to amounts shown at N and L - primary production - blank
#> 380                                                                           Other deductions relating to amounts shown at N and L - primary production - blank
#> 381                                                                           Other deductions relating to amounts shown at N and L - primary production (total)
#> 382                                                                           Other deductions relating to amounts shown at N and L - primary production (total)
#> 383                                                                                                             (P&T) Net primary production distribution amount
#> 384                                                                                                             (P&T) Net primary production distribution amount
#> 385                                                                                                                                                         <NA>
#> 386                                                                                                             Partnerships and trusts - non-primary production
#> 387                                                                         Distribution from partnerships less foreign income - non-primary production – profit
#> 388                                                                         Distribution from partnerships less foreign income - non-primary production – profit
#> 389                                                                           Distribution from partnerships less foreign income - non-primary production – loss
#> 390                                                                           Distribution from partnerships less foreign income - non-primary production – loss
#> 391                                                                          Distribution from partnerships less foreign income - non-primary production (total)
#> 392                                                                          Distribution from partnerships less foreign income - non-primary production (total)
#> 393                               Share of net income from trusts less capital gains, foreign income and franked distributions - non-primary production – profit
#> 394                               Share of net income from trusts less capital gains, foreign income and franked distributions - non-primary production – profit
#> 395                                 Share of net income from trusts less capital gains, foreign income and franked distributions - non-primary production – loss
#> 396                                 Share of net income from trusts less capital gains, foreign income and franked distributions - non-primary production – loss
#> 397                                Share of net income from trusts less capital gains, foreign income and franked distributions - non-primary production (total)
#> 398                                Share of net income from trusts less capital gains, foreign income and franked distributions - non-primary production (total)
#> 399                                                                                                   Franked distributions from trusts - non-primary production
#> 400                                                                                                   Franked distributions from trusts - non-primary production
#> 401                                                                                                        Landcare operations expenses - non-primary production
#> 402                                                                                                        Landcare operations expenses - non-primary production
#> 403  Other deductions relating to amounts shown at O, U and C - non-primary production - all of the amount consists of prior year deferred non-commercial losses
#> 404  Other deductions relating to amounts shown at O, U and C - non-primary production - all of the amount consists of prior year deferred non-commercial losses
#> 405 Other deductions relating to amounts shown at O, U and C - non-primary production - part of the amount consists of prior year deferred non-commercial losses
#> 406 Other deductions relating to amounts shown at O, U and C - non-primary production - part of the amount consists of prior year deferred non-commercial losses
#> 407 Other deductions relating to amounts shown at O, U and C - non-primary production - none of the amount consists of prior year deferred non-commercial losses
#> 408 Other deductions relating to amounts shown at O, U and C - non-primary production - none of the amount consists of prior year deferred non-commercial losses
#> 409                                                                    Other deductions relating to amounts shown at O, U and C - non-primary production - blank
#> 410                                                                    Other deductions relating to amounts shown at O, U and C - non-primary production - blank
#> 411                                                                    Other deductions relating to amounts shown at O, U and C - non-primary production (total)
#> 412                                                                    Other deductions relating to amounts shown at O, U and C - non-primary production (total)
#> 413                                                                                                         (P&T) Net non-primary production distribution amount
#> 414                                                                                                         (P&T) Net non-primary production distribution amount
#> 415                                                                                                                                                         <NA>
#> 416                                                                                                                         Total distribution from partnerships
#> 417                                                                                                                         Total distribution from partnerships
#> 418                                                                                                                        Total share of net income from trusts
#> 419                                                                                                                        Total share of net income from trusts
#> 420                                                                                                              Total distribution from partnerships and trusts
#> 421                                                                                                              Total distribution from partnerships and trusts
#> 422                                                                                              Total landcare operations expenses from partnerships and trusts
#> 423                                                                                              Total landcare operations expenses from partnerships and trusts
#> 424                                                                                Total other deductions relating to amounts shown from partnerships and trusts
#> 425                                                                                Total other deductions relating to amounts shown from partnerships and trusts
#> 426                                                                                                               Total net amounts from partnerships and trusts
#> 427                                                                                                               Total net amounts from partnerships and trusts
#> 428                                                                                                                                                         <NA>
#> 429                                                                    Partnership share of net small business income less deductions attributable to that share
#> 430                                                                    Partnership share of net small business income less deductions attributable to that share
#> 431                                                                          Trust share of net small business income less deductions attributable to that share
#> 432                                                                          Trust share of net small business income less deductions attributable to that share
#> 433                                                                                                                                                         <NA>
#> 434                                                                                       Partnerships and trusts - Share of credits from income and tax offsets
#> 435                                                                                 Share of credit for tax withheld where Australian business number not quoted
#> 436                                                                                 Share of credit for tax withheld where Australian business number not quoted
#> 437                                                                                                              Share of franking credit from franked dividends
#> 438                                                                                                              Share of franking credit from franked dividends
#> 439                                                   Share of credit for tax file number amounts withheld from interest, dividends and unit trust distributions
#> 440                                                   Share of credit for tax file number amounts withheld from interest, dividends and unit trust distributions
#> 441                                                                                       Credit for TFN amounts withheld from payments from closely held trusts
#> 442                                                                                       Credit for TFN amounts withheld from payments from closely held trusts
#> 443                                                                                                                      Share of credit for tax paid by trustee
#> 444                                                                                                                      Share of credit for tax paid by trustee
#> 445                                                                                       Share of credit for amounts withheld from foreign resident withholding
#> 446                                                                                       Share of credit for amounts withheld from foreign resident withholding
#> 447                                                                                                     Share of National rental affordability scheme tax offset
#> 448                                                                                                     Share of National rental affordability scheme tax offset
#> 449                                                                                                                                                         <NA>
#> 450                                                                                                                               Personal services income (PSI)
#> 451                                                                                                Personal services income - Tax withheld - voluntary agreement
#> 452                                                                                                Personal services income - Tax withheld - voluntary agreement
#> 453                                                                          Personal services income - Tax withheld where Australian business number not quoted
#> 454                                                                          Personal services income - Tax withheld where Australian business number not quoted
#> 455                                                                            Personal services income - Tax withheld - labour hire or other specified payments
#> 456                                                                            Personal services income - Tax withheld - labour hire or other specified payments
#> 457                                                                                                Personal services income - Net PSI - transferred from item P1
#> 458                                                                                                Personal services income - Net PSI - transferred from item P1
#> 459                                                                                                                                                         <NA>
#> 460                                                                                                                             Net income or loss from business
#> 461                                                                             Net income or loss from business - primary production - transferred from item P8
#> 462                                                                             Net income or loss from business - primary production - transferred from item P8
#> 463                                                                           Net income or loss from business - non-primary production transferred from item P8
#> 464                                                                           Net income or loss from business - non-primary production transferred from item P8
#> 465                                                                                                                                    Net small business income
#> 466                                                                                                                                    Net small business income
#> 467                                                                                                                                  Total small business income
#> 468                                                                                                                                  Total small business income
#> 469                                                                                        Net income or loss from business - Tax withheld - voluntary agreement
#> 470                                                                                        Net income or loss from business - Tax withheld - voluntary agreement
#> 471                                                                  Net income or loss from business - Tax withheld where Australian business number not quoted
#> 472                                                                  Net income or loss from business - Tax withheld where Australian business number not quoted
#> 473                                                                               Net income or loss from business - Tax withheld - foreign resident withholding
#> 474                                                                               Net income or loss from business - Tax withheld - foreign resident withholding
#> 475                                                                    Net income or loss from business - Tax withheld - labour hire or other specified payments
#> 476                                                                    Net income or loss from business - Tax withheld - labour hire or other specified payments
#> 477                                                                                                                                                         <NA>
#> 478                                                                                                                      Deferred non-commercial business losses
#> 479                                                          Deferred non-commercial business losses - your share of deferred losses from partnership activities
#> 480                                                          Deferred non-commercial business losses - your share of deferred losses from partnership activities
#> 481                                                                        Deferred non-commercial business losses - deferred losses from sole trader activities
#> 482                                                                        Deferred non-commercial business losses - deferred losses from sole trader activities
#> 483                                                                                 Deferred non-commercial business losses - primary production deferred losses
#> 484                                                                                 Deferred non-commercial business losses - primary production deferred losses
#> 485                                                                             Deferred non-commercial business losses - non-primary production deferred losses
#> 486                                                                             Deferred non-commercial business losses - non-primary production deferred losses
#> 487                                                                                                                                                         <NA>
#> 488                                                                                                                   Net farm management deposits or repayments
#> 489                                                                                             Net farm management deposits or repayments - deductible deposits
#> 490                                                                                             Net farm management deposits or repayments - deductible deposits
#> 491                                                                               Net farm management deposits or repayments - early repayments natural disaster
#> 492                                                                               Net farm management deposits or repayments - early repayments natural disaster
#> 493                                                                                                Net farm management deposits or repayments - other repayments
#> 494                                                                                                Net farm management deposits or repayments - other repayments
#> 495                                                                                                                                 Net farm management deposits
#> 496                                                                                                                                 Net farm management deposits
#> 497                                                                                                                                Net farm management repayment
#> 498                                                                                                                                Net farm management repayment
#> 499                                                                                                                   Net farm management deposits or repayments
#> 500                                                                                                                   Net farm management deposits or repayments
#> 501                                                                                                                                                         <NA>
#> 502                                                                                                                                                Capital gains
#> 503                                                                                                                                             Net capital gain
#> 504                                                                                                                                             Net capital gain
#> 505                                                                                                                             Total current year capital gains
#> 506                                                                                                                             Total current year capital gains
#> 507                                                                                                     Net capital losses carried forward to later income years
#> 508                                                                                                     Net capital losses carried forward to later income years
#> 509                                                                                                         Credit for foreign capital gains withholding amounts
#> 510                                                                                                         Credit for foreign capital gains withholding amounts
#> 511                                                                                                                                                         <NA>
#> 512                                                                                                                                             Foreign entities
#> 513                                                                                                         Foreign entities - controlled foreign company income
#> 514                                                                                                         Foreign entities - controlled foreign company income
#> 515                                                                                                                   Foreign entities - transferor trust income
#> 516                                                                                                                   Foreign entities - transferor trust income
#> 517                                                                                                                                                         <NA>
#> 518                                                                                                         Foreign source income and foreign assets or property
#> 519                                                                                                                             Assessable foreign source income
#> 520                                                                                                                             Assessable foreign source income
#> 521                                                                                                                          Other net foreign employment income
#> 522                                                                                                                          Other net foreign employment income
#> 523                                                                                   Net foreign pension or annuity income without an undeducted purchase price
#> 524                                                                                   Net foreign pension or annuity income without an undeducted purchase price
#> 525                                                                                      Net foreign pension or annuity income with an undeducted purchase price
#> 526                                                                                      Net foreign pension or annuity income with an undeducted purchase price
#> 527                                                                                                                                             Net foreign rent
#> 528                                                                                                                                             Net foreign rent
#> 529                                                                                                                              Other net foreign source income
#> 530                                                                                                                              Other net foreign source income
#> 531                                                                                              Australian franking credits from a New Zealand franking company
#> 532                                                                                              Australian franking credits from a New Zealand franking company
#> 533                                                                                                              Net foreign employment income - payment summary
#> 534                                                                                                              Net foreign employment income - payment summary
#> 535                                                                                                                             Exempt foreign employment income
#> 536                                                                                                                             Exempt foreign employment income
#> 537                                                                                                                                    Foreign income tax offset
#> 538                                                                                                                                    Foreign income tax offset
#> 539                                                                                                                                                         <NA>
#> 540                                                                                                                                                         Rent
#> 541                                                                                                                                            Rent - gross rent
#> 542                                                                                                                                            Rent - gross rent
#> 543                                                                                                                                   Rent - interest deductions
#> 544                                                                                                                                   Rent - interest deductions
#> 545                                                                                                                              Rent - capital works deductions
#> 546                                                                                                                              Rent - capital works deductions
#> 547                                                                                                                               Rent - other rental deductions
#> 548                                                                                                                               Rent - other rental deductions
#> 549                                                                                                                                      Rent - total deductions
#> 550                                                                                                                                      Rent - total deductions
#> 551                                                                                                                                            Net rent – profit
#> 552                                                                                                                                            Net rent – profit
#> 553                                                                                                                                           Net rent – neutral
#> 554                                                                                                                                              Net rent – loss
#> 555                                                                                                                                              Net rent – loss
#> 556                                                                                                                                                    Net rent2
#> 557                                                                                                                                                    Net rent2
#> 558                                                                                                                                                         <NA>
#> 559                                                                                                 Bonuses from life insurance companies and friendly societies
#> 560                                                                                                 Bonuses from life insurance companies and friendly societies
#> 561                                                                                                                    Forestry managed investment scheme income
#> 562                                                                                                                    Forestry managed investment scheme income
#> 563                                                                                                                                    Other income - category 1
#> 564                                                                                                                                    Other income - category 1
#> 565                                                                                                                                    Other income - category 2
#> 566                                                                                                                                    Other income - category 2
#> 567                                                                                                                     Other income - category 2 (ATO interest)
#> 568                                                                                                                     Other income - category 2 (ATO interest)
#> 569                                                                                                                                    Other income - category 3
#> 570                                                                                                                                    Other income - category 3
#> 571                                                                                                                             Other income - category 3 (FHSS)
#> 572                                                                                                                             Other income - category 3 (FHSS)
#> 573                                                                                                                                    Other income - category 4
#> 574                                                                                                                                    Other income - category 4
#> 575                                                                                                   Other income - tax withheld - lump sum payments in arrears
#> 576                                                                                                   Other income - tax withheld - lump sum payments in arrears
#> 577                                                                                                                   Other income - taxable professional income
#> 578                                                                                                                   Other income - taxable professional income
#> 579                                                                                                Other income - tax withheld - assessable FHSS released amount
#> 580                                                                                                Other income - tax withheld - assessable FHSS released amount
#> 581                                                                                                                             Total supplement income or loss2
#> 582                                                                                                                             Total supplement income or loss2
#> 583                                                                                                                                                         <NA>
#> 584                                                                                                                           Supplementary section - Deductions
#> 585                                                                               Deductible amount of undeducted purchase price of a foreign pension or annuity
#> 586                                                                               Deductible amount of undeducted purchase price of a foreign pension or annuity
#> 587                                                                                                                        Personal superannuation contributions
#> 588                                                                                                                        Personal superannuation contributions
#> 589                                                                                                                                   Deduction for project pool
#> 590                                                                                                                                   Deduction for project pool
#> 591                                                                                                                 Forestry managed investment scheme deduction
#> 592                                                                                                                 Forestry managed investment scheme deduction
#> 593                                                                                                                                            Election expenses
#> 594                                                                                                                                            Election expenses
#> 595                                                                                                                                             Other deductions
#> 596                                                                                                                                             Other deductions
#> 597                                                                                                                                 Total supplement deductions2
#> 598                                                                                                                                 Total supplement deductions2
#> 599                                                                                                                                                         <NA>
#> 600                                                                                                                          Supplementary section - Tax offsets
#> 601                                                                                             Superannuation contributions on behalf of your spouse tax offset
#> 602                                                                                             Superannuation contributions on behalf of your spouse tax offset
#> 603                                                                                                                           Zone or overseas forces tax offset
#> 604                                                                                                                           Zone or overseas forces tax offset
#> 605                                                                                                                     Invalid and carer tax offset (dependent)
#> 606                                                                                                                     Invalid and carer tax offset (dependent)
#> 607                                                                                                                       Landcare and water facility tax offset
#> 608                                                                                                                       Landcare and water facility tax offset
#> 609                                                                         Early stage venture capital limited partnership tax offset - Current year tax offset
#> 610                                                                         Early stage venture capital limited partnership tax offset - Current year tax offset
#> 611                                                   Early stage venture capital limited partnership tax offset - Tax offset carried forward from previous year
#> 612                                                   Early stage venture capital limited partnership tax offset - Tax offset carried forward from previous year
#> 613                                                                                                    Early stage investor tax offset - Current year tax offset
#> 614                                                                                                    Early stage investor tax offset - Current year tax offset
#> 615                                                                              Early stage investor tax offset - Tax offset carried forward from previous year
#> 616                                                                              Early stage investor tax offset - Tax offset carried forward from previous year
#> 617                                                                    Other non-refundable tax offsets - land transport facilities or infrastructure borrowings
#> 618                                                                    Other non-refundable tax offsets - land transport facilities or infrastructure borrowings
#> 619                                                                           Other non-refundable tax offsets - heritage conservation work or a JPDA tax offset
#> 620                                                                           Other non-refundable tax offsets - heritage conservation work or a JPDA tax offset
#> 621                                                                                                                     Other non-refundable tax offsets - blank
#> 622                                                                                                                     Other non-refundable tax offsets - blank
#> 623                                                                                                                     Other non-refundable tax offsets (total)
#> 624                                                                                                                     Other non-refundable tax offsets (total)
#> 625                                                                             Other refundable tax offsets - special beneficiary trust - principle beneficiary
#> 626                                                                             Other refundable tax offsets - special beneficiary trust - principle beneficiary
#> 627                                                                                                                Other refundable tax offsets - multiple codes
#> 628                                                                                                                Other refundable tax offsets - multiple codes
#> 629                                                                                                            Other refundable tax offsets - exploration credit
#> 630                                                                                                            Other refundable tax offsets - exploration credit
#> 631                                                                                                                         Other refundable tax offsets - blank
#> 632                                                                                                                         Other refundable tax offsets - blank
#> 633                                                                                                                         Other refundable tax offsets (total)
#> 634                                                                                                                         Other refundable tax offsets (total)
#> 635                                                                                                                                Total supplement tax offsets2
#> 636                                                                                                                                Total supplement tax offsets2
#> 637                                                                                                                                                         <NA>
#> 638                                                                                                                                                   Adjustment
#> 639                                                                                                  Amount on which family trust distribution tax has been paid
#> 640                                                                                                  Amount on which family trust distribution tax has been paid
#> 641                                                                                                                                                         <NA>
#> 642                                                                                                                              Credit for interest on tax paid
#> 643                                                                                                   Credit for interest on early payments - amount of interest
#> 644                                                                                                   Credit for interest on early payments - amount of interest
#> 645                                                                                                                                                         <NA>
#> 646                                                                                                                      Business and professional items section
#> 647                                                                                                                               Personal services income (PSI)
#> 648                                                                                                                                    PSI – voluntary agreement
#> 649                                                                                                                                    PSI – voluntary agreement
#> 650                                                                                                            PSI – where Australian business number not quoted
#> 651                                                                                                            PSI – where Australian business number not quoted
#> 652                                                                                                                PSI – labour hire or other specified payments
#> 653                                                                                                                PSI – labour hire or other specified payments
#> 654                                                                                                                                                  PSI – other
#> 655                                                                                                                                                  PSI – other
#> 656                                                                                               PSI – deductions for payments to associates for principal work
#> 657                                                                                               PSI – deductions for payments to associates for principal work
#> 658                                                                                                           PSI – total amount of other deductions against PSI
#> 659                                                                                                           PSI – total amount of other deductions against PSI
#> 660                                                                                                                                                      Net PSI
#> 661                                                                                                                                                      Net PSI
#> 662                                                                                                                                                         <NA>
#> 663                                                                                                                    Sold goods or services using the internet
#> 664                                                                                                                                                         <NA>
#> 665                                                                                                                                 Business income and expenses
#> 666                                                                                                                                              Business income
#> 667                                                                              Gross payments where Australian business number not quoted – primary production
#> 668                                                                              Gross payments where Australian business number not quoted – primary production
#> 669                                                                          Gross payments where Australian business number not quoted – non-primary production
#> 670                                                                          Gross payments where Australian business number not quoted – non-primary production
#> 671                                                                                           Gross payments where Australian business number not quoted (total)
#> 672                                                                                           Gross payments where Australian business number not quoted (total)
#> 673                                                                              Gross payments subject to foreign resident withholding – non-primary production
#> 674                                                                              Gross payments subject to foreign resident withholding – non-primary production
#> 675                                                                                               Gross payments subject to foreign resident withholding (total)
#> 676                                                                                               Gross payments subject to foreign resident withholding (total)
#> 677                                                                                                    Gross payments – voluntary agreement – primary production
#> 678                                                                                                    Gross payments – voluntary agreement – primary production
#> 679                                                                                                Gross payments – voluntary agreement – non-primary production
#> 680                                                                                                Gross payments – voluntary agreement – non-primary production
#> 681                                                                                                                 Gross payments – voluntary agreement (total)
#> 682                                                                                                                 Gross payments – voluntary agreement (total)
#> 683                                                                                Gross payments – labour hire or other specified payments – primary production
#> 684                                                                                Gross payments – labour hire or other specified payments – primary production
#> 685                                                                            Gross payments – labour hire or other specified payments – non-primary production
#> 686                                                                            Gross payments – labour hire or other specified payments – non-primary production
#> 687                                                                                             Gross payments – labour hire or other specified payments (total)
#> 688                                                                                             Gross payments – labour hire or other specified payments (total)
#> 689                                                                                                 Assessable government industry payments – primary production
#> 690                                                                                                 Assessable government industry payments – primary production
#> 691                                                                                             Assessable government industry payments – non-primary production
#> 692                                                                                             Assessable government industry payments – non-primary production
#> 693                                                                                                              Assessable government industry payments (total)
#> 694                                                                                                              Assessable government industry payments (total)
#> 695                                                                                                                   Other business income – primary production
#> 696                                                                                                                   Other business income – primary production
#> 697                                                                                                               Other business income – non-primary production
#> 698                                                                                                               Other business income – non-primary production
#> 699                                                                                                                                Other business income (total)
#> 700                                                                                                                                Other business income (total)
#> 701                                                                                                                    Total business income primary production2
#> 702                                                                                                                    Total business income primary production2
#> 703                                                                                                                Total business income non-primary production2
#> 704                                                                                                                Total business income non-primary production2
#> 705                                                                                                                               Total business income (total)2
#> 706                                                                                                                               Total business income (total)2
#> 707                                                                                                                                                         <NA>
#> 708                                                                                                                                            Business expenses
#> 709                                                                                                                                                Opening stock
#> 710                                                                                                                                                Opening stock
#> 711                                                                                                                                    Purchases and other costs
#> 712                                                                                                                                    Purchases and other costs
#> 713                                                                                                                                         Closing stock - cost
#> 714                                                                                                                                         Closing stock - cost
#> 715                                                                                                                         Closing stock - market selling value
#> 716                                                                                                                         Closing stock - market selling value
#> 717                                                                                                                            Closing stock - replacement value
#> 718                                                                                                                            Closing stock - replacement value
#> 719                                                                                                                                        Closing stock - blank
#> 720                                                                                                                                        Closing stock - blank
#> 721                                                                                                                                        Closing stock (total)
#> 722                                                                                                                                        Closing stock (total)
#> 723                                                                                                                                                Cost of sales
#> 724                                                                                                                                                Cost of sales
#> 725                                                                                                                        Foreign resident withholding expenses
#> 726                                                                                                                        Foreign resident withholding expenses
#> 727                                                                                                            Contractor, subcontractor and commission expenses
#> 728                                                                                                            Contractor, subcontractor and commission expenses
#> 729                                                                                                                                      Superannuation expenses
#> 730                                                                                                                                      Superannuation expenses
#> 731                                                                                                                                                    Bad debts
#> 732                                                                                                                                                    Bad debts
#> 733                                                                                                                                               Lease expenses
#> 734                                                                                                                                               Lease expenses
#> 735                                                                                                                                                Rent expenses
#> 736                                                                                                                                                Rent expenses
#> 737                                                                                                                           Interest expenses within Australia
#> 738                                                                                                                           Interest expenses within Australia
#> 739                                                                                                                                   Interest expenses overseas
#> 740                                                                                                                                   Interest expenses overseas
#> 741                                                                                                                                        Depreciation expenses
#> 742                                                                                                                                        Depreciation expenses
#> 743                                                                                                          Motor vehicle expenses - cents per kilometre method
#> 744                                                                                                          Motor vehicle expenses - cents per kilometre method
#> 745                                                                                                                      Motor vehicle expenses - logbook method
#> 746                                                                                                                      Motor vehicle expenses - logbook method
#> 747                                                        Motor vehicle expenses - motorcycle, taxi, hire car, vehicle over 1 tonne, carry 9 or more passengers
#> 748                                                        Motor vehicle expenses - motorcycle, taxi, hire car, vehicle over 1 tonne, carry 9 or more passengers
#> 749                                                                                                                               Motor vehicle expenses - blank
#> 750                                                                                                                               Motor vehicle expenses - blank
#> 751                                                                                                                               Motor vehicle expenses (total)
#> 752                                                                                                                               Motor vehicle expenses (total)
#> 753                                                                                                                             Repairs and maintenance expenses
#> 754                                                                                                                             Repairs and maintenance expenses
#> 755                                                                                                                                           All other expenses
#> 756                                                                                                                                           All other expenses
#> 757                                                                                                                  Total business expenses primary production2
#> 758                                                                                                                  Total business expenses primary production2
#> 759                                                                                                              Total business expenses non-primary production2
#> 760                                                                                                              Total business expenses non-primary production2
#> 761                                                                                                                             Total business expenses (total)2
#> 762                                                                                                                             Total business expenses (total)2
#> 763                                                                                                                                                         <NA>
#> 764                                                                                                           Business income and expenses: Reconciliation items
#> 765                                                                                                                                     Section 40-880 deduction
#> 766                                                                                                                                     Section 40-880 deduction
#> 767                                                                                                                          Business deduction for project pool
#> 768                                                                                                                          Business deduction for project pool
#> 769                                    Landcare operations and business deduction for decline in value of water facility, fencing asset and fodder storage asset
#> 770                                    Landcare operations and business deduction for decline in value of water facility, fencing asset and fodder storage asset
#> 771                                                                                                                            Income reconciliation adjustments
#> 772                                                                                                                            Income reconciliation adjustments
#> 773                                                                                                                           Expense reconciliation adjustments
#> 774                                                                                                                           Expense reconciliation adjustments
#> 775                                                                                                                                                         <NA>
#> 776                                                                                                                             Net income or loss from business
#> 777                                                                                             Net income or loss from business this year – primary production2
#> 778                                                                                             Net income or loss from business this year – primary production2
#> 779                                                                                         Net income or loss from business this year – non-primary production2
#> 780                                                                                         Net income or loss from business this year – non-primary production2
#> 781                                                                                                          Net income or loss from business this year (total)2
#> 782                                                                                                          Net income or loss from business this year (total)2
#> 783                                                                               Deferred non-commercial business losses from a prior year – primary production
#> 784                                                                               Deferred non-commercial business losses from a prior year – primary production
#> 785                                                                           Deferred non-commercial business losses from a prior year – non-primary production
#> 786                                                                           Deferred non-commercial business losses from a prior year – non-primary production
#> 787                                                                                           Deferred non-commercial business losses from a prior year (total)2
#> 788                                                                                           Deferred non-commercial business losses from a prior year (total)2
#> 789                                                                                                        Net income or loss from business – primary production
#> 790                                                                                                        Net income or loss from business – primary production
#> 791                                                                                                    Net income or loss from business – non-primary production
#> 792                                                                                                    Net income or loss from business – non-primary production
#> 793                                                                                                                    Net income or loss from business (total)2
#> 794                                                                                                                    Net income or loss from business (total)2
#> 795                                                                                                                                                         <NA>
#> 796                                                                                                                Small business entity simplified depreciation
#> 797                                                                                                                                 Deduction for certain assets
#> 798                                                                                                                                 Deduction for certain assets
#> 799                                                                                                                    Deduction for general small business pool
#> 800                                                                                                                    Deduction for general small business pool
#> 801                                                                                                                                                         <NA>
#> 802                                                                                                                                     Temporary full expensing
#> 803                                                                                                                       Value of assets you are opting out for
#> 804                                                                                                                       Value of assets you are opting out for
#> 805                                                                                                                          Temporary full expensing deductions
#> 806                                                                                                                          Temporary full expensing deductions
#> 807                                                                                                                                                         <NA>
#> 808                                                                                                                                  Backing business investment
#> 809                                                                                                                       Value of assets you are opting out for
#> 810                                                                                                                       Value of assets you are opting out for
#> 811                                                                                                                                                         <NA>
#> 812                                                                                                                                         Small business boost
#> 813                                                                                                                     Small business skills and training boost
#> 814                                                                                                                     Small business skills and training boost
#> 815                                                                                                                   Small business technology investment boost
#> 816                                                                                                                   Small business technology investment boost
#> 817                                                                                                                                                         <NA>
#> 818                                                                                                                        Other business and professional items
#> 819                                                                                                                                                Trade debtors
#> 820                                                                                                                                                Trade debtors
#> 821                                                                                                                                              Trade creditors
#> 822                                                                                                                                              Trade creditors
#> 823                                                                                                                Salary and wage expenses - all other expenses
#> 824                                                                                                                Salary and wage expenses - all other expenses
#> 825                                                                             Salary and wage expenses - included in both cost of sales and all other expenses
#> 826                                                                             Salary and wage expenses - included in both cost of sales and all other expenses
#> 827                                                                                                                     Salary and wage expenses - cost of sales
#> 828                                                                                                                     Salary and wage expenses - cost of sales
#> 829                                                                                           Salary and wage expenses - cost of sales and/or all other expenses
#> 830                                                                                           Salary and wage expenses - cost of sales and/or all other expenses
#> 831                                                                                                                             Salary and wage expenses - blank
#> 832                                                                                                                             Salary and wage expenses - blank
#> 833                                                                                                                             Salary and wage expenses (total)
#> 834                                                                                                                             Salary and wage expenses (total)
#> 835                                                                                                                               Payments to associated persons
#> 836                                                                                                                               Payments to associated persons
#> 837                                                                                                                Intangible depreciating assets first deducted
#> 838                                                                                                                Intangible depreciating assets first deducted
#> 839                                                                                                                     Other depreciating assets first deducted
#> 840                                                                                                                     Other depreciating assets first deducted
#> 841                                                                                                          Termination value of intangible depreciating assets
#> 842                                                                                                          Termination value of intangible depreciating assets
#> 843                                                                                                               Termination value of other depreciating assets
#> 844                                                                                                               Termination value of other depreciating assets
#>              1978_79     1979_80     1980_81     1981_82     1982_83
#> 1    no.     6487440     6972725     7330715     7283495     8263255
#> 2    no.     5208120     5662415     5998375     5954875     6863065
#> 3    no.     1279320     1310310     1332340     1328625     1400190
#> 4    no.          na          na          na          na          na
#> 5    no.          na          na          na          na          na
#> 6    no.          na          na          na          na          na
#> 7    no.          na          na          na          na          na
#> 8    no.          na          na          na          na          na
#> 9   <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 10  <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 11   no.          na          na          na          na          na
#> 12   no.          na          na          na          na          na
#> 13   no.          na          na          na          na          na
#> 14   no.          na          na          na          na          na
#> 15   no.          na          na          na          na          na
#> 16   no.          na          na          na          na          na
#> 17   no.          na          na          na          na          na
#> 18   no.          na          na          na          na          na
#> 19   no.          na          na          na          na          na
#> 20   no.          na          na          na          na          na
#> 21   no.          na          na          na          na          na
#> 22  <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 23  <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 24   no.          na          na          na          na          na
#> 25   no.          na          na          na          na          na
#> 26   no.          na          na          na          na          na
#> 27   no.          na          na          na          na          na
#> 28  <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 29  <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 30   no.          na          na          na          na          na
#> 31   no.          na          na          na          na          na
#> 32   no.          na          na          na          na          na
#> 33   no.          na          na          na          na          na
#> 34   no.          na          na          na          na          na
#> 35   no.          na          na          na          na          na
#> 36   no.          na          na          na          na          na
#> 37   no.          na          na          na          na          na
#> 38   no.          na          na          na          na          na
#> 39   no.          na          na          na          na          na
#> 40   no.          na          na          na          na          na
#> 41   no.          na          na          na          na          na
#> 42   no.          na          na          na          na          na
#> 43  <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 44  <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 45   no.          na          na          na          na          na
#> 46     $ 11963381000 13864776000 16250870000 19524300000 23189347000
#> 47   no.          na          na          na          na          na
#> 48     $          na          na          na          na          na
#> 49   no.          na          na          na          na          na
#> 50     $          na          na          na          na          na
#> 51   no.          na          na          na          na          na
#> 52     $          na          na          na          na          na
#> 53   no.          na          na          na          na          na
#> 54     $          na          na          na          na          na
#> 55   no.          na          na          na          na          na
#> 56     $ 11078483000 14166311000 16614958000 19749428000 20921530000
#> 57   no.          na          na          na          na          na
#> 58     $          na          na          na          na          na
#> 59   no.          na          na          na          na          na
#> 60     $          na          na          na          na          na
#> 61   no.          na          na          na          na          na
#> 62     $          na          na          na          na          na
#> 63   no.          na          na          na          na          na
#> 64     $          na          na          na          na          na
#> 65   no.          na          na          na          na          na
#> 66     $          na          na          na          na          na
#> 67   no.          na          na          na          na          na
#> 68     $          na          na          na          na          na
#> 69   no.          na          na          na          na          na
#> 70     $          na          na          na          na          na
#> 71   no.          na          na          na          na          na
#> 72     $          na          na          na          na          na
#> 73   no.          na          na          na          na          na
#> 74     $          na          na          na          na          na
#> 75   no.          na          na          na          na          na
#> 76     $          na          na          na          na          na
#> 77   no.          na          na          na          na          na
#> 78     $          na          na          na          na          na
#> 79   no.          na          na          na          na          na
#> 80     $          na          na          na          na          na
#> 81   no.          na          na          na          na          na
#> 82     $          na          na          na          na          na
#> 83  <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 84  <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 85   no.     5260100     5482095     7965855     5878135     5786025
#> 86     $ 46659998000 54164429000 63427205000 74077557000 81185183000
#> 87   no.          na          na          na          na          na
#> 88     $          na          na          na          na          na
#> 89   no.      888685      936985     1068270     1161775     1157285
#> 90     $   407184000   457898000   583651000   694513000   795416000
#> 91   no.      663915      772515      823620      903860      817695
#> 92     $   328045000   442709000   551877000   709638000   851175000
#> 93   no.      267970      190630      201660      212515      269260
#> 94     $    55641000    56003000    71834000    89233000   157970000
#> 95   no.          na          na          na          na          na
#> 96     $          na          na          na          na          na
#> 97   no.          na          na          na          na          na
#> 98     $          na          na          na          na          na
#> 99   no.          na          na          na          na          na
#> 100    $          na          na          na          na          na
#> 101  no.          na          na          na          na          na
#> 102    $          na          na          na          na          na
#> 103  no.          na          na          na          na          na
#> 104    $          na          na          na          na          na
#> 105  no.          na          na          na          na          na
#> 106    $          na          na          na          na          na
#> 107  no.          na          na          na          na          na
#> 108    $          na          na          na          na          na
#> 109  no.          na          na          na          na          na
#> 110    $          na          na          na          na          na
#> 111  no.          na          na          na          na          na
#> 112    $          na          na          na          na          na
#> 113  no.      376755      374345      389145      416365      563770
#> 114    $   369950000   376346000   427233000   516585000   940266000
#> 115  no.      387700      390780      436510      468975      487260
#> 116    $   790362000   829115000   996250000  1159757000  1398263000
#> 117  no.          na          na          na          na          na
#> 118    $          na          na          na          na          na
#> 119  no.          na          na          na          na          na
#> 120    $          na          na          na          na          na
#> 121  no.          na          na          na          na          na
#> 122    $          na          na          na          na          na
#> 123  no.          na          na          na          na          na
#> 124    $          na          na          na          na          na
#> 125  no.          na          na          na          na          na
#> 126    $          na          na          na          na          na
#> 127  no.          na          na          na          na          na
#> 128    $          na          na          na          na          na
#> 129  no.          na          na          na          na          na
#> 130    $          na          na          na          na          na
#> 131  no.          na          na          na          na          na
#> 132    $          na          na          na          na          na
#> 133  no.          na          na          na          na          na
#> 134    $          na          na          na          na          na
#> 135  no.          na          na          na          na          na
#> 136    $          na          na          na          na          na
#> 137  no.          na          na          na          na          na
#> 138    $          na          na          na          na          na
#> 139  no.          na          na          na          na          na
#> 140    $          na          na          na          na          na
#> 141  no.          na          na          na          na          na
#> 142    $          na          na          na          na          na
#> 143  no.          na          na          na          na          na
#> 144    $          na          na          na          na          na
#> 145 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 146  no.          na          na          na          na          na
#> 147    $          na  2289706000  2771047000  3907659000          na
#> 148  no.          na          na          na          na          na
#> 149    $          na          na          na          na          na
#> 150  no.          na          na          na          na          na
#> 151    $          na          na          na          na          na
#> 152  no.          na          na          na          na          na
#> 153    $          na          na          na          na          na
#> 154  no.          na          na          na          na          na
#> 155    $          na          na          na          na          na
#> 156  no.          na          na          na          na          na
#> 157    $          na          na          na          na          na
#> 158  no.          na          na          na          na          na
#> 159    $          na          na          na          na          na
#> 160  no.          na          na          na          na          na
#> 161    $          na          na          na          na          na
#> 162  no.          na          na          na          na          na
#> 163    $          na          na          na          na          na
#> 164  no.          na          na          na          na          na
#> 165    $          na          na          na          na          na
#> 166  no.          na          na          na          na          na
#> 167    $          na          na          na          na          na
#> 168  no.          na          na          na          na          na
#> 169    $          na          na          na          na          na
#> 170  no.          na          na          na          na          na
#> 171    $          na          na          na          na          na
#> 172  no.          na          na          na          na          na
#> 173    $          na          na          na          na          na
#> 174  no.          na          na          na          na          na
#> 175    $          na          na          na          na          na
#> 176  no.          na          na          na          na          na
#> 177    $          na          na          na          na          na
#> 178 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 179 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 180  no.          na          na          na          na          na
#> 181    $          na          na          na          na          na
#> 182  no.          na          na          na          na          na
#> 183    $          na          na          na          na          na
#> 184  no.          na          na          na          na          na
#> 185    $          na          na          na          na          na
#> 186  no.          na          na          na          na          na
#> 187    $          na          na          na          na          na
#> 188  no.          na          na          na          na          na
#> 189    $          na          na          na          na          na
#> 190  no.          na          na          na          na          na
#> 191    $          na          na          na          na          na
#> 192  no.          na          na          na          na          na
#> 193    $          na          na          na          na          na
#> 194  no.          na          na          na          na          na
#> 195    $          na          na          na          na          na
#> 196  no.          na          na          na          na          na
#> 197    $          na          na          na          na          na
#> 198  no.          na          na          na          na          na
#> 199    $          na          na          na          na          na
#> 200  no.          na          na          na          na          na
#> 201    $          na          na          na          na          na
#> 202  no.          na          na          na          na          na
#> 203    $          na          na          na          na          na
#> 204  no.          na          na          na          na          na
#> 205    $          na          na          na          na          na
#> 206  no.          na          na          na          na          na
#> 207    $          na          na          na          na          na
#> 208  no.          na          na          na          na          na
#> 209    $          na          na          na          na          na
#> 210  no.          na          na          na          na          na
#> 211    $          na          na          na          na          na
#> 212  no.          na          na          na          na          na
#> 213    $          na          na          na          na          na
#> 214  no.          na          na          na          na          na
#> 215    $          na          na          na          na          na
#> 216  no.          na          na          na          na          na
#> 217    $          na          na          na          na          na
#> 218  no.          na          na          na          na          na
#> 219    $          na          na          na          na          na
#> 220  no.          na          na          na          na          na
#> 221    $          na          na          na          na          na
#> 222  no.          na          na          na          na          na
#> 223    $          na          na          na          na          na
#> 224  no.          na          na          na          na          na
#> 225    $    58694000    68456000   122140000   152243000   199689000
#> 226  no.     1220190     1270935     1378025     1548180     1761740
#> 227    $    37252000    42839000    51827000    64812000    81677000
#> 228  no.          na          na          na          na          na
#> 229    $          na          na          na          na          na
#> 230  no.          na          na          na          na          na
#> 231    $          na          na          na          na          na
#> 232  no.          na          na          na          na          na
#> 233    $          na          na          na          na          na
#> 234  no.          na          na          na          na          na
#> 235    $          na          na          na          na          na
#> 236  no.          na          na          na          na          na
#> 237    $          na          na          na          na          na
#> 238 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 239 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 240  no.          na          na          na          na          na
#> 241    $          na          na          na          na          na
#> 242 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 243 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 244  no.          na          na          na          na          na
#> 245    $          na          na          na          na          na
#> 246  no.          na          na          na          na          na
#> 247    $          na          na          na          na          na
#> 248  no.          na          na          na          na          na
#> 249    $          na          na          na          na          na
#> 250  no.          na          na          na          na          na
#> 251    $          na          na          na          na          na
#> 252  no.          na          na          na          na          na
#> 253    $          na          na          na          na          na
#> 254  no.          na          na          na          na          na
#> 255    $          na          na          na          na          na
#> 256 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 257 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 258  no.          na          na          na          na          na
#> 259    $          na          na          na          na          na
#> 260 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 261  no.          na          na          na          na          na
#> 262    $ 57563107000 68078291000 79045481000 91064326000 99671894000
#> 263 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 264 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 265  no.          na          na          na          na          na
#> 266    $          na          na          na          na          na
#> 267  no.          na          na          na          na          na
#> 268    $          na          na          na          na          na
#> 269  no.          na          na          na          na          na
#> 270    $          na          na          na          na          na
#> 271 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 272 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 273  no.          na          na          na          na          na
#> 274    $          na          na          na          na          na
#> 275  no.          na          na          na          na          na
#> 276    $          na          na          na          na          na
#> 277  no.          na          na          na          na          na
#> 278    $          na          na          na          na          na
#> 279  no.          na          na          na          na          na
#> 280    $          na          na          na          na          na
#> 281  no.          na          na          na          na          na
#> 282    $          na          na          na          na          na
#> 283  no.      191280      228675      196985      166960      107355
#> 284    $   157398000   209004000   162671000   121951000    55798000
#> 285  no.          na          na          na          na          na
#> 286    $          na          na          na          na          na
#> 287  no.          na          na          na          na          na
#> 288    $          na          na          na          na          na
#> 289  no.          na          na          na          na          na
#> 290    $          na          na          na          na          na
#> 291  no.          na          na          na          na          na
#> 292    $          na          na          na          na          na
#> 293 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 294 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 295  no.     5172940     5449150     5731260     5890925     5798180
#> 296    $ 10156840000 12302871000 14609565000 18037070000 19634850000
#> 297  no.          na          na          na          na          na
#> 298    $          na          na          na          na          na
#> 299 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 300 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 301  no.          na          na          na          na          na
#> 302  no.          na          na          na          na          na
#> 303    $          na          na          na          na          na
#> 304  no.          na          na          na          na          na
#> 305    $          na          na          na          na          na
#> 306  no.          na          na          na          na          na
#> 307    $          na          na          na          na          na
#> 308  no.          na          na          na          na          na
#> 309    $          na          na          na          na          na
#> 310 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 311 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 312  no.          na          na          na          na          na
#> 313    $          na          na          na          na          na
#> 314  no.          na          na          na          na          na
#> 315    $          na          na          na          na          na
#> 316  no.          na          na          na          na          na
#> 317    $          na          na          na          na  2499972000
#> 318 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 319 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 320  no.          na          na          na          na          na
#> 321    $          na          na          na          na          na
#> 322  no.          na          na          na          na          na
#> 323    $          na          na          na          na          na
#> 324  no.          na          na          na          na          na
#> 325    $          na          na          na          na          na
#> 326  no.          na          na          na          na          na
#> 327    $          na          na          na          na          na
#> 328  no.          na          na          na          na          na
#> 329    $          na          na          na          na          na
#> 330  no.          na          na          na          na          na
#> 331    $          na          na          na          na          na
#> 332  no.          na          na          na          na          na
#> 333    $          na          na          na          na          na
#> 334  no.          na          na          na          na          na
#> 335    $          na          na          na          na          na
#> 336 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 337 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 338  no.          na          na          na          na          na
#> 339    $          na          na          na          na          na
#> 340  no.          na          na          na          na          na
#> 341    $          na          na          na          na          na
#> 342  no.          na          na          na          na          na
#> 343    $          na          na          na          na          na
#> 344  no.          na          na          na          na          na
#> 345    $          na          na          na          na          na
#> 346  no.          na          na          na          na          na
#> 347    $          na          na          na          na          na
#> 348  no.          na          na          na          na          na
#> 349    $          na          na          na          na          na
#> 350  no.          na          na          na          na          na
#> 351    $          na          na          na          na          na
#> 352  no.          na          na          na          na          na
#> 353    $          na          na          na          na          na
#> 354  no.          na          na          na          na          na
#> 355    $          na          na          na          na          na
#> 356 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 357 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 358 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 359  no.          na          na          na          na          na
#> 360    $          na          na          na          na          na
#> 361  no.          na          na          na          na          na
#> 362    $          na          na          na          na          na
#> 363  no.          na          na          na          na          na
#> 364    $          na          na          na          na          na
#> 365  no.          na          na          na          na          na
#> 366    $          na          na          na          na          na
#> 367  no.          na          na          na          na          na
#> 368    $          na          na          na          na          na
#> 369  no.          na          na          na          na          na
#> 370    $          na          na          na          na          na
#> 371  no.          na          na          na          na          na
#> 372    $          na          na          na          na          na
#> 373  no.          na          na          na          na          na
#> 374    $          na          na          na          na          na
#> 375  no.          na          na          na          na          na
#> 376    $          na          na          na          na          na
#> 377  no.          na          na          na          na          na
#> 378    $          na          na          na          na          na
#> 379  no.          na          na          na          na          na
#> 380    $          na          na          na          na          na
#> 381  no.          na          na          na          na          na
#> 382    $          na          na          na          na          na
#> 383  no.      275670      353240      364295      365675      355120
#> 384    $  1475219000  2027416000  1701948000  1388910000   366007000
#> 385 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 386 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 387  no.          na          na          na          na          na
#> 388    $          na          na          na          na          na
#> 389  no.          na          na          na          na          na
#> 390    $          na          na          na          na          na
#> 391  no.          na          na          na          na          na
#> 392    $          na          na          na          na          na
#> 393  no.          na          na          na          na          na
#> 394    $          na          na          na          na          na
#> 395  no.          na          na          na          na          na
#> 396    $          na          na          na          na          na
#> 397  no.          na          na          na          na          na
#> 398    $          na          na          na          na          na
#> 399  no.          na          na          na          na          na
#> 400    $          na          na          na          na          na
#> 401  no.          na          na          na          na          na
#> 402    $          na          na          na          na          na
#> 403  no.          na          na          na          na          na
#> 404    $          na          na          na          na          na
#> 405  no.          na          na          na          na          na
#> 406    $          na          na          na          na          na
#> 407  no.          na          na          na          na          na
#> 408    $          na          na          na          na          na
#> 409  no.          na          na          na          na          na
#> 410    $          na          na          na          na          na
#> 411  no.          na          na          na          na          na
#> 412    $          na          na          na          na          na
#> 413  no.      884390     1047915     1128755     1168685     1217535
#> 414    $  3935344000  4999382000  5820810000  6289912000  6533663000
#> 415 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 416  no.          na          na          na          na          na
#> 417    $          na          na          na          na          na
#> 418  no.          na          na          na          na          na
#> 419    $          na          na          na          na          na
#> 420  no.          na          na          na          na          na
#> 421    $          na          na          na          na          na
#> 422  no.          na          na          na          na          na
#> 423    $          na          na          na          na          na
#> 424  no.          na          na          na          na          na
#> 425    $          na          na          na          na          na
#> 426  no.          na          na     1299935     1328695     1373650
#> 427    $  5410563000  7026798000  7522759000  7678822000  7009581000
#> 428 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 429  no.          na          na          na          na          na
#> 430    $          na          na          na          na          na
#> 431  no.          na          na          na          na          na
#> 432    $          na          na          na          na          na
#> 433 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 434 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 435  no.          na          na          na          na          na
#> 436    $          na          na          na          na          na
#> 437  no.          na          na          na          na          na
#> 438    $          na          na          na          na          na
#> 439  no.          na          na          na          na          na
#> 440    $          na          na          na          na          na
#> 441  no.          na          na          na          na          na
#> 442    $          na          na          na          na          na
#> 443  no.          na          na          na          na          na
#> 444    $          na          na          na          na          na
#> 445  no.          na          na          na          na          na
#> 446    $          na          na          na          na          na
#> 447  no.          na          na          na          na          na
#> 448    $          na          na          na          na          na
#> 449 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 450 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 451  no.          na          na          na          na          na
#> 452    $          na          na          na          na          na
#> 453  no.          na          na          na          na          na
#> 454    $          na          na          na          na          na
#> 455  no.          na          na          na          na          na
#> 456    $          na          na          na          na          na
#> 457  no.          na          na          na          na          na
#> 458    $          na          na          na          na          na
#> 459 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 460 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 461  no.       85290      113870      115110      113475      111945
#> 462    $   280103000   322659000   175012000    87331000  -104784000
#> 463  no.      209180      287835      303930      317605      324765
#> 464    $  1163344000  1689002000  1907287000  1881573000  1965133000
#> 465  no.          na          na          na          na          na
#> 466    $          na          na          na          na          na
#> 467  no.          na          na          na          na          na
#> 468    $          na          na          na          na          na
#> 469  no.          na          na          na          na          na
#> 470    $          na          na          na          na          na
#> 471  no.          na          na          na          na          na
#> 472    $          na          na          na          na          na
#> 473  no.          na          na          na          na          na
#> 474    $          na          na          na          na          na
#> 475  no.          na          na          na          na          na
#> 476    $          na          na          na          na          na
#> 477 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 478 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 479  no.          na          na          na          na          na
#> 480    $          na          na          na          na          na
#> 481  no.          na          na          na          na          na
#> 482    $          na          na          na          na          na
#> 483  no.          na          na          na          na          na
#> 484    $          na          na          na          na          na
#> 485  no.          na          na          na          na          na
#> 486    $          na          na          na          na          na
#> 487 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 488 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 489  no.          na          na          na          na          na
#> 490    $          na          na          na          na          na
#> 491  no.          na          na          na          na          na
#> 492    $          na          na          na          na          na
#> 493  no.          na          na          na          na          na
#> 494    $          na          na          na          na          na
#> 495  no.          na          na          na          na          na
#> 496    $          na          na          na          na          na
#> 497  no.          na          na          na          na          na
#> 498    $          na          na          na          na          na
#> 499  no.          na          na          na          na          na
#> 500    $          na          na          na          na          na
#> 501 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 502 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 503  no.          na          na          na          na          na
#> 504    $          na          na          na          na          na
#> 505  no.          na          na          na          na          na
#> 506    $          na          na          na          na          na
#> 507  no.          na          na          na          na          na
#> 508    $          na          na          na          na          na
#> 509  no.          na          na          na          na          na
#> 510    $          na          na          na          na          na
#> 511 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 512 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 513  no.          na          na          na          na          na
#> 514    $          na          na          na          na          na
#> 515  no.          na          na          na          na          na
#> 516    $          na          na          na          na          na
#> 517 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 518 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 519  no.          na          na          na          na          na
#> 520    $          na          na          na          na          na
#> 521  no.          na          na          na          na          na
#> 522    $          na          na          na          na          na
#> 523  no.          na          na          na          na          na
#> 524    $          na          na          na          na          na
#> 525  no.          na          na          na          na          na
#> 526    $          na          na          na          na          na
#> 527  no.          na          na          na          na          na
#> 528    $          na          na          na          na          na
#> 529  no.          na          na          na          na          na
#> 530    $          na          na          na          na          na
#> 531  no.          na          na          na          na          na
#> 532    $          na          na          na          na          na
#> 533  no.          na          na          na          na          na
#> 534    $          na          na          na          na          na
#> 535  no.          na          na          na          na          na
#> 536    $          na          na          na          na          na
#> 537  no.          na          na          na          na          na
#> 538    $          na          na          na          na          na
#> 539 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 540 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 541  no.      274040      330065      367140      398840          na
#> 542    $   736666000   991812000  1188078000  1433287000          na
#> 543  no.          na          na          na          na          na
#> 544    $          na          na          na          na          na
#> 545  no.          na          na          na          na          na
#> 546    $          na          na          na          na          na
#> 547  no.          na          na          na          na          na
#> 548    $          na          na          na          na          na
#> 549  no.          na          na          na          na          na
#> 550    $          na          na          na          na          na
#> 551  no.          na          na          na          na          na
#> 552    $          na          na          na          na          na
#> 553  no.          na          na          na          na          na
#> 554  no.          na          na          na          na          na
#> 555    $          na          na          na          na          na
#> 556  no.          na          na          na          na          na
#> 557    $          na          na          na          na          na
#> 558 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 559  no.          na          na          na          na          na
#> 560    $          na          na          na          na          na
#> 561  no.          na          na          na          na          na
#> 562    $          na          na          na          na          na
#> 563  no.          na          na          na          na          na
#> 564    $          na          na          na          na          na
#> 565  no.          na          na          na          na          na
#> 566    $          na          na          na          na          na
#> 567  no.          na          na          na          na          na
#> 568    $          na          na          na          na          na
#> 569  no.          na          na          na          na          na
#> 570    $          na          na          na          na          na
#> 571  no.          na          na          na          na          na
#> 572    $          na          na          na          na          na
#> 573  no.          na          na          na          na          na
#> 574    $          na          na          na          na          na
#> 575  no.          na          na          na          na          na
#> 576    $          na          na          na          na          na
#> 577  no.          na          na          na          na          na
#> 578    $          na          na          na          na          na
#> 579  no.          na          na          na          na          na
#> 580    $          na          na          na          na          na
#> 581  no.          na          na          na          na          na
#> 582    $          na          na          na          na          na
#> 583 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 584 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 585  no.          na          na          na          na          na
#> 586    $          na          na          na          na          na
#> 587  no.          na          na          na          na          na
#> 588    $          na          na          na          na          na
#> 589  no.          na          na          na          na          na
#> 590    $          na          na          na          na          na
#> 591  no.          na          na          na          na          na
#> 592    $          na          na          na          na          na
#> 593  no.          na          na          na          na          na
#> 594    $          na          na          na          na          na
#> 595  no.     2650310          na     2876865     3101075     3214620
#> 596    $   507398000   550810000   700771000   889926000  1065032000
#> 597  no.          na          na          na          na          na
#> 598    $          na          na          na          na          na
#> 599 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 600 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 601  no.          na          na          na          na          na
#> 602    $          na          na          na          na          na
#> 603  no.      259205      466345      303035      322155      332880
#> 604    $    33072000    46061000    43311000    85717000    93166000
#> 605  no.          na          na          na          na          na
#> 606    $     6774000     3830000     5728000     5800000     5530000
#> 607  no.          na          na          na          na          na
#> 608    $          na          na          na          na          na
#> 609  no.          na          na          na          na          na
#> 610    $          na          na          na          na          na
#> 611  no.          na          na          na          na          na
#> 612    $          na          na          na          na          na
#> 613  no.          na          na          na          na          na
#> 614    $          na          na          na          na          na
#> 615  no.          na          na          na          na          na
#> 616    $          na          na          na          na          na
#> 617  no.          na          na          na          na          na
#> 618    $          na          na          na          na          na
#> 619  no.          na          na          na          na          na
#> 620    $          na          na          na          na          na
#> 621  no.          na          na          na          na          na
#> 622    $          na          na          na          na          na
#> 623  no.          na          na          na          na          na
#> 624    $          na          na          na          na          na
#> 625  no.          na          na          na          na          na
#> 626    $          na          na          na          na          na
#> 627  no.          na          na          na          na          na
#> 628    $          na          na          na          na          na
#> 629  no.          na          na          na          na          na
#> 630    $          na          na          na          na          na
#> 631  no.          na          na          na          na          na
#> 632    $          na          na          na          na          na
#> 633  no.          na          na          na          na          na
#> 634    $          na          na          na          na          na
#> 635  no.          na          na          na          na          na
#> 636    $          na          na          na          na          na
#> 637 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 638 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 639  no.          na          na          na          na          na
#> 640    $          na          na          na          na          na
#> 641 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 642 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 643  no.          na          na          na          na          na
#> 644    $          na          na          na          na          na
#> 645 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 646 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 647 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 648  no.          na          na          na          na          na
#> 649    $          na          na          na          na          na
#> 650  no.          na          na          na          na          na
#> 651    $          na          na          na          na          na
#> 652  no.          na          na          na          na          na
#> 653    $          na          na          na          na          na
#> 654  no.          na          na          na          na          na
#> 655    $          na          na          na          na          na
#> 656  no.          na          na          na          na          na
#> 657    $          na          na          na          na          na
#> 658  no.          na          na          na          na          na
#> 659    $          na          na          na          na          na
#> 660  no.          na          na          na          na          na
#> 661    $          na          na          na          na          na
#> 662 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 663  no.          na          na          na          na          na
#> 664 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 665 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 666 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 667  no.          na          na          na          na          na
#> 668    $          na          na          na          na          na
#> 669  no.          na          na          na          na          na
#> 670    $          na          na          na          na          na
#> 671  no.          na          na          na          na          na
#> 672    $          na          na          na          na          na
#> 673  no.          na          na          na          na          na
#> 674    $          na          na          na          na          na
#> 675  no.          na          na          na          na          na
#> 676    $          na          na          na          na          na
#> 677  no.          na          na          na          na          na
#> 678    $          na          na          na          na          na
#> 679  no.          na          na          na          na          na
#> 680    $          na          na          na          na          na
#> 681  no.          na          na          na          na          na
#> 682    $          na          na          na          na          na
#> 683  no.          na          na          na          na          na
#> 684    $          na          na          na          na          na
#> 685  no.          na          na          na          na          na
#> 686    $          na          na          na          na          na
#> 687  no.          na          na          na          na          na
#> 688    $          na          na          na          na          na
#> 689  no.          na          na          na          na          na
#> 690    $          na          na          na          na          na
#> 691  no.          na          na          na          na          na
#> 692    $          na          na          na          na          na
#> 693  no.          na          na          na          na          na
#> 694    $          na          na          na          na          na
#> 695  no.          na          na          na          na          na
#> 696    $          na          na          na          na          na
#> 697  no.          na          na          na          na          na
#> 698    $          na          na          na          na          na
#> 699  no.          na          na          na          na          na
#> 700    $          na          na          na          na          na
#> 701  no.          na          na      112135      110230      111460
#> 702    $          na          na  1389415000  1389070000  1263709000
#> 703  no.          na          na      301680      315305      325100
#> 704    $          na          na  5769025000  6214832000  7056817000
#> 705  no.      318925      383250      396100      408715      360730
#> 706    $  4436838000  6525294000  7158024000  7603900000  8320526000
#> 707 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 708 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 709  no.       86320          na      100160       98990       96980
#> 710    $   373009000   604609000   670365000   708217000   739144000
#> 711  no.       79890       94695       92140       91340       84985
#> 712    $  1769185000  2537786000  2716362000  2836287000  2888305000
#> 713  no.          na          na          na          na          na
#> 714    $          na          na          na          na          na
#> 715  no.          na          na          na          na          na
#> 716    $          na          na          na          na          na
#> 717  no.          na          na          na          na          na
#> 718    $          na          na          na          na          na
#> 719  no.          na          na          na          na          na
#> 720    $          na          na          na          na          na
#> 721  no.       87730      105165      101845      101140       99005
#> 722    $   440705000   698495000   734172000   753990000   753027000
#> 723  no.          na          na          na          na          na
#> 724    $          na          na          na          na          na
#> 725  no.          na          na          na          na          na
#> 726    $          na          na          na          na          na
#> 727  no.          na          na          na          na          na
#> 728    $          na          na          na          na          na
#> 729  no.          na          na          na          na          na
#> 730    $          na          na          na          na          na
#> 731  no.          na          na          na          na          na
#> 732    $          na          na          na          na          na
#> 733  no.          na       53810       56680       53185       53600
#> 734    $          na   155412000   188736000   202970000   217830000
#> 735  no.          na          na          na          na          na
#> 736    $          na          na          na          na          na
#> 737  no.          na          na          na          na          na
#> 738    $          na          na          na          na          na
#> 739  no.          na          na          na          na          na
#> 740    $          na          na          na          na          na
#> 741  no.          na          na          na          na          na
#> 742    $          na          na          na          na          na
#> 743  no.          na          na          na          na          na
#> 744    $          na          na          na          na          na
#> 745  no.          na          na          na          na          na
#> 746    $          na          na          na          na          na
#> 747  no.          na          na          na          na          na
#> 748    $          na          na          na          na          na
#> 749  no.          na          na          na          na          na
#> 750    $          na          na          na          na          na
#> 751  no.          na          na          na          na          na
#> 752    $          na          na          na          na          na
#> 753  no.          na      358455          na          na          na
#> 754    $          na   299202000          na          na          na
#> 755  no.          na          na          na          na          na
#> 756    $          na          na          na          na          na
#> 757  no.          na          na          na          na          na
#> 758    $          na          na          na          na          na
#> 759  no.          na          na          na          na          na
#> 760    $          na          na          na          na          na
#> 761  no.          na          na          na          na          na
#> 762    $          na          na          na          na          na
#> 763 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 764 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 765  no.          na          na          na          na          na
#> 766    $          na          na          na          na          na
#> 767  no.          na          na          na          na          na
#> 768    $          na          na          na          na          na
#> 769  no.          na          na          na          na          na
#> 770    $          na          na          na          na          na
#> 771  no.          na          na          na          na          na
#> 772    $          na          na          na          na          na
#> 773  no.          na          na          na          na          na
#> 774    $          na          na          na          na          na
#> 775 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 776 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 777  no.          na          na          na          na          na
#> 778    $          na          na          na          na          na
#> 779  no.          na          na          na          na          na
#> 780    $          na          na          na          na          na
#> 781  no.          na          na          na          na          na
#> 782    $          na          na          na          na          na
#> 783  no.          na          na          na          na          na
#> 784    $          na          na          na          na          na
#> 785  no.          na          na          na          na          na
#> 786    $          na          na          na          na          na
#> 787  no.          na          na          na          na          na
#> 788    $          na          na          na          na          na
#> 789  no.       85290      113870      115110      113475      111945
#> 790    $   280103000   322659000   175012000    87331000  -104784000
#> 791  no.      209180      287835      303930      317605      324765
#> 792    $  1163344000  1689002000  1907287000  1881573000  1965133000
#> 793  no.          na          na      400630      413640      420525
#> 794    $  1443447000  2011661000  1997598000  1968903000  1860350000
#> 795 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 796 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 797  no.          na          na          na          na          na
#> 798    $          na          na          na          na          na
#> 799  no.          na          na          na          na          na
#> 800    $          na          na          na          na          na
#> 801 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 802 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 803  no.          na          na          na          na          na
#> 804    $          na          na          na          na          na
#> 805  no.          na          na          na          na          na
#> 806    $          na          na          na          na          na
#> 807 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 808 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 809  no.          na          na          na          na          na
#> 810    $          na          na          na          na          na
#> 811 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 812 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 813  no.          na          na          na          na          na
#> 814    $          na          na          na          na          na
#> 815  no.          na          na          na          na          na
#> 816    $          na          na          na          na          na
#> 817 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 818 <NA>        <NA>        <NA>        <NA>        <NA>        <NA>
#> 819  no.          na          na          na          na          na
#> 820    $          na          na          na          na          na
#> 821  no.          na          na          na          na          na
#> 822    $          na          na          na          na          na
#> 823  no.          na          na          na          na          na
#> 824    $          na          na          na          na          na
#> 825  no.          na          na          na          na          na
#> 826    $          na          na          na          na          na
#> 827  no.          na          na          na          na          na
#> 828    $          na          na          na          na          na
#> 829  no.          na          na          na          na          na
#> 830    $          na          na          na          na          na
#> 831  no.          na          na          na          na          na
#> 832    $          na          na          na          na          na
#> 833  no.       96420      133045      132500      131070      129325
#> 834    $   642293000  1002053000  1086952000  1132165000  1152805000
#> 835  no.          na          na          na          na          na
#> 836    $          na          na          na          na          na
#> 837  no.          na          na          na          na          na
#> 838    $          na          na          na          na          na
#> 839  no.          na          na          na          na          na
#> 840    $          na          na          na          na          na
#> 841  no.          na          na          na          na          na
#> 842    $          na          na          na          na          na
#> 843  no.          na          na          na          na          na
#> 844    $          na          na          na          na          na
#>          1983_84      1984_85      1985_86      1986_87      1987_88
#> 1        7604885      7813965      8200615      8343795      8874210
#> 2        6338015      6546545      6966075      7181865      7629455
#> 3        1266865      1267420      1234540      1161930      1244760
#> 4             na           na      4626495      4647105      4914610
#> 5             na           na      3574115      3696690      3959605
#> 6             na           na           na           na           na
#> 7             na           na      8178465      8324365      8852485
#> 8             na           na        22150        19430        21725
#> 9           <NA>         <NA>         <NA>         <NA>         <NA>
#> 10          <NA>         <NA>         <NA>         <NA>         <NA>
#> 11            na           na      2819065      2834990      3007325
#> 12            na           na      2205755      2249570      2377890
#> 13            na           na      1245295      1287345      1399320
#> 14            na           na       768030       791370       842390
#> 15            na           na       727030       738755       776725
#> 16            na           na       222585       224295       234820
#> 17            na           na       145375       148970       163135
#> 18            na           na        67475        68505        72610
#> 19            na           na           na           na           na
#> 20            na           na           na           na           na
#> 21            na           na           na           na           na
#> 22          <NA>         <NA>         <NA>         <NA>         <NA>
#> 23          <NA>         <NA>         <NA>         <NA>         <NA>
#> 24            na           na      4982355      5148340      5559020
#> 25            na           na           na           na           na
#> 26            na           na      3218260      3195450      3315195
#> 27            na           na           na           na           na
#> 28          <NA>         <NA>         <NA>         <NA>         <NA>
#> 29          <NA>         <NA>         <NA>         <NA>         <NA>
#> 30            na           na           na           na        95205
#> 31            na           na           na           na      1433345
#> 32            na           na           na           na      1195045
#> 33            na           na           na           na      2105920
#> 34            na           na           na           na         <NA>
#> 35            na           na           na           na      1703515
#> 36            na           na           na           na         <NA>
#> 37            na           na           na           na      1080020
#> 38            na           na           na           na         <NA>
#> 39            na           na           na           na       426880
#> 40            na           na           na           na       306615
#> 41            na           na           na           na       527670
#> 42            na           na           na           na         <NA>
#> 43          <NA>         <NA>         <NA>         <NA>         <NA>
#> 44          <NA>         <NA>         <NA>         <NA>         <NA>
#> 45            na           na           na           na           na
#> 46   24979318000  26955710000  31453890000  35290505000  40085000000
#> 47         75230        70375        58185        38110        35335
#> 48      21684000     18795000     14655000      9446000      9000000
#> 49       5438400      5555965           na           na           na
#> 50     395614000   1035350000   1182668000   1499599000   1865000000
#> 51            na           na           na           na           na
#> 52            na           na           na           na           na
#> 53            na           na           na           na           na
#> 54            na           na           na           na           na
#> 55            na           na           na           na           na
#> 56   23823666000  26420394000  31031250000  35180080000  38945000000
#> 57            na           na           na           na           na
#> 58            na           na           na           na           na
#> 59            na           na           na           na           na
#> 60            na           na           na           na           na
#> 61            na           na           na           na           na
#> 62            na           na           na     43000000    126000000
#> 63            na           na           na           na           na
#> 64            na           na           na           na           na
#> 65            na           na           na           na           na
#> 66            na           na           na           na           na
#> 67            na           na           na           na           na
#> 68            na           na           na           na           na
#> 69            na           na           na           na           na
#> 70            na           na           na           na           na
#> 71            na           na           na           na           na
#> 72            na           na           na           na           na
#> 73            na           na           na           na           na
#> 74            na           na           na           na           na
#> 75            na           na           na           na           na
#> 76            na           na           na           na           na
#> 77            na           na           na           na           na
#> 78            na           na           na           na           na
#> 79            na           na           na           na           na
#> 80            na           na           na           na           na
#> 81            na           na           na           na           na
#> 82            na           na           na           na           na
#> 83          <NA>         <NA>         <NA>         <NA>         <NA>
#> 84          <NA>         <NA>         <NA>         <NA>         <NA>
#> 85       5833440      7038300      6352480      6413555      6910315
#> 86   86093387000  95085801000 105596678000 113735152000 130719000000
#> 87            na           na           na           na           na
#> 88            na           na           na           na           na
#> 89       1180365      1260270      1405685      1467685      1548965
#> 90     852469000    982466000   1099359000    999761000   1074000000
#> 91        793070       816315       985195       984285      1082665
#> 92     879147000    959813000   1315506000   1487539000   1835000000
#> 93        191795       131065       139870       125025       128965
#> 94     123637000     25143000     44497000     33726000     40000000
#> 95            na           na           na           na           na
#> 96            na           na           na           na           na
#> 97            na           na           na           na           na
#> 98            na           na           na           na           na
#> 99            na           na           na           na           na
#> 100           na           na           na           na           na
#> 101           na           na           na           na           na
#> 102           na           na           na           na           na
#> 103           na           na           na           na           na
#> 104           na           na           na           na           na
#> 105           na           na           na           na           na
#> 106           na           na           na           na           na
#> 107           na           na           na           na           na
#> 108           na           na           na           na           na
#> 109           na           na           na           na           na
#> 110           na           na           na           na           na
#> 111           na           na           na           na           na
#> 112           na           na           na           na           na
#> 113       573755       547305       619795       714260       560515
#> 114   1143755000   1117208000   1508391000   1760166048   1401000000
#> 115       505085       503070       553615       598340       657030
#> 116   1459831000   1601206000   1945987000   2260545000   2875000000
#> 117           na           na           na           na           na
#> 118           na           na           na           na           na
#> 119           na           na           na           na           na
#> 120           na           na           na           na           na
#> 121           na           na           na           na           na
#> 122           na           na           na           na           na
#> 123           na           na           na           na           na
#> 124           na           na           na           na           na
#> 125           na           na           na           na           na
#> 126           na           na           na           na           na
#> 127           na           na           na           na           na
#> 128           na           na           na           na           na
#> 129           na           na           na           na           na
#> 130           na           na           na           na           na
#> 131           na           na           na           na           na
#> 132           na           na           na           na           na
#> 133           na           na           na           na           na
#> 134           na           na           na           na           na
#> 135           na           na           na           na           na
#> 136           na           na           na           na           na
#> 137           na           na           na           na           na
#> 138           na           na           na           na           na
#> 139           na           na           na           na           na
#> 140           na           na           na           na           na
#> 141           na           na           na           na           na
#> 142           na           na           na           na           na
#> 143           na           na           na           na           na
#> 144           na           na           na           na           na
#> 145         <NA>         <NA>         <NA>         <NA>         <NA>
#> 146           na           na           na      4646215      5435580
#> 147   5075827000   5649374000   7206195000   8710649000   8486000000
#> 148           na           na           na           na           na
#> 149           na           na           na           na           na
#> 150           na           na           na           na           na
#> 151           na           na           na           na           na
#> 152           na           na           na           na       495790
#> 153           na           na           na           na   1101000000
#> 154           na           na           na           na       561390
#> 155           na           na           na           na   1332000000
#> 156           na           na           na           na           na
#> 157           na           na           na           na           na
#> 158           na           na           na           na           na
#> 159           na           na           na           na           na
#> 160           na           na           na           na           na
#> 161           na           na           na           na           na
#> 162           na           na           na           na           na
#> 163           na           na           na           na           na
#> 164           na           na           na           na           na
#> 165           na           na           na           na           na
#> 166           na           na           na           na           na
#> 167           na           na           na           na           na
#> 168           na           na           na           na           na
#> 169           na           na           na           na           na
#> 170           na           na           na           na           na
#> 171           na           na           na           na           na
#> 172           na           na           na           na           na
#> 173           na           na           na           na           na
#> 174           na           na           na           na           na
#> 175           na           na           na           na           na
#> 176           na           na           na           na           na
#> 177           na           na           na           na           na
#> 178         <NA>         <NA>         <NA>         <NA>         <NA>
#> 179         <NA>         <NA>         <NA>         <NA>         <NA>
#> 180           na           na           na           na           na
#> 181           na           na           na           na           na
#> 182           na           na           na           na           na
#> 183           na           na           na           na           na
#> 184           na           na           na           na           na
#> 185           na           na           na           na           na
#> 186           na           na           na           na           na
#> 187           na           na           na           na           na
#> 188           na           na           na           na           na
#> 189           na           na           na           na           na
#> 190           na           na           na           na           na
#> 191           na           na           na           na           na
#> 192           na           na           na           na           na
#> 193           na           na           na           na           na
#> 194           na           na           na           na           na
#> 195           na           na           na           na           na
#> 196           na           na           na           na           na
#> 197           na           na           na           na           na
#> 198           na           na           na           na           na
#> 199           na           na           na           na           na
#> 200           na           na           na           na           na
#> 201           na           na           na           na           na
#> 202           na           na           na           na           na
#> 203           na           na           na           na           na
#> 204           na           na           na           na           na
#> 205           na           na           na           na           na
#> 206           na           na           na           na           na
#> 207           na           na           na           na           na
#> 208           na           na           na           na           na
#> 209           na           na           na           na           na
#> 210           na           na           na           na           na
#> 211           na           na           na           na           na
#> 212           na           na           na           na           na
#> 213           na           na           na           na           na
#> 214           na           na           na           na           na
#> 215           na           na           na           na           na
#> 216           na           na           na           na      4911490
#> 217           na           na           na           na   3171000000
#> 218           na           na           na           na           na
#> 219           na           na           na           na           na
#> 220           na           na           na           na           na
#> 221           na           na           na           na           na
#> 222           na           na           na           na           na
#> 223           na           na           na           na           na
#> 224           na           na      3925705      3560850      3645335
#> 225    213463000    230342000    282782000    308956000    329834000
#> 226      1980660      2201205      2360410           na           na
#> 227    100592000    121867000    147608000    168434000           na
#> 228           na           na           na           na           na
#> 229           na           na           na           na           na
#> 230           na           na           na           na           na
#> 231           na           na           na           na           na
#> 232           na           na           na           na           na
#> 233           na           na           na           na           na
#> 234           na           na           na           na           na
#> 235           na           na           na           na           na
#> 236           na           na      6100545      6175620      6583760
#> 237           na           na   5044000000   4695000000   6152000000
#> 238         <NA>         <NA>         <NA>         <NA>         <NA>
#> 239         <NA>         <NA>         <NA>         <NA>         <NA>
#> 240           na           na           na           na           na
#> 241           na           na           na           na           na
#> 242         <NA>         <NA>         <NA>         <NA>         <NA>
#> 243         <NA>         <NA>         <NA>         <NA>         <NA>
#> 244           na           na           na           na           na
#> 245           na           na           na           na           na
#> 246           na           na           na           na           na
#> 247           na           na           na           na           na
#> 248           na           na           na           na           na
#> 249           na           na           na           na           na
#> 250           na           na           na           na           na
#> 251           na           na           na           na           na
#> 252           na           na           na           na           na
#> 253           na           na           na           na           na
#> 254           na           na           na           na           na
#> 255           na           na           na           na           na
#> 256         <NA>         <NA>         <NA>         <NA>         <NA>
#> 257         <NA>         <NA>         <NA>         <NA>         <NA>
#> 258           na           na           na           na           na
#> 259           na           na           na           na           na
#> 260         <NA>         <NA>         <NA>         <NA>         <NA>
#> 261           na           na           na           na           na
#> 262 106099370000 112655931000 130595000000 144857000000 166640000000
#> 263         <NA>         <NA>         <NA>         <NA>         <NA>
#> 264         <NA>         <NA>         <NA>         <NA>         <NA>
#> 265           na           na           na           na           na
#> 266           na           na           na           na           na
#> 267           na           na           na           na           na
#> 268           na           na           na           na           na
#> 269           na           na           na           na           na
#> 270           na           na           na           na           na
#> 271         <NA>         <NA>         <NA>         <NA>         <NA>
#> 272         <NA>         <NA>         <NA>         <NA>         <NA>
#> 273           na           na         2630         6715        11960
#> 274           na           na      1000000      3000000     10000000
#> 275           na           na           na           na           na
#> 276           na           na           na           na           na
#> 277           na           na           na           na           na
#> 278           na           na           na           na           na
#> 279           na           na           na           na           na
#> 280           na           na           na           na           na
#> 281           na           na           na           na           na
#> 282           na           na           na           na           na
#> 283       143920       133945       141515       170090       194920
#> 284    108822000    102453000    112016000    176000000    275000000
#> 285           na           na       188465       358590       379140
#> 286           na           na     29000000     68000000     89000000
#> 287           na           na       299410       359765       477175
#> 288           na           na    197000000    234000000    264000000
#> 289           na           na           na           na           na
#> 290           na           na           na           na           na
#> 291           na           na           na           na           na
#> 292           na           na           na           na           na
#> 293         <NA>         <NA>         <NA>         <NA>         <NA>
#> 294         <NA>         <NA>         <NA>         <NA>         <NA>
#> 295      5845320      6099520      6407005      6532545      6939170
#> 296  21244241000  23985871000  27431088000  30077251000  33786000000
#> 297           na           na           na           na           na
#> 298           na           na           na           na           na
#> 299         <NA>         <NA>         <NA>         <NA>         <NA>
#> 300         <NA>         <NA>         <NA>         <NA>         <NA>
#> 301           na           na           na           na           na
#> 302           na           na           na           na           na
#> 303           na           na           na           na           na
#> 304           na           na           na           na           na
#> 305           na           na           na           na           na
#> 306           na           na           na           na           na
#> 307           na           na           na           na           na
#> 308           na           na           na           na           na
#> 309           na           na           na           na           na
#> 310         <NA>         <NA>         <NA>         <NA>         <NA>
#> 311         <NA>         <NA>         <NA>         <NA>         <NA>
#> 312           na           na           na           na           na
#> 313           na           na           na           na           na
#> 314           na           na           na           na           na
#> 315           na           na           na           na           na
#> 316           na           na           na           na           na
#> 317   3539751000   3476988000   5101516000   3035452000   2723000000
#> 318         <NA>         <NA>         <NA>         <NA>         <NA>
#> 319         <NA>         <NA>         <NA>         <NA>         <NA>
#> 320           na           na           na           na           na
#> 321           na           na           na           na           na
#> 322           na           na           na           na           na
#> 323           na           na           na           na           na
#> 324           na           na           na           na           na
#> 325           na           na           na           na           na
#> 326           na           na           na           na           na
#> 327           na           na           na           na           na
#> 328           na           na           na           na           na
#> 329           na           na           na           na           na
#> 330           na           na           na           na           na
#> 331           na           na           na           na           na
#> 332           na           na           na           na           na
#> 333           na           na           na           na           na
#> 334           na           na           na           na           na
#> 335           na           na           na           na           na
#> 336         <NA>         <NA>         <NA>         <NA>         <NA>
#> 337         <NA>         <NA>         <NA>         <NA>         <NA>
#> 338           na           na           na           na           na
#> 339           na           na           na           na           na
#> 340           na           na           na           na           na
#> 341           na           na           na           na           na
#> 342           na           na           na           na           na
#> 343           na           na           na           na           na
#> 344           na           na           na           na           na
#> 345           na           na           na           na           na
#> 346           na           na           na           na           na
#> 347           na           na           na           na           na
#> 348           na           na           na           na           na
#> 349           na           na           na           na           na
#> 350           na           na           na           na           na
#> 351           na           na           na           na           na
#> 352           na           na           na           na           na
#> 353           na           na           na           na           na
#> 354           na           na           na           na           na
#> 355           na           na           na           na           na
#> 356         <NA>         <NA>         <NA>         <NA>         <NA>
#> 357         <NA>         <NA>         <NA>         <NA>         <NA>
#> 358         <NA>         <NA>         <NA>         <NA>         <NA>
#> 359           na           na           na           na           na
#> 360           na           na           na           na           na
#> 361           na           na           na           na           na
#> 362           na           na           na           na           na
#> 363           na           na           na           na           na
#> 364           na           na           na           na           na
#> 365           na           na           na           na           na
#> 366           na           na           na           na           na
#> 367           na           na           na           na           na
#> 368           na           na           na           na           na
#> 369           na           na           na           na           na
#> 370           na           na           na           na           na
#> 371           na           na           na           na           na
#> 372           na           na           na           na           na
#> 373           na           na           na           na           na
#> 374           na           na           na           na           na
#> 375           na           na           na           na           na
#> 376           na           na           na           na           na
#> 377           na           na           na           na           na
#> 378           na           na           na           na           na
#> 379           na           na           na           na           na
#> 380           na           na           na           na           na
#> 381           na           na           na           na           na
#> 382           na           na           na           na           na
#> 383       353745       355200       359510       341030       357425
#> 384   1210381000    874644000    779526000   1502000000   2619000000
#> 385         <NA>         <NA>         <NA>         <NA>         <NA>
#> 386         <NA>         <NA>         <NA>         <NA>         <NA>
#> 387           na           na           na           na           na
#> 388           na           na           na           na           na
#> 389           na           na           na           na           na
#> 390           na           na           na           na           na
#> 391           na           na           na           na           na
#> 392           na           na           na           na           na
#> 393           na           na           na           na           na
#> 394           na           na           na           na           na
#> 395           na           na           na           na           na
#> 396           na           na           na           na           na
#> 397           na           na           na           na           na
#> 398           na           na           na           na           na
#> 399           na           na           na           na           na
#> 400           na           na           na           na           na
#> 401           na           na           na           na           na
#> 402           na           na           na           na           na
#> 403           na           na           na           na           na
#> 404           na           na           na           na           na
#> 405           na           na           na           na           na
#> 406           na           na           na           na           na
#> 407           na           na           na           na           na
#> 408           na           na           na           na           na
#> 409           na           na           na           na           na
#> 410           na           na           na           na           na
#> 411           na           na           na           na           na
#> 412           na           na           na           na           na
#> 413      1262350      1221970      1316610      1319095      1391280
#> 414   7567017000   7742128000   9468457000  10548000000  12163000000
#> 415         <NA>         <NA>         <NA>         <NA>         <NA>
#> 416           na           na           na           na           na
#> 417           na           na           na           na           na
#> 418           na           na           na           na           na
#> 419           na           na           na           na           na
#> 420           na           na           na           na           na
#> 421           na           na           na           na           na
#> 422           na           na           na           na           na
#> 423           na           na           na           na           na
#> 424           na           na           na           na           na
#> 425           na           na           na           na           na
#> 426      1406120      1373330      1462100      1447175      1517215
#> 427   8777398000   8616771000  10248000000  12050000000  14782000000
#> 428         <NA>         <NA>         <NA>         <NA>         <NA>
#> 429           na           na           na           na           na
#> 430           na           na           na           na           na
#> 431           na           na           na           na           na
#> 432           na           na           na           na           na
#> 433         <NA>         <NA>         <NA>         <NA>         <NA>
#> 434         <NA>         <NA>         <NA>         <NA>         <NA>
#> 435           na           na           na           na           na
#> 436           na           na           na           na           na
#> 437           na           na           na           na           na
#> 438           na           na           na           na           na
#> 439           na           na           na           na           na
#> 440           na           na           na           na           na
#> 441           na           na           na           na           na
#> 442           na           na           na           na           na
#> 443           na           na        11065         9725         3740
#> 444           na           na    102000000     88000000     30000000
#> 445           na           na           na           na           na
#> 446           na           na           na           na           na
#> 447           na           na           na           na           na
#> 448           na           na           na           na           na
#> 449         <NA>         <NA>         <NA>         <NA>         <NA>
#> 450         <NA>         <NA>         <NA>         <NA>         <NA>
#> 451           na           na           na           na           na
#> 452           na           na           na           na           na
#> 453           na           na           na           na           na
#> 454           na           na           na           na           na
#> 455           na           na           na           na           na
#> 456           na           na           na           na           na
#> 457           na           na           na           na           na
#> 458           na           na           na           na           na
#> 459         <NA>         <NA>         <NA>         <NA>         <NA>
#> 460         <NA>         <NA>         <NA>         <NA>         <NA>
#> 461       109430       108010       113205       110695       117360
#> 462     71145000    -57029000   -111516000      6121000    136000000
#> 463       374560       396920       422695       437395       495100
#> 464   2363407000   2678204000   3136435000   3555000000   4118000000
#> 465           na           na           na           na           na
#> 466           na           na           na           na           na
#> 467           na           na           na           na           na
#> 468           na           na           na           na           na
#> 469           na           na           na           na           na
#> 470           na           na           na           na           na
#> 471           na           na           na           na           na
#> 472           na           na           na           na           na
#> 473           na           na           na           na           na
#> 474           na           na           na           na           na
#> 475           na           na           na           na           na
#> 476           na           na           na           na           na
#> 477         <NA>         <NA>         <NA>         <NA>         <NA>
#> 478         <NA>         <NA>         <NA>         <NA>         <NA>
#> 479           na           na           na           na           na
#> 480           na           na           na           na           na
#> 481           na           na           na           na           na
#> 482           na           na           na           na           na
#> 483           na           na           na           na           na
#> 484           na           na           na           na           na
#> 485           na           na           na           na           na
#> 486           na           na           na           na           na
#> 487         <NA>         <NA>         <NA>         <NA>         <NA>
#> 488         <NA>         <NA>         <NA>         <NA>         <NA>
#> 489           na           na           na           na           na
#> 490           na           na           na           na           na
#> 491           na           na           na           na           na
#> 492           na           na           na           na           na
#> 493           na           na           na           na           na
#> 494           na           na           na           na           na
#> 495           na           na           na           na           na
#> 496           na           na           na           na           na
#> 497           na           na         1975          965          650
#> 498           na           na     20000000     11000000      8000000
#> 499           na           na           na           na           na
#> 500           na           na           na           na           na
#> 501         <NA>         <NA>         <NA>         <NA>         <NA>
#> 502         <NA>         <NA>         <NA>         <NA>         <NA>
#> 503           na           na           na        25165        72210
#> 504           na           na           na    103000000    350000000
#> 505           na           na           na           na           na
#> 506           na           na           na           na           na
#> 507           na           na           na           na           na
#> 508           na           na           na           na           na
#> 509           na           na           na           na           na
#> 510           na           na           na           na           na
#> 511         <NA>         <NA>         <NA>         <NA>         <NA>
#> 512         <NA>         <NA>         <NA>         <NA>         <NA>
#> 513           na           na           na           na           na
#> 514           na           na           na           na           na
#> 515           na           na           na           na           na
#> 516           na           na           na           na           na
#> 517         <NA>         <NA>         <NA>         <NA>         <NA>
#> 518         <NA>         <NA>         <NA>         <NA>         <NA>
#> 519           na           na           na           na           na
#> 520           na           na           na           na           na
#> 521           na           na           na           na           na
#> 522           na           na           na           na           na
#> 523           na           na           na           na           na
#> 524           na           na           na           na           na
#> 525           na           na           na           na           na
#> 526           na           na           na           na           na
#> 527           na           na           na           na           na
#> 528           na           na           na           na           na
#> 529           na           na           na           na           na
#> 530           na           na           na           na           na
#> 531           na           na           na           na           na
#> 532           na           na           na           na           na
#> 533           na           na           na           na           na
#> 534           na           na           na           na           na
#> 535           na           na           na           na           na
#> 536           na           na           na           na           na
#> 537           na           na           na           na        34285
#> 538           na           na           na           na     20000000
#> 539         <NA>         <NA>         <NA>         <NA>         <NA>
#> 540         <NA>         <NA>         <NA>         <NA>         <NA>
#> 541           na           na       504830       510810       561525
#> 542           na           na   2603485000   2870000000   3199000000
#> 543           na           na           na           na           na
#> 544           na           na           na           na           na
#> 545           na           na           na           na           na
#> 546           na           na           na           na           na
#> 547           na           na           na           na           na
#> 548           na           na           na           na           na
#> 549           na           na           na           na           na
#> 550           na           na           na           na           na
#> 551           na           na           na           na           na
#> 552           na           na           na           na           na
#> 553           na           na           na           na           na
#> 554           na           na           na           na           na
#> 555           na           na           na           na           na
#> 556           na           na           na           na           na
#> 557           na           na           na           na           na
#> 558         <NA>         <NA>         <NA>         <NA>         <NA>
#> 559           na           na         3815         6720        11970
#> 560           na           na      3000000     12000000     33000000
#> 561           na           na           na           na           na
#> 562           na           na           na           na           na
#> 563           na           na           na           na           na
#> 564           na           na           na           na           na
#> 565           na           na           na           na           na
#> 566           na           na           na           na           na
#> 567           na           na           na           na           na
#> 568           na           na           na           na           na
#> 569           na           na           na           na           na
#> 570           na           na           na           na           na
#> 571           na           na           na           na           na
#> 572           na           na           na           na           na
#> 573           na           na           na           na           na
#> 574           na           na           na           na           na
#> 575           na           na           na           na           na
#> 576           na           na           na           na           na
#> 577           na           na           na           na           na
#> 578           na           na           na           na           na
#> 579           na           na           na           na           na
#> 580           na           na           na           na           na
#> 581           na           na           na           na           na
#> 582           na           na           na           na           na
#> 583         <NA>         <NA>         <NA>         <NA>         <NA>
#> 584         <NA>         <NA>         <NA>         <NA>         <NA>
#> 585           na           na           na           na           na
#> 586           na           na           na           na           na
#> 587           na           na       547895       623060       739840
#> 588           na           na    425748000    556000000    698000000
#> 589           na           na           na           na           na
#> 590           na           na           na           na           na
#> 591           na           na           na           na           na
#> 592           na           na           na           na           na
#> 593           na           na           na           na           na
#> 594           na           na           na           na           na
#> 595      3319625      3637825      3999525      3946815           na
#> 596   1291987000   1683746000   2458151000   2210112000           na
#> 597           na           na           na           na           na
#> 598           na           na           na           na           na
#> 599         <NA>         <NA>         <NA>         <NA>         <NA>
#> 600         <NA>         <NA>         <NA>         <NA>         <NA>
#> 601           na           na           na           na           na
#> 602           na           na           na           na           na
#> 603       342490       351810       367550       373015       387195
#> 604     98912000    111868000    119846000    117000000    125000000
#> 605           na           na           na           na           na
#> 606      5976000      6399000           na           na           na
#> 607           na           na           na           na           na
#> 608           na           na           na           na           na
#> 609           na           na           na           na           na
#> 610           na           na           na           na           na
#> 611           na           na           na           na           na
#> 612           na           na           na           na           na
#> 613           na           na           na           na           na
#> 614           na           na           na           na           na
#> 615           na           na           na           na           na
#> 616           na           na           na           na           na
#> 617           na           na           na           na           na
#> 618           na           na           na           na           na
#> 619           na           na           na           na           na
#> 620           na           na           na           na           na
#> 621           na           na           na           na           na
#> 622           na           na           na           na           na
#> 623           na           na           na           na           na
#> 624           na           na           na           na           na
#> 625           na           na           na           na           na
#> 626           na           na           na           na           na
#> 627           na           na           na           na           na
#> 628           na           na           na           na           na
#> 629           na           na           na           na           na
#> 630           na           na           na           na           na
#> 631           na           na           na           na           na
#> 632           na           na           na           na           na
#> 633           na           na           na           na           na
#> 634           na           na           na           na           na
#> 635           na           na           na           na           na
#> 636           na           na           na           na           na
#> 637         <NA>         <NA>         <NA>         <NA>         <NA>
#> 638         <NA>         <NA>         <NA>         <NA>         <NA>
#> 639           na           na           na           na           na
#> 640           na           na           na           na           na
#> 641         <NA>         <NA>         <NA>         <NA>         <NA>
#> 642         <NA>         <NA>         <NA>         <NA>         <NA>
#> 643           na           na           na           na           na
#> 644           na           na           na           na           na
#> 645         <NA>         <NA>         <NA>         <NA>         <NA>
#> 646         <NA>         <NA>         <NA>         <NA>         <NA>
#> 647         <NA>         <NA>         <NA>         <NA>         <NA>
#> 648           na           na           na           na           na
#> 649           na           na           na           na           na
#> 650           na           na           na           na           na
#> 651           na           na           na           na           na
#> 652           na           na           na           na           na
#> 653           na           na           na           na           na
#> 654           na           na           na           na           na
#> 655           na           na           na           na           na
#> 656           na           na           na           na           na
#> 657           na           na           na           na           na
#> 658           na           na           na           na           na
#> 659           na           na           na           na           na
#> 660           na           na           na           na           na
#> 661           na           na           na           na           na
#> 662         <NA>         <NA>         <NA>         <NA>         <NA>
#> 663           na           na           na           na           na
#> 664         <NA>         <NA>         <NA>         <NA>         <NA>
#> 665         <NA>         <NA>         <NA>         <NA>         <NA>
#> 666         <NA>         <NA>         <NA>         <NA>         <NA>
#> 667           na           na           na           na           na
#> 668           na           na           na           na           na
#> 669           na           na           na           na           na
#> 670           na           na           na           na           na
#> 671           na           na           na           na           na
#> 672           na           na           na           na           na
#> 673           na           na           na           na           na
#> 674           na           na           na           na           na
#> 675           na           na           na           na           na
#> 676           na           na           na           na           na
#> 677           na           na           na           na           na
#> 678           na           na           na           na           na
#> 679           na           na           na           na           na
#> 680           na           na           na           na           na
#> 681           na           na           na           na           na
#> 682           na           na           na           na           na
#> 683           na           na           na           na           na
#> 684           na           na           na           na           na
#> 685           na           na           na           na           na
#> 686           na           na           na           na           na
#> 687           na           na           na           na           na
#> 688           na           na           na           na           na
#> 689           na           na           na           na           na
#> 690           na           na           na           na           na
#> 691           na           na           na           na           na
#> 692           na           na           na           na           na
#> 693           na           na           na           na           na
#> 694           na           na           na           na           na
#> 695           na           na           na           na           na
#> 696           na           na           na           na           na
#> 697           na           na           na           na           na
#> 698           na           na           na           na           na
#> 699           na           na           na           na           na
#> 700           na           na           na           na           na
#> 701       108875       107165       113420       109345       115540
#> 702   1579008000   1540491000   1847113000   1985000000   2356000000
#> 703           na       397370       423825       438240       495585
#> 704           na   9704155000  15219968000  16263000000  18692000000
#> 705       467980       489245       520020       533285       596355
#> 706  10133586000  11245877000  17067083000  18248000000  21047000000
#> 707         <NA>         <NA>         <NA>         <NA>         <NA>
#> 708         <NA>         <NA>         <NA>         <NA>         <NA>
#> 709        97130        98110       120540       120895       125640
#> 710    762289000    848999000   1066773000   1147000000   1349000000
#> 711        91360        93355       152460           na           na
#> 712   3349261000   3707685000   4919948000           na           na
#> 713           na           na           na           na           na
#> 714           na           na           na           na           na
#> 715           na           na           na           na           na
#> 716           na           na           na           na           na
#> 717           na           na           na           na           na
#> 718           na           na           na           na           na
#> 719           na           na           na           na           na
#> 720           na           na           na           na           na
#> 721       101195       102790       126670       128000       132995
#> 722    870264000    966557000   1167258000   1284000000   1440000000
#> 723           na           na           na       180030       191195
#> 724           na           na           na   5510000000   6290000000
#> 725           na           na           na           na           na
#> 726           na           na           na           na           na
#> 727           na           na           na           na           na
#> 728           na           na           na           na           na
#> 729           na           na           na           na           na
#> 730           na           na           na           na           na
#> 731           na           na           na           na           na
#> 732           na           na           na           na           na
#> 733           na           na           na           na           na
#> 734           na           na           na           na           na
#> 735           na           na           na           na           na
#> 736           na           na           na           na           na
#> 737           na           na           na           na           na
#> 738           na           na           na           na           na
#> 739           na           na           na           na           na
#> 740           na           na           na           na           na
#> 741           na           na       733530           na           na
#> 742           na           na    901504000           na           na
#> 743           na           na           na           na           na
#> 744           na           na           na           na           na
#> 745           na           na           na           na           na
#> 746           na           na           na           na           na
#> 747           na           na           na           na           na
#> 748           na           na           na           na           na
#> 749           na           na           na           na           na
#> 750           na           na           na           na           na
#> 751           na           na           na           na           na
#> 752           na           na           na           na           na
#> 753       624235           na           na           na           na
#> 754    571373000           na           na           na           na
#> 755           na           na           na           na           na
#> 756           na           na           na           na           na
#> 757           na           na           na           na           na
#> 758           na           na           na           na           na
#> 759           na           na           na           na           na
#> 760           na           na           na           na           na
#> 761           na           na           na           na           na
#> 762           na           na           na           na           na
#> 763         <NA>         <NA>         <NA>         <NA>         <NA>
#> 764         <NA>         <NA>         <NA>         <NA>         <NA>
#> 765           na           na           na           na           na
#> 766           na           na           na           na           na
#> 767           na           na           na           na           na
#> 768           na           na           na           na           na
#> 769           na           na           na           na           na
#> 770           na           na           na           na           na
#> 771           na           na           na           na           na
#> 772           na           na           na           na           na
#> 773           na           na           na           na           na
#> 774           na           na           na           na           na
#> 775         <NA>         <NA>         <NA>         <NA>         <NA>
#> 776         <NA>         <NA>         <NA>         <NA>         <NA>
#> 777           na           na           na           na           na
#> 778           na           na           na           na           na
#> 779           na           na           na           na           na
#> 780           na           na           na           na           na
#> 781           na           na           na           na           na
#> 782           na           na           na           na           na
#> 783           na           na           na           na           na
#> 784           na           na           na           na           na
#> 785           na           na           na           na           na
#> 786           na           na           na           na           na
#> 787           na           na           na           na           na
#> 788           na           na           na           na           na
#> 789       109430       108010       113205       110695       117360
#> 790     71145000    -57029000   -111516000      6121000    136000000
#> 791       374560       396920       422695       437395       495100
#> 792   2363407000   2678204000   3136435000   3555000000   4118000000
#> 793       467665       488910       519165       532600       595870
#> 794   2434552000   2621176000   3024919000   3561000000   4254000000
#> 795         <NA>         <NA>         <NA>         <NA>         <NA>
#> 796         <NA>         <NA>         <NA>         <NA>         <NA>
#> 797           na           na           na           na           na
#> 798           na           na           na           na           na
#> 799           na           na           na           na           na
#> 800           na           na           na           na           na
#> 801         <NA>         <NA>         <NA>         <NA>         <NA>
#> 802         <NA>         <NA>         <NA>         <NA>         <NA>
#> 803           na           na           na           na           na
#> 804           na           na           na           na           na
#> 805           na           na           na           na           na
#> 806           na           na           na           na           na
#> 807         <NA>         <NA>         <NA>         <NA>         <NA>
#> 808         <NA>         <NA>         <NA>         <NA>         <NA>
#> 809           na           na           na           na           na
#> 810           na           na           na           na           na
#> 811         <NA>         <NA>         <NA>         <NA>         <NA>
#> 812         <NA>         <NA>         <NA>         <NA>         <NA>
#> 813           na           na           na           na           na
#> 814           na           na           na           na           na
#> 815           na           na           na           na           na
#> 816           na           na           na           na           na
#> 817         <NA>         <NA>         <NA>         <NA>         <NA>
#> 818         <NA>         <NA>         <NA>         <NA>         <NA>
#> 819           na           na           na           na           na
#> 820           na           na           na           na           na
#> 821           na           na           na           na           na
#> 822           na           na           na           na           na
#> 823           na           na           na           na           na
#> 824           na           na           na           na           na
#> 825           na           na           na           na           na
#> 826           na           na           na           na           na
#> 827           na           na           na           na           na
#> 828           na           na           na           na           na
#> 829           na           na           na           na           na
#> 830           na           na           na           na           na
#> 831           na           na           na           na           na
#> 832           na           na           na           na           na
#> 833       133925       130035       135450       129665       130950
#> 834   1290828000   1377278000   1573168000   1614000000   1790000000
#> 835           na           na           na           na           na
#> 836           na           na           na           na           na
#> 837           na           na           na           na           na
#> 838           na           na           na           na           na
#> 839           na           na           na           na           na
#> 840           na           na           na           na           na
#> 841           na           na           na           na           na
#> 842           na           na           na           na           na
#> 843           na           na           na           na           na
#> 844           na           na           na           na           na
#>          1988_89      1989_90      1990_91      1991_92      1992_93
#> 1        9257035      9421815      9330715      9288825      9272970
#> 2        7906140      8074690      7800250      7660355      7661770
#> 3        1350890      1347130      1530470      1628470      1611200
#> 4        5082160      5158160      5099715      5076135      5070630
#> 5        4174875      4263660      4231005      4212690      4202340
#> 6             na           na           na           na           na
#> 7        9235320      9400155      9308890      9264670      9245345
#> 8          21715        21660        21825        24155        27625
#> 9           <NA>         <NA>         <NA>         <NA>         <NA>
#> 10          <NA>         <NA>         <NA>         <NA>         <NA>
#> 11       3090075      3147995      3123905      3134075      3112810
#> 12       2466200      2490435      2451835      2413545      2387990
#> 13       1505430      1519710      1555850      1583065      1614895
#> 14        887680       903950       885115       882910       893050
#> 15        795515       796460       789620       778050       768355
#> 16        242705       238795       242295       240795       240365
#> 17        192545       196280       200895       176745       173795
#> 18         76880        80000        81200        79635        81260
#> 19            na           na           na           na           na
#> 20            na           na           na           na           na
#> 21            na           na           na           na           na
#> 22          <NA>         <NA>         <NA>         <NA>         <NA>
#> 23          <NA>         <NA>         <NA>         <NA>         <NA>
#> 24       5838560      6223135      6600540      6881920      6581285
#> 25            na           na           na           na           na
#> 26       3418470      3150490      2730180      2406905      2691685
#> 27            na           na           na           na           na
#> 28          <NA>         <NA>         <NA>         <NA>         <NA>
#> 29          <NA>         <NA>         <NA>         <NA>         <NA>
#> 30         35905        58910        44935        86505        33630
#> 31       1313505      1419725      1337355      1432380      1223540
#> 32       1231765      1202745      1175210      1157680      1142305
#> 33       2237670      2259395      2284375      2285165      2314530
#> 34          <NA>         <NA>         <NA>         <NA>         <NA>
#> 35       1911410      1972250      2031395      2027270      2133190
#> 36          <NA>         <NA>         <NA>         <NA>         <NA>
#> 37       1171155      1201940      1228510      1187095      1288975
#> 38          <NA>         <NA>         <NA>         <NA>         <NA>
#> 39        453485       453340       434155       398825       387905
#> 40        329255       323800       309715       281495       289695
#> 41        572880       529710       485065       432415       459200
#> 42          <NA>         <NA>         <NA>         <NA>         <NA>
#> 43          <NA>         <NA>         <NA>         <NA>         <NA>
#> 44          <NA>         <NA>         <NA>         <NA>         <NA>
#> 45            na           na           na           na           na
#> 46   48339000000  46833000000  46089000000  45776000000  48637000000
#> 47         39465        55455       106120        97580        84125
#> 48      11000000     18000000     45000000     41000000     33000000
#> 49            na      6467380      6041845      5977500      5985695
#> 50    2131000000   2224000000   2199000000   2228000000   2295000000
#> 51            na           na           na           na           na
#> 52            na           na           na           na           na
#> 53            na           na           na           na           na
#> 54            na           na           na           na           na
#> 55            na           na           na           na           na
#> 56   44860000000  45455000000  44207000000  43668000000  45796000000
#> 57            na           na           na           na           na
#> 58            na           na           na           na           na
#> 59            na           na           na           na           na
#> 60            na           na           na           na           na
#> 61            na           na           na           na           na
#> 62     306000000    240000000    174000000    244000000    258766439
#> 63         31240        57205        71585        76875        90395
#> 64       9000000     28000000     48000000     55000000     70000000
#> 65            na           na           na           na           na
#> 66            na           na           na           na           na
#> 67            na           na           na           na           na
#> 68            na           na           na           na           na
#> 69            na           na           na           na           na
#> 70            na           na           na           na           na
#> 71            na           na           na           na           na
#> 72            na           na           na           na           na
#> 73            na           na           na           na           na
#> 74            na           na           na           na           na
#> 75            na           na           na           na           na
#> 76            na           na           na           na           na
#> 77            na           na           na           na           na
#> 78            na           na           na           na           na
#> 79            na           na           na           na           na
#> 80            na           na           na           na           na
#> 81            na           na           na           na           na
#> 82            na           na           na           na           na
#> 83          <NA>         <NA>         <NA>         <NA>         <NA>
#> 84          <NA>         <NA>         <NA>         <NA>         <NA>
#> 85       7338955      7407545      7255445      7099835      7088160
#> 86  145146000000 156640000000 161436000000 163724000000 166544000000
#> 87            na           na           na           na           na
#> 88            na           na           na           na           na
#> 89       1801445      1999470      2011970      1946130      1937880
#> 90    1303000000   2685000000   3007000000   2874000000   2859000000
#> 91       1119965      1106350       943490       815265       819390
#> 92    2010000000   2162000000   2092000000   2210000000   2416000000
#> 93        111335        91545        86315        85510        81925
#> 94      28000000     34000000     34000000     37000000     35000000
#> 95            na           na           na           na           na
#> 96            na           na           na           na           na
#> 97            na           na           na           na           na
#> 98            na           na           na           na           na
#> 99            na           na           na           na           na
#> 100           na           na           na           na           na
#> 101           na           na           na           na           na
#> 102           na           na           na           na           na
#> 103           na           na           na           na           na
#> 104           na           na           na           na           na
#> 105           na           na           na           na           na
#> 106           na           na           na           na           na
#> 107           na           na           na           na           na
#> 108           na           na           na           na           na
#> 109           na           na           na           na           na
#> 110           na           na           na           na           na
#> 111           na           na           na           na           na
#> 112           na           na           na           na           na
#> 113       799565       751720       912940      1030905      1139715
#> 114   2197000000   2164000000   2955000000   3907000000   4493000000
#> 115       698420       659860       647720       680995       669450
#> 116   3244000000   3240000000   3330000000   3483000000   3439000000
#> 117           na           na           na           na           na
#> 118           na           na           na           na           na
#> 119           na           na           na           na           na
#> 120           na           na           na           na           na
#> 121           na           na           na           na           na
#> 122           na           na           na           na           na
#> 123           na           na           na           na           na
#> 124           na           na           na           na           na
#> 125           na           na           na           na           na
#> 126           na           na           na           na           na
#> 127           na           na           na           na           na
#> 128           na           na           na           na           na
#> 129           na           na           na           na           na
#> 130           na           na           na           na           na
#> 131           na           na           na           na           na
#> 132           na           na           na           na           na
#> 133           na           na           na           na           na
#> 134           na           na           na           na           na
#> 135           na           na           na           na           na
#> 136           na           na           na           na           na
#> 137           na           na           na           na           na
#> 138           na           na           na           na           na
#> 139           na           na           na           na           na
#> 140           na           na           na           na           na
#> 141           na           na           na           na           na
#> 142           na           na           na           na           na
#> 143           na           na           na           na           na
#> 144           na           na           na           na           na
#> 145         <NA>         <NA>         <NA>         <NA>         <NA>
#> 146      5646385      5874335      6022305      5907990      5695450
#> 147   9242000000  12629000000  11621000000   9009000000   6591000000
#> 148           na           na           na           na           na
#> 149           na           na           na           na           na
#> 150           na           na           na           na           na
#> 151           na           na           na           na           na
#> 152       612020       598010       632485       697695       768875
#> 153   2976000000   1807000000   1948000000   1836000000   2108000000
#> 154       716170       714175       757225       837670       926045
#> 155   3800000000   1442000000   1581000000   1493000000   1724000000
#> 156           na           na           na           na           na
#> 157           na           na           na           na           na
#> 158           na           na           na           na           na
#> 159           na           na           na           na           na
#> 160           na           na           na           na           na
#> 161           na           na           na           na           na
#> 162           na           na           na           na           na
#> 163           na           na           na           na           na
#> 164           na           na           na           na           na
#> 165           na           na           na           na           na
#> 166           na           na           na           na           na
#> 167           na           na           na           na           na
#> 168           na           na           na           na           na
#> 169           na           na           na           na           na
#> 170           na           na           na           na           na
#> 171           na           na           na           na           na
#> 172           na           na           na           na           na
#> 173           na           na           na           na           na
#> 174           na           na           na           na           na
#> 175           na           na           na           na           na
#> 176           na           na           na           na           na
#> 177           na           na           na           na 221832000000
#> 178         <NA>         <NA>         <NA>         <NA>         <NA>
#> 179         <NA>         <NA>         <NA>         <NA>         <NA>
#> 180           na           na           na           na           na
#> 181           na           na           na           na           na
#> 182           na           na           na           na           na
#> 183           na           na           na           na           na
#> 184           na           na           na           na           na
#> 185           na           na           na           na           na
#> 186           na           na           na           na           na
#> 187           na           na           na           na           na
#> 188           na           na           na      1251060      1133580
#> 189           na           na           na   1547000000   1535000000
#> 190           na           na           na       501190       427030
#> 191           na           na           na    447000000    429000000
#> 192           na           na           na           na           na
#> 193           na           na           na           na           na
#> 194           na           na           na           na           na
#> 195           na           na           na           na           na
#> 196           na           na           na           na           na
#> 197           na           na           na           na           na
#> 198           na           na           na           na           na
#> 199           na           na           na           na           na
#> 200           na           na           na           na           na
#> 201           na           na           na           na           na
#> 202           na           na           na      3609975      3234200
#> 203           na           na           na    834000000    635000000
#> 204           na           na           na           na           na
#> 205           na           na           na           na           na
#> 206           na           na           na           na           na
#> 207           na           na           na           na           na
#> 208           na           na           na           na           na
#> 209           na           na           na           na           na
#> 210           na           na           na           na           na
#> 211           na           na           na           na           na
#> 212           na           na           na       434580       442840
#> 213           na           na           na    318000000    349000000
#> 214           na           na           na      4332970      4306265
#> 215           na           na           na   2207000000   2082000000
#> 216           na      5877335      5940785      5797250      5537290
#> 217           na   4804000000   5176000000   5355000000   5032000000
#> 218           na           na           na           na           na
#> 219           na           na           na           na           na
#> 220           na           na           na           na           na
#> 221           na           na           na           na           na
#> 222           na           na           na           na           na
#> 223           na           na           na           na           na
#> 224           na           na           na           na      3134555
#> 225           na           na           na           na    439000000
#> 226           na           na           na           na           na
#> 227           na           na           na           na           na
#> 228           na           na           na           na           na
#> 229           na           na           na           na           na
#> 230           na           na           na           na           na
#> 231           na           na           na           na           na
#> 232           na           na           na           na           na
#> 233           na           na           na           na           na
#> 234           na           na           na           na           na
#> 235           na           na           na           na           na
#> 236      7092900      7360560      7446495      7554775      7363195
#> 237   7938000000   8772000000   9147000000  12391000000  11096000000
#> 238         <NA>         <NA>         <NA>         <NA>         <NA>
#> 239         <NA>         <NA>         <NA>         <NA>         <NA>
#> 240           na           na           na           na           na
#> 241           na           na           na           na           na
#> 242         <NA>         <NA>         <NA>         <NA>         <NA>
#> 243         <NA>         <NA>         <NA>         <NA>         <NA>
#> 244           na           na           na           na           na
#> 245           na           na           na           na           na
#> 246           na           na           na           na           na
#> 247           na           na           na           na           na
#> 248           na           na           na           na           na
#> 249           na           na           na           na           na
#> 250           na           na           na           na           na
#> 251           na           na           na           na           na
#> 252           na           na           na           na           na
#> 253           na           na           na           na           na
#> 254           na           na           na           na           na
#> 255           na           na           na           na           na
#> 256         <NA>         <NA>         <NA>         <NA>         <NA>
#> 257         <NA>         <NA>         <NA>         <NA>         <NA>
#> 258           na           na           na           na           na
#> 259           na           na           na           na           na
#> 260         <NA>         <NA>         <NA>         <NA>         <NA>
#> 261           na           na           na           na           na
#> 262 189579000000 200215000000 202430000000 203117000000 210903000000
#> 263         <NA>         <NA>         <NA>         <NA>         <NA>
#> 264         <NA>         <NA>         <NA>         <NA>         <NA>
#> 265           na           na           na           na           na
#> 266           na           na           na           na           na
#> 267           na           na       297765       164105       821450
#> 268           na           na     62000000     34000000     55000000
#> 269           na           na           na           na           na
#> 270           na           na           na           na           na
#> 271         <NA>         <NA>         <NA>         <NA>         <NA>
#> 272         <NA>         <NA>         <NA>         <NA>         <NA>
#> 273        19275        41930        47475        41990        45110
#> 274     14000000     46000000     62000000     59000000     68000000
#> 275           na           na           na           na           na
#> 276           na           na           na           na           na
#> 277           na           na           na           na           na
#> 278           na           na           na           na           na
#> 279           na           na           na           na           na
#> 280           na           na           na           na           na
#> 281           na           na           na           na           na
#> 282           na           na           na           na           na
#> 283       194260       173260        90600        85600       110490
#> 284    291000000    214000000     66000000     70000000    113000000
#> 285       455560       338500       429495       485045       521250
#> 286    146000000     92000000    148000000    168000000    189000000
#> 287       722610       755255       708340       552925       612790
#> 288    425000000    558000000    651000000    848000000   1264000000
#> 289           na           na           na           na           na
#> 290           na           na           na           na           na
#> 291           na           na           na           na           na
#> 292           na           na           na           na           na
#> 293         <NA>         <NA>         <NA>         <NA>         <NA>
#> 294         <NA>         <NA>         <NA>         <NA>         <NA>
#> 295      7303760      7447615      7375940      7287470      7278175
#> 296  39273000000  40114000000  41181000000  41467000000  43000000000
#> 297           na           na           na           na           na
#> 298           na           na           na           na           na
#> 299         <NA>         <NA>         <NA>         <NA>         <NA>
#> 300         <NA>         <NA>         <NA>         <NA>         <NA>
#> 301           na           na           na           na           na
#> 302           na           na           na           na           na
#> 303           na           na           na           na           na
#> 304           na           na           na           na           na
#> 305           na           na           na           na           na
#> 306           na           na           na           na           na
#> 307           na           na           na           na           na
#> 308           na           na           na           na           na
#> 309           na           na           na           na           na
#> 310         <NA>         <NA>         <NA>         <NA>         <NA>
#> 311         <NA>         <NA>         <NA>         <NA>         <NA>
#> 312           na           na           na           na           na
#> 313           na           na           na           na   6038000000
#> 314           na           na           na           na           na
#> 315           na           na           na           na  -6483000000
#> 316           na           na           na           na           na
#> 317   3061000000   3211000000   -981000000  -1764000000   -445000000
#> 318         <NA>         <NA>         <NA>         <NA>         <NA>
#> 319         <NA>         <NA>         <NA>         <NA>         <NA>
#> 320           na           na           na           na           na
#> 321           na           na           na           na           na
#> 322           na           na           na           na           na
#> 323           na           na           na           na           na
#> 324           na           na           na           na           na
#> 325           na           na           na           na           na
#> 326           na           na           na           na           na
#> 327           na           na           na           na           na
#> 328           na           na           na           na           na
#> 329           na           na           na           na           na
#> 330           na           na           na           na           na
#> 331           na           na           na           na           na
#> 332           na           na           na           na           na
#> 333           na           na           na           na           na
#> 334           na           na           na           na           na
#> 335           na           na           na           na           na
#> 336         <NA>         <NA>         <NA>         <NA>         <NA>
#> 337         <NA>         <NA>         <NA>         <NA>         <NA>
#> 338           na           na           na           na           na
#> 339           na           na           na           na           na
#> 340           na           na           na           na           na
#> 341           na           na           na           na           na
#> 342           na           na           na           na           na
#> 343           na           na           na           na           na
#> 344           na           na           na           na           na
#> 345           na           na           na           na           na
#> 346           na           na           na           na           na
#> 347           na           na           na           na           na
#> 348           na           na           na           na           na
#> 349           na           na           na           na           na
#> 350           na           na           na           na           na
#> 351           na           na           na           na           na
#> 352           na           na           na           na           na
#> 353           na           na           na           na           na
#> 354           na           na           na           na           na
#> 355           na           na           na           na           na
#> 356         <NA>         <NA>         <NA>         <NA>         <NA>
#> 357         <NA>         <NA>         <NA>         <NA>         <NA>
#> 358         <NA>         <NA>         <NA>         <NA>         <NA>
#> 359           na           na           na           na           na
#> 360           na           na           na           na           na
#> 361           na           na           na           na           na
#> 362           na           na           na           na           na
#> 363           na           na           na           na           na
#> 364           na           na           na           na           na
#> 365           na           na           na           na           na
#> 366           na           na           na           na           na
#> 367           na           na           na           na           na
#> 368           na           na           na           na           na
#> 369           na           na           na           na           na
#> 370           na           na           na           na           na
#> 371           na           na           na           na           na
#> 372           na           na           na           na           na
#> 373           na           na           na           na           na
#> 374           na           na           na           na           na
#> 375           na           na           na           na           na
#> 376           na           na           na           na           na
#> 377           na           na           na           na           na
#> 378           na           na           na           na           na
#> 379           na           na           na           na           na
#> 380           na           na           na           na           na
#> 381           na           na           na           na           na
#> 382           na           na           na           na           na
#> 383       368005       394405       379540       380525       385520
#> 384   3064000000   2851000000    736000000    816000000   1643000000
#> 385         <NA>         <NA>         <NA>         <NA>         <NA>
#> 386         <NA>         <NA>         <NA>         <NA>         <NA>
#> 387           na           na           na           na           na
#> 388           na           na           na           na           na
#> 389           na           na           na           na           na
#> 390           na           na           na           na           na
#> 391           na           na           na           na           na
#> 392           na           na           na           na           na
#> 393           na           na           na           na           na
#> 394           na           na           na           na           na
#> 395           na           na           na           na           na
#> 396           na           na           na           na           na
#> 397           na           na           na           na           na
#> 398           na           na           na           na           na
#> 399           na           na           na           na           na
#> 400           na           na           na           na           na
#> 401           na           na           na           na           na
#> 402           na           na           na           na           na
#> 403           na           na           na           na           na
#> 404           na           na           na           na           na
#> 405           na           na           na           na           na
#> 406           na           na           na           na           na
#> 407           na           na           na           na           na
#> 408           na           na           na           na           na
#> 409           na           na           na           na           na
#> 410           na           na           na           na           na
#> 411           na           na           na           na           na
#> 412           na           na           na           na           na
#> 413      1480055      1470830      1468075      1502580      1545585
#> 414  14644000000  13931000000  13170000000  13044000000  13818000000
#> 415         <NA>         <NA>         <NA>         <NA>         <NA>
#> 416           na           na           na           na           na
#> 417           na           na           na           na           na
#> 418           na           na           na           na           na
#> 419           na           na           na           na           na
#> 420           na           na           na           na           na
#> 421           na           na           na           na           na
#> 422           na           na           na           na           na
#> 423           na           na           na           na           na
#> 424           na           na           na           na           na
#> 425           na           na           na           na           na
#> 426      1605625      1616550      1604040      1634920      1680705
#> 427  17708000000  16782000000  13906000000  13860000000  15460000000
#> 428         <NA>         <NA>         <NA>         <NA>         <NA>
#> 429           na           na           na           na           na
#> 430           na           na           na           na           na
#> 431           na           na           na           na           na
#> 432           na           na           na           na           na
#> 433         <NA>         <NA>         <NA>         <NA>         <NA>
#> 434         <NA>         <NA>         <NA>         <NA>         <NA>
#> 435           na           na           na           na           na
#> 436           na           na           na           na           na
#> 437           na           na           na           na           na
#> 438           na           na           na           na           na
#> 439           na           na           na           na           na
#> 440           na           na           na           na           na
#> 441           na           na           na           na           na
#> 442           na           na           na           na           na
#> 443         3150           na          975          930          840
#> 444     22000000           na      6000000      5000000      4000000
#> 445           na           na           na           na           na
#> 446           na           na           na           na           na
#> 447           na           na           na           na           na
#> 448           na           na           na           na           na
#> 449         <NA>         <NA>         <NA>         <NA>         <NA>
#> 450         <NA>         <NA>         <NA>         <NA>         <NA>
#> 451           na           na           na           na           na
#> 452           na           na           na           na           na
#> 453           na           na           na           na           na
#> 454           na           na           na           na           na
#> 455           na           na           na           na           na
#> 456           na           na           na           na           na
#> 457           na           na           na           na           na
#> 458           na           na           na           na           na
#> 459         <NA>         <NA>         <NA>         <NA>         <NA>
#> 460         <NA>         <NA>         <NA>         <NA>         <NA>
#> 461       119985       123640       118790       120820       122340
#> 462    121000000     14000000   -345000000   -384000000   -249000000
#> 463       549390       577540       584200       632020       686290
#> 464   4876000000   5336000000   5169000000   5590000000   6363000000
#> 465           na           na           na           na           na
#> 466           na           na           na           na           na
#> 467           na           na           na           na           na
#> 468           na           na           na           na           na
#> 469           na           na           na           na           na
#> 470           na           na           na           na           na
#> 471           na           na           na           na           na
#> 472           na           na           na           na           na
#> 473           na           na           na           na           na
#> 474           na           na           na           na           na
#> 475           na           na           na           na           na
#> 476           na           na           na           na           na
#> 477         <NA>         <NA>         <NA>         <NA>         <NA>
#> 478         <NA>         <NA>         <NA>         <NA>         <NA>
#> 479           na           na           na           na           na
#> 480           na           na           na           na           na
#> 481           na           na           na           na           na
#> 482           na           na           na           na           na
#> 483           na           na           na           na           na
#> 484           na           na           na           na           na
#> 485           na           na           na           na           na
#> 486           na           na           na           na           na
#> 487         <NA>         <NA>         <NA>         <NA>         <NA>
#> 488         <NA>         <NA>         <NA>         <NA>         <NA>
#> 489           na           na           na           na           na
#> 490           na           na           na           na           na
#> 491           na           na           na           na           na
#> 492           na           na           na           na           na
#> 493           na           na           na           na           na
#> 494           na           na           na           na           na
#> 495           na           na           na          855         1570
#> 496           na           na           na    -18000000    -33000000
#> 497          315           na          655         1360          950
#> 498      3000000           na      8000000     21000000     14000000
#> 499           na           na           na           na           na
#> 500           na           na           na           na           na
#> 501         <NA>         <NA>         <NA>         <NA>         <NA>
#> 502         <NA>         <NA>         <NA>         <NA>         <NA>
#> 503       151470       175780       160210       202250       251035
#> 504    970000000    951000000    735000000    918000000   1131000000
#> 505           na           na           na           na           na
#> 506           na           na           na           na           na
#> 507           na           na           na           na           na
#> 508           na           na           na           na           na
#> 509           na           na           na           na           na
#> 510           na           na           na           na           na
#> 511         <NA>         <NA>         <NA>         <NA>         <NA>
#> 512         <NA>         <NA>         <NA>         <NA>         <NA>
#> 513           na           na           na           na           na
#> 514           na           na           na           na           na
#> 515           na           na           na           na           na
#> 516           na           na           na           na           na
#> 517         <NA>         <NA>         <NA>         <NA>         <NA>
#> 518         <NA>         <NA>         <NA>         <NA>         <NA>
#> 519           na           na           na           na           na
#> 520           na           na           na           na           na
#> 521           na           na           na           na           na
#> 522           na           na           na           na           na
#> 523           na           na           na           na           na
#> 524           na           na           na           na           na
#> 525           na           na           na           na           na
#> 526           na           na           na           na           na
#> 527           na           na           na           na           na
#> 528           na           na           na           na           na
#> 529           na           na           na       144130       186265
#> 530           na           na           na    256000000    291000000
#> 531           na           na           na           na           na
#> 532           na           na           na           na           na
#> 533           na           na           na           na           na
#> 534           na           na           na           na           na
#> 535           na           na           na           na           na
#> 536           na           na           na           na           na
#> 537        33030        82140        93865       122860       162385
#> 538     21000000     46000000     44000000     46000000     50000000
#> 539         <NA>         <NA>         <NA>         <NA>         <NA>
#> 540         <NA>         <NA>         <NA>         <NA>         <NA>
#> 541       607865           na           na           na           na
#> 542   3617000000           na   5706000000   6334000000   6916000000
#> 543           na           na           na           na       581865
#> 544           na           na           na           na   3405000000
#> 545           na           na           na           na           na
#> 546           na           na           na           na           na
#> 547           na           na           na           na       881920
#> 548           na           na           na           na   3287000000
#> 549           na           na           na           na           na
#> 550           na           na           na           na           na
#> 551           na           na           na           na           na
#> 552           na           na           na           na           na
#> 553           na           na           na           na           na
#> 554           na           na           na           na           na
#> 555           na           na           na           na           na
#> 556           na       696355       764405       837865       907130
#> 557           na   -275000000   -390000000   -122000000    224000000
#> 558         <NA>         <NA>         <NA>         <NA>         <NA>
#> 559        19290        41950        47510        42610        45995
#> 560     48000000    129000000    178000000    166000000    192000000
#> 561           na           na           na           na           na
#> 562           na           na           na           na           na
#> 563           na           na           na           na           na
#> 564           na           na           na           na           na
#> 565           na           na           na           na           na
#> 566           na           na           na           na           na
#> 567           na           na           na           na           na
#> 568           na           na           na           na           na
#> 569           na           na           na           na           na
#> 570           na           na           na           na           na
#> 571           na           na           na           na           na
#> 572           na           na           na           na           na
#> 573           na           na           na           na           na
#> 574           na           na           na           na           na
#> 575           na           na           na           na           na
#> 576           na           na           na           na           na
#> 577           na           na           na           na           na
#> 578           na           na           na           na           na
#> 579           na           na           na           na           na
#> 580           na           na           na           na           na
#> 581           na           na           na           na           na
#> 582           na           na           na           na           na
#> 583         <NA>         <NA>         <NA>         <NA>         <NA>
#> 584         <NA>         <NA>         <NA>         <NA>         <NA>
#> 585           na           na           na           na           na
#> 586           na           na           na           na           na
#> 587       894515      1214680      1373985      1312325       287920
#> 588   1091000000   1493000000   2003000000   2142000000    791000000
#> 589           na           na           na           na           na
#> 590           na           na           na           na           na
#> 591           na           na           na           na           na
#> 592           na           na           na           na           na
#> 593           na           na           na           na           na
#> 594           na           na           na           na           na
#> 595           na      4566305      4694420      5147320      3754520
#> 596           na   1003000000   1129000000   1398000000   1009000000
#> 597           na           na           na           na           na
#> 598           na           na           na           na           na
#> 599         <NA>         <NA>         <NA>         <NA>         <NA>
#> 600         <NA>         <NA>         <NA>         <NA>         <NA>
#> 601           na           na           na           na           na
#> 602           na           na           na           na           na
#> 603       406430           na       429935       436705       441415
#> 604    128000000           na    145000000    150000000    163000000
#> 605           na           na           na           na           na
#> 606           na           na           na           na           na
#> 607           na           na           na           na           na
#> 608           na           na           na           na           na
#> 609           na           na           na           na           na
#> 610           na           na           na           na           na
#> 611           na           na           na           na           na
#> 612           na           na           na           na           na
#> 613           na           na           na           na           na
#> 614           na           na           na           na           na
#> 615           na           na           na           na           na
#> 616           na           na           na           na           na
#> 617           na           na           na           na           na
#> 618           na           na           na           na           na
#> 619           na           na           na           na           na
#> 620           na           na           na           na           na
#> 621           na           na           na           na           na
#> 622           na           na           na           na           na
#> 623           na           na           na           na           na
#> 624           na           na           na           na           na
#> 625           na           na           na           na           na
#> 626           na           na           na           na           na
#> 627           na           na           na           na           na
#> 628           na           na           na           na           na
#> 629           na           na           na           na           na
#> 630           na           na           na           na           na
#> 631           na           na           na           na           na
#> 632           na           na           na           na           na
#> 633           na           na           na           na           na
#> 634           na           na           na           na           na
#> 635           na           na           na           na           na
#> 636           na           na           na           na           na
#> 637         <NA>         <NA>         <NA>         <NA>         <NA>
#> 638         <NA>         <NA>         <NA>         <NA>         <NA>
#> 639           na           na           na           na           na
#> 640           na           na           na           na           na
#> 641         <NA>         <NA>         <NA>         <NA>         <NA>
#> 642         <NA>         <NA>         <NA>         <NA>         <NA>
#> 643           na           na           na           na           na
#> 644           na           na           na           na           na
#> 645         <NA>         <NA>         <NA>         <NA>         <NA>
#> 646         <NA>         <NA>         <NA>         <NA>         <NA>
#> 647         <NA>         <NA>         <NA>         <NA>         <NA>
#> 648           na           na           na           na           na
#> 649           na           na           na           na           na
#> 650           na           na           na           na           na
#> 651           na           na           na           na           na
#> 652           na           na           na           na           na
#> 653           na           na           na           na           na
#> 654           na           na           na           na           na
#> 655           na           na           na           na           na
#> 656           na           na           na           na           na
#> 657           na           na           na           na           na
#> 658           na           na           na           na           na
#> 659           na           na           na           na           na
#> 660           na           na           na           na           na
#> 661           na           na           na           na           na
#> 662         <NA>         <NA>         <NA>         <NA>         <NA>
#> 663           na           na           na           na           na
#> 664         <NA>         <NA>         <NA>         <NA>         <NA>
#> 665         <NA>         <NA>         <NA>         <NA>         <NA>
#> 666         <NA>         <NA>         <NA>         <NA>         <NA>
#> 667           na           na           na           na           na
#> 668           na           na           na           na           na
#> 669           na           na           na           na           na
#> 670           na           na           na           na           na
#> 671           na           na           na           na           na
#> 672           na           na           na           na           na
#> 673           na           na           na           na           na
#> 674           na           na           na           na           na
#> 675           na           na           na           na           na
#> 676           na           na           na           na           na
#> 677           na           na           na           na           na
#> 678           na           na           na           na           na
#> 679           na           na           na           na           na
#> 680           na           na           na           na           na
#> 681           na           na           na           na           na
#> 682           na           na           na           na           na
#> 683           na           na           na           na           na
#> 684           na           na           na           na           na
#> 685           na           na           na           na           na
#> 686           na           na           na           na           na
#> 687           na           na           na           na           na
#> 688           na           na           na           na           na
#> 689           na           na           na           na           na
#> 690           na           na           na           na           na
#> 691           na           na           na           na           na
#> 692           na           na           na           na           na
#> 693           na           na           na           na           na
#> 694           na           na           na           na           na
#> 695           na           na           na           na           na
#> 696           na           na           na           na           na
#> 697           na           na           na           na           na
#> 698           na           na           na           na           na
#> 699           na           na           na           na           na
#> 700           na           na           na           na           na
#> 701       117875       121010       117160       108015       109860
#> 702   2467000000   2269000000   1849000000   2082000000   2382000000
#> 703       549385       577515       585815       616725       675085
#> 704  20826000000  21302000000  20021000000  24982000000  28552000000
#> 705       651825       682165       685885           na       768620
#> 706  23293000000  23571000000  21871000000  27064000000  30933000000
#> 707         <NA>         <NA>         <NA>         <NA>         <NA>
#> 708         <NA>         <NA>         <NA>         <NA>         <NA>
#> 709       108815       105780       118765       129315       133550
#> 710   1308000000   1438000000   1566000000   1661000000   1775000000
#> 711           na           na           na           na           na
#> 712           na           na           na           na           na
#> 713           na           na           na           na           na
#> 714           na           na           na           na           na
#> 715           na           na           na           na           na
#> 716           na           na           na           na           na
#> 717           na           na           na           na           na
#> 718           na           na           na           na           na
#> 719           na           na           na           na           na
#> 720           na           na           na           na           na
#> 721       114720       115095       129180       133695       147545
#> 722   1431000000   1512000000   1604000000   1636000000   1897000000
#> 723       144510       156970       173110       212035       231400
#> 724   5466000000   6663000000   6782000000   7774000000   9073000000
#> 725           na           na           na           na           na
#> 726           na           na           na           na           na
#> 727           na        48175        48815        72790        74005
#> 728           na    734000000    634000000   1102000000   1157000000
#> 729           na           na           na           na        56125
#> 730           na           na           na           na    133000000
#> 731           na           na           na           na         7015
#> 732           na           na           na           na     34000000
#> 733           na           na           na           na        40420
#> 734           na           na           na           na    255000000
#> 735           na           na           na           na       132305
#> 736           na           na           na           na    989000000
#> 737           na           na           na           na           na
#> 738           na           na           na           na           na
#> 739           na           na           na          855          170
#> 740           na           na           na      4000000      2000000
#> 741           na       371045       431935       434835       476865
#> 742           na    850000000    913000000    895000000    995000000
#> 743           na           na           na           na           na
#> 744           na           na           na           na           na
#> 745           na           na           na           na           na
#> 746           na           na           na           na           na
#> 747           na           na           na           na           na
#> 748           na           na           na           na           na
#> 749           na           na           na           na           na
#> 750           na           na           na           na           na
#> 751           na       388130       437340       483880       533255
#> 752           na   1507000000   1565000000   1636000000   1763000000
#> 753           na       207370       227495       247565       267280
#> 754           na    404000000    411000000    422000000    477000000
#> 755           na           na           na       616270       684245
#> 756           na           na           na   9298000000   9186000000
#> 757           na           na           na           na           na
#> 758           na           na           na           na           na
#> 759           na           na           na           na           na
#> 760           na           na           na           na           na
#> 761           na           na           na           na           na
#> 762           na           na           na           na           na
#> 763         <NA>         <NA>         <NA>         <NA>         <NA>
#> 764         <NA>         <NA>         <NA>         <NA>         <NA>
#> 765           na           na           na           na           na
#> 766           na           na           na           na           na
#> 767           na           na           na           na           na
#> 768           na           na           na           na           na
#> 769           na           na           na         4175         1645
#> 770           na           na           na     21000000      5000000
#> 771           na           na           na           na           na
#> 772           na           na           na           na           na
#> 773           na           na           na           na           na
#> 774           na           na           na           na           na
#> 775         <NA>         <NA>         <NA>         <NA>         <NA>
#> 776         <NA>         <NA>         <NA>         <NA>         <NA>
#> 777           na           na           na           na           na
#> 778           na           na           na           na           na
#> 779           na           na           na           na           na
#> 780           na           na           na           na           na
#> 781           na           na           na           na           na
#> 782           na           na           na           na           na
#> 783           na           na           na           na           na
#> 784           na           na           na           na           na
#> 785           na           na           na           na           na
#> 786           na           na           na           na           na
#> 787           na           na           na           na           na
#> 788           na           na           na           na           na
#> 789       119985       123640       118790       120820       122340
#> 790    121000000     14000000   -345000000   -384000000   -249000000
#> 791       549390       577540       584200       632020       686290
#> 792   4876000000   5336000000   5169000000   5590000000   6363000000
#> 793       651515       680240       684910       734930       789985
#> 794   4996000000   5350000000   4825000000   5205000000   6115000000
#> 795         <NA>         <NA>         <NA>         <NA>         <NA>
#> 796         <NA>         <NA>         <NA>         <NA>         <NA>
#> 797           na           na           na           na           na
#> 798           na           na           na           na           na
#> 799           na           na           na           na           na
#> 800           na           na           na           na           na
#> 801         <NA>         <NA>         <NA>         <NA>         <NA>
#> 802         <NA>         <NA>         <NA>         <NA>         <NA>
#> 803           na           na           na           na           na
#> 804           na           na           na           na           na
#> 805           na           na           na           na           na
#> 806           na           na           na           na           na
#> 807         <NA>         <NA>         <NA>         <NA>         <NA>
#> 808         <NA>         <NA>         <NA>         <NA>         <NA>
#> 809           na           na           na           na           na
#> 810           na           na           na           na           na
#> 811         <NA>         <NA>         <NA>         <NA>         <NA>
#> 812         <NA>         <NA>         <NA>         <NA>         <NA>
#> 813           na           na           na           na           na
#> 814           na           na           na           na           na
#> 815           na           na           na           na           na
#> 816           na           na           na           na           na
#> 817         <NA>         <NA>         <NA>         <NA>         <NA>
#> 818         <NA>         <NA>         <NA>         <NA>         <NA>
#> 819           na           na           na           na           na
#> 820           na           na           na           na           na
#> 821           na           na           na           na           na
#> 822           na           na           na           na           na
#> 823           na           na           na           na           na
#> 824           na           na           na           na           na
#> 825           na           na           na           na           na
#> 826           na           na           na           na           na
#> 827           na           na           na           na           na
#> 828           na           na           na           na           na
#> 829           na           na           na           na           na
#> 830           na           na           na           na           na
#> 831           na           na           na           na           na
#> 832           na           na           na           na           na
#> 833           na        71430       103670        94145        99440
#> 834           na   1417000000   1966000000   1899000000   2048000000
#> 835           na        34965        36790        35490        36975
#> 836           na    353000000    416000000    410000000    447000000
#> 837           na           na           na           na           na
#> 838           na           na           na           na           na
#> 839           na           na           na           na           na
#> 840           na           na           na           na           na
#> 841           na           na           na           na           na
#> 842           na           na           na           na           na
#> 843           na           na           na           na           na
#> 844           na           na           na           na           na
#>          1993_94      1994_95      1995_96      1996_97      1997_98
#> 1        9391090      9619010     10188615     10271135     10317585
#> 2        7609300      7861135      8406025      8557900      8643240
#> 3        1781790      1757875      1782590      1713235      1674345
#> 4        5125870      5219020      5514450      5530600      5557600
#> 5        4265220      4399990      4674165      4740530      4759985
#> 6             na           na           na           na           na
#> 7        9360385      9588540     10151850     10238385     10291210
#> 8          30705        30470        36765        32750        26375
#> 9           <NA>         <NA>         <NA>         <NA>         <NA>
#> 10          <NA>         <NA>         <NA>         <NA>         <NA>
#> 11       3144505      3218860      3387715      3414645      3435905
#> 12       2388390      2424270      2551230      2565680      2585675
#> 13       1662980      1726890      1836480      1862615      1887205
#> 14        921305       952175      1012310      1026845      1039115
#> 15        770650       782175       808855       809325       807720
#> 16        240870       243110       244705       250745       246500
#> 17        177545       183450       202635       188860       190025
#> 18         84900        87515        95330        98580        99510
#> 19            na           na        49355        53835        25925
#> 20            na           na           na           na           na
#> 21            na           na           na           na           na
#> 22          <NA>         <NA>         <NA>         <NA>         <NA>
#> 23          <NA>         <NA>         <NA>         <NA>         <NA>
#> 24       6810775      7072345      7395750      7607695      7839220
#> 25            na           na           na           na           na
#> 26       2580315      2546665      2792855      2663440      2478365
#> 27            na           na           na           na           na
#> 28          <NA>         <NA>         <NA>         <NA>         <NA>
#> 29          <NA>         <NA>         <NA>         <NA>         <NA>
#> 30         27865       140345       276555       324285       263590
#> 31       1217665      1341065      1500765      1481260      1433690
#> 32       1169095      1125295      1175765      1182960      1202910
#> 33       2352305      2247510      2359750      1150040      1128780
#> 34          <NA>         <NA>         <NA>      1188285      1203990
#> 35       2205690      2108010      2195405      1119720      1140490
#> 36          <NA>         <NA>         <NA>      1057800      1068800
#> 37       1351095       781575       804680       844155       921950
#> 38          <NA>       580705       589800       598960       634220
#> 39        371765       410705       407020       412500       435045
#> 40        268695       329500       328540       326685       319470
#> 41        426920       232905       234250       238235       241200
#> 42          <NA>       321395       316085       346250       323445
#> 43          <NA>         <NA>         <NA>         <NA>         <NA>
#> 44          <NA>         <NA>         <NA>         <NA>         <NA>
#> 45            na           na           na           na           na
#> 46   51024000000  54444000000  61555124669  66086246093  72119711261
#> 47         74815        62215        51915        64155        70390
#> 48      26000000     19000000     16571001     23261559     26805535
#> 49       6002070      6293920      6747840      6886210      6956535
#> 50    2697000000   2907000000   3452444506   4121303145   3881760755
#> 51            na           na           na           na       167330
#> 52            na           na           na           na    112142940
#> 53            na           na           na           na           na
#> 54            na           na           na           na           na
#> 55            na           na           na           na           na
#> 56   47653000000  50940000000  58016332830  62811041571  67862497836
#> 57            na           na           na           na           na
#> 58            na           na           na           na           na
#> 59            na           na           na           na           na
#> 60            na           na           na           na           na
#> 61            na           na           na           na           na
#> 62     562569559    365350699    516176843    762083183   1201330646
#> 63        123955       147675       191210       200630       328090
#> 64     129000000    164000000    218991184    267269735    485124017
#> 65            na           na           na           na           na
#> 66            na           na           na           na           na
#> 67            na           na           na           na           na
#> 68            na           na           na           na           na
#> 69            na           na           na           na           na
#> 70            na           na           na           na           na
#> 71            na           na           na           na           na
#> 72            na           na           na           na           na
#> 73            na           na           na           na           na
#> 74            na           na           na           na           na
#> 75            na           na           na           na           na
#> 76            na           na           na           na           na
#> 77            na           na           na           na           na
#> 78            na           na           na           na           na
#> 79            na           na           na           na           na
#> 80            na           na           na           na           na
#> 81            na           na           na           na           na
#> 82            na           na           na           na           na
#> 83          <NA>         <NA>         <NA>         <NA>         <NA>
#> 84          <NA>         <NA>         <NA>         <NA>         <NA>
#> 85       7209180      7413070      7819290      7847265      7924380
#> 86  174239000000 186117000000 204460311444 214084762750 226324145443
#> 87            na           na           na           na           na
#> 88            na           na           na           na           na
#> 89       1968085      1983190      2055155      2044495      2048300
#> 90    2981000000   3197000000   3592568970   3784677053   4211232430
#> 91        777025       432385       318690       292555       282330
#> 92    2574000000   1629000000   1604533776   1809899783   2044863327
#> 93         77075        49950        45800        47235        45900
#> 94      35000000     21000000     19279059     20751392     20709723
#> 95            na           na           na           na           na
#> 96            na           na           na           na           na
#> 97            na           na           na           na           na
#> 98            na           na           na           na           na
#> 99            na           na           na           na           na
#> 100           na           na           na           na           na
#> 101           na           na           na           na           na
#> 102           na           na           na           na           na
#> 103           na           na           na           na           na
#> 104           na           na           na           na           na
#> 105           na           na           na           na           na
#> 106           na           na           na           na           na
#> 107           na           na           na           na           na
#> 108           na           na           na           na           na
#> 109           na           na           na           na           na
#> 110           na           na           na           na           na
#> 111           na           na           na           na           na
#> 112           na           na           na           na           na
#> 113      1184240      1321625      1443560      1383590      1266080
#> 114   4836000000   4501000000   4893226896   4804597220   4447839856
#> 115       686705       714795       791930       828065       759105
#> 116   3573000000   3760000000   4277423596   4643405772   4212576407
#> 117           na           na           na           na           na
#> 118           na           na           na           na           na
#> 119           na           na           na           na           na
#> 120           na           na           na           na           na
#> 121           na           na           na           na           na
#> 122           na           na           na           na           na
#> 123           na           na           na           na           na
#> 124           na           na           na           na           na
#> 125           na           na           na           na           na
#> 126           na           na           na           na           na
#> 127           na           na           na           na           na
#> 128           na           na           na           na           na
#> 129           na           na           na           na           na
#> 130           na           na           na           na           na
#> 131           na           na           na           na           na
#> 132           na           na           na           na           na
#> 133           na           na           na           na           na
#> 134           na           na           na           na           na
#> 135           na           na           na           na           na
#> 136           na           na           na           na           na
#> 137           na           na           na           na           na
#> 138           na           na           na           na           na
#> 139           na           na           na           na           na
#> 140           na           na           na           na           na
#> 141           na           na           na           na           na
#> 142           na           na           na           na           na
#> 143           na           na           na           na           na
#> 144           na           na           na           na           na
#> 145         <NA>         <NA>         <NA>         <NA>         <NA>
#> 146      5634645      5718455      6003285      5821715      5105835
#> 147   5487000000   5848000000   7751738850   7484402239   6175396307
#> 148           na           na           na           na           na
#> 149           na           na           na           na           na
#> 150           na           na           na           na           na
#> 151           na           na           na           na           na
#> 152       907255       985830      1115900      1329200      2002435
#> 153   2520000000   3776000000   4509210922   4770776522   5490587848
#> 154      1095990      1195015      1114855      1329200      1989385
#> 155   2045000000   2839000000   2546662168   2674863996   3075503927
#> 156           na           na           na           na           na
#> 157           na           na           na           na           na
#> 158           na           na           na           na           na
#> 159           na           na           na           na           na
#> 160           na           na           na           na           na
#> 161           na           na           na           na           na
#> 162           na           na           na           na           na
#> 163           na           na           na           na           na
#> 164           na           na           na           na           na
#> 165           na           na           na           na           na
#> 166           na           na           na           na           na
#> 167           na           na           na           na           na
#> 168           na           na           na           na           na
#> 169           na           na           na           na           na
#> 170           na           na           na           na           na
#> 171           na           na           na           na           na
#> 172           na           na           na           na           na
#> 173           na           na           na           na           na
#> 174           na           na           na           na           na
#> 175           na           na           na           na           na
#> 176           na           na           na           na           na
#> 177 234246000000 249308000000 274678842614 290027340577 306426378841
#> 178         <NA>         <NA>         <NA>         <NA>         <NA>
#> 179         <NA>         <NA>         <NA>         <NA>         <NA>
#> 180           na           na           na           na           na
#> 181           na           na           na           na           na
#> 182           na           na           na           na           na
#> 183           na           na           na           na           na
#> 184           na           na           na           na           na
#> 185           na           na           na           na           na
#> 186           na           na           na           na           na
#> 187           na           na           na           na           na
#> 188      1198020      1306055      1439265      1505990      1567610
#> 189   1613000000   1855000000   2153674442   2256707623   2445571601
#> 190       400650       404485       457005       443130       442270
#> 191    433000000    439000000    519494654    502957151    508477124
#> 192           na           na           na           na           na
#> 193           na           na           na           na           na
#> 194           na           na           na           na           na
#> 195           na           na           na           na           na
#> 196           na           na           na           na           na
#> 197           na           na           na           na           na
#> 198           na           na           na           na           na
#> 199           na           na           na           na           na
#> 200           na           na           na           na           na
#> 201           na           na           na           na           na
#> 202      3032635      3193560      3404915      3471830      3569215
#> 203    545000000    575000000    629757234    641794834    669847625
#> 204           na           na           na           na           na
#> 205           na           na           na           na           na
#> 206           na           na           na           na           na
#> 207           na           na           na           na           na
#> 208           na           na           na           na           na
#> 209           na           na           na           na           na
#> 210           na           na           na           na           na
#> 211           na           na           na           na           na
#> 212       458570       508435       482425       491310       559280
#> 213    385000000    436000000    469022722    530623316    618369361
#> 214      4333345      4441565      4915645      5017980      5127245
#> 215   2124000000   2221000000   2614451495   2708537537   2774937779
#> 216      5506435      5681045      6141875      6230765      6359875
#> 217   5101000000   5525000000   6385829817   6640620597   7006828647
#> 218           na           na           na           na           na
#> 219           na           na           na           na           na
#> 220           na           na           na           na           na
#> 221           na           na           na           na           na
#> 222           na           na           na           na           na
#> 223           na           na           na           na           na
#> 224      3156225      3170370      3259235      3232260      3300100
#> 225    471000000    495000000    539207259    564627744    610946663
#> 226           na           na           na      4395795      4650215
#> 227           na           na           na    578145432    633988293
#> 228           na           na           na           na           na
#> 229           na           na           na           na           na
#> 230           na           na           na           na           na
#> 231           na           na           na           na           na
#> 232           na           na           na           na           na
#> 233           na           na           na           na           na
#> 234           na           na           na           na           na
#> 235           na           na           na           na           na
#> 236      7387915      7582125      8031015      8158185      8275540
#> 237  11446000000  11947000000  14290028898  14905959754  15949822906
#> 238         <NA>         <NA>         <NA>         <NA>         <NA>
#> 239         <NA>         <NA>         <NA>         <NA>         <NA>
#> 240           na           na           na           na           na
#> 241           na           na           na           na           na
#> 242         <NA>         <NA>         <NA>         <NA>         <NA>
#> 243         <NA>         <NA>         <NA>         <NA>         <NA>
#> 244           na           na           na           na           na
#> 245           na           na           na           na           na
#> 246           na           na           na           na           na
#> 247           na           na           na           na           na
#> 248           na           na           na           na           na
#> 249           na           na           na           na           na
#> 250           na           na           na           na           na
#> 251           na           na           na           na           na
#> 252           na           na           na           na           na
#> 253           na           na           na           na           na
#> 254           na           na           na           na           na
#> 255           na           na           na           na           na
#> 256         <NA>         <NA>         <NA>         <NA>         <NA>
#> 257         <NA>         <NA>         <NA>         <NA>         <NA>
#> 258           na           na           na           na           na
#> 259           na           na           na           na           na
#> 260         <NA>         <NA>         <NA>         <NA>         <NA>
#> 261           na           na           na           na           na
#> 262 222712000000 236580000000 264563681532 273609356592 294733664539
#> 263         <NA>         <NA>         <NA>         <NA>         <NA>
#> 264         <NA>         <NA>         <NA>         <NA>         <NA>
#> 265           na           na           na           na           na
#> 266           na           na           na           na           na
#> 267       672390       548360       573585       542165       516110
#> 268     44000000     35000000    241577947    357522704    376373756
#> 269           na           na           na           na           na
#> 270           na           na           na           na           na
#> 271         <NA>         <NA>         <NA>         <NA>         <NA>
#> 272         <NA>         <NA>         <NA>         <NA>         <NA>
#> 273        44335        44820        45235        34255        19490
#> 274     71000000     76000000     73035066     49622410     25630178
#> 275      4017600      3995300      4102315      4045660      3850380
#> 276    520000000    517000000    532351894    524570962    499933313
#> 277           na           na           na           na           na
#> 278           na           na           na           na           na
#> 279           na           na           na           na           na
#> 280           na           na           na           na           na
#> 281           na           na           na           na           na
#> 282           na           na           na           na           na
#> 283       125675       129655       143435       127330       116200
#> 284    126000000    154000000    206643841    144313625    122563208
#> 285       538295       635420       628895       340525       319475
#> 286    211000000    317000000    268741664    115199298    110881096
#> 287       666830       512840       500975       481500       453380
#> 288   1274000000   1127000000   1173874874   1398467453   1547427682
#> 289           na           na           na           na           na
#> 290           na           na           na           na           na
#> 291           na           na           na           na           na
#> 292           na           na           na           na           na
#> 293         <NA>         <NA>         <NA>         <NA>         <NA>
#> 294         <NA>         <NA>         <NA>         <NA>         <NA>
#> 295      7416350      7634555      8081050      8149885      8245910
#> 296  44835000000  48180000000  54609660282  59189562303  63929997287
#> 297           na           na           na           na           na
#> 298           na           na           na           na           na
#> 299         <NA>         <NA>         <NA>         <NA>         <NA>
#> 300         <NA>         <NA>         <NA>         <NA>         <NA>
#> 301           na           na           na           na           na
#> 302           na           na           na           na           na
#> 303           na           na           na           na           na
#> 304           na           na           na           na           na
#> 305           na           na           na           na           na
#> 306           na           na           na           na           na
#> 307           na           na           na           na           na
#> 308           na           na           na           na           na
#> 309           na           na           na           na           na
#> 310         <NA>         <NA>         <NA>         <NA>         <NA>
#> 311         <NA>         <NA>         <NA>         <NA>         <NA>
#> 312           na           na      1949260      1956535      1918425
#> 313   2887000000   3003000000   3700992304   3617391700   4642830872
#> 314           na           na      7530005      7605110      7751410
#> 315  -7181000000  -7711000000  -8401444318  -8694237673  -9867316330
#> 316           na           na           na           na           na
#> 317  -4294000000  -4708000000  -4700452014  -5076845973  -5224485458
#> 318         <NA>         <NA>         <NA>         <NA>         <NA>
#> 319         <NA>         <NA>         <NA>         <NA>         <NA>
#> 320           na           na           na           na           na
#> 321           na           na           na           na           na
#> 322           na           na           na           na           na
#> 323           na           na           na           na           na
#> 324           na           na           na           na           na
#> 325           na           na           na           na           na
#> 326           na           na           na        85430       125730
#> 327           na           na           na    595697484    673626442
#> 328           na           na           na           na           na
#> 329           na           na           na           na           na
#> 330           na           na           na           na           na
#> 331           na           na           na           na           na
#> 332           na           na           na           na           na
#> 333           na           na           na           na           na
#> 334           na           na           na           na           na
#> 335           na           na           na           na           na
#> 336         <NA>         <NA>         <NA>         <NA>         <NA>
#> 337         <NA>         <NA>         <NA>         <NA>         <NA>
#> 338           na           na           na           na           na
#> 339           na           na           na           na           na
#> 340           na           na           na           na           na
#> 341           na           na           na           na           na
#> 342           na           na           na           na           na
#> 343           na           na           na           na           na
#> 344           na           na           na           na           na
#> 345           na           na           na           na           na
#> 346           na           na           na           na           na
#> 347           na           na           na           na           na
#> 348           na           na           na           na           na
#> 349           na           na           na           na           na
#> 350           na           na           na           na           na
#> 351           na           na           na           na           na
#> 352           na           na           na           na           na
#> 353           na           na           na           na           na
#> 354           na           na           na           na           na
#> 355           na           na           na           na           na
#> 356         <NA>         <NA>         <NA>         <NA>         <NA>
#> 357         <NA>         <NA>         <NA>         <NA>         <NA>
#> 358         <NA>         <NA>         <NA>         <NA>         <NA>
#> 359           na           na           na           na           na
#> 360           na           na           na           na           na
#> 361           na           na           na           na           na
#> 362           na           na           na           na           na
#> 363           na           na           na           na           na
#> 364           na           na           na           na           na
#> 365           na           na           na           na           na
#> 366           na           na           na           na           na
#> 367           na           na           na           na           na
#> 368           na           na           na           na           na
#> 369           na           na           na           na           na
#> 370           na           na           na           na           na
#> 371           na           na           na           na        17935
#> 372           na           na           na           na     56943341
#> 373           na           na           na           na           na
#> 374           na           na           na           na           na
#> 375           na           na           na           na           na
#> 376           na           na           na           na           na
#> 377           na           na           na           na           na
#> 378           na           na           na           na           na
#> 379           na           na           na           na           na
#> 380           na           na           na           na           na
#> 381           na           na           na           na        77235
#> 382           na           na           na           na    239467092
#> 383       384340       364300       374265       387825       373275
#> 384   1893000000   1995000000   2330971138   1943755574   1738398791
#> 385         <NA>         <NA>         <NA>         <NA>         <NA>
#> 386         <NA>         <NA>         <NA>         <NA>         <NA>
#> 387           na           na           na           na           na
#> 388           na           na           na           na           na
#> 389           na           na           na           na           na
#> 390           na           na           na           na           na
#> 391           na           na           na           na           na
#> 392           na           na           na           na           na
#> 393           na           na           na           na           na
#> 394           na           na           na           na           na
#> 395           na           na           na           na           na
#> 396           na           na           na           na           na
#> 397           na           na           na           na           na
#> 398           na           na           na           na           na
#> 399           na           na           na           na           na
#> 400           na           na           na           na           na
#> 401           na           na           na           na         2935
#> 402           na           na           na           na      9851521
#> 403           na           na           na           na           na
#> 404           na           na           na           na           na
#> 405           na           na           na           na           na
#> 406           na           na           na           na           na
#> 407           na           na           na           na           na
#> 408           na           na           na           na           na
#> 409           na           na           na           na           na
#> 410           na           na           na           na           na
#> 411           na           na           na           na       226120
#> 412           na           na           na           na    836037627
#> 413      1622830      1650430      1757290      1812960      1888830
#> 414  14883000000  16539000000  16845186923  17550393336  18982494823
#> 415         <NA>         <NA>         <NA>         <NA>         <NA>
#> 416           na           na           na           na           na
#> 417           na           na           na           na           na
#> 418           na           na           na           na           na
#> 419           na           na           na           na           na
#> 420           na           na           na           na           na
#> 421           na           na           na           na           na
#> 422           na           na           na           na           na
#> 423           na           na           na           na           na
#> 424           na           na           na           na           na
#> 425           na           na           na           na           na
#> 426      1749250      1764525      1870190      1937840      2003105
#> 427  16774000000  18534000000  19176158061  19494148910  20720893614
#> 428         <NA>         <NA>         <NA>         <NA>         <NA>
#> 429           na           na           na           na           na
#> 430           na           na           na           na           na
#> 431           na           na           na           na           na
#> 432           na           na           na           na           na
#> 433         <NA>         <NA>         <NA>         <NA>         <NA>
#> 434         <NA>         <NA>         <NA>         <NA>         <NA>
#> 435           na           na           na           na           na
#> 436           na           na           na           na           na
#> 437           na           na           na           na           na
#> 438           na           na           na           na           na
#> 439           na           na           na           na           na
#> 440           na           na           na           na           na
#> 441           na           na           na           na           na
#> 442           na           na           na           na           na
#> 443         3790         3025         3225         5575         4450
#> 444      7000000      7000000      5540256     10702979      9019566
#> 445           na           na           na           na           na
#> 446           na           na           na           na           na
#> 447           na           na           na           na           na
#> 448           na           na           na           na           na
#> 449         <NA>         <NA>         <NA>         <NA>         <NA>
#> 450         <NA>         <NA>         <NA>         <NA>         <NA>
#> 451           na           na           na           na           na
#> 452           na           na           na           na           na
#> 453           na           na           na           na           na
#> 454           na           na           na           na           na
#> 455           na           na           na           na           na
#> 456           na           na           na           na           na
#> 457           na           na           na           na           na
#> 458           na           na           na           na           na
#> 459         <NA>         <NA>         <NA>         <NA>         <NA>
#> 460         <NA>         <NA>         <NA>         <NA>         <NA>
#> 461       124185       119280       122815       123845       125890
#> 462   -148000000   -291000000   -373322978   -576465647   -692599591
#> 463       725120       747820       796115       789045       815455
#> 464   7119000000   7856000000   8411958990   8698548270   9776062798
#> 465           na           na           na           na           na
#> 466           na           na           na           na           na
#> 467           na           na           na           na           na
#> 468           na           na           na           na           na
#> 469           na           na           na           na           na
#> 470           na           na           na           na           na
#> 471           na           na           na           na           na
#> 472           na           na           na           na           na
#> 473           na           na           na           na           na
#> 474           na           na           na           na           na
#> 475           na           na           na           na           na
#> 476           na           na           na           na           na
#> 477         <NA>         <NA>         <NA>         <NA>         <NA>
#> 478         <NA>         <NA>         <NA>         <NA>         <NA>
#> 479           na           na           na           na           na
#> 480           na           na           na           na           na
#> 481           na           na           na           na           na
#> 482           na           na           na           na           na
#> 483           na           na           na           na           na
#> 484           na           na           na           na           na
#> 485           na           na           na           na           na
#> 486           na           na           na           na           na
#> 487         <NA>         <NA>         <NA>         <NA>         <NA>
#> 488         <NA>         <NA>         <NA>         <NA>         <NA>
#> 489           na           na           na           na           na
#> 490           na           na           na           na           na
#> 491           na           na           na           na           na
#> 492           na           na           na           na           na
#> 493           na           na           na           na           na
#> 494           na           na           na           na           na
#> 495         1780         2390         4930         4190         4770
#> 496    -38000000    -55000000   -117336143    -90754282   -115957901
#> 497          910         1215         1080         1590         2000
#> 498     13000000     19000000     17344718     28176189     39650276
#> 499           na           na           na           na           na
#> 500           na           na           na           na           na
#> 501         <NA>         <NA>         <NA>         <NA>         <NA>
#> 502         <NA>         <NA>         <NA>         <NA>         <NA>
#> 503       414630       332525       441800       695455       855740
#> 504   2440000000   1656000000   2311565029   3282635607   5147334900
#> 505           na           na           na           na           na
#> 506           na           na           na           na           na
#> 507           na           na       169040       216680       268265
#> 508           na           na   2000002046   2733144354   3499022311
#> 509           na           na           na           na           na
#> 510           na           na           na           na           na
#> 511         <NA>         <NA>         <NA>         <NA>         <NA>
#> 512         <NA>         <NA>         <NA>         <NA>         <NA>
#> 513           na           na           na           na           na
#> 514           na           na           na           na           na
#> 515           na           na           na           na           na
#> 516           na           na           na           na           na
#> 517         <NA>         <NA>         <NA>         <NA>         <NA>
#> 518         <NA>         <NA>         <NA>         <NA>         <NA>
#> 519           na           na           na           na           na
#> 520           na           na           na           na           na
#> 521           na           na           na           na           na
#> 522           na           na           na           na           na
#> 523           na           na           na           na           na
#> 524           na           na           na           na           na
#> 525           na           na           na           na        68655
#> 526           na           na           na           na    385199943
#> 527           na           na           na           na           na
#> 528           na           na           na           na           na
#> 529       243695       248065       296340       333340       386835
#> 530    298000000    269000000    347948934    392110227    548774573
#> 531           na           na           na           na           na
#> 532           na           na           na           na           na
#> 533           na           na           na           na           na
#> 534           na           na           na           na           na
#> 535           na           na        14815           na           na
#> 536           na           na    486834438           na           na
#> 537       192125       168270       266940       292190       323315
#> 538     51000000     51000000     62014049     80191206     94214961
#> 539         <NA>         <NA>         <NA>         <NA>         <NA>
#> 540         <NA>         <NA>         <NA>         <NA>         <NA>
#> 541       969570      1034110      1139855      1196790      1239295
#> 542   7439000000   8204000000   9360556789  10100514242  10750599049
#> 543       647835       700535       785055       831785       872605
#> 544   3501000000   4217000000   5228416592   5206008833   4902710947
#> 545           na           na           na           na       201155
#> 546           na           na           na           na    330714849
#> 547       959790      1024710      1130425      1188015      1232490
#> 548   3539000000   3981000000   4550435909   4875523095   4932207891
#> 549           na           na           na           na           na
#> 550           na           na           na           na  10165633687
#> 551       480735       482505       505855       555755       607300
#> 552   2270000000   2350000000   2550190113   2796411835   3011974543
#> 553           na           na           na           na           na
#> 554       499735       561630       643555       650405       623620
#> 555  -1872000000  -2345000000  -2968110454  -2777190348  -2412679911
#> 556       980470      1044135      1149410      1206160      1230920
#> 557    399000000      6000000   -417920341     19221487    599294631
#> 558         <NA>         <NA>         <NA>         <NA>         <NA>
#> 559        45335        45960        47005        35280        19825
#> 560    208000000    230000000    219755123    146990881     71824257
#> 561           na           na           na           na           na
#> 562           na           na           na           na           na
#> 563           na           na           na           na        38875
#> 564           na           na           na           na    195691248
#> 565           na           na           na           na       114500
#> 566           na           na           na           na    552611932
#> 567           na           na           na           na           na
#> 568           na           na           na           na           na
#> 569           na           na           na           na           na
#> 570           na           na           na           na           na
#> 571           na           na           na           na           na
#> 572           na           na           na           na           na
#> 573           na           na           na           na           na
#> 574           na           na           na           na           na
#> 575           na           na           na           na           na
#> 576           na           na           na           na           na
#> 577           na           na           na           na           na
#> 578           na           na           na           na           na
#> 579           na           na           na           na           na
#> 580           na           na           na           na           na
#> 581           na           na           na           na           na
#> 582           na           na           na           na           na
#> 583         <NA>         <NA>         <NA>         <NA>         <NA>
#> 584         <NA>         <NA>         <NA>         <NA>         <NA>
#> 585           na           na           na           na           na
#> 586           na           na           na           na           na
#> 587       243810       226070       225270       211375       205585
#> 588    809000000    694000000    883474700    849647232    961375319
#> 589           na           na           na           na           na
#> 590           na           na           na           na           na
#> 591           na           na           na           na           na
#> 592           na           na           na           na           na
#> 593           na           na           na           na           na
#> 594           na           na           na           na           na
#> 595      3904785      4084225      4280690       172995       127170
#> 596   1139000000   1385000000   1337465974    247151553    328364719
#> 597           na           na           na           na           na
#> 598           na           na           na           na           na
#> 599         <NA>         <NA>         <NA>         <NA>         <NA>
#> 600         <NA>         <NA>         <NA>         <NA>         <NA>
#> 601           na           na           na           na           na
#> 602           na           na           na           na           na
#> 603       454035       470750       508130       515775       515440
#> 604    179000000    183000000    199325382    205017836    208876221
#> 605           na           na           na           na           na
#> 606           na           na           na           na           na
#> 607           na           na           na           na           na
#> 608           na           na           na           na           na
#> 609           na           na           na           na           na
#> 610           na           na           na           na           na
#> 611           na           na           na           na           na
#> 612           na           na           na           na           na
#> 613           na           na           na           na           na
#> 614           na           na           na           na           na
#> 615           na           na           na           na           na
#> 616           na           na           na           na           na
#> 617           na           na           na           na           na
#> 618           na           na           na           na           na
#> 619           na           na           na           na           na
#> 620           na           na           na           na           na
#> 621           na           na           na           na           na
#> 622           na           na           na           na           na
#> 623           na           na           na           na           na
#> 624           na           na           na           na           na
#> 625           na           na           na           na           na
#> 626           na           na           na           na           na
#> 627           na           na           na           na           na
#> 628           na           na           na           na           na
#> 629           na           na           na           na           na
#> 630           na           na           na           na           na
#> 631           na           na           na           na           na
#> 632           na           na           na           na           na
#> 633           na           na           na           na           na
#> 634           na           na           na           na           na
#> 635           na           na           na           na           na
#> 636           na           na           na           na           na
#> 637         <NA>         <NA>         <NA>         <NA>         <NA>
#> 638         <NA>         <NA>         <NA>         <NA>         <NA>
#> 639           na           na           na           na           na
#> 640           na           na           na           na           na
#> 641         <NA>         <NA>         <NA>         <NA>         <NA>
#> 642         <NA>         <NA>         <NA>         <NA>         <NA>
#> 643           na           na           na           na           na
#> 644           na           na           na           na           na
#> 645         <NA>         <NA>         <NA>         <NA>         <NA>
#> 646         <NA>         <NA>         <NA>         <NA>         <NA>
#> 647         <NA>         <NA>         <NA>         <NA>         <NA>
#> 648           na           na           na           na           na
#> 649           na           na           na           na           na
#> 650           na           na           na           na           na
#> 651           na           na           na           na           na
#> 652           na           na           na           na           na
#> 653           na           na           na           na           na
#> 654           na           na           na           na           na
#> 655           na           na           na           na           na
#> 656           na           na           na           na           na
#> 657           na           na           na           na           na
#> 658           na           na           na           na           na
#> 659           na           na           na           na           na
#> 660           na           na           na           na           na
#> 661           na           na           na           na           na
#> 662         <NA>         <NA>         <NA>         <NA>         <NA>
#> 663           na           na           na           na           na
#> 664         <NA>         <NA>         <NA>         <NA>         <NA>
#> 665         <NA>         <NA>         <NA>         <NA>         <NA>
#> 666         <NA>         <NA>         <NA>         <NA>         <NA>
#> 667           na           na           na           na           na
#> 668           na           na           na           na           na
#> 669           na           na           na           na           na
#> 670           na           na           na           na           na
#> 671           na           na           na           na           na
#> 672           na           na           na           na           na
#> 673           na           na           na           na           na
#> 674           na           na           na           na           na
#> 675           na           na           na           na           na
#> 676           na           na           na           na           na
#> 677           na           na           na           na           na
#> 678           na           na           na           na           na
#> 679           na           na           na           na           na
#> 680           na           na           na           na           na
#> 681           na           na           na           na           na
#> 682           na           na           na           na           na
#> 683           na           na           na           na           na
#> 684           na           na           na           na           na
#> 685           na           na           na           na           na
#> 686           na           na           na           na           na
#> 687           na           na           na           na           na
#> 688           na           na           na           na           na
#> 689           na           na           na           na         5955
#> 690           na           na           na           na     18696377
#> 691           na           na           na           na         3960
#> 692           na           na           na           na     71675015
#> 693           na           na           na         3855           na
#> 694           na           na           na     24868928     90371392
#> 695           na           na           na           na           na
#> 696           na           na           na           na           na
#> 697           na           na           na           na           na
#> 698           na           na           na           na           na
#> 699           na           na           na           na           na
#> 700           na           na           na           na           na
#> 701       110800       103970       103660       101845        99985
#> 702   2643000000   2645000000   2841849368   2837366716   2890478805
#> 703       714170       734175       780405       772480       783075
#> 704  31379000000  33312000000  37651763605  38904295111  40859349201
#> 705       808485       822230       866235       853940       866370
#> 706  34022000000  35957000000  40420701631  41486917803  43768697359
#> 707         <NA>         <NA>         <NA>         <NA>         <NA>
#> 708         <NA>         <NA>         <NA>         <NA>         <NA>
#> 709       138950       139760       149070       144890       149460
#> 710   1947000000   2071000000   2369744805   2528627759   2587877511
#> 711           na           na           na           na           na
#> 712           na           na           na           na           na
#> 713           na           na           na           na           na
#> 714           na           na           na           na           na
#> 715           na           na           na           na           na
#> 716           na           na           na           na           na
#> 717           na           na           na           na           na
#> 718           na           na           na           na           na
#> 719           na           na           na           na           na
#> 720           na           na           na           na           na
#> 721       152360       150340       158830       153180       155790
#> 722   2094000000   2172000000   2505137504   2459320997   2611004686
#> 723       242225       236375       243825       234970       238100
#> 724   9968000000  10044000000  11457043415  11758971396  12723014024
#> 725           na           na           na           na           na
#> 726           na           na           na           na           na
#> 727        74025        71190        75245        77435        80765
#> 728   1193000000   1181000000   1261216744   1286978118   1305026117
#> 729        67105        66305        69750        68285        70475
#> 730    164000000    175000000    230689671    242843589    270353230
#> 731         7390         8150         8870         9070         9330
#> 732     25000000     30000000     33742765     35376624     31047598
#> 733        46165        46495        49930        50020        53135
#> 734    272000000    279000000    321308631    342821695    365656379
#> 735       141160       142270       158020       157560       162305
#> 736   1067000000   1121000000   1294201056   1330329790   1378045518
#> 737           na           na           na           na       210525
#> 738           na           na           na           na    929279244
#> 739          305          360           na           na         3840
#> 740      2000000      3000000           na           na     18757951
#> 741       509385       526590       564185       553975       566510
#> 742   1114000000   1230000000   1409687056   1435218865   1511500682
#> 743           na           na           na           na           na
#> 744           na           na           na           na           na
#> 745           na           na           na           na           na
#> 746           na           na           na           na           na
#> 747           na           na           na           na           na
#> 748           na           na           na           na           na
#> 749           na           na           na           na           na
#> 750           na           na           na           na           na
#> 751       559140       571335       605315       595915       619850
#> 752   1842000000   1954000000   2170103222   2180086045   2295257158
#> 753       278360       282765       302095       297080       304375
#> 754    513000000    523000000    582390298    581949004    611967853
#> 755       722040       740845       791975       789440       817985
#> 756  10118000000  11023000000  12743418837  13402233413  14359089508
#> 757           na           na           na           na           na
#> 758           na           na           na           na           na
#> 759           na           na           na           na           na
#> 760           na           na           na           na           na
#> 761           na           na           na           na           na
#> 762           na           na           na           na           na
#> 763         <NA>         <NA>         <NA>         <NA>         <NA>
#> 764         <NA>         <NA>         <NA>         <NA>         <NA>
#> 765           na           na           na           na           na
#> 766           na           na           na           na           na
#> 767           na           na           na           na           na
#> 768           na           na           na           na           na
#> 769         1780         1635         1445         1400         3385
#> 770      4000000      5000000      5058620      4816823     15271371
#> 771           na           na           na           na           na
#> 772           na           na           na           na           na
#> 773           na           na           na           na           na
#> 774           na           na           na           na           na
#> 775         <NA>         <NA>         <NA>         <NA>         <NA>
#> 776         <NA>         <NA>         <NA>         <NA>         <NA>
#> 777           na           na           na           na           na
#> 778           na           na           na           na           na
#> 779           na           na           na           na           na
#> 780           na           na           na           na           na
#> 781           na           na           na           na           na
#> 782           na           na           na           na           na
#> 783           na           na           na           na           na
#> 784           na           na           na           na           na
#> 785           na           na           na           na           na
#> 786           na           na           na           na           na
#> 787           na           na           na           na           na
#> 788           na           na           na           na           na
#> 789       124185       119280       122815       123845       125890
#> 790   -148000000   -291000000   -373322978   -576465647   -692599591
#> 791       725120       747820       796115       789045       815455
#> 792   7119000000   7856000000   8411958990   8698548270   9776062798
#> 793       830055       848045       898450       606545       918990
#> 794   6972000000   7566000000   8038636011   8122082623   9083463206
#> 795         <NA>         <NA>         <NA>         <NA>         <NA>
#> 796         <NA>         <NA>         <NA>         <NA>         <NA>
#> 797           na           na           na           na           na
#> 798           na           na           na           na           na
#> 799           na           na           na           na           na
#> 800           na           na           na           na           na
#> 801         <NA>         <NA>         <NA>         <NA>         <NA>
#> 802         <NA>         <NA>         <NA>         <NA>         <NA>
#> 803           na           na           na           na           na
#> 804           na           na           na           na           na
#> 805           na           na           na           na           na
#> 806           na           na           na           na           na
#> 807         <NA>         <NA>         <NA>         <NA>         <NA>
#> 808         <NA>         <NA>         <NA>         <NA>         <NA>
#> 809           na           na           na           na           na
#> 810           na           na           na           na           na
#> 811         <NA>         <NA>         <NA>         <NA>         <NA>
#> 812         <NA>         <NA>         <NA>         <NA>         <NA>
#> 813           na           na           na           na           na
#> 814           na           na           na           na           na
#> 815           na           na           na           na           na
#> 816           na           na           na           na           na
#> 817         <NA>         <NA>         <NA>         <NA>         <NA>
#> 818         <NA>         <NA>         <NA>         <NA>         <NA>
#> 819           na           na           na           na           na
#> 820           na           na           na           na           na
#> 821           na           na           na           na           na
#> 822           na           na           na           na           na
#> 823           na           na           na           na           na
#> 824           na           na           na           na           na
#> 825           na           na           na           na           na
#> 826           na           na           na           na           na
#> 827           na           na           na           na           na
#> 828           na           na           na           na           na
#> 829           na           na           na           na           na
#> 830           na           na           na           na           na
#> 831           na           na           na           na           na
#> 832           na           na           na           na           na
#> 833       103810       102825       110755       107670       104420
#> 834   2212000000   2299000000   2557614574   2545241514   2608812000
#> 835        35805        35245        36525        35260        34545
#> 836    455000000    466000000    499315856    490909920    497635862
#> 837           na           na           na           na           na
#> 838           na           na           na           na           na
#> 839           na           na           na           na           na
#> 840           na           na           na           na           na
#> 841           na           na           na           na           na
#> 842           na           na           na           na           na
#> 843           na           na           na           na           na
#> 844           na           na           na           na           na
#>          1998_99    1999_2000      2000_01      2001_02      2002_03
#> 1       10364730     10751410     10933145     11093975     11350160
#> 2        8485225      9074345      8948110      9064090      9241690
#> 3        1879510      1677060      1985030      2029885      2108475
#> 4        5570765      5772065      5834230      5878660      5963295
#> 5        4793965      4979345      5098915      5215315      5386865
#> 6             na           na           na           na           na
#> 7       10310210     10689300     10869740     11020140     11280350
#> 8          54520        62110        63405        73835        69810
#> 9           <NA>         <NA>         <NA>         <NA>         <NA>
#> 10          <NA>         <NA>         <NA>         <NA>         <NA>
#> 11       3459135      3608435      3677280      3701335      3761700
#> 12       2599320      2700070      2750965      2793345      2851260
#> 13       1910465      1987255      2028830      2087235      2166100
#> 14       1043625      1073110      1083230      1098735      1128160
#> 15        807840       825745       832080       844190       862080
#> 16        243800       246665       249045       252340       258690
#> 17        192015       198190       202455       205980       210285
#> 18         98415       101220        99655       101380       102665
#> 19         10120        10710         9600         9440         9225
#> 20            na           na           na           na           na
#> 21            na           na           na           na           na
#> 22          <NA>         <NA>         <NA>         <NA>         <NA>
#> 23          <NA>         <NA>         <NA>         <NA>         <NA>
#> 24       8027655      8347220      8397190      8417340      8506530
#> 25            na           na           na           na           na
#> 26       2337075      2292630      2270030      2137520      2041595
#> 27            na       111560       265920       539120       802035
#> 28          <NA>         <NA>         <NA>         <NA>         <NA>
#> 29          <NA>         <NA>         <NA>         <NA>         <NA>
#> 30        265650       278935       277470       260830       271320
#> 31       1426410      1468800      1479180      1496755      1527495
#> 32       1192185      1214430      1189365      1167590      1167005
#> 33       1120860      1157645      1200730      1248130      1286475
#> 34       1197275      1214880      1219860      1212655      1213035
#> 35       1151400      1194290      1233015      1261120      1282380
#> 36       1071180      1104885      1133725      1158790      1180655
#> 37        950205      1006715      1048175      1048535      1066410
#> 38        660485       710490       749905       820030       880390
#> 39        450855       484740       504955       528615       555595
#> 40        310535       318705       313280       317785       333245
#> 41        240595       249940       242950       234035       233665
#> 42        327090       346955       340535       339105       352485
#> 43          <NA>         <NA>         <NA>         <NA>         <NA>
#> 44          <NA>         <NA>         <NA>         <NA>         <NA>
#> 45            na           na           na           na           na
#> 46   77513594417  86909911134  82616841614  86316083504  92838132043
#> 47         73445        63295        44920        43315        53520
#> 48      31581841     26547052     15209888     16116244     22967161
#> 49       7431980      7396620      7403685      7421690      7533285
#> 50    4335426214   4466202483   4707949218   4858396410   5125909394
#> 51        267630       276590       166085       203695       245785
#> 52     165980790    166595962    103585909    124659977    151124433
#> 53            na           na           na           na           na
#> 54            na           na           na           na           na
#> 55            na           na           na           na           na
#> 56   72445465843  82049238889  82947910049  86494003024  93206206025
#> 57            na           na           na           na           na
#> 58            na           na           na           na           na
#> 59            na           na           na           na           na
#> 60            na           na           na           na           na
#> 61            na           na           na           na           na
#> 62    1704997845   1811201820   1968050729   2139423692   2314571884
#> 63        319955       342990       354840       348515       351530
#> 64     491840483    561684502    606011706    611710892    638941417
#> 65            na           na           na           na           na
#> 66            na           na           na           na           na
#> 67            na           na           na           na           na
#> 68            na           na           na           na           na
#> 69            na           na           na           na           na
#> 70            na           na           na           na           na
#> 71            na           na           na           na           na
#> 72            na           na           na           na           na
#> 73            na           na           na           na           na
#> 74            na           na           na           na           na
#> 75            na           na           na           na           na
#> 76            na           na           na           na           na
#> 77            na           na           na           na           na
#> 78            na           na           na           na           na
#> 79            na           na           na           na           na
#> 80            na           na           na           na           na
#> 81            na           na           na           na           na
#> 82            na           na           na           na           na
#> 83          <NA>         <NA>         <NA>         <NA>         <NA>
#> 84          <NA>         <NA>         <NA>         <NA>         <NA>
#> 85       7986135      8301885      8439340      8509955      8647140
#> 86  237440435636 257114064414 274069457330 284852462530 300136845188
#> 87            na           na           na           na           na
#> 88            na           na           na           na           na
#> 89       2061105      2132865      2079930      2035385      2056340
#> 90    4609916519   5059235358   5167068034   5297411404   5441794059
#> 91        250340       228095       219020       225160       186555
#> 92    1943591836   1884279019   1876083361   2007497966   1684253167
#> 93         38655        34235        30615        27675        23160
#> 94      18022671     17428110     15735249     13886343     11915881
#> 95            na           na           na           na           na
#> 96            na           na           na           na           na
#> 97            na           na           na           na           na
#> 98            na           na           na           na           na
#> 99            na           na           na           na           na
#> 100           na           na           na           na           na
#> 101           na           na           na           na           na
#> 102           na           na           na           na           na
#> 103           na           na           na           na           na
#> 104           na           na           na           na           na
#> 105           na           na           na           na           na
#> 106           na           na           na           na           na
#> 107           na           na           na           na           na
#> 108           na           na           na           na           na
#> 109           na           na           na           na           na
#> 110           na           na           na           na           na
#> 111           na           na           na           na           na
#> 112           na           na           na           na           na
#> 113      1176605      1164715      1184995      1185135      1146625
#> 114   4361728549   4261121395   4509424510   4831909870   4891684504
#> 115       730170       734575       676575       673010       691840
#> 116   4093157845   4240444377   4068202062   4186105779   4487267412
#> 117           na           na           na           na           na
#> 118           na           na           na           na           na
#> 119           na           na           na           na           na
#> 120           na           na           na           na           na
#> 121           na           na           na           na           na
#> 122           na           na           na           na           na
#> 123           na           na           na           na           na
#> 124           na           na           na           na           na
#> 125           na           na           na           na           na
#> 126           na           na           na           na           na
#> 127           na           na           na           na           na
#> 128           na           na           na           na           na
#> 129           na           na           na           na           na
#> 130           na           na           na           na           na
#> 131           na           na           na           na           na
#> 132           na           na           na           na           na
#> 133           na           na           na           na           na
#> 134           na           na           na           na           na
#> 135           na           na           na           na           na
#> 136           na           na           na           na           na
#> 137           na           na           na           na           na
#> 138           na           na           na           na           na
#> 139           na           na           na           na           na
#> 140           na           na           na           na           na
#> 141           na           na           na           na           na
#> 142           na           na           na           na           na
#> 143           na           na         7480         7155         7660
#> 144           na           na    156525007    148749122    173180276
#> 145         <NA>         <NA>         <NA>         <NA>         <NA>
#> 146      4815925      4697850      4532210      4111485      4039060
#> 147   5607148478   5676501198   6715224132   5885261161   6421899557
#> 148           na       136830       141275       120730       123380
#> 149           na     29266338     37669935     31815449     36869489
#> 150           na           na           na           na           na
#> 151           na           na           na           na           na
#> 152      2446470      2672570      3311650      3274065      3219000
#> 153   5998744802   6959419349   9142010570   8286281513   9798695016
#> 154      2431825      2664070      3291625      3253530      3179500
#> 155   3363646252   3897561039   4683948868   3537670899   4180653212
#> 156           na       114880       111510        79300        87310
#> 157           na     12490865     12056718      7002899      8069729
#> 158           na           na           na           na           na
#> 159           na           na           na           na           na
#> 160           na           na           na           na           na
#> 161           na           na           na           na           na
#> 162           na           na           na           na           na
#> 163           na           na           na           na           na
#> 164           na           na           na           na           na
#> 165           na           na           na           na           na
#> 166           na           na           na           na           na
#> 167           na           na           na           na           na
#> 168           na           na           na           na           na
#> 169           na           na           na           na           na
#> 170           na           na           na           na           na
#> 171           na           na           na           na           na
#> 172           na           na           na           na           na
#> 173           na           na           na           na           na
#> 174           na           na           na           na           na
#> 175           na           na           na           na           na
#> 176           na           na           na           na           na
#> 177 321360167922 348854939540 356070315208 368697577495 388239211578
#> 178         <NA>         <NA>         <NA>         <NA>         <NA>
#> 179         <NA>         <NA>         <NA>         <NA>         <NA>
#> 180           na           na           na           na           na
#> 181           na           na           na           na           na
#> 182           na           na           na           na           na
#> 183           na           na           na           na           na
#> 184           na           na           na           na           na
#> 185           na           na           na           na           na
#> 186           na           na           na           na           na
#> 187           na           na           na           na           na
#> 188      1647515      1806945      1939330      2093695      2224935
#> 189   2620775912   3118485024   3634605973   3972950000   4316145747
#> 190       454535       497750       527095       565055       604315
#> 191    581930770    679860272    762986812    816692469    887579732
#> 192           na           na           na           na           na
#> 193           na           na           na           na           na
#> 194           na           na           na           na           na
#> 195           na           na           na           na           na
#> 196           na           na           na           na           na
#> 197           na           na           na           na           na
#> 198           na           na           na           na           na
#> 199           na           na           na           na           na
#> 200           na           na           na           na           na
#> 201           na           na           na           na           na
#> 202      3718220      3978840      4139675      4470445      4632900
#> 203    711778067    794023027    851878284   1127293984   1031993180
#> 204           na           na           na           na           na
#> 205           na           na           na           na           na
#> 206           na           na           na           na           na
#> 207           na           na           na           na           na
#> 208           na           na           na           na           na
#> 209           na           na           na           na           na
#> 210           na           na           na           na           na
#> 211           na           na           na           na           na
#> 212       509030       513065       516350       528065       534980
#> 213    574636475    625187802    672887563    715778173    752075457
#> 214      5328405      5618295      5775215      5239105      5287430
#> 215   2827794025   3105454004   3407798556   3675008390   3839997877
#> 216      6525590      6847070      7016340      6947750      7066925
#> 217   7316915249   8323000346   9330157188  10307723016  10827791993
#> 218           na           na           na       103170       143085
#> 219           na           na           na     53632965     74070194
#> 220           na           na           na           na           na
#> 221           na           na           na           na           na
#> 222           na           na           na           na           na
#> 223           na           na           na           na           na
#> 224      3392450      3471650      3565275      3750205      3854545
#> 225    685557681    744131056    867537254    925155255   1000823363
#> 226      4804840      4986900      5022235      5052485      5105485
#> 227    692716288    760745355    900840866    992466474   1071981916
#> 228           na           na           na           na           na
#> 229           na           na           na           na           na
#> 230           na           na           na           na           na
#> 231           na           na           na           na           na
#> 232           na           na           na           na           na
#> 233           na           na           na           na           na
#> 234           na           na           na           na           na
#> 235           na           na           na           na           na
#> 236      8371080      8602780      8694205      8714155      8856570
#> 237  16368204755  14170352868  16085766130  17779939125  18941438452
#> 238         <NA>         <NA>         <NA>         <NA>         <NA>
#> 239         <NA>         <NA>         <NA>         <NA>         <NA>
#> 240           na           na           na           na           na
#> 241           na           na           na           na           na
#> 242         <NA>         <NA>         <NA>         <NA>         <NA>
#> 243         <NA>         <NA>         <NA>         <NA>         <NA>
#> 244           na           na           na           na           na
#> 245           na           na           na           na           na
#> 246           na           na           na           na           na
#> 247           na           na           na           na           na
#> 248           na           na           na           na           na
#> 249           na           na           na           na           na
#> 250           na           na        50135        42505        32820
#> 251           na           na   2151769419   1899651113   1468744103
#> 252           na           na        67485        79465        80730
#> 253           na           na   1716508278   1821043014   1756492058
#> 254           na        73310        80500        87185        80195
#> 255           na    842156636   1084818986   1127033851    991831902
#> 256         <NA>         <NA>         <NA>         <NA>         <NA>
#> 257         <NA>         <NA>         <NA>         <NA>         <NA>
#> 258           na           na           na           na           na
#> 259           na           na           na           na           na
#> 260         <NA>         <NA>         <NA>         <NA>         <NA>
#> 261           na           na           na           na           na
#> 262 309083899417 335473326376 354681007196 366689146155 386455167966
#> 263         <NA>         <NA>         <NA>         <NA>         <NA>
#> 264         <NA>         <NA>         <NA>         <NA>         <NA>
#> 265           na           na           na           na           na
#> 266           na           na           na           na           na
#> 267       511965       474785       443525       438275       417850
#> 268    428243696    495190055    560992595    614400924    648266218
#> 269           na           na           na           na           na
#> 270           na           na           na           na           na
#> 271         <NA>         <NA>         <NA>         <NA>         <NA>
#> 272         <NA>         <NA>         <NA>         <NA>         <NA>
#> 273        13855        11770         8445         5290         3685
#> 274     18136882     16240008     13082768      8910812      3784103
#> 275      3559305      3686030      3353240      3256365      3181795
#> 276    458956386    479360329    430269460    417802676    408110862
#> 277           na           na           na           na           na
#> 278           na           na           na           na           na
#> 279           na           na           na           na           na
#> 280           na           na           na           na           na
#> 281           na           na           na           na           na
#> 282           na           na           na           na           na
#> 283       106630       102115       134155       145480       109530
#> 284    102285219    114413174    212947369    314317446    217804019
#> 285       321210       316215       287545       318770       331240
#> 286    120133081    120257901     91467361    112670651    130510590
#> 287       451085       421840       259665       278280       261005
#> 288   1548133597   1680230973   1467940139   1591880479   1669274971
#> 289           na           na           na           na           na
#> 290           na           na           na           na           na
#> 291           na           na           na           na           na
#> 292           na           na           na           na           na
#> 293         <NA>         <NA>         <NA>         <NA>         <NA>
#> 294         <NA>         <NA>         <NA>         <NA>         <NA>
#> 295      8309040      8612750      8736520      8801570      8938735
#> 296  68488538664  75579570655  72341415966  76449721245  81695017443
#> 297           na           na           na           na           na
#> 298           na           na           na           na           na
#> 299         <NA>         <NA>         <NA>         <NA>         <NA>
#> 300         <NA>         <NA>         <NA>         <NA>         <NA>
#> 301           na      4241820      5068900      5279545      5423755
#> 302           na           na           na           na           na
#> 303           na           na           na           na           na
#> 304           na           na           na           na           na
#> 305           na           na           na           na           na
#> 306           na           na           na           na           na
#> 307           na           na           na           na           na
#> 308           na           na           na           na           na
#> 309           na           na           na           na           na
#> 310         <NA>         <NA>         <NA>         <NA>         <NA>
#> 311         <NA>         <NA>         <NA>         <NA>         <NA>
#> 312      1788545      2150240      2039085      2028655      2096420
#> 313   5024454449   7028485948   7866220723   8185732970   8821935079
#> 314      7890935      7918320      8424450      8596640      8771530
#> 315 -10544020337 -11141224506 -10768248211 -11525329551 -12549305573
#> 316           na           na           na           na           na
#> 317  -5519565888  -4112738558  -2902027488  -3339596581  -3727370494
#> 318         <NA>         <NA>         <NA>         <NA>         <NA>
#> 319         <NA>         <NA>         <NA>         <NA>         <NA>
#> 320           na           na           na           na           na
#> 321           na           na           na           na           na
#> 322           na           na           na           na           na
#> 323           na           na           na           na           na
#> 324           na           na           na           na           na
#> 325           na           na           na           na           na
#> 326       172745       184585       193390       183865       200920
#> 327    928393968   1134972583   1149889698   1072007481   1170654719
#> 328           na           na           na           na           na
#> 329           na           na           na           na           na
#> 330           na           na           na           na           na
#> 331           na           na           na           na           na
#> 332           na           na           na           na           na
#> 333           na           na           na           na           na
#> 334           na           na           na           na           na
#> 335           na           na           na           na           na
#> 336         <NA>         <NA>         <NA>         <NA>         <NA>
#> 337         <NA>         <NA>         <NA>         <NA>         <NA>
#> 338           na           na           na           na           na
#> 339           na           na           na           na           na
#> 340           na           na           na           na           na
#> 341           na           na           na           na           na
#> 342           na       448395       469035       500065       545055
#> 343           na   5476706279   5929182921   5703191038   6549941124
#> 344           na           na           na           na           na
#> 345           na           na           na           na           na
#> 346           na           na           na           na           na
#> 347           na           na           na           na           na
#> 348           na           na           na           na           na
#> 349           na           na           na           na           na
#> 350           na           na           na           na           na
#> 351           na           na           na           na           na
#> 352           na           na           na           na           na
#> 353           na           na           na           na           na
#> 354           na           na           na           na           na
#> 355           na           na           na           na           na
#> 356         <NA>         <NA>         <NA>         <NA>         <NA>
#> 357         <NA>         <NA>         <NA>         <NA>         <NA>
#> 358         <NA>         <NA>         <NA>         <NA>         <NA>
#> 359           na           na           na           na           na
#> 360           na           na           na           na           na
#> 361           na           na           na           na           na
#> 362           na           na           na           na           na
#> 363           na           na           na           na           na
#> 364           na           na           na           na           na
#> 365           na           na           na           na           na
#> 366           na           na           na           na           na
#> 367           na           na           na           na           na
#> 368           na           na           na           na           na
#> 369           na           na           na           na           na
#> 370           na           na           na           na           na
#> 371        18130        17315        14960        15215        15190
#> 372     60945354     59702321     50738725     58021988     55228489
#> 373           na           na           na           na           na
#> 374           na           na           na           na           na
#> 375           na           na           na           na           na
#> 376           na           na           na           na           na
#> 377           na           na           na           na           na
#> 378           na           na           na           na           na
#> 379           na           na           na           na           na
#> 380           na           na           na           na           na
#> 381        73450        69875        66600        96470        77605
#> 382    228922916    233930186    231377625    283512535    256608817
#> 383       356500       347400       334555       325005       315135
#> 384   4610767440    881183425   2772718122   4431447759   2453632579
#> 385         <NA>         <NA>         <NA>         <NA>         <NA>
#> 386         <NA>         <NA>         <NA>         <NA>         <NA>
#> 387           na           na           na           na           na
#> 388           na           na           na           na           na
#> 389           na           na           na           na           na
#> 390           na           na           na           na           na
#> 391           na           na           na           na           na
#> 392           na           na           na           na           na
#> 393           na           na           na           na           na
#> 394           na           na           na           na           na
#> 395           na           na           na           na           na
#> 396           na           na           na           na           na
#> 397           na           na           na           na           na
#> 398           na           na           na           na           na
#> 399           na           na           na           na           na
#> 400           na           na           na           na           na
#> 401         1815         1875         1690         1460         1420
#> 402      4548526      5006888      5307309      4386783      4764681
#> 403           na           na           na           na           na
#> 404           na           na           na           na           na
#> 405           na           na           na           na           na
#> 406           na           na           na           na           na
#> 407           na           na           na           na           na
#> 408           na           na           na           na           na
#> 409           na           na           na           na           na
#> 410           na           na           na           na           na
#> 411       255455       288840       324700       360660       357145
#> 412    924521992   1054305448   1187666364   1260108950   1334648986
#> 413      1954510      2048720      2163450      2121835      2097645
#> 414  22260899184  22780264396  22179582953  22353754558  24508973536
#> 415         <NA>         <NA>         <NA>         <NA>         <NA>
#> 416           na           na           na           na           na
#> 417           na           na           na           na           na
#> 418           na           na           na           na           na
#> 419           na           na           na           na           na
#> 420           na           na           na           na           na
#> 421           na           na           na           na           na
#> 422           na           na           na           na           na
#> 423           na           na           na           na           na
#> 424           na           na           na           na           na
#> 425           na           na           na           na           na
#> 426      2063850      2157115      2258780      2213845      2189640
#> 427  26871666624  23661447821  24952301075  26785202317  26962606115
#> 428         <NA>         <NA>         <NA>         <NA>         <NA>
#> 429           na           na           na           na           na
#> 430           na           na           na           na           na
#> 431           na           na           na           na           na
#> 432           na           na           na           na           na
#> 433         <NA>         <NA>         <NA>         <NA>         <NA>
#> 434         <NA>         <NA>         <NA>         <NA>         <NA>
#> 435           na           na         6145         4875         4495
#> 436           na           na      8015112      3795865      6110949
#> 437           na       798660       932515      1000255       986710
#> 438           na   1253695714   1464902932   1053483429   1291821929
#> 439           na        77730        76485        66330        65645
#> 440           na     24807805     24214993     20208653     22584354
#> 441           na           na           na           na           na
#> 442           na           na           na           na           na
#> 443         4810         4265         4840         3045         2630
#> 444      9887825      9188255      8685869      8408614      7222044
#> 445           na           na           na           na           na
#> 446           na           na           na           na           na
#> 447           na           na           na           na           na
#> 448           na           na           na           na           na
#> 449         <NA>         <NA>         <NA>         <NA>         <NA>
#> 450         <NA>         <NA>         <NA>         <NA>         <NA>
#> 451           na           na         6900         7315         7670
#> 452           na           na     28309029     31992830     39205549
#> 453           na           na         1800         1470         1350
#> 454           na           na      2779429      3030833      3188445
#> 455           na           na         9190        17660        19665
#> 456           na           na     30592384     59363154     71705908
#> 457           na           na           na           na           na
#> 458           na           na           na           na           na
#> 459         <NA>         <NA>         <NA>         <NA>         <NA>
#> 460         <NA>         <NA>         <NA>         <NA>         <NA>
#> 461       125525       124095       116620       115810       117515
#> 462   -708163569   -729597416   -302259062   -146136835   -672755368
#> 463       844660       898215       790130       821855       862790
#> 464  10960893919  12792307295  11185239938  12727828351  14029264793
#> 465           na           na           na           na           na
#> 466           na           na           na           na           na
#> 467           na           na           na           na           na
#> 468           na           na           na           na           na
#> 469           na           na        23915        17510        13890
#> 470           na           na    123471579     99572863     84243496
#> 471           na           na         3185         2020         1780
#> 472           na           na      4850210      4450413      3979568
#> 473           na           na           na           na           na
#> 474           na           na           na           na           na
#> 475           na           na         5485         4615         4590
#> 476           na           na     24487482     21963471     22499064
#> 477         <NA>         <NA>         <NA>         <NA>         <NA>
#> 478         <NA>         <NA>         <NA>         <NA>         <NA>
#> 479           na           na        38980        41880        43980
#> 480           na           na    156219215    177507221    217312363
#> 481           na           na        63985        78145        89990
#> 482           na           na    297281817    399473008    520526570
#> 483           na           na           na           na           na
#> 484           na           na           na           na           na
#> 485           na           na           na           na           na
#> 486           na           na           na           na           na
#> 487         <NA>         <NA>         <NA>         <NA>         <NA>
#> 488         <NA>         <NA>         <NA>         <NA>         <NA>
#> 489           na           na           na           na           na
#> 490           na           na           na           na           na
#> 491           na           na           na           na           na
#> 492           na           na           na           na           na
#> 493           na           na           na           na           na
#> 494           na           na           na           na           na
#> 495         6310         6115        12380        27165        18985
#> 496   -158916709   -167658225   -411593479  -1022239655   -720930409
#> 497         2770         3650         2675         2355         9165
#> 498     59448502     79013534     62516224     59692751    252399002
#> 499           na           na           na           na           na
#> 500           na           na           na           na           na
#> 501         <NA>         <NA>         <NA>         <NA>         <NA>
#> 502         <NA>         <NA>         <NA>         <NA>         <NA>
#> 503       972620      1031175      1441125      1140830       840580
#> 504   6171731083   6325314900   6131267704   6837506302   7247383925
#> 505           na      1154970      1616905      1331010      1083260
#> 506           na  10767733746  13064179896  15692704245  17158109215
#> 507       321960       334800       391925       490435       610320
#> 508   3972571142   4657290779   4808237520   6022283516   7499732529
#> 509           na           na           na           na           na
#> 510           na           na           na           na           na
#> 511         <NA>         <NA>         <NA>         <NA>         <NA>
#> 512         <NA>         <NA>         <NA>         <NA>         <NA>
#> 513           na           na           na           na           na
#> 514           na           na           na           na           na
#> 515           na           na           na           na           na
#> 516           na           na           na           na           na
#> 517         <NA>         <NA>         <NA>         <NA>         <NA>
#> 518         <NA>         <NA>         <NA>         <NA>         <NA>
#> 519           na       669315       731900       831365       915295
#> 520           na   1746589220   1901128331   1851715819   2007711319
#> 521           na           na           na           na           na
#> 522           na           na           na           na           na
#> 523           na           na           na           na           na
#> 524           na           na           na           na           na
#> 525        72480        77760        58950        53805        54050
#> 526    447099789    468557107    415183433    407138920    421349746
#> 527           na           na           na           na           na
#> 528           na           na           na           na           na
#> 529       453780       538345       626660       734690       823750
#> 530    576485248    626988920    744276220    799860245    870904977
#> 531           na           na           na           na           na
#> 532           na           na           na           na           na
#> 533           na           na           na           na           na
#> 534           na           na           na           na           na
#> 535           na        18095        19810        22270        22795
#> 536           na    802989545    992735743   1212504740   1185851193
#> 537       354295       332215       411705       481465       570475
#> 538    102622836    108466157    134264917    131598564    136410653
#> 539         <NA>         <NA>         <NA>         <NA>         <NA>
#> 540         <NA>         <NA>         <NA>         <NA>         <NA>
#> 541      1276350      1352200      1381970      1426555      1480480
#> 542  11369255419  12402571705  13454798381  14337280240  15553863159
#> 543       913350       990170      1030690      1085525      1149830
#> 544   5001371247   5848682492   7226796301   7235387046   8625647434
#> 545       245500       293780       321770       367655       413025
#> 546    404041774    491470006    572576125    664306865    761039191
#> 547      1271735      1350630      1378010      1427660      1483110
#> 548   5265410313   5906740098   6456410661   7060370749   7692634752
#> 549           na           na           na           na           na
#> 550  10670823334  12246892596  14255783087  14960064660  17079321377
#> 551       636555       628980       582670       616700       596840
#> 552   3194420389   3266612704   3252070646   3421754510   3466336692
#> 553           na           na           na           na           na
#> 554       649680       736810       809280       825080       900840
#> 555  -2495966765  -3110944665  -4053057665  -4044538930  -4991797313
#> 556      1286230      1365790      1391950      1441780      1497685
#> 557    698453624    155668039   -800987019   -622784420  -1525460621
#> 558         <NA>         <NA>         <NA>         <NA>         <NA>
#> 559        14060        11960         8570         5355         3725
#> 560     49838890     43983757     35107213     26720846     12619123
#> 561           na           na           na           na           na
#> 562           na           na           na           na           na
#> 563         4475        40390        79185        63665        60095
#> 564     40771782    278883489    359846650    426881947    436779652
#> 565        90140       108440       114435       112970        81865
#> 566    712297453    873199597    995125153   1021964588    847053414
#> 567           na           na           na           na           na
#> 568           na           na           na           na           na
#> 569           na           na           na           na           na
#> 570           na           na           na           na           na
#> 571           na           na           na           na           na
#> 572           na           na           na           na           na
#> 573           na           na           na           na           na
#> 574           na           na           na           na           na
#> 575           na         2475         5335         3640         4185
#> 576           na      7358089      8185287      7526476     10003286
#> 577           na         4105         3950         4455         4860
#> 578           na    132037037    134773055    176990985    203019683
#> 579           na           na           na           na           na
#> 580           na           na           na           na           na
#> 581           na           na           na           na           na
#> 582           na           na           na           na           na
#> 583         <NA>         <NA>         <NA>         <NA>         <NA>
#> 584         <NA>         <NA>         <NA>         <NA>         <NA>
#> 585           na        68455        50370        45975        46905
#> 586           na     61691483     48953946     46001207     48752990
#> 587       203300       193185       186405       190110       174970
#> 588   1097333270   1132960376   1191145367   1358774757   1375499745
#> 589           na           na           na         7090         1155
#> 590           na           na           na      4514222      2779987
#> 591           na           na           na           na           na
#> 592           na           na           na           na           na
#> 593           na           na           na           na           na
#> 594           na           na           na           na           na
#> 595       214990       275020       316370       350645       371515
#> 596    702208391    906216310   1007260078    989035933   1043632399
#> 597           na           na           na           na           na
#> 598           na           na           na           na           na
#> 599         <NA>         <NA>         <NA>         <NA>         <NA>
#> 600         <NA>         <NA>         <NA>         <NA>         <NA>
#> 601           na        27575        32005        33870        30675
#> 602           na     11742560     13635232     14641367     13027148
#> 603       512795       510520       504025       509320       518850
#> 604    208667981    204640427    201270856    208118577    214391055
#> 605           na        11780        12945        12750        12280
#> 606           na     13690500     16406068     15945550     14571634
#> 607           na          490          425          355          225
#> 608           na       244881       309399       349600       269787
#> 609           na           na           na           na           na
#> 610           na           na           na           na           na
#> 611           na           na           na           na           na
#> 612           na           na           na           na           na
#> 613           na           na           na           na           na
#> 614           na           na           na           na           na
#> 615           na           na           na           na           na
#> 616           na           na           na           na           na
#> 617           na           na           na           na           na
#> 618           na           na           na           na           na
#> 619           na           na           na           na           na
#> 620           na           na           na           na           na
#> 621           na           na           na           na           na
#> 622           na           na           na           na           na
#> 623           na           na           na           na           na
#> 624           na           na           na           na           na
#> 625           na           na           na           na           na
#> 626           na           na           na           na           na
#> 627           na           na           na           na           na
#> 628           na           na           na           na           na
#> 629           na           na           na           na           na
#> 630           na           na           na           na           na
#> 631           na           na           na           na           na
#> 632           na           na           na           na           na
#> 633           na           na           na           na           na
#> 634           na           na           na           na           na
#> 635           na           na           na           na           na
#> 636           na           na           na           na           na
#> 637         <NA>         <NA>         <NA>         <NA>         <NA>
#> 638         <NA>         <NA>         <NA>         <NA>         <NA>
#> 639           na          380          600          415          225
#> 640           na       961887      1263645      2187692      1904930
#> 641         <NA>         <NA>         <NA>         <NA>         <NA>
#> 642         <NA>         <NA>         <NA>         <NA>         <NA>
#> 643           na         6065         3850         3915         3600
#> 644           na       248013       159169       119797       135975
#> 645         <NA>         <NA>         <NA>         <NA>         <NA>
#> 646         <NA>         <NA>         <NA>         <NA>         <NA>
#> 647         <NA>         <NA>         <NA>         <NA>         <NA>
#> 648           na           na           na           na           na
#> 649           na           na           na           na           na
#> 650           na           na           na           na           na
#> 651           na           na           na           na           na
#> 652           na           na           na           na           na
#> 653           na           na           na           na           na
#> 654           na           na           na           na           na
#> 655           na           na           na           na           na
#> 656           na           na           na           na           na
#> 657           na           na           na           na           na
#> 658           na           na           na           na           na
#> 659           na           na           na           na           na
#> 660           na           na        41780        54860        64995
#> 661           na           na    516970494    724220339    962234648
#> 662         <NA>         <NA>         <NA>         <NA>         <NA>
#> 663           na           na           na           na           na
#> 664         <NA>         <NA>         <NA>         <NA>         <NA>
#> 665         <NA>         <NA>         <NA>         <NA>         <NA>
#> 666         <NA>         <NA>         <NA>         <NA>         <NA>
#> 667           na           na          590          520          510
#> 668           na           na      6401737      8053133      5785060
#> 669           na           na         5700         4240         3965
#> 670           na           na    105270645    109554457    117998885
#> 671           na           na           na           na           na
#> 672           na           na           na           na           na
#> 673           na           na           na           na           na
#> 674           na           na           na           na           na
#> 675           na           na           na           na           na
#> 676           na           na           na           na           na
#> 677           na           na          615          580          605
#> 678           na           na     18671084     15435260     15802874
#> 679           na           na        24875        18360        14490
#> 680           na           na    654207755    525643084    434670506
#> 681           na           na           na           na           na
#> 682           na           na           na           na           na
#> 683           na           na          215          155          215
#> 684           na           na      3235359      2233361      2714435
#> 685           na           na         7880         6705         6745
#> 686           na           na    151899907    126162809    131365334
#> 687           na           na           na           na           na
#> 688           na           na           na           na           na
#> 689         6210         7085        10445        10550        11340
#> 690     19182579     24491260     53870561     67811633     62799203
#> 691         3135         3055        10465         9460        10530
#> 692     67535266     69192989    260765258    249998127    309698920
#> 693         9305        10105        20815        19895        21720
#> 694     86717845     93684249    314635819    317809760    372498123
#> 695           na           na           na           na           na
#> 696           na           na           na           na           na
#> 697           na           na           na           na           na
#> 698           na           na           na           na           na
#> 699           na           na           na           na           na
#> 700           na           na           na           na           na
#> 701        99515        95160        90040        88645        87450
#> 702   2986483488   3216512316   3695242604   4242291376   3851087316
#> 703       834380       886490       782555       812715       852915
#> 704  44878883728  53637294490  51671615559  57548839446  63831305939
#> 705       916915       965630       859090       887990       927155
#> 706  47865367216  56853806806  55366858163  61791130822  67682393255
#> 707         <NA>         <NA>         <NA>         <NA>         <NA>
#> 708         <NA>         <NA>         <NA>         <NA>         <NA>
#> 709       145950       143330       132755       130275       128965
#> 710   2632264430   3008224562   3350585838   3745345676   3744278516
#> 711           na       212605       217540       222165       229725
#> 712           na  18261727941  17916241849  20197266222  22471505681
#> 713           na           na           na           na           na
#> 714           na           na           na           na           na
#> 715           na           na           na           na           na
#> 716           na           na           na           na           na
#> 717           na           na           na           na           na
#> 718           na           na           na           na           na
#> 719           na           na           na           na           na
#> 720           na           na           na           na           na
#> 721       151810       149605       139460       136820       136185
#> 722   2808723138   3335937451   3529686684   3989250642   3880215344
#> 723       234155       240495       241920       244685       253255
#> 724  13666200112  17934004102  17737141003  19953361256  22335568853
#> 725           na           na           na           na           na
#> 726           na           na           na           na           na
#> 727        84940        89575        91790        97770       104150
#> 728   1358539347   1548260514   1523033412   1763954007   2007476037
#> 729        70420        72240        69925        71350        73600
#> 730    308066812    328910502    350832945    388508851    431892310
#> 731         9190         9965         9540         9600         9280
#> 732     37370003     43820253     39874058     37778805     37757902
#> 733        56680        58520        54345        54150        53095
#> 734    396432895    418008029    390452475    378915365    374657313
#> 735       165330       171275       163380       166800       171565
#> 736   1418481260   1530535222   1591980894   1695585134   1826057978
#> 737       207535       217095       210275       213240       219780
#> 738    894226296    982967171   1067528407   1046034671   1130468963
#> 739         2950         3390         4205         4310         4265
#> 740     13921653     15894657     21539270     20382469     20089743
#> 741       574845       592100       547670       550370       571250
#> 742   1579120513   1762994436   1657992365   1828524862   1948516587
#> 743           na           na           na           na           na
#> 744           na           na           na           na           na
#> 745           na           na           na           na           na
#> 746           na           na           na           na           na
#> 747           na           na           na           na           na
#> 748           na           na           na           na           na
#> 749           na           na           na           na           na
#> 750           na           na           na           na           na
#> 751       637735       671745       608700       635500       662280
#> 752   2410215305   2716303702   2567632305   2687433793   2877131444
#> 753       303600       306950       289995       294225       298295
#> 754    624960419    673796136    647592983    723934563    719006267
#> 755       848390       894825       824760       855110       895110
#> 756  14898230244  16803996063  16849458338  18439155809  20298139198
#> 757           na           na           na           na           na
#> 758           na           na           na           na           na
#> 759           na           na           na           na           na
#> 760           na           na           na           na           na
#> 761           na           na           na           na           na
#> 762           na           na           na           na           na
#> 763         <NA>         <NA>         <NA>         <NA>         <NA>
#> 764         <NA>         <NA>         <NA>         <NA>         <NA>
#> 765           na           na           na          280          385
#> 766           na           na           na       655790      1225500
#> 767           na           na           na          190          170
#> 768           na           na           na       305854       687950
#> 769         3525         3300         2770         2470         2330
#> 770     13852914     13561990     11915571      9891341      9894480
#> 771           na         8730         8045        10405        13535
#> 772           na    -38075893    -50447570   -121354463    -72742630
#> 773           na        18930        19485        33360        38665
#> 774           na     20945728     24778347     18455677      4982225
#> 775         <NA>         <NA>         <NA>         <NA>         <NA>
#> 776         <NA>         <NA>         <NA>         <NA>         <NA>
#> 777           na           na           na           na           na
#> 778           na           na           na           na           na
#> 779           na           na           na           na           na
#> 780           na           na           na           na           na
#> 781           na           na           na           na           na
#> 782           na           na           na           na           na
#> 783           na           na           na           na           na
#> 784           na           na           na           na           na
#> 785           na           na           na           na           na
#> 786           na           na           na           na           na
#> 787           na           na           na           na           na
#> 788           na           na           na           na           na
#> 789       125525       124095       116620       115810       117515
#> 790   -708163569   -729597416   -302259062   -146136835   -672755368
#> 791       844660       898215       790130       821855       862790
#> 792  10960893919  12792307295  11185239938  12727828351  14029264793
#> 793       948200      1000470       888575       919505       961800
#> 794  10252730350  12062709879  10882980876  12581691516  13356509425
#> 795         <NA>         <NA>         <NA>         <NA>         <NA>
#> 796         <NA>         <NA>         <NA>         <NA>         <NA>
#> 797           na           na           na           na           na
#> 798           na           na           na           na           na
#> 799           na           na           na           na           na
#> 800           na           na           na           na           na
#> 801         <NA>         <NA>         <NA>         <NA>         <NA>
#> 802         <NA>         <NA>         <NA>         <NA>         <NA>
#> 803           na           na           na           na           na
#> 804           na           na           na           na           na
#> 805           na           na           na           na           na
#> 806           na           na           na           na           na
#> 807         <NA>         <NA>         <NA>         <NA>         <NA>
#> 808         <NA>         <NA>         <NA>         <NA>         <NA>
#> 809           na           na           na           na           na
#> 810           na           na           na           na           na
#> 811         <NA>         <NA>         <NA>         <NA>         <NA>
#> 812         <NA>         <NA>         <NA>         <NA>         <NA>
#> 813           na           na           na           na           na
#> 814           na           na           na           na           na
#> 815           na           na           na           na           na
#> 816           na           na           na           na           na
#> 817         <NA>         <NA>         <NA>         <NA>         <NA>
#> 818         <NA>         <NA>         <NA>         <NA>         <NA>
#> 819           na           na           na           na           na
#> 820           na           na           na           na           na
#> 821           na           na           na           na           na
#> 822           na           na           na           na           na
#> 823           na           na           na           na           na
#> 824           na           na           na           na           na
#> 825           na           na           na           na           na
#> 826           na           na           na           na           na
#> 827           na           na           na           na           na
#> 828           na           na           na           na           na
#> 829           na           na           na           na           na
#> 830           na           na           na           na           na
#> 831           na           na           na           na           na
#> 832           na           na           na           na           na
#> 833       100995        99370        84360        82355        81055
#> 834   2633834912   2845436815   3006357622   2913659834   3105428964
#> 835        30670        29205        21600        20925        20090
#> 836    649248556    709629837    643020232    572555496    459888489
#> 837           na           na           na         2015         1505
#> 838           na           na           na     26296851     15886596
#> 839           na           na           na       117990       122155
#> 840           na           na           na   1534781334   1530550437
#> 841           na           na           na          880          765
#> 842           na           na           na     16415912     17335954
#> 843           na           na           na        42720        37680
#> 844           na           na           na    871585740    721159033
#>          2003_04      2004_05      2005_06      2006_07      2007_08
#> 1       11662875     11946065     12208760     12562515     12994080
#> 2        9442995      9723380      9920200      9850200     10083420
#> 3        2219875      2222685      2288560      2712315      2910660
#> 4        6089255      6223025      6344865      6523110      6760940
#> 5        5573620      5723040      5863895      6039405      6233135
#> 6             na           na           na           na           na
#> 7       11591845     11873640     12134830     12481635     12906460
#> 8          71030        72425        73930        80880        87620
#> 9           <NA>         <NA>         <NA>         <NA>         <NA>
#> 10          <NA>         <NA>         <NA>         <NA>         <NA>
#> 11       3850320      3920540      3978125      4066365      4174915
#> 12       2914455      2976705      3036160      3114550      3213010
#> 13       2256385      2339020      2416815      2510670      2619550
#> 14       1165050      1203520      1246295      1303720      1372245
#> 15        880070       896490       910605       927240       948315
#> 16        266955       273805       278320       283265       288620
#> 17        214850       218730       224130       231145       238980
#> 18        104695       107200       107960       111585       117935
#> 19         10095        10050        10345        13980        20505
#> 20            na           na           na           na           na
#> 21            na           na           na           na           na
#> 22          <NA>         <NA>         <NA>         <NA>         <NA>
#> 23          <NA>         <NA>         <NA>         <NA>         <NA>
#> 24       8669205      8811355      8974240      9147375      9204045
#> 25            na           na           na           na           na
#> 26       1972720      1839710      1734725      1669585      1674930
#> 27       1020950      1294995      1499795      1745555      2115100
#> 28          <NA>         <NA>         <NA>         <NA>         <NA>
#> 29          <NA>         <NA>         <NA>         <NA>         <NA>
#> 30        282195       296715       296355       305860       341295
#> 31       1573570      1596215      1619910      1672760      1784290
#> 32       1183365      1203890      1228760      1282915      1366070
#> 33       1312120      1339225      1314660      1298795      1307265
#> 34       1236815      1283145      1328220      1374870      1412340
#> 35       1304900      1324340      1317470      1314830      1323340
#> 36       1213005      1252830      1281965      1315800      1355305
#> 37       1085330      1109820      1131850      1160710      1197130
#> 38        921575       962915      1001840      1008960      1035655
#> 39        592940       626965       669305       740120       782135
#> 40        352855       367050       392150       418110       418575
#> 41        235265       230855       239570       252875       253160
#> 42        368945       352105       386705       415910       417520
#> 43          <NA>         <NA>         <NA>         <NA>         <NA>
#> 44          <NA>         <NA>         <NA>         <NA>         <NA>
#> 45            na           na           na           na           na
#> 46  100542894543 109464561643 115525646211 122744641532 127514602293
#> 47         57675        58480        56275        48220        41185
#> 48      27730619     29204600     29240797     22058098     17488777
#> 49       7765765      8026890      8253100      8512005      8727310
#> 50    5543147887   5999849932   6468919889   7101763428   7607234083
#> 51        346135       452440       535995       680090       760230
#> 52     212964034    276814678    334559635    431162935    482765262
#> 53            na           na           na           na           na
#> 54            na           na           na           na           na
#> 55            na           na           na           na           na
#> 56  100961716811 109469766072 115231517725 121472183849 126555872057
#> 57            na           na           na           na           na
#> 58            na           na           na   4684792762   5025102721
#> 59            na           na           na           na           na
#> 60            na           na           na 116779824944 121523758815
#> 61            na           na           na           na           na
#> 62    3585208926   4273413176   5483349046   8153388256   7483808610
#> 63        369220       270190       301650       325025       364250
#> 64     704148931    683518081    808905432    938640956   1123990859
#> 65            na           na           na           na           na
#> 66            na           na           na           na           na
#> 67            na           na           na           na           na
#> 68            na           na           na           na           na
#> 69            na           na           na        58430        60175
#> 70            na           na           na     89127687     96792773
#> 71            na           na           na           na           na
#> 72            na           na           na           na           na
#> 73            na           na           na           na           na
#> 74            na           na           na           na           na
#> 75            na           na           na           na           na
#> 76            na           na           na           na           na
#> 77            na           na           na           na           na
#> 78            na           na           na           na           na
#> 79            na           na           na           na           na
#> 80            na           na           na           na           na
#> 81            na           na           na           na           na
#> 82            na           na           na           na           na
#> 83          <NA>         <NA>         <NA>         <NA>         <NA>
#> 84          <NA>         <NA>         <NA>         <NA>         <NA>
#> 85       8865995      9121855      9349850      9679410     10184950
#> 86  321128753043 345302362155 369938753469 401301192824 441910373996
#> 87            na           na           na           na           na
#> 88            na           na           na           na           na
#> 89       2097915      2146645      2172910      2172700      2243595
#> 90    5635877210   6035657544   6396896785   6925888725   7611988203
#> 91        163165       155395       159575       150210       145115
#> 92    1496688987   1451238911   1617921434   1631477679   1497159759
#> 93         19445        19310        19675        18010        18305
#> 94      10122174     10419439     10267556      9838819      9946209
#> 95            na           na           na           na           na
#> 96            na           na           na           na           na
#> 97            na           na           na           na           na
#> 98            na           na           na           na           na
#> 99            na           na           na           na           na
#> 100           na           na           na           na           na
#> 101           na           na           na           na           na
#> 102           na           na           na           na           na
#> 103           na           na           na           na           na
#> 104           na           na           na           na           na
#> 105           na           na           na           na           na
#> 106           na           na           na           na           na
#> 107           na           na           na           na           na
#> 108           na           na           na           na           na
#> 109           na           na           na           na           na
#> 110           na           na           na           na           na
#> 111           na           na           na           na       155290
#> 112           na           na           na           na   1811043573
#> 113      1081715      1046890      1013180       996215       971880
#> 114   5097220637   4899335998   4727712212   4703237466   4714811245
#> 115       704395       740470       760900       761470       762615
#> 116   4953282164   5391775429   5575749918   5783036343   5881763543
#> 117           na           na           na           na       112395
#> 118           na           na           na           na   1825376667
#> 119           na           na           na           na       215910
#> 120           na           na           na           na   4826833808
#> 121           na           na           na           na           na
#> 122           na           na           na           na           na
#> 123           na           na           na           na         1145
#> 124           na           na           na           na      5533501
#> 125           na           na           na           na         2215
#> 126           na           na           na           na      8693045
#> 127           na           na           na           na           na
#> 128           na           na           na           na           na
#> 129           na           na           na           na           na
#> 130           na           na           na           na           na
#> 131           na           na           na           na           na
#> 132           na           na           na           na           na
#> 133           na           na           na           na        92350
#> 134           na           na           na           na   2188028079
#> 135           na           na           na           na           na
#> 136           na           na           na           na           na
#> 137           na           na           na           na           na
#> 138           na           na           na           na           na
#> 139           na           na           na           na           na
#> 140           na           na           na           na           na
#> 141           na           na           na           na        13130
#> 142           na           na           na           na    279888825
#> 143         7395         7245         7195         7600         8785
#> 144    183928936    188174560    209662811    233089041    285148928
#> 145         <NA>         <NA>         <NA>         <NA>         <NA>
#> 146      4161355      4555760      4616330      5109960      6074695
#> 147   7535089074   8976549721  10189869463  12076065771  14286148659
#> 148       135035       162480       183075       228055       399820
#> 149     43775841     52545479     62567050     76381268    109356861
#> 150           na           na           na      1196090      1212515
#> 151           na           na           na    828994995    854403986
#> 152      3183850      3136620      3110985      3146410      3165800
#> 153  11502618710  13451422861  15319337225  18865462410  19880049359
#> 154      3158615      3124200      3102000      3138375      3158510
#> 155   4911566061   5752031686   6552242985   8073905501   8509972026
#> 156        79910        70465        62275        61430        70670
#> 157      5653853      6681271      6098508      7160786      6841506
#> 158           na           na           na           na           na
#> 159           na           na           na           na           na
#> 160           na           na           na           na           na
#> 161           na           na           na           na           na
#> 162           na           na           na           na           na
#> 163           na           na           na           na           na
#> 164           na           na           na           na           na
#> 165           na           na           na           na           na
#> 166           na           na           na           na           na
#> 167           na           na           na           na           na
#> 168           na           na           na           na           na
#> 169           na           na           na           na           na
#> 170           na           na           na      4706460      4847675
#> 171           na           na           na  83214011701  84503374044
#> 172           na           na           na           na           na
#> 173           na           na           na           na           na
#> 174           na           na           na           na           na
#> 175           na           na           na           na           na
#> 176           na           na           na     12401780     12886875
#> 177 419835401618 453002143433 488634174528 566246339823 600894119100
#> 178         <NA>         <NA>         <NA>         <NA>         <NA>
#> 179         <NA>         <NA>         <NA>         <NA>         <NA>
#> 180           na           na           na      2303615      2439470
#> 181           na           na           na   3539830252   3879754815
#> 182           na           na           na       267325       283055
#> 183           na           na           na   2238608291   2481073518
#> 184           na           na           na           na           na
#> 185           na           na           na           na           na
#> 186           na           na           na        47710        43545
#> 187           na           na           na     71323476     66587423
#> 188      2353365      2454495      2548490      2661640      2812390
#> 189   4684766428   5000689005   5508067545   6036226521   6628565612
#> 190       647525       704685       753995       812280       895310
#> 191    964716529   1072954489   1201356181   1324142814   1505578586
#> 192           na           na           na      1924540      2014180
#> 193           na           na           na    494915799    536256873
#> 194           na           na           na      2668090      2864430
#> 195           na           na           na    613579840    671668152
#> 196           na           na           na       356280       389810
#> 197           na           na           na     68251661     76120407
#> 198           na           na           na       431625       470895
#> 199           na           na           na    119869546    133057086
#> 200           na           na           na       180355       165775
#> 201           na           na           na     40869706     39673563
#> 202      4869855      5116225      5332905      5560895      5905090
#> 203   1110895143   1182056524   1263559059   1337486552   1456776081
#> 204           na           na           na       416690       457710
#> 205           na           na           na    722499374    811525474
#> 206           na           na           na        66450        67575
#> 207           na           na           na    134308614    141410601
#> 208           na           na           na         9840         8685
#> 209           na           na           na     14038535     12901336
#> 210           na           na           na       131810       192410
#> 211           na           na           na     84998422    118830392
#> 212       533720       533405       530665       624790       726380
#> 213    784493134    813352318    866398509    955844945   1084667803
#> 214      5483665      5690545      5906300      6104450      6360155
#> 215   4195829639   4542579486   4960686849   5394661617   5867778759
#> 216      7297660      7540715      7771150      8041825      8428670
#> 217  11740687595  12611631822  13800068143  15048362449  16543366841
#> 218       178415       204045       230875       249310       265685
#> 219     93771638    104386771    110930263    112695718    115085261
#> 220           na           na           na           na           na
#> 221           na           na           na           na           na
#> 222           na           na           na           na           na
#> 223           na           na           na           na           na
#> 224      4006745      4462255      4346220      4448860      4536475
#> 225   1202353414   1524305412   1615119212   1950764705   2385983131
#> 226      5176160      5299925      5379390      5466180      5640455
#> 227   1178269238   1302599141   1403481123   1533316026   1779505944
#> 228           na           na           na           na           na
#> 229           na           na           na           na           na
#> 230           na           na           na           na           na
#> 231           na           na           na           na           na
#> 232           na           na           na           na           na
#> 233           na           na           na           na           na
#> 234           na           na           na       779050       809985
#> 235           na           na           na   9812713695   9536876051
#> 236      9136495      9471765      9712860     10036610     10362015
#> 237  21158365457  23927124226  28385384773  35881851958  34582105508
#> 238         <NA>         <NA>         <NA>         <NA>         <NA>
#> 239         <NA>         <NA>         <NA>         <NA>         <NA>
#> 240           na           na           na     12403230     12887735
#> 241           na           na           na 530364487865 566312013592
#> 242         <NA>         <NA>         <NA>         <NA>         <NA>
#> 243         <NA>         <NA>         <NA>         <NA>         <NA>
#> 244           na        41010        39925        44140        50770
#> 245           na   2314500859   2558585672   2842815837   3467405277
#> 246           na       106730       123070       143825       155605
#> 247           na   2733760649   3456942317   3890976063   4440973836
#> 248           na           na           na       182210       199885
#> 249           na           na           na   6733791900   7908379113
#> 250        38860        24425        21480        21695        27685
#> 251   1584625144    487192508    429331953    443413076    579691534
#> 252        85945        62825        64465        74185        77265
#> 253   1796546884    688407065    788160840    926495266    984214264
#> 254        90485        86075        84755        94560       103410
#> 255   1143097494   1173807715   1217492743   1369908342   1563905798
#> 256         <NA>         <NA>         <NA>         <NA>         <NA>
#> 257         <NA>         <NA>         <NA>         <NA>         <NA>
#> 258           na           na           na     12189910     12661075
#> 259           na           na           na 532310873092 568595402462
#> 260         <NA>         <NA>         <NA>         <NA>         <NA>
#> 261           na           na           na           na           na
#> 262 416344145771 449105991708 483218599181 532310873092 568595402462
#> 263         <NA>         <NA>         <NA>         <NA>         <NA>
#> 264         <NA>         <NA>         <NA>         <NA>         <NA>
#> 265           na           na           na           na           na
#> 266           na           na           na           na           na
#> 267       341030       377335       416805       452940       231205
#> 268    697368882    829872290   1015563999   1223455344    590953345
#> 269           na           na           na      1302800      1402300
#> 270           na           na           na    755121810    834807691
#> 271         <NA>         <NA>         <NA>         <NA>         <NA>
#> 272         <NA>         <NA>         <NA>         <NA>         <NA>
#> 273         3000         2660         2320         2280         2030
#> 274      3241392      3525690      3923972      5773933      4077740
#> 275      3700225      3624040      3506815      5727250      7063495
#> 276    702296002    686825801    660249053   2405046039   3846718863
#> 277           na           na           na           na           na
#> 278           na           na           na           na           na
#> 279           na           na           na           na           na
#> 280           na           na           na           na           na
#> 281           na           na           na           na           na
#> 282           na           na           na           na           na
#> 283       104510        97055        84920        74090        85300
#> 284    152191584    128775605    102509007     89638092    132911889
#> 285       356510       337085       318395       310730       312000
#> 286    164845508    158459496    140755388    145092780    158018201
#> 287       250055       255140       250150       211870       149530
#> 288   1645729266   1827673960   1986967045   1451715666    873272721
#> 289           na           na           na           na           na
#> 290           na           na           na           na           na
#> 291           na           na           na           na           na
#> 292           na           na           na           na           na
#> 293         <NA>         <NA>         <NA>         <NA>         <NA>
#> 294         <NA>         <NA>         <NA>         <NA>         <NA>
#> 295      9146385      9406090      9635260      9958920     10320750
#> 296  87013635182  93878245342  98767865646 102482396766 109532060987
#> 297           na           na           na      1450395      1432370
#> 298           na           na           na  12838780137  13580876574
#> 299         <NA>         <NA>         <NA>         <NA>         <NA>
#> 300         <NA>         <NA>         <NA>         <NA>         <NA>
#> 301      5560370      5715550      5894955      6144225      6416940
#> 302           na           na           na           na           na
#> 303           na           na           na           na           na
#> 304           na           na           na           na           na
#> 305           na           na           na           na           na
#> 306           na           na           na           na           na
#> 307           na           na           na           na           na
#> 308           na           na           na           na           na
#> 309           na           na           na           na           na
#> 310         <NA>         <NA>         <NA>         <NA>         <NA>
#> 311         <NA>         <NA>         <NA>         <NA>         <NA>
#> 312      2187720      2198890      2158655      2079955      1980650
#> 313  10359322246  11277035718  12247233169  15111787873  15036352683
#> 314      8967305      9250975      9531600      9911095     10432600
#> 315 -13880254375 -15482894477 -17414172368 -19752905205 -22912985561
#> 316           na           na           na     11991050     12413250
#> 317  -3520932129  -4205858759  -5166939199  -4641117332  -7876632878
#> 318         <NA>         <NA>         <NA>         <NA>         <NA>
#> 319         <NA>         <NA>         <NA>         <NA>         <NA>
#> 320           na           na           na           na           na
#> 321           na           na           na           na           na
#> 322           na           na           na           na           na
#> 323           na           na           na           na           na
#> 324           na           na           na           na           na
#> 325           na           na           na           na           na
#> 326       211085       223080       226860       233250       263655
#> 327   1218101915   1504798758   1596351854   1675725501   1830461399
#> 328           na           na           na           na           na
#> 329           na           na           na           na           na
#> 330           na           na           na           na           na
#> 331           na           na           na           na           na
#> 332           na           na           na           na           na
#> 333           na           na           na           na           na
#> 334           na           na           na           na           na
#> 335           na           na           na           na           na
#> 336         <NA>         <NA>         <NA>         <NA>         <NA>
#> 337         <NA>         <NA>         <NA>         <NA>         <NA>
#> 338           na           na           na           na           na
#> 339           na           na           na           na           na
#> 340           na           na           na           na           na
#> 341           na           na           na           na           na
#> 342       610490       674765       717580       785685       699955
#> 343   7681367660   9256425965   9890788376  10575070112  11081223311
#> 344           na           na           na           na           na
#> 345           na           na           na           na           na
#> 346           na           na           na           na           na
#> 347           na           na           na           na           na
#> 348           na           na           na           na           na
#> 349           na           na           na           na           na
#> 350           na           na           na           na           na
#> 351           na           na           na           na           na
#> 352           na           na           na           na           na
#> 353           na           na           na           na           na
#> 354           na           na           na           na           na
#> 355           na           na           na           na           na
#> 356         <NA>         <NA>         <NA>         <NA>         <NA>
#> 357         <NA>         <NA>         <NA>         <NA>         <NA>
#> 358         <NA>         <NA>         <NA>         <NA>         <NA>
#> 359           na           na           na       101445       106485
#> 360           na           na           na   2395892048   2979178479
#> 361           na           na           na       142705       130235
#> 362           na           na           na  -2789756259  -2705438283
#> 363           na           na           na       244150       236720
#> 364           na           na           na   -393864211    273740196
#> 365           na           na           na        34370        35775
#> 366           na           na           na   1000975958   1173206701
#> 367           na           na           na         8115         7955
#> 368           na           na           na   -246842043   -298096917
#> 369           na           na           na        42485        43730
#> 370           na           na           na    754133915    875109784
#> 371        14295        14470        15745        15785        15095
#> 372     55679185     51003587     53816855     55040548     55247194
#> 373           na           na           na           na           na
#> 374           na           na           na           na           na
#> 375           na           na           na           na           na
#> 376           na           na           na           na           na
#> 377           na           na           na           na           na
#> 378           na           na           na           na           na
#> 379           na           na           na           na           na
#> 380           na           na           na           na           na
#> 381        74735        70905        63580        59780        57340
#> 382    262083567    272675931    261394648    266545799    276561771
#> 383       305160       297480       289455       280945       274585
#> 384   1955714785   1714386220    787119196     38683357    817041015
#> 385         <NA>         <NA>         <NA>         <NA>         <NA>
#> 386         <NA>         <NA>         <NA>         <NA>         <NA>
#> 387           na           na           na       603435       577710
#> 388           na           na           na  16104200787  16460677376
#> 389           na           na           na       129765       128065
#> 390           na           na           na  -1358954221  -1541036761
#> 391           na           na           na       733200       705775
#> 392           na           na           na  14745246566  14919640615
#> 393           na           na           na      1542195      1618895
#> 394           na           na           na  23694765730  26701515636
#> 395           na           na           na        11345        11100
#> 396           na           na           na   -440949261   -413680609
#> 397           na           na           na      1553540      1629995
#> 398           na           na           na  23253816469  26287835027
#> 399           na           na           na           na           na
#> 400           na           na           na           na           na
#> 401         1320         1355         3170         3275         2950
#> 402      4733158      5094550      8955736     10917861     10162863
#> 403           na           na           na           na           na
#> 404           na           na           na           na           na
#> 405           na           na           na           na           na
#> 406           na           na           na           na           na
#> 407           na           na           na           na           na
#> 408           na           na           na           na           na
#> 409           na           na           na           na           na
#> 410           na           na           na           na           na
#> 411       369300       378765       387830       414845       423940
#> 412   1489509834   1695228767   1966351859   2394288128   2768690196
#> 413      2099045      2121315      2137630      2172790      2219895
#> 414  26696341181  28713105143  30789919313  35593857442  38428642248
#> 415         <NA>         <NA>         <NA>         <NA>         <NA>
#> 416           na           na           na       826300       800070
#> 417           na           na           na  14351382355  15193380811
#> 418           na           na           na      1566585      1643225
#> 419           na           na           na  24007950384  27162944811
#> 420           na           na           na      2252760      2298865
#> 421           na           na           na  38359332739  42356325622
#> 422           na           na           na        19035        18030
#> 423           na           na           na     65958409     65410057
#> 424           na           na           na       470705       477470
#> 425           na           na           na   2660833927   3045251967
#> 426      2189830      2211340      2226040      2259980      2307130
#> 427  28652055966  30427491363  31577038509  35632540799  39245683263
#> 428         <NA>         <NA>         <NA>         <NA>         <NA>
#> 429           na           na           na           na           na
#> 430           na           na           na           na           na
#> 431           na           na           na           na           na
#> 432           na           na           na           na           na
#> 433         <NA>         <NA>         <NA>         <NA>         <NA>
#> 434         <NA>         <NA>         <NA>         <NA>         <NA>
#> 435         4395         4260         4005         3760         3875
#> 436      3128792      3060182      3888609      3784897      3920830
#> 437       951840       960700       971825       987575       968295
#> 438   1543697692   1867052993   2155893936   2880206541   3238853800
#> 439        70525        71660        71445        73910        83680
#> 440     28034599     37539119     45978750     57268771     47605495
#> 441           na           na           na           na           na
#> 442           na           na           na           na           na
#> 443         3200         3450         2865         2980         3195
#> 444      9808534     16634047     13300888     18316088     16315748
#> 445           na         3945         3995         3995         4690
#> 446           na      1428519      1974016      2322064     24294583
#> 447           na           na           na           na           na
#> 448           na           na           na           na           na
#> 449         <NA>         <NA>         <NA>         <NA>         <NA>
#> 450         <NA>         <NA>         <NA>         <NA>         <NA>
#> 451         7860         7925         6750         6265         5990
#> 452     42522201     46478242     45143853     44233211     41640813
#> 453         1275         1175         1055          915          855
#> 454      2498111      2106539      2383752      1712224      1980181
#> 455        22685        25175        27840        27755        32600
#> 456     85649494    104047473    121944593    121293118    144055236
#> 457           na           na           na        97010       107375
#> 458           na           na           na   1643921508   1917758337
#> 459         <NA>         <NA>         <NA>         <NA>         <NA>
#> 460         <NA>         <NA>         <NA>         <NA>         <NA>
#> 461       121910       128745       134565       136180       130795
#> 462   -837704283  -1172118477  -1498630806  -1802602773  -1565582638
#> 463       903140       933550       965445      1005240      1047165
#> 464  15639962329  16699570540  18200223287  20553158257  21989025585
#> 465           na           na           na           na           na
#> 466           na           na           na           na           na
#> 467           na           na           na           na           na
#> 468           na           na           na           na           na
#> 469        11975        11035         9865         8840         8170
#> 470     77444435     77970737     76090147     70870239     67080893
#> 471         1710         1580         1350         1070         1035
#> 472      3592166      3375667      2894562      2531603      2272732
#> 473           na          165          175          315          435
#> 474           na      4699354      4033683      4389481     14532859
#> 475         4955         4825         4890         4760         5640
#> 476     24562476     26215233     28761691     27055625     31216986
#> 477         <NA>         <NA>         <NA>         <NA>         <NA>
#> 478         <NA>         <NA>         <NA>         <NA>         <NA>
#> 479        43690        44165        44395        44490        41890
#> 480    231100390    267691122    295298637    330418453    335051267
#> 481        98910       106020       113355       117715       117525
#> 482    620952261    731179430    829815621    953717822   1035096182
#> 483           na           na           na        34945        32200
#> 484           na           na           na    377377613    375382571
#> 485           na           na           na       127325       127440
#> 486           na           na           na    907017714    995076139
#> 487         <NA>         <NA>         <NA>         <NA>         <NA>
#> 488         <NA>         <NA>         <NA>         <NA>         <NA>
#> 489           na           na           na           na           na
#> 490           na           na           na           na           na
#> 491           na           na           na           na           na
#> 492           na           na           na           na           na
#> 493           na           na           na           na           na
#> 494           na           na           na           na           na
#> 495        14730        14540        12220        11415        12930
#> 496   -463027874   -488584500   -404264190   -491189856   -571696233
#> 497        12570        11485        12205        12790        11355
#> 498    384069587    333220735    381668531    430946291    452671195
#> 499           na           na           na           na           na
#> 500           na           na           na           na           na
#> 501         <NA>         <NA>         <NA>         <NA>         <NA>
#> 502         <NA>         <NA>         <NA>         <NA>         <NA>
#> 503      1014565      1200660      1248545      1434310      1406695
#> 504  10981476028  13208972584  17297841077  27064478297  24348501048
#> 505      1506670      1450705      1426670      1592150      1589720
#> 506  25624315011  30915500887  38884892415  58789071674  57086596868
#> 507       869170       821075       707275       630350       638045
#> 508   8130083082   8281109103   8166708309   8130279402   9808064029
#> 509           na           na           na           na           na
#> 510           na           na           na           na           na
#> 511         <NA>         <NA>         <NA>         <NA>         <NA>
#> 512         <NA>         <NA>         <NA>         <NA>         <NA>
#> 513           na           na           na        10770        23770
#> 514           na           na           na     35952476     31970673
#> 515           na           na           na           80          135
#> 516           na           na           na      4178466      2402009
#> 517         <NA>         <NA>         <NA>         <NA>         <NA>
#> 518         <NA>         <NA>         <NA>         <NA>         <NA>
#> 519       943490      1014775      1069880      1107095      1100500
#> 520   2161761148   2372235033   2672389365   3276516867   3538452973
#> 521           na           na           na           na           na
#> 522           na           na           na           na           na
#> 523           na           na           na           na           na
#> 524           na           na           na           na           na
#> 525        56180        59725        61005        60205        56745
#> 526    410245598    445130068    449385498    455954399    428052703
#> 527           na           na           na           na           na
#> 528           na           na           na           na           na
#> 529       849530       910810       963555      1004660      1003110
#> 530    957915599   1068604167   1332878340   1694020116   2057106839
#> 531         6735         7980         8905         6560         7220
#> 532       725578       991562      1276827      1403123      1853791
#> 533           na           na           na           na           na
#> 534           na           na           na           na           na
#> 535        25045        25040        26420        28170        28725
#> 536   1179228206   1278094064   1365073575   1630647403   1763501410
#> 537       628080       684270       761405       772735       742335
#> 538    150199020    178849949    224957333    245085504    267283528
#> 539         <NA>         <NA>         <NA>         <NA>         <NA>
#> 540         <NA>         <NA>         <NA>         <NA>         <NA>
#> 541      1553565      1588005      1642300      1700340      1756935
#> 542  17259507886  18881342594  20520296684  22491658271  25053768178
#> 543      1228425      1263240      1313900      1368475      1427435
#> 544  10867625327  13062002276  14926458448  17465169502  21103962351
#> 545       467795       509315       550815       596965       639310
#> 546    898287848   1035350123   1169519735   1319012685   1461928165
#> 547      1555860      1589810      1645640      1704720      1762455
#> 548   8549238644   9243162593   9952775810  10680881047  11552546512
#> 549           na           na           na           na           na
#> 550  20315151819  23340514992  26048753993  29465063234  34118437028
#> 551       574160       554500       553730       549885       542680
#> 552   3524479024   3605852890   3766451723   3979153116   4247247908
#> 553           na           na           na           na           na
#> 554       996835      1050270      1106470      1170485      1236215
#> 555  -6580122957  -8065025288  -9294909032 -10952558079 -13311916758
#> 556      1570995      1604770      1660200      1720370      1778890
#> 557  -3055643933  -4459172398  -5528457309  -6973404963  -9064668850
#> 558         <NA>         <NA>         <NA>         <NA>         <NA>
#> 559         3010         2670         2330         2300         2070
#> 560     10808940     11763138     13095257     19324006     13710764
#> 561           na           na           na           na         1170
#> 562           na           na           na           na     13349140
#> 563        70440        82665        86715       103570       209800
#> 564    568761979    809723159   1128165278   1601344198   1911209962
#> 565       112350       116600       122075       122885       133655
#> 566    908799029   1031338621   1091633892   1282714945   1117156335
#> 567           na           na           na           na           na
#> 568           na           na           na           na           na
#> 569           na           na           na           na           na
#> 570           na           na           na           na           na
#> 571           na           na           na           na           na
#> 572           na           na           na           na           na
#> 573           na           na           na           na           na
#> 574           na           na           na           na           na
#> 575         3255         4055         3305         2785         2500
#> 576     10229906     12716324     11497231     11185811      9186878
#> 577         5425         5790         5950         6680         7615
#> 578    235404370    251438723    264360505    312265272    392577070
#> 579           na           na           na           na           na
#> 580           na           na           na           na           na
#> 581           na           na           na      4706460      4847675
#> 582           na           na           na  83214011701  84503374044
#> 583         <NA>         <NA>         <NA>         <NA>         <NA>
#> 584         <NA>         <NA>         <NA>         <NA>         <NA>
#> 585        49360        52615        50915        50260        46650
#> 586     48562604     52769362     51904094     51981621     49159105
#> 587       179005       185790       209825       260690       235385
#> 588   1649981105   2077254655   3985399405   8306898346   7504047215
#> 589         1145         1000          795          915          590
#> 590      2953854      3208392      3309801      4057657      3667864
#> 591           na           na           na           na        12385
#> 592           na           na           na           na    276354189
#> 593           na           na           na         2315         2175
#> 594           na           na           na      9558481      7937494
#> 595       411105       435120       460820       498400       547920
#> 596   1159414712   1208222760   1302652415   1423873770   1679780247
#> 597           na           na           na       779050       809985
#> 598           na           na           na   9812713695   9536876051
#> 599         <NA>         <NA>         <NA>         <NA>         <NA>
#> 600         <NA>         <NA>         <NA>         <NA>         <NA>
#> 601        33455        35665        35320        26140        20985
#> 602     14408568     15411307     15427449     10768958      8404142
#> 603       528960       543650       562615       584395       609255
#> 604    219375654    226265276    234806688    247025221    266347474
#> 605        13960        18070        25165        29600        30135
#> 606     17179945     23203074     33496986     43346423     44726544
#> 607          125          145          100           60           55
#> 608        95506       147621       103418        52631        42982
#> 609           na           na           na           na           na
#> 610           na           na           na           na           na
#> 611           na           na           na           na           na
#> 612           na           na           na           na           na
#> 613           na           na           na           na           na
#> 614           na           na           na           na           na
#> 615           na           na           na           na           na
#> 616           na           na           na           na           na
#> 617           na           na           na           na           na
#> 618           na           na           na           na           na
#> 619           na           na           na           na           na
#> 620           na           na           na           na           na
#> 621           na           na           na           na           na
#> 622           na           na           na           na           na
#> 623           na           na           na           na           na
#> 624           na           na           na           na           na
#> 625           na           na           na           na           na
#> 626           na           na           na           na           na
#> 627           na           na           na           na           na
#> 628           na           na           na           na           na
#> 629           na           na           na           na           na
#> 630           na           na           na           na           na
#> 631           na           na           na           na           na
#> 632           na           na           na           na           na
#> 633           na           na           na           na           na
#> 634           na           na           na           na           na
#> 635           na           na           na      1302800      1402300
#> 636           na           na           na    755121810    834807691
#> 637         <NA>         <NA>         <NA>         <NA>         <NA>
#> 638         <NA>         <NA>         <NA>         <NA>         <NA>
#> 639          215          375          465          510          530
#> 640      1364428     41563101      9167878     11538362     12800812
#> 641         <NA>         <NA>         <NA>         <NA>         <NA>
#> 642         <NA>         <NA>         <NA>         <NA>         <NA>
#> 643         4270         5565         6735         7655         8485
#> 644       150425       220472       240789       290834       345501
#> 645         <NA>         <NA>         <NA>         <NA>         <NA>
#> 646         <NA>         <NA>         <NA>         <NA>         <NA>
#> 647         <NA>         <NA>         <NA>         <NA>         <NA>
#> 648           na           na           na         6590         6255
#> 649           na           na           na    207425518    199046280
#> 650           na           na           na          970          920
#> 651           na           na           na      4820159      5844609
#> 652           na           na           na        28475        33250
#> 653           na           na           na    492537344    585570183
#> 654           na           na           na        62510        68600
#> 655           na           na           na   1212655079   1434896662
#> 656           na           na           na         2670         2790
#> 657           na           na           na     15649646     18223510
#> 658           na           na           na        56290        60465
#> 659           na           na           na    257850381    289375627
#> 660        79195        86020        90440        97015       107380
#> 661   1201255813   1357356672   1485011568   1643938073   1917758597
#> 662         <NA>         <NA>         <NA>         <NA>         <NA>
#> 663           na           na           na           na           na
#> 664         <NA>         <NA>         <NA>         <NA>         <NA>
#> 665         <NA>         <NA>         <NA>         <NA>         <NA>
#> 666         <NA>         <NA>         <NA>         <NA>         <NA>
#> 667          505          435          475          390          365
#> 668      6035991      6151998      6525681      9345449      9546198
#> 669         3875         3705         3385         3125         2720
#> 670    119277942    118281556    121854439    107668999     97609161
#> 671           na           na           na         3490         3055
#> 672           na           na           na    117014448    107155359
#> 673           na          330          220          485          615
#> 674           na     23705105     13687043     29220266     52572308
#> 675           na           na           na          490          615
#> 676           na           na           na     39596250     52580655
#> 677          585          510          450          420          425
#> 678     14450098     13610364     12496875     11750671     12890986
#> 679        12525        11550        10240         9225         8515
#> 680    393358213    397969495    370991585    352907709    333648149
#> 681           na           na           na         9635         8930
#> 682           na           na           na    364658380    346539135
#> 683          275          195          255          255          320
#> 684      3618062      3125923      5269983      4819914      5296628
#> 685         7070         7030         7000         6675         7205
#> 686    145172134    146598150    160379039    160722638    173963263
#> 687           na           na           na         6925         7515
#> 688           na           na           na    165542552    179259891
#> 689        11775        11940        12430        13880        15305
#> 690     65536021     68820858     83768760     95638796    125923510
#> 691        10800        11265        11200        12985        15425
#> 692    288331994    238878468    231282203    246447034    286975211
#> 693        22425        23055        23475        26695        30515
#> 694    353868015    307699326    315050963    342085830    412898721
#> 695           na           na           na        85155        87385
#> 696           na           na           na   4139779776   4515748132
#> 697           na           na           na       969555      1012845
#> 698           na           na           na  93937413030 106564125489
#> 699           na           na           na      1041465      1086570
#> 700           na           na           na  98077192806 111079873621
#> 701        89290        88930        89610        88820        91405
#> 702   4009918644   4171668954   4314737452   4261442830   4669413801
#> 703       890925       919050       949110       987360      1030555
#> 704  70889836214  79178249845  86303408403  94844647436 107508893581
#> 705       966440       994305      1024910      1062630      1107965
#> 706  74899754858  83349918799  90618145855  99106090266 112178307382
#> 707         <NA>         <NA>         <NA>         <NA>         <NA>
#> 708         <NA>         <NA>         <NA>         <NA>         <NA>
#> 709       128995       129650       129450       128770       128020
#> 710   3915204061   4371047745   4688764499   5193503946   5970969523
#> 711       236610       242200       246995       248955       255275
#> 712  26001578069  31137254608  34824237305  38300223057  45662239539
#> 713           na           na           na           na           na
#> 714           na           na           na           na           na
#> 715           na           na           na           na           na
#> 716           na           na           na           na           na
#> 717           na           na           na           na           na
#> 718           na           na           na           na           na
#> 719           na           na           na           na           na
#> 720           na           na           na           na           na
#> 721       137775       137905       136970       136200       136230
#> 722   4384030843   4772713462   5176072722   5814814899   6136621509
#> 723       258455       263865       268115       270655       275295
#> 724  25532751287  30735588891  34336929082  37678912104  45496587553
#> 725           na          165           60           80          180
#> 726           na      3718143      1669457      2349674      6053571
#> 727       110525       114795       120375       123275       127735
#> 728   2279963217   2482191876   2699594802   2946797365   3275753452
#> 729        78490        78615        79270        80975        82140
#> 730    464794510    483081073    574469979    714638088    750595987
#> 731         9445         9380         9400         9270         9430
#> 732     41911993     52515439     47045620     47331332     61806281
#> 733        52405        51765        43725        42025        40375
#> 734    370618374    375298492    362265033    368115198    382709262
#> 735       177810       181210       183150       186270       189955
#> 736   1971099193   2087669734   2207302421   2365429034   2536351205
#> 737       228090       237360       242955       247340       249180
#> 738   1267598488   1447069562   1632149668   1889399732   2181803634
#> 739         4130         4765         4775         5630         6000
#> 740     20790744     25658203     28535318     38475974     52480274
#> 741       596325       616435       632200       644240       655150
#> 742   2108112383   2292785847   2454335928   2595238332   2720107110
#> 743           na           na           na           na           na
#> 744           na           na           na           na           na
#> 745           na           na           na           na           na
#> 746           na           na           na           na           na
#> 747           na           na           na           na           na
#> 748           na           na           na           na           na
#> 749           na           na           na           na           na
#> 750           na           na           na           na           na
#> 751       686355       701760       714900       729910       745835
#> 752   3038319948   3202318639   3453871140   3600263246   3856821274
#> 753       300335       298090       294055       291330       289535
#> 754    743678089    759456552    767633547    794646512    837850346
#> 755       933995       965700       996925      1029480      1055075
#> 756  21846437163  23352162769  24593447060  26155271186  27832879569
#> 757           na           na           na       131935       126050
#> 758           na           na           na   5890667179   6048858448
#> 759           na           na           na       968265      1003330
#> 760           na           na           na  73938715700  84880056155
#> 761           na           na           na      1082165      1111750
#> 762           na           na           na  79829382879  90928914603
#> 763         <NA>         <NA>         <NA>         <NA>         <NA>
#> 764         <NA>         <NA>         <NA>         <NA>         <NA>
#> 765          440          515          660          720          700
#> 766      1307750      1505334      1784646      1947189      1492393
#> 767          160          175          170          180          150
#> 768       742565       388450       462138       841646       593088
#> 769         2190         2150         2080         2220         2085
#> 770     10544878     10221032     10446133     12012326     11971852
#> 771        15845        17440        18330        19590        20045
#> 772    -66736975    -50349039    -28244693    -49486410     13542012
#> 773        41155        44015        41985        41600        38830
#> 774    -19246531    -59870059      -811393     15063815   -190689654
#> 775         <NA>         <NA>         <NA>         <NA>         <NA>
#> 776         <NA>         <NA>         <NA>         <NA>         <NA>
#> 777           na           na           na       135090       129660
#> 778           na           na           na  -1668528524  -1137746504
#> 779           na           na           na       996450      1038400
#> 780           na           na           na  28415620696  22319773783
#> 781           na           na           na      1110915      1147915
#> 782           na           na           na  26747092172  21182027279
#> 783           na           na           na         6245         6640
#> 784           na           na           na    127136072    145503426
#> 785           na           na           na        47590        48675
#> 786           na           na           na    447798733    488182311
#> 787           na           na           na        53575        55025
#> 788           na           na           na    574934805    633685737
#> 789       121910       128745       134565       136180       130795
#> 790   -837704283  -1172118477  -1498630806  -1802602773  -1565582638
#> 791       903140       933550       965445      1005240      1047165
#> 792  15639962329  16699570540  18200223287  20553158257  21989025585
#> 793      1005810      1042110      1079120      1120535      1157515
#> 794  14802258046  15527452063  16701592481  18750555484  20423442947
#> 795         <NA>         <NA>         <NA>         <NA>         <NA>
#> 796         <NA>         <NA>         <NA>         <NA>         <NA>
#> 797           na           na           na           na           na
#> 798           na           na           na           na           na
#> 799           na           na           na           na           na
#> 800           na           na           na           na           na
#> 801         <NA>         <NA>         <NA>         <NA>         <NA>
#> 802         <NA>         <NA>         <NA>         <NA>         <NA>
#> 803           na           na           na           na           na
#> 804           na           na           na           na           na
#> 805           na           na           na           na           na
#> 806           na           na           na           na           na
#> 807         <NA>         <NA>         <NA>         <NA>         <NA>
#> 808         <NA>         <NA>         <NA>         <NA>         <NA>
#> 809           na           na           na           na           na
#> 810           na           na           na           na           na
#> 811         <NA>         <NA>         <NA>         <NA>         <NA>
#> 812         <NA>         <NA>         <NA>         <NA>         <NA>
#> 813           na           na           na           na           na
#> 814           na           na           na           na           na
#> 815           na           na           na           na           na
#> 816           na           na           na           na           na
#> 817         <NA>         <NA>         <NA>         <NA>         <NA>
#> 818         <NA>         <NA>         <NA>         <NA>         <NA>
#> 819           na           na           na        23215        23385
#> 820           na           na           na    739525235    737716585
#> 821           na           na           na        26015        25535
#> 822           na           na           na    982204862   1056263530
#> 823           na           na           na           na           na
#> 824           na           na           na           na           na
#> 825           na           na           na           na           na
#> 826           na           na           na           na           na
#> 827           na           na           na           na           na
#> 828           na           na           na           na           na
#> 829           na           na           na           na           na
#> 830           na           na           na           na           na
#> 831           na           na           na           na           na
#> 832           na           na           na           na           na
#> 833        81205        80555        81830        81785        81295
#> 834   3248363873   3249287071   3415005889   3650105131   3891003411
#> 835        19455        19105        20000        19620        19765
#> 836    425403652    436380756    462962003    496404743    509425885
#> 837         1270         1250         1235         1295         1455
#> 838     16686390     15059636     20025510     16399722     25117562
#> 839       127285       125045       103710        91915       113000
#> 840   1831564636   1724267596   1381911687   1322649791   1600098085
#> 841          740          630          540          560          605
#> 842     23171316     20331013     19077402     17555961     18836554
#> 843        35520        32215        26195        23850        26800
#> 844    742538595    723505337    596818290    584953000    715777676
#>          2008_09      2009_10      2010_11      2011_12      2012_13
#> 1       12908185     13049455     13275055     13366780     13405941
#> 2        9582260      9537600      9815520     10203645      9867053
#> 3        3325920      3511860      3459530      3163135      3538884
#> 4        6680150      6755450      6873630      6981476      7013950
#> 5        6228030      6294005      6401425      6385304      6391991
#> 6             na           na           na           na           na
#> 7       12818545     12954885     13177330     13263698     13299135
#> 8          89640        94575        97725       103082       106806
#> 9           <NA>         <NA>         <NA>         <NA>         <NA>
#> 10          <NA>         <NA>         <NA>         <NA>         <NA>
#> 11       4129605      4158110      4219900      4218083      4220655
#> 12       3194905      3240915      3306625      3323285      3333819
#> 13       2604070      2617765      2656220      2679838      2680415
#> 14       1376445      1392790      1432830      1484720      1516844
#> 15        937235       948565       954155       949820       943283
#> 16        285815       287970       288170       282058       276753
#> 17        236020       240020       244770       250347       251133
#> 18        118780       119880       122610       126542       128799
#> 19         25300        43435        49775        52087        54240
#> 20            na           na           na           na           na
#> 21            na           na           na           na           na
#> 22          <NA>         <NA>         <NA>         <NA>         <NA>
#> 23          <NA>         <NA>         <NA>         <NA>         <NA>
#> 24       8976365      9451755      9667900      9871946      9961302
#> 25            na           na           na           na           na
#> 26       1762015      1121485      1016535       832556       599540
#> 27       2169800      2476215      2590620      2662278      2845099
#> 28          <NA>         <NA>         <NA>         <NA>         <NA>
#> 29          <NA>         <NA>         <NA>         <NA>         <NA>
#> 30        245885       234075       228220       191362       141592
#> 31       1715040      1685010      1686630      1674962      1613607
#> 32       1378780      1429880      1463035      1486936      1499863
#> 33       1295630      1321060      1356140      1386774      1433687
#> 34       1408655      1419670      1396330      1352844      1340215
#> 35       1326365      1355470      1397400      1415609      1434415
#> 36       1361985      1365185      1355830      1332539      1320191
#> 37       1216325      1241355      1268840      1292946      1311729
#> 38       1043985      1053545      1076885      1101729      1119253
#> 39        807140       832000       869280       877931       888477
#> 40        431160       446445       476845       528169       562865
#> 41        258485       258645       272675       285830       293624
#> 42        418750       407110       426945       439149       446423
#> 43          <NA>         <NA>         <NA>         <NA>         <NA>
#> 44          <NA>         <NA>         <NA>         <NA>         <NA>
#> 45            na     11774130     12075175     12320812     10727418
#> 46  125808260581 131933456442 144988295727 156410203868 158861873717
#> 47         39905        44465        34410        38708        35275
#> 48      16988645     19039053     13679227     16673592     27372586
#> 49       8666605      8669470      9027380      9315961      9332248
#> 50    7758722458   8318675268   8880539453   9475603742   9943028297
#> 51        221825       241915       254870       264125       218086
#> 52     195443083    209253201    227110036    247129523    277897180
#> 53            na           na           na           na           na
#> 54            na           na           na           na           na
#> 55            na      9537600      9815520     10203646      9867053
#> 56  121920873975 127354003048 139914503907 153422498041 162115139644
#> 57            na           na       655960       666919       652507
#> 58    4925818008   5135930417   6023356934   6517189250   6708922087
#> 59            na      9309315      9581365      9968972      9684540
#> 60  116989682370 122218072632 133891146973 146905308791 155406217558
#> 61            na       447625       462200       356046       405926
#> 62    3239451027   3545154488   3880705908   3072546068   3422263863
#> 63        369430       377430       404610       424012       442634
#> 64    1195801691   1270027786   1418884164   1532192796   1632507840
#> 65            na           na           na           na           na
#> 66            na           na           na           na           na
#> 67            na           na           na           na           na
#> 68            na           na           na           na           na
#> 69         53215        47685        44230        39291        34960
#> 70      89359659     83067426     80455895     74071537     67661814
#> 71            na           na           na           na           na
#> 72            na           na           na           na           na
#> 73            na           na           na           na           na
#> 74            na           na           na           na           na
#> 75            na           na           na           na           na
#> 76            na           na           na           na           na
#> 77            na           na           na           na           na
#> 78            na           na           na           na           na
#> 79            na           na           na           na           na
#> 80            na           na           na           na           na
#> 81            na           na           na           na           na
#> 82            na           na           na           na           na
#> 83          <NA>         <NA>         <NA>         <NA>         <NA>
#> 84          <NA>         <NA>         <NA>         <NA>         <NA>
#> 85      10057285     10134375     10348995     10560582     10602801
#> 86  461428908566 483194462126 521048169173 557702984978 587575245059
#> 87            na           na           na           na     10314577
#> 88            na           na           na           na 141673951385
#> 89       2215425      2264390      2349085      2403969      2375587
#> 90    7829059836   7944407810   8311633313   8906756798   9206982067
#> 91        201455       153885       142750       168768       216201
#> 92    2108400593   1779219815   1698971208   2143471622   2930162300
#> 93         16160        14220        13665        14158        14335
#> 94       8956589      7652068      7492687      7894647      8157959
#> 95            na           na           na           na        75071
#> 96            na           na           na           na   1903056144
#> 97            na           na           na           na          229
#> 98            na           na           na           na      3380212
#> 99            na           na           na           na       146585
#> 100           na           na           na           na   1080470108
#> 101           na           na           na           na          476
#> 102           na           na           na           na      4209662
#> 103           na           na           na           95          395
#> 104           na           na           na      3663228      2995808
#> 105           na           na           na          798         3403
#> 106           na           na           na      6452159     21401608
#> 107           na           na           na        23006        33060
#> 108           na           na           na    319311304    609753697
#> 109           na           na           na         8403            7
#> 110           na           na           na    213275519        18779
#> 111       203595       185300       190340       227897       259525
#> 112   2828466915   2480134847   2499594523   3565663141   3627294991
#> 113       968495      1032915      1013300       973894       957029
#> 114   4587549014   5243459980   5262820581   5093258045   5130975318
#> 115       735820       742800       728165       728754       705840
#> 116   5904062312   6255343527   6605466280   6839677105   6642194453
#> 117       122360       125770       132170       138053       139398
#> 118   1797153433   1656668147   1727258742   1879364950   1801285106
#> 119       211050       210330       215230       216114       215538
#> 120   5019510848   5174301649   5585800471   5710820443   5905101552
#> 121           na           na           na           na           na
#> 122           na           na           na           na           na
#> 123          955          835         1180          883         1191
#> 124      7343754      5861145      5704182      4353467      6360475
#> 125         1175          935         1480         1254         1455
#> 126     10021127      9343065     15134387     11977256     11668784
#> 127           na           na           na           na        18564
#> 128           na           na           na           na    802268355
#> 129           na           na           na           na         5350
#> 130           na           na           na           na    148585532
#> 131           na           na           na           na        80542
#> 132           na           na           na           na   1754161887
#> 133        88910        95535       103970       100199       104456
#> 134   2032889806   1974000217   2260344106   2528997612   2705015774
#> 135           na           na           na           na         3255
#> 136           na           na           na           na    105233780
#> 137           na           na           na           na         1414
#> 138           na           na           na           na     45201674
#> 139           na           na           na           na        10394
#> 140           na           na           na           na    278915450
#> 141        11615        14740        15650        15175        15063
#> 142    307815768    319833401    375036966    423488126    429350904
#> 143         9155        14560        14965        16251        15550
#> 144    307415672    430956682    524569872    647866230    689412520
#> 145         <NA>         <NA>         <NA>         <NA>         <NA>
#> 146      6437015      6541230      7133065      7497290      7497840
#> 147  14973906992  11778632480  16009412893  17736668450  15646024037
#> 148       426355       418210       547720       611651       584073
#> 149    103599291     86298846    123286806    130237232    111599675
#> 150      1116790      1178520      1209190      1169158      1147128
#> 151    789588438    940225074   1067325829   1003129646    922313433
#> 152      3160605      3166155      3145155      3079234      3053019
#> 153  20232654778  18548022079  20697126192  20534949550  21450622426
#> 154      3153145      3156960      3127170      3066822      3042120
#> 155   8662624383   7939115606   8863897688   8793875898   9184798109
#> 156        64970        79595        89865       107367        81920
#> 157      7663839     11422572     11469108     11705450      8303826
#> 158           na        83965       153630       166499       186444
#> 159           na     84725673    170208173    166598971    175335330
#> 160           na        10885        11215        12421        12358
#> 161           na    144721510    111203154     98387794    119577122
#> 162           na         4730        25060        41270        82462
#> 163           na    117254028    573991937   1016366602   2158569028
#> 164         6045        57690        86895        86740       116070
#> 165    121178365   1716699541   2472848030   2440931387   3140024634
#> 166           na          195          670          551          262
#> 167           na       388012       924698       674152      3895361
#> 168           na          260          370          666          868
#> 169           na     10914989     18748125     24971198     50811899
#> 170      4631315      4791400      5008755      5019962      5029778
#> 171  73625992375  80146064112  88470073775  89653562522  94804435891
#> 172           na           na           na           na           na
#> 173           na           na           na           na           na
#> 174           na           na           na           na           na
#> 175           na           na           na           na           na
#> 176     12729125     12879055     13110025     13305378     13340688
#> 177 612462321199 637544293764 693508653589 735659086960 771877628136
#> 178         <NA>         <NA>         <NA>         <NA>         <NA>
#> 179         <NA>         <NA>         <NA>         <NA>         <NA>
#> 180      2459335      2559735      2672430      2805417      2861994
#> 181   4251145528   4508883500   4770842791   5097254847   5302833644
#> 182       276155       279405       287025       295883       300239
#> 183   2458575439   2485361480   2618858750   2730326170   2773099036
#> 184           na           na           na           na           na
#> 185           na           na           na           na           na
#> 186        36490        37165        33125        27984        17645
#> 187     58527194     60328778     55822110     48741706     32549740
#> 188      2818040      2923785      3042485      3181514      3233704
#> 189   6971275093   7263350299   7666160632   8110130199   8353217940
#> 190       915750      1068790      1158330      1212800      1226040
#> 191   1570326327   1736867249   1911787517   2051767400   2051039177
#> 192      2000875      2019960      2069380      2149426      2142324
#> 193    546216067    564534653    589290463    620970736    628685255
#> 194      2886225      2944260      3033735      3129143      3134894
#> 195    686662142    717909917    744009779    769866495    777310654
#> 196       407345       428550       444770       464110       473383
#> 197     80099952     86221668     89854693     94669030     97324471
#> 198       487725       478825       493085       507255       514453
#> 199    140010575    141337046    147594845    152920565    156858181
#> 200       132395       126830       115360        93464        54849
#> 201     33884824     35214995     31534233     25658707     15174871
#> 202      5914565      5998425      6156330      6343398      6319903
#> 203   1486873560   1545218279   1602284013   1664085533   1675353432
#> 204       466590       460135       471695       487765       470904
#> 205    854955454    852330434    893185245    915084264    900226171
#> 206        68805        79390        85460        87400        81924
#> 207    148292431    173454156    188074752    195972541    190491666
#> 208         9845        20125        17855        19640        19227
#> 209     14777085     31197088     31537152     31261041     29672711
#> 210       144545       131980        26190        24238        13333
#> 211     91866252     86740487     28886056     25926995     14269427
#> 212       689785       691635       653220       619043       585388
#> 213   1109891222   1143722165   1201565950   1168244841   1134659975
#> 214      6347360      6445275      6631200      6875463      6928489
#> 215   6002676642   6249800321   6639450624   7069880886   7310605063
#> 216      8355285      8456865      8675620      8857293      8814847
#> 217  17141042844  17938958313  19021248736  20064108859  20524875587
#> 218       272980       283030       293520       310798       299584
#> 219    114740305    116328116    120352069    127224684    129031534
#> 220           na       535665       498160       450293       381823
#> 221           na   1529741420   1394045792   1230900859    971911183
#> 222           na       301200       311940       293844       276468
#> 223           na   1514643375   1661774349   1455568844   1265264557
#> 224      4780600      4545765      4928310      4663785      4682081
#> 225   2140788508   2032990857   2305010412   2297780863   2354985656
#> 226      5928905      5888415      6140470      6316893      6368304
#> 227   1985869879   2199647327   2341927738   2473280943   2519738858
#> 228           na           na           na           na           na
#> 229           na           na           na           na           na
#> 230           na           na           na           na           na
#> 231           na           na           na           na           na
#> 232           na           na           na           na           na
#> 233           na           na           na           na           na
#> 234       804375       832565       886815       911508       903640
#> 235   8446398035   5938017697   6152910366   6392907774   4901176344
#> 236     10307535     10385720     10673745     10846338     10776879
#> 237  33780715488  31270446088  32997269759  34041772826  32666811574
#> 238         <NA>         <NA>         <NA>         <NA>         <NA>
#> 239         <NA>         <NA>         <NA>         <NA>         <NA>
#> 240     12731025     12885285     13111940     13307256     13342974
#> 241 578677509832 606273847676 660511413201 701617314134 739210661574
#> 242         <NA>         <NA>         <NA>         <NA>         <NA>
#> 243         <NA>         <NA>         <NA>         <NA>         <NA>
#> 244        48865        52205        56055        51012        48602
#> 245   3973647379   4471897927   5222619254   5179614783   5249356614
#> 246       164260       160420       161320       157588       165073
#> 247   5338610574   6441083873   6766350976   6959012632   7354970921
#> 248       206165       204535       226810       199241       204027
#> 249   9312257953  10912981800  11988970230  12138627415  12604327535
#> 250        23660        23690        30520        23748        20776
#> 251    562210447    521124493    882305348    666275891    609266403
#> 252        80675        84980        83080        79671        79405
#> 253   1086391053   1378416041   1391552513   1296818781   1344099898
#> 254       102715       106845       111115       101278        98164
#> 255   1648601500   1899540534   2273857861   1963094672   1953366301
#> 256         <NA>         <NA>         <NA>         <NA>         <NA>
#> 257         <NA>         <NA>         <NA>         <NA>         <NA>
#> 258     12497395     12648555     13068025     13265848     13302389
#> 259 581277500867 608133004479 658167177189 699637156136 737257091823
#> 260         <NA>         <NA>         <NA>         <NA>         <NA>
#> 261           na     12840430     13068020     13093045     13134679
#> 262 581277500867 610178889876 658167073804 702834200231 740421792742
#> 263         <NA>         <NA>         <NA>         <NA>         <NA>
#> 264         <NA>         <NA>         <NA>         <NA>         <NA>
#> 265           na           na           na           na       630122
#> 266           na           na           na           na    765945806
#> 267       239975       244690       242415       224744       220456
#> 268    613924394    609295750    613035942    584875757    583699814
#> 269      1465435      1555015      1466320      1493664       739461
#> 270    875328267    957676941    936900201    993846982    461990720
#> 271         <NA>         <NA>         <NA>         <NA>         <NA>
#> 272         <NA>         <NA>         <NA>         <NA>         <NA>
#> 273         1445          930          910          651          614
#> 274      2465911      1177361      1502344      1004091      1011648
#> 275      8500960      8215565      8569695      8676523      6748524
#> 276   7213506422   7273704071   8260980851   8456509854   2141794768
#> 277           na           na           na           na           na
#> 278           na           na           na           na           na
#> 279           na           na           na           na           na
#> 280           na           na           na           na           na
#> 281           na           na           na           na           na
#> 282           na           na           na           na           na
#> 283        77330        75265        91140        72905        59681
#> 284    114291959     97918545    187432114    145282808    164184224
#> 285       288780       336610       370700       358486       358266
#> 286    145220367    169805844    190798373    188195202    189860914
#> 287       160055       150740       166485       191180       352883
#> 288    936886175    822277911    907297563   1169141836   1263298813
#> 289           na           na           na           na           na
#> 290           na           na           na           na           na
#> 291           na           na           na           na           na
#> 292           na           na           na           na           na
#> 293         <NA>         <NA>         <NA>         <NA>         <NA>
#> 294         <NA>         <NA>         <NA>         <NA>         <NA>
#> 295     10134750     10203200     10400350     10581375     10527510
#> 296 110278329659 114919912445 124290853518 136531011154 144035907270
#> 297      1377790      1304950      1271060      1345369      1419582
#> 298  13543722002  13660630487  14237414643  16775839533  18090357138
#> 299         <NA>         <NA>         <NA>         <NA>         <NA>
#> 300         <NA>         <NA>         <NA>         <NA>         <NA>
#> 301      6525055      6485075      6867000      7102829      7203971
#> 302           na           na           na           na      5878835
#> 303           na           na           na           na   3770702123
#> 304           na           na           na           na       555563
#> 305           na           na           na           na    202517718
#> 306           na           na           na           na      1443765
#> 307           na           na           na           na    514938430
#> 308           na           na           na           na           na
#> 309           na           na           na           na   3458281411
#> 310         <NA>         <NA>         <NA>         <NA>         <NA>
#> 311         <NA>         <NA>         <NA>         <NA>         <NA>
#> 312      1562120      1563890      1779930      1928873      1916070
#> 313  10955375451  12198670827  14292476224  13937651791  14300772077
#> 314     10724810     10797900     10808645     10681934     10672568
#> 315 -24962970077 -24870726543 -25786348206 -26151880292 -26701078736
#> 316     12286930     12361790     12588575     12610807     12588638
#> 317 -14007594626 -12672055716 -11493877430 -12214228500 -12400306659
#> 318         <NA>         <NA>         <NA>         <NA>         <NA>
#> 319         <NA>         <NA>         <NA>         <NA>         <NA>
#> 320           na           na           na           na           na
#> 321           na           na           na           na           na
#> 322           na           na           na           na           na
#> 323           na           na           na           na           na
#> 324           na           na           na           na           na
#> 325           na           na           na           na           na
#> 326       184090       165425       220540       143761       104762
#> 327   1454894043   1180293418   1224693032   1154741393    899603134
#> 328           na        75775        96200        72130        98262
#> 329           na    623039384    765916184    717483062    932539018
#> 330           na        37660        40073        33529        48374
#> 331           na    865927008    987908028    816668620   1028436870
#> 332           na        11855        12590        12119        15928
#> 333           na    128601542    161261608    159088903    209167351
#> 334           na           na           na           na           na
#> 335           na           na           na           na           na
#> 336         <NA>         <NA>         <NA>         <NA>         <NA>
#> 337         <NA>         <NA>         <NA>         <NA>         <NA>
#> 338           na           na           na           na           na
#> 339           na           na           na           na           na
#> 340           na           na           na           na           na
#> 341           na           na           na           na           na
#> 342       726835       759085       772230       802457       840795
#> 343  11828372437  12343727216  12914808488  13676598162  14909992697
#> 344           na      1210295      1215415      1257445      1324771
#> 345           na  11393549608  12322524673  13068638961   9741729470
#> 346           na        80840       122195       168313       207223
#> 347           na    867641235   1344520697   1965697181   2501441954
#> 348           na        11660        10010         9289        17143
#> 349           na    406007330    357173280    373924690    704175340
#> 350           na       131155       130290       124603       135222
#> 351           na    909704586    901167690    807836461    874890200
#> 352           na       969770      1028205      1097168      1353198
#> 353           na   9101103461  11285367886  12915488586  13032201609
#> 354           na        93795        98875       105103       159713
#> 355           na    561736238    657212102    677584834   1209667043
#> 356         <NA>         <NA>         <NA>         <NA>         <NA>
#> 357         <NA>         <NA>         <NA>         <NA>         <NA>
#> 358         <NA>         <NA>         <NA>         <NA>         <NA>
#> 359        96040        91325       103450        94609        82403
#> 360   2567438776   2166754758   3576439013   3042217980   2638978941
#> 361       130540       129415       110075       113281       120974
#> 362  -2738401053  -2857697326  -2121592267  -2267176173  -2576068133
#> 363       226575       220740       213525       207890       203377
#> 364   -170962277   -690942568   1454846746    775041807     62910808
#> 365        33030        34570        37260        36941        36119
#> 366   1164141357   1046094234   1550983077   1583817569   1686541929
#> 367         7365         7340         7500         8164         8302
#> 368   -263375252   -258076873   -270670944   -311277263   -334075334
#> 369        40395        41910        44760        45105        44421
#> 370    900766105    788017361   1280312133   1272540306   1352466595
#> 371        14605        13790        12420        11009         8319
#> 372     54047788     50992586     43611693     35052150     29315025
#> 373           na           na           na           na           na
#> 374           na           na           na           na           na
#> 375           na           na           na           na           na
#> 376           na           na           na           na           na
#> 377           na           na           na           na           na
#> 378           na           na           na           na           na
#> 379           na           na           na           na           na
#> 380           na           na           na           na           na
#> 381        52910        49510        47595        45544        42984
#> 382    264527114    257362267    292563374    309462243    347774139
#> 383       261975       257865       252975       247676       242506
#> 384    411452350   -211265111   2398983812   1703067720   1038288239
#> 385         <NA>         <NA>         <NA>         <NA>         <NA>
#> 386         <NA>         <NA>         <NA>         <NA>         <NA>
#> 387       537325       515765       501130       478703       458419
#> 388  15744810954  15325929841  15765876690  15643076002  14867244162
#> 389       123835       117280       109685       104602        99131
#> 390  -1560913677  -1378483355  -1273535259  -1200121991  -1130514129
#> 391       661160       633045       610815       583305       557550
#> 392  14183897277  13947446486  14492341431  14442954011  13736730033
#> 393      1532430      1531905      1523910      1330778      1295884
#> 394  27189062708  29207609151  33797157982  26138367710  25996343984
#> 395         6775         7460         7355        44164        40487
#> 396   -205420183   -187564004   -211824441   -966809562   -776965613
#> 397      1539200      1539365      1531265      1374942      1336371
#> 398  26983642525  29020045147  33585333541  25171558148  25219378371
#> 399           na           na           na       423751       508434
#> 400           na           na           na  11159702033  12839658257
#> 401         2605         2320         2410         2083          716
#> 402      8098110      7100781      7820604      6780054      2753090
#> 403           na           na           na           na           na
#> 404           na           na           na           na           na
#> 405           na           na           na           na           na
#> 406           na           na           na           na           na
#> 407           na           na           na           na           na
#> 408           na           na           na           na           na
#> 409           na           na           na           na           na
#> 410           na           na           na           na           na
#> 411       401575       394935       379825       354808       323358
#> 412   2380204715   2262681199   2341147898   2182676529   1896410264
#> 413      2096695      2073405      2047365      1920349      1877529
#> 414  38779356940  40697845756  45728760217  48584757609  49896603307
#> 415         <NA>         <NA>         <NA>         <NA>         <NA>
#> 416       755825       732320       824340       680679       655925
#> 417  14012935000  13256503918  15947188177  15217995818  13799640841
#> 418      1550855      1552420      1576025      1437180      1413378
#> 419  27884408630  29808062508  34865645674  37603800487  39411503223
#> 420      2175060      2157485      2400365      2001881      1961467
#> 421  41897343630  43064566426  50812833851  52821796305  53211144064
#> 422        17200        16100        14830        13083         9022
#> 423     62145898     58093367     51432297     41832204     32068115
#> 424       451075       441150       427420       397485       363698
#> 425   2644731829   2520043466   2633711272   2492138772   2244184403
#> 426      2184055      2165970      2300340      2010756      1969466
#> 427  39190809290  40486580645  48127744029  50287825329  50934891546
#> 428         <NA>         <NA>         <NA>         <NA>         <NA>
#> 429           na           na           na           na           na
#> 430           na           na           na           na           na
#> 431           na           na           na           na           na
#> 432           na           na           na           na           na
#> 433         <NA>         <NA>         <NA>         <NA>         <NA>
#> 434         <NA>         <NA>         <NA>         <NA>         <NA>
#> 435         3075         3020         2315         3283         1420
#> 436      3957932      4529857      3031090      3959223      1894540
#> 437       891310       873420       854680       780077       728667
#> 438   3402063623   3455128280   3975496977   4169644336   4451226906
#> 439        67620        66005        62700        54257        59832
#> 440     31636717     24989465     28202872     24230545     21383370
#> 441           na           na          950          815          991
#> 442           na           na      1378114      1757460      1114611
#> 443         3075         7940         6000        10806         3893
#> 444     20671601     27527214     28303994     34372549     20462188
#> 445         4575         3475         3100         3591         3935
#> 446      2437341      2494432      3525969      3736136      4864319
#> 447          190          315         1060         2841         6539
#> 448       148059       906821      3304113     10061390     28534412
#> 449         <NA>         <NA>         <NA>         <NA>         <NA>
#> 450         <NA>         <NA>         <NA>         <NA>         <NA>
#> 451         5195         4880         4775         4582         3859
#> 452     38371052     36085722     36668066     37967566     31111961
#> 453          845          845          895          937          927
#> 454      1703419      1957976      2283417      2965451      2551828
#> 455        30785        39850        49580        54192        52253
#> 456    158064851    210966630    286330230    365282212    378512620
#> 457       105345       118470       131545       138197       134175
#> 458   2034125873   2343389549   2754957379   3105879105   3149107637
#> 459         <NA>         <NA>         <NA>         <NA>         <NA>
#> 460         <NA>         <NA>         <NA>         <NA>         <NA>
#> 461       118520       114030       107220       103226       103651
#> 462  -1346851845  -1012695512   -617808778   -806645681   -951002405
#> 463      1041140      1086455      1109445      1118112      1127819
#> 464  21920294717  24343088463  26991804285  27847042215  28290025809
#> 465           na           na           na           na           na
#> 466           na           na           na           na           na
#> 467           na           na           na           na           na
#> 468           na           na           na           na           na
#> 469         6975         6220         5450         4617         3676
#> 470     61145673     53127397     49524259     45824496     35721732
#> 471          995          950          835          917          936
#> 472      2843188      2697148      2551247      3737731      2886808
#> 473          540          585          695          737          913
#> 474     12046267      9002147      8907208     10624222     14542498
#> 475         5245         6485         7225         6648         5388
#> 476     30262186     35804571     44601585     49548551     41291553
#> 477         <NA>         <NA>         <NA>         <NA>         <NA>
#> 478         <NA>         <NA>         <NA>         <NA>         <NA>
#> 479        41360        42530        40940        40330        40114
#> 480    361716024    482397033    513746952    542439858    558276537
#> 481       126260       135235       135675       137245       141004
#> 482   1166790377   1478607706   1557548480   1753486655   1903493614
#> 483        31430        33430        32325        31990        30980
#> 484    396285136    619545335    661404620    735226765    785254075
#> 485       136470       144700       144740       146114       150680
#> 486   1133314751   1344548497   1410244068   1560726625   1676631404
#> 487         <NA>         <NA>         <NA>         <NA>         <NA>
#> 488         <NA>         <NA>         <NA>         <NA>         <NA>
#> 489           na           na           na        15047        14178
#> 490           na           na           na    860615529    959859045
#> 491           na           na           na           34           19
#> 492           na           na           na      1386705       454391
#> 493           na           na           na        11721        13724
#> 494           na           na           na    600445567    723505758
#> 495        10220         8150        15470        12634        11049
#> 496   -447665212   -317243778   -789606075   -586673172   -583110935
#> 497        10875        12310         8620         8938        10178
#> 498    411040370    453992086    314971106    331415807    351085423
#> 499           na        20460        24090        21572        21227
#> 500           na    136748308   -474634969   -255257365   -232025512
#> 501         <NA>         <NA>         <NA>         <NA>         <NA>
#> 502         <NA>         <NA>         <NA>         <NA>         <NA>
#> 503       544475       572415       587400       448197       531558
#> 504  11084491410  11819049644  12541830391   9837818636  10773957996
#> 505       761720       818610       849265       699451       799055
#> 506  28587908398  29923427203  31259860875  25708748639  27226021396
#> 507       877600       927565      1006150      1070592      1083662
#> 508  18532579507  20106682369  22122718327  25783274117  27849138741
#> 509           na           na           na           na           na
#> 510           na           na           na           na           na
#> 511         <NA>         <NA>         <NA>         <NA>         <NA>
#> 512         <NA>         <NA>         <NA>         <NA>         <NA>
#> 513         8005         6780         7190         2930         1359
#> 514     14978352      8317631      7061306     17341204     21390405
#> 515          675          335          540          465          543
#> 516      2380464      1379496      3335434      6500731     12011611
#> 517         <NA>         <NA>         <NA>         <NA>         <NA>
#> 518         <NA>         <NA>         <NA>         <NA>         <NA>
#> 519       993275       944855       897545       824141       780331
#> 520   3526631476   3567707326   3606987037   3782187037   4064149046
#> 521           na        23890        23330        23958        25867
#> 522           na   1105723063   1178780820   1374972303   1568874770
#> 523           na        54190        55210        56074        56673
#> 524           na    473715799    454530341    450116714    475838178
#> 525        53835        51635        49870        48244        46132
#> 526    434686851    376403504    334531972    320722513    320898166
#> 527        19975        26580        31340        37409        41595
#> 528     28799877     39209143     36076946     57207573     75244036
#> 529       887730       845720       796990       719412       671765
#> 530   1788475179   1462504768   1484564766   1449874393   1487676718
#> 531         5480         4980         8980        26667        28161
#> 532      1545617      1308068      1333958      1787373      2433458
#> 533           na         5355         6165         6478         6684
#> 534           na    383647266    459132128    542130462    605672314
#> 535        24840         8155         6165         5576         5163
#> 536   1898135008    425068486    362406767    336234951    326576072
#> 537       651010       741610       691350       626634       618389
#> 538    244395182    483565730    563581848    651300893    771563846
#> 539         <NA>         <NA>         <NA>         <NA>         <NA>
#> 540         <NA>         <NA>         <NA>         <NA>         <NA>
#> 541      1766595      1831570      1886485      1966949      2034929
#> 542  27682808644  29846238411  32625707605  35891037904  38477631022
#> 543      1434635      1491330      1543135      1612217      1669158
#> 544  20698701840  19678211311  24163374178  25605226320  23777820301
#> 545       670370       725475       775560       838578       899012
#> 546   1615867449   1811281971   2044851832   2292925406   2574197843
#> 547      1769655      1837750      1894210      1974970      2043983
#> 548  12413133654  13606961407  14847606907  16368802045  17857654101
#> 549           na           na           na           na           na
#> 550  34727702943  35096454689  41055832917  44266953771  44209672245
#> 551       606710       676490       629940       660709       740081
#> 552   4957624208   5609027651   5754778053   6214690979   6943473906
#> 553           na           na           na           na         2855
#> 554      1178155      1177340      1280935      1330377      1319730
#> 555 -12002518507 -10859243929 -14115137656 -14574254038 -12676789164
#> 556      1784865      1853830      1910875      1991086      2062666
#> 557  -7044894299  -5250216278  -8360359603  -8359563059  -5733315258
#> 558         <NA>         <NA>         <NA>         <NA>         <NA>
#> 559         1485         1100         1040          887          929
#> 560      8529720      4758261      6050567      4510953      4812176
#> 561         1880         3460         1750         2290         3562
#> 562     15853944     31005714     14040491     14023671     41661071
#> 563       284500       412305       774245       880532       789842
#> 564   2041410498   1156349226   1287200150   1361379291   1387446237
#> 565       123300       128245       152515       159386       172207
#> 566    946213618    641707881    627385602    642073233    712589075
#> 567           na           na           na           na           na
#> 568           na           na           na           na           na
#> 569           na           na           na           na           na
#> 570           na           na           na           na           na
#> 571           na           na           na           na           na
#> 572           na           na           na           na           na
#> 573           na           na           na           na           na
#> 574           na           na           na           na           na
#> 575         2150         2650         2800         2913         3041
#> 576      8113769      9113901      8216048      8675899     10789844
#> 577         9175        12045        15725        16012        17643
#> 578    458958150    504855586    604761536    682740902    745540288
#> 579           na           na           na           na           na
#> 580           na           na           na           na           na
#> 581      4631315      4791400      5008755      5019962      5029777
#> 582  73625992375  80146064112  88470073775  89653562522  94804401193
#> 583         <NA>         <NA>         <NA>         <NA>         <NA>
#> 584         <NA>         <NA>         <NA>         <NA>         <NA>
#> 585        44910        41575        40085        38369        35974
#> 586     52163931     43746753     37455033     35100852     33740594
#> 587       198595       186990       193600       190315       187850
#> 588   6347226543   3951155820   4327123856   4490444567   2964496221
#> 589          820         1005         2270         2371         2632
#> 590      2058904      1932976      2823715      2712245      2266806
#> 591        13540        14695        13620        12230         9258
#> 592    158275825     96419647     90351871     74757881     86409038
#> 593         2140         2000         2175         2174         6132
#> 594      6463460      6037650      4900393      4660197     14296279
#> 595       578670       621525       660390       704841       699741
#> 596   1811844498   1835660045   1690200722   1785233843   1799946536
#> 597       804375       832565       886815       911506       903636
#> 598   8446398035   5938017697   6152910366   6392905757   4901155474
#> 599         <NA>         <NA>         <NA>         <NA>         <NA>
#> 600         <NA>         <NA>         <NA>         <NA>         <NA>
#> 601        16730        16360        15185        13507        12503
#> 602      6582235      6614768      6125973      5404397      5039221
#> 603       609745       613955       592490       665642       677842
#> 604    268465304    271529891    269007060    309917713    333833862
#> 605        31915        32670        30860        17543        13861
#> 606     46418617     47737302     45252414     24527862     25661331
#> 607          185          240          220          211          680
#> 608       196859       301763       244882       201099       415702
#> 609           na           na           na           na           na
#> 610           na           na           na           na           na
#> 611           na           na           na           na           na
#> 612           na           na           na           na           na
#> 613           na           na           na           na           na
#> 614           na           na           na           na           na
#> 615           na           na           na           na           na
#> 616           na           na           na           na           na
#> 617           na           na           na           na           na
#> 618           na           na           na           na           na
#> 619           na           na           na           na           na
#> 620           na           na           na           na           na
#> 621           na           na           na           na           na
#> 622           na           na           na           na           na
#> 623           na           na           na           na          848
#> 624           na           na           na           na      4984247
#> 625           na           na           na           na           na
#> 626           na           na           na           na           na
#> 627           na           na           na           na           na
#> 628           na           na           na           na           na
#> 629           na           na           na           na           na
#> 630           na           na           na           na           na
#> 631           na           na           na           na           na
#> 632           na           na           na           na           na
#> 633           na           na           na           na         2280
#> 634           na           na           na           na     13197386
#> 635      1465435      1555015      1466320      1493664       739461
#> 636    875328267    957676941    936900201    993846982    461990720
#> 637         <NA>         <NA>         <NA>         <NA>         <NA>
#> 638         <NA>         <NA>         <NA>         <NA>         <NA>
#> 639          510          425          415          370          372
#> 640      6778948      4833863      5652813      4382360      3171562
#> 641         <NA>         <NA>         <NA>         <NA>         <NA>
#> 642         <NA>         <NA>         <NA>         <NA>         <NA>
#> 643         7625         3820         4925         6179         5949
#> 644       277824        72536       559264       613326       498384
#> 645         <NA>         <NA>         <NA>         <NA>         <NA>
#> 646         <NA>         <NA>         <NA>         <NA>         <NA>
#> 647         <NA>         <NA>         <NA>         <NA>         <NA>
#> 648         5445         5115         4940         4707         3888
#> 649    187082516    174490727    174636795    177233130    146251564
#> 650          920          895          960          998          937
#> 651      5582969      6211951      7469488      9345579      8217001
#> 652        31350        40295        50105        54600        52334
#> 653    643217533    855705268   1146726750   1387604332   1425395290
#> 654        69080        73520        77280        79647        78543
#> 655   1516273784   1646717246   1786558670   1917425260   1966748815
#> 656         2560         2910         3045         3124         2812
#> 657     19259501     19294910     21563235     22069653     19963264
#> 658        59870        63340        66405        68136        65391
#> 659    298686976    327487533    338880701    363624749    377535979
#> 660       105355       118210       131525       138180       134174
#> 661   2034210312   2336342751   2754947798   3105913869   3149113426
#> 662         <NA>         <NA>         <NA>         <NA>         <NA>
#> 663           na           na           na        32326        33351
#> 664         <NA>         <NA>         <NA>         <NA>         <NA>
#> 665         <NA>         <NA>         <NA>         <NA>         <NA>
#> 666         <NA>         <NA>         <NA>         <NA>         <NA>
#> 667          405          370          340          320          146
#> 668      8101117      7175807     12958008     11311843      3034738
#> 669         2540         2535         2515         2414         1399
#> 670     95582671     97239887     95449434     92398794     31347732
#> 671         2915         2875         2825         2706         1536
#> 672    103683788    104415694    108424845    103741288     34382470
#> 673          735          710          815          893         1165
#> 674     54479926     43150231     39081469     48733866     61817612
#> 675          740          715          795          891         1166
#> 676     54604326     43162991     38390650     48457689     61819814
#> 677          380          360          320          293          250
#> 678     11081611     11098655     10640354      9906003      8084764
#> 679         7315         6480         5655         4875         3788
#> 680    303415922    267342659    248952018    230922330    180992298
#> 681         7690         6835         5965         5157         4024
#> 682    314497533    278441314    259533697    240806971    188517062
#> 683          295          330          355          323          290
#> 684      4934428      6873166      5562719      5281678      5333001
#> 685         6730         8030         8540         8052         6263
#> 686    161587165    186452783    217038552    225323577    179659337
#> 687         7020         8355         8890         8371         6547
#> 688    166521593    193325949    222952909    230753856    184908982
#> 689        13665        14110        14585        15311        17115
#> 690     87044418     80901856     79896120     89741884     96630284
#> 691        15655        16815        17575        17350        17501
#> 692    242694395    310986066    344867915    234574078    296413557
#> 693        29125        30730        31935        32422        34395
#> 694    329738813    391887922    424936384    324291395    393599466
#> 695        82185        84435        79320        78235        82611
#> 696   4523893896   4514714432   4888975428   8149988512   4759139087
#> 697      1003020      1043735      1068360      1076902      1087735
#> 698 100001924838 107879765520 104617538658 105077118409 103719793303
#> 699      1072095      1114920      1135160      1142900      1158083
#> 700 104525818734 112394479952 109379436927 113094260411 108081823146
#> 701        84480        87280        82165        81181        86548
#> 702   4635179870   4628362519   4999120589   4932147097   4874282619
#> 703      1019250      1063130      1084525      1091856      1101087
#> 704 100859684917 109089249921 105346427254 105810964475 104048142392
#> 705      1090395      1136895      1154090      1160741      1174936
#> 706 105494864787 113717612440 110377271067 110768963682 108920241070
#> 707         <NA>         <NA>         <NA>         <NA>         <NA>
#> 708         <NA>         <NA>         <NA>         <NA>         <NA>
#> 709       126050       127600       129215       127866       125973
#> 710   5999366456   5529471533   5845339159   5956672503   5629791116
#> 711       249055       256805       257570       255903       250179
#> 712  38617754565  43297223581  37466601098  36234126736  29957984572
#> 713           na           na           na           na           na
#> 714           na           na           na           na           na
#> 715           na           na           na           na           na
#> 716           na           na           na           na           na
#> 717           na           na           na           na           na
#> 718           na           na           na           na           na
#> 719           na           na           na           na           na
#> 720           na           na           na           na           na
#> 721       133445       135095       134440       132890       130973
#> 722   5637044740   5740355523   5853913699   5546687483   5461458348
#> 723       269105       276470       277305       275293       271273
#> 724  38980076281  43086482471  37458026558  36644111756  30126317340
#> 725          265          450          425          455          559
#> 726      9169738     12932153      8818619     12538858      8500750
#> 727       126185       132620       135150       135063       138780
#> 728   3197292197   3371586295   3582491122   3569531360   3517733551
#> 729        77520        76875        77040        75885        75151
#> 730    728919443    634740886    647205260    649640317    585863247
#> 731         9375         9410         9855        10043        10394
#> 732     56095281     62772514     65203315     61653608     64253452
#> 733        36515        33595        31560        29265        27358
#> 734    422273313    342691732    393082215    322682151    315008640
#> 735       182920       185440       189495       193589       197656
#> 736   2617987514   2733848831   2873872395   2981940746   3056101820
#> 737       235475       231095       224070       216481       207571
#> 738   2089566953   1907819230   2071768786   2007422941   1799523756
#> 739         5730         5570         5575         5203         4913
#> 740     49691859     40771397     44357255     46273646     43542424
#> 741       649575       661060       660170       651031       629449
#> 742   2777075912   2944030898   2933299655   2883573345   3287794606
#> 743           na           na           na           na           na
#> 744           na           na           na           na           na
#> 745           na           na           na           na           na
#> 746           na           na           na           na           na
#> 747           na           na           na           na           na
#> 748           na           na           na           na           na
#> 749           na           na           na           na           na
#> 750           na           na           na           na           na
#> 751       734380       756880       765865       765314       758405
#> 752   3779967729   3858826665   5401944249   4054026602   3981570232
#> 753       279405       279110       277110       270891       267424
#> 754    824894718    819776631    884971593    880474119    871549127
#> 755      1037335      1064270      1077625      1080031      1076293
#> 756  27014963228  27242165958  27795167510  28310942860  28948007003
#> 757       114910       108400       102520        98418        95223
#> 758   5705928078   5305634617   5333913109   5388940081   5446051831
#> 759       995550      1033665      1052145      1058873      1061334
#> 760  77841987383  83188700533  77681699661  77381688456  70436811757
#> 761      1093875      1126350      1139490      1142505      1143173
#> 762  83547915461  88494335150  82967160647  82724764111  75875288088
#> 763         <NA>         <NA>         <NA>         <NA>         <NA>
#> 764         <NA>         <NA>         <NA>         <NA>         <NA>
#> 765          850         1045         1060         1046         1401
#> 766      2649000      4438831      2341895      2382792      3881918
#> 767          260          245          160          172          227
#> 768      1486325      1427138       560534       725838      1073239
#> 769         2110         1990         1760         1624         1420
#> 770     11305181     10437309      9037544      6777175      6064176
#> 771        21965        27095        25250        24238        22010
#> 772  -1097765055  -2495024916  -1495240278  -7958152692  -4736888029
#> 773        40115        40705        39895        40083        40515
#> 774    -13002556     -7243642     11632102     39158122    -13704244
#> 775         <NA>         <NA>         <NA>         <NA>         <NA>
#> 776         <NA>         <NA>         <NA>         <NA>         <NA>
#> 777       117365       112305       105920       101854       102698
#> 778  -1186844264   -839584121   -368692401   -496996660   -580418411
#> 779      1031580      1074050      1098845      1106784      1118200
#> 780  22413967954  24780308152  27598478721  28535094022  29084935491
#> 781      1129900      1168085      1186345      1190866      1204625
#> 782  21227123690  23940724031  27212259637  28041774259  28493551186
#> 783         6635         7110         7850         8191         8445
#> 784    143569925    168621977    244929525    307574236    368235699
#> 785        48655        55985        59300        61100        62900
#> 786    534766499    662955868    772637313    869433896    991238833
#> 787        55010        62790        66565        68691        70857
#> 788    678336424    831577845   1014600599   1170364108   1340141316
#> 789       118520       113715       107220       103226       103651
#> 790  -1346851845  -1010094119   -617808778   -806645681   -951002405
#> 791      1041140      1084140      1109445      1118112      1127819
#> 792  21920294717  24282539432  26991804285  27847042215  28290025809
#> 793      1140225      1181695      1216665      1204199      1215174
#> 794  20573442872  23330392951  26373995507  27040396534  27339023404
#> 795         <NA>         <NA>         <NA>         <NA>         <NA>
#> 796         <NA>         <NA>         <NA>         <NA>         <NA>
#> 797           na           na           na           na        98018
#> 798           na           na           na           na    289842799
#> 799           na           na           na           na       161432
#> 800           na           na           na           na    994251195
#> 801         <NA>         <NA>         <NA>         <NA>         <NA>
#> 802         <NA>         <NA>         <NA>         <NA>         <NA>
#> 803           na           na           na           na           na
#> 804           na           na           na           na           na
#> 805           na           na           na           na           na
#> 806           na           na           na           na           na
#> 807         <NA>         <NA>         <NA>         <NA>         <NA>
#> 808         <NA>         <NA>         <NA>         <NA>         <NA>
#> 809           na           na           na           na           na
#> 810           na           na           na           na           na
#> 811         <NA>         <NA>         <NA>         <NA>         <NA>
#> 812         <NA>         <NA>         <NA>         <NA>         <NA>
#> 813           na           na           na           na           na
#> 814           na           na           na           na           na
#> 815           na           na           na           na           na
#> 816           na           na           na           na           na
#> 817         <NA>         <NA>         <NA>         <NA>         <NA>
#> 818         <NA>         <NA>         <NA>         <NA>         <NA>
#> 819        23360        23070        22545        21715        20841
#> 820    734988091    720286102    719862076    700597386    671180592
#> 821        24540        23655        22895        21803        20563
#> 822   1012398052    921774122    924475790    880290386    964069046
#> 823           na           na           na           na           na
#> 824           na           na           na           na           na
#> 825           na           na           na           na           na
#> 826           na           na           na           na           na
#> 827           na           na           na           na           na
#> 828           na           na           na           na           na
#> 829           na           na           na           na           na
#> 830           na           na           na           na           na
#> 831           na           na           na           na           na
#> 832           na           na           na           na           na
#> 833        78195        77615        78375        78330        79550
#> 834   3889612354   3952762305   4072425919   4186921808   4330599492
#> 835        19520        20490        21160        21655        22828
#> 836    531025133    563104463    570549026    607928748    630142643
#> 837         1305         1350         1165         1093         2000
#> 838     19406522     15726453     15403966     13652160     24767129
#> 839       111245       115155       104640        97944        70762
#> 840   1616658474   1756198117   1351063957   1273864105   1025715798
#> 841          560          520          420          439          532
#> 842     15073555     17272067     14334693     10405928     16948344
#> 843        25495        26195        23195        21707        17186
#> 844    635529275    650990001    555486003    522027303    419607124
#>          2013_14      2014_15      2015_16      2016_17      2017_18
#> 1       13651048     13967366     14337401     14741536     15127836
#> 2       10094991     10357365     10584639     10874723     11270674
#> 3        3556057      3610001      3752762      3866813      3857162
#> 4        7122657      7264970      7426987      7600300      7783610
#> 5        6528391      6702396      6910414      7141236      7344226
#> 6             na           na           na           na           na
#> 7       13540937     13848644     14177808     14526706     14871926
#> 8         110111       118722       159593       214830       255910
#> 9           <NA>         <NA>         <NA>         <NA>         <NA>
#> 10          <NA>         <NA>         <NA>         <NA>         <NA>
#> 11       4261909      4374102      4508683      4650905      4766913
#> 12       3389274      3484001      3601499      3728325      3853647
#> 13       2705444      2761499      2830477      2911642      2997923
#> 14       1532989      1554045      1565144      1575560      1594756
#> 15        951154       963082       975848       993076      1014780
#> 16        278329       282894       289093       297150       307285
#> 17        253844       259121       267062       276408       285425
#> 18        131536       133630       135314       137550       138227
#> 19        146569           na           na           na           na
#> 20            na       154813       164000       170463       168311
#> 21            na          179          281          457          569
#> 22          <NA>         <NA>         <NA>         <NA>         <NA>
#> 23          <NA>         <NA>         <NA>         <NA>         <NA>
#> 24      10163928     10320632     10355325     10442913     10499516
#> 25       1189412      2024295      3644097      4031354      4407435
#> 26        497727       385312       337979       267269       220885
#> 27       1799981      1237127           na           na           na
#> 28          <NA>         <NA>         <NA>         <NA>         <NA>
#> 29          <NA>         <NA>         <NA>         <NA>         <NA>
#> 30        146971       164168       182609       212647       228400
#> 31       1623482      1664932      1722909      1767935      1825187
#> 32       1532908      1550272      1595962      1639367      1672752
#> 33       1488247      1546590      1601333      1653254      1690191
#> 34       1350403      1379730      1428162      1495956      1568758
#> 35       1442698      1450787      1435542      1429193      1435751
#> 36       1329580      1356310      1403716      1454107      1488705
#> 37       1327041      1334793      1330780      1326920      1328258
#> 38       1147995      1179536      1210033      1243085      1275362
#> 39        904530       923086       947950       976540      1007128
#> 40        588299       615517       639805       646254       665558
#> 41        310956       329382       349411       385994       415125
#> 42        457938       472263       489189       510284       526661
#> 43          <NA>         <NA>         <NA>         <NA>         <NA>
#> 44          <NA>         <NA>         <NA>         <NA>         <NA>
#> 45      10957906     11236843     11489118     11803231     12178315
#> 46  170083945039 177280396095 186094400718 191279182928 208376578616
#> 47         33594        35585        37691        38247        40389
#> 48      26772459     30513129     35249008     37466346     40768771
#> 49       9520276      9654540      9785134      9954233     10254505
#> 50   10441216565  14311636724  14853449846  15267340189  16340493373
#> 51        203136       190146       214683       232116       294762
#> 52     269155866    258957124    279392345    303894309    385676763
#> 53       9512392      9646879      9779123      9946273     10246687
#> 54   10696435054  14550768771  15113309997  15551105362  16705317659
#> 55      10094991     10357365     10584639     10874723     11270674
#> 56  173638961959 186222275378 195729662439 201095688094 217985387593
#> 57        685569       718554       758495       805838       854459
#> 58    7128072062   7723181218   8108246554   8385731754   8942375372
#> 59       9903568     10162638     10377171     10655459     11041166
#> 60  166510889897 178499094160 187621415885 192709956340 209043012221
#> 61        498062       558373       544866       575877       641657
#> 62    5057571529   6348736249   6859018825   7605273584   8880706623
#> 63        449581       466345       526221           10           na
#> 64    1688655877   1788401803   2156806532        38350           na
#> 65            na           na            1       603826       644183
#> 66            na           na         3858   2438381859   2805400016
#> 67            na           na           na         7968        10028
#> 68            na           na           na     49500636     59892261
#> 69         30154        26356        24831        24798        22410
#> 70      59571085     52546472     50532764     47300096     46401724
#> 71            na          938         2547         4718         8319
#> 72            na      1783164      6332665     11990593     23663438
#> 73            na           na           na           na            2
#> 74            na           na           na           na         4030
#> 75            na           na           na           na           na
#> 76            na           na           na           na           na
#> 77            na           na           na           na           na
#> 78            na           na           na           na           na
#> 79            na           na           16           87          266
#> 80            na           na        19066       103555       358642
#> 81            na           na            2            4           15
#> 82            na           na         2361         5212        22728
#> 83          <NA>         <NA>         <NA>         <NA>         <NA>
#> 84          <NA>         <NA>         <NA>         <NA>         <NA>
#> 85      10780034     10981806     11201274     11460644     11756222
#> 86  608638434391 629640575540 655510441166 675030651940 717166582796
#> 87      10450026     10616950     10818027     11056227     11349359
#> 88  148484273254 158383925612 166165924217 171574938894 184065126141
#> 89       2399564      2450044      2463872      2551739      2657577
#> 90    9317591404   9471328330   9384669445   9467287657   9980985702
#> 91        211216       218464       208777       189104       173564
#> 92    3023833500   3281862487   3222081166   2938196818   2650093509
#> 93         13187        11811         9860         8860         7866
#> 94       7661320      6603032      4884162      3722603      3989604
#> 95         67226        62261        46926        38113        33913
#> 96    2014569428   2030543039   1813952916   1610181980   1428147510
#> 97           180          233          113          124           59
#> 98       4134046      4461380      2476525      3244253      2311584
#> 99        156686       146855       136692       124218       130205
#> 100   1255611436   1174135464   1193440200   1161469778   1130739747
#> 101          682          716          716          602          246
#> 102      6981247      6296624      5618478      5197164      2263294
#> 103          312          194           86           74           78
#> 104      2332595      2787819       898988      1249601      1152907
#> 105         1786         1106          722          512          406
#> 106     13912207      8789086      6208096      4290459      2468972
#> 107        31816        58217        78877        72328        79316
#> 108    632528793    835363314   1154567787   1085582826   1144066168
#> 109            2            0            1            1            2
#> 110        10813            0          114         2607        37683
#> 111       258739       269583       264133       235972       244225
#> 112   3930466273   4062382099   4177163104   3871218668   3711187865
#> 113      1020081      1062484      1097267      1073308      1046103
#> 114   5871511337   6412546991   6739512082   6792371449   6745430298
#> 115       679097       715325       728380       745209       680623
#> 116   6941519265   7465818383   7951418759   8246966468   8061035772
#> 117       142034       152165       148794       138324       108181
#> 118   1989159716   2139007186   2107780992   1964300469   1513601462
#> 119       215928       222961       225299       227483       220152
#> 120   6163696663   6613227293   6901247255   7165017440   7271591813
#> 121           na           na           na           na         8035
#> 122           na           na           na           na     80097997
#> 123          953         1222          781          755          801
#> 124      4641749      6531360      4702824      4745559      5720936
#> 125         1266         1798         1288         1385         1233
#> 126     14796456     20129159     23613123     31137021     26445250
#> 127        18639        33978        43676        50161        53388
#> 128    824602343   1144763376   1249897613   1498049864   1382656134
#> 129         5787         5547         5647         6106         6117
#> 130    156963481    190618059    188513305    225972802    233129829
#> 131        81556        65959        56339        60260        54770
#> 132   1794767636   1806120672   1444158983   1765372549   1400396342
#> 133       105982       105484       105662       116527       114275
#> 134   2776333460   3141502107   2882569901   3489395215   3016182305
#> 135         2779         3950         5277         5598         6822
#> 136     98178582    145588503    149518414    161709672    166669636
#> 137         1497         1731         1797         1824         2121
#> 138     47952822     69265316     67680908     70076510     84601018
#> 139         9384         8565         8283         7377         8251
#> 140    261552742    240029840    194001185    197826244    214512209
#> 141        13660        14246        15357        14799        17194
#> 142    407684146    454883659    411200507    429612426    465782863
#> 143        14997        15420        14405        14269        15642
#> 144    688260027    695246737    685832199    723045186    825088743
#> 145         <NA>         <NA>         <NA>         <NA>         <NA>
#> 146      7678467      8071698      8232785      8166441      8249727
#> 147  13812670272  12903325214  11328654684   9980030090   9873453415
#> 148       596074       710530       689422       619010       589334
#> 149    108471988    124968453    115334678    100318001     92770002
#> 150      1100156      1107148      1052364      1111665      1110689
#> 151    991589024   1056625229   1156673703   1044808191   1021920592
#> 152      2977241      2971550      3019998      2972001      2935586
#> 153  23512250257  22852046355  23144508817  23187107576  25394314993
#> 154      2970398      2965063      3014956      2965002      2928068
#> 155  10070088114   9788828441   9912193543   9680795196  10523262803
#> 156        74133        74001        63929        98877        62958
#> 157      7089747      8905905      8658409     10318302      7833332
#> 158       207456       190226       185289       195474       204910
#> 159    200696862    189142750    199801334    185026993    197796282
#> 160        14580        12899        17284        11448        12461
#> 161    143390593    123126606    132392759    188589626    198069134
#> 162        81883        80319        73147        81420        87874
#> 163   2750166571   3566820307   3540327519   3591048189   4540161870
#> 164       115963       109789       108274       108765       119400
#> 165   3476576378   4090790706   3955422427   4002656466   4991600299
#> 166          356          226          369          435          489
#> 167      4763038      4560541      3995730      2679031      7979154
#> 168         1016         1034          911          941         1001
#> 169     82788254     92271439     89861314     97475224    113672225
#> 170      5065814      5191020      5107649      5228107      5369375
#> 171 107482080298 115049126287 120696648866 127634503241 137077880417
#> 172        87771        53522        66166        70223       173446
#> 173    551966733    358338059    406697354    429085331   1042945180
#> 174           na         2588         2344         2646        11189
#> 175           na     31089229     26153303     26186259     65853874
#> 176     13572771     13887550     14212988     14573734     14933764
#> 177 809672830075 839541813883 870634098345 896142834958 951515048488
#> 178         <NA>         <NA>         <NA>         <NA>         <NA>
#> 179         <NA>         <NA>         <NA>         <NA>         <NA>
#> 180      2976250      3132908      3294017      3365809      3357609
#> 181   5723472131   6163633558   5876636409   5810974775   5598304315
#> 182       310654       318403       350548       352901       353502
#> 183   2901693138   2934164390   3122677025   3092416564   3087724785
#> 184           na           12            6           10            6
#> 185           na        91365        42125        61771        27355
#> 186        15185        12133         9729         8104         6360
#> 187     29821838     25732662     19710796     17119516     13665931
#> 188      3360194      3521182      3654304      3726824      3717477
#> 189   8919099771   9384971599   9019074150   8920572626   8699722386
#> 190      1264947      1302021      1362239      1416359      1446181
#> 191   2126026515   2109409021   2133962262   2105716739   2100403190
#> 192      2187988      2226509      2265917      2294904      2297120
#> 193    659770089    700853888    743491620    749073265    730444615
#> 194      3174027      3142235      3107355      3159217      3137948
#> 195    798755442    824514663    838906170    836377972    799076504
#> 196       503288       527671       554565       559726       528955
#> 197    106247813    117141571    128717932    129438565    118554505
#> 198       513417       522392       542926       568556       566730
#> 199    160442445    170557615    183721095    189321701    180961260
#> 200        44840        33395        41960        21866        16091
#> 201     12405673     10012232     13923620      7161473      5974649
#> 202      6423560      6452202      6512723      6604269      6546844
#> 203   1737621462   1823079969   1908760437   1911372976   1835011533
#> 204       480940       488757       419458       399304       391830
#> 205    903491470    938653766    889694561    820556038    790870870
#> 206        93980        98591        95714       111641       126128
#> 207    215928716    239008228    248345925    284164582    309454697
#> 208        27123        34763        33975        35150        21398
#> 209     37951410     51516247     57176268     56613621     32569676
#> 210        11986         9150         7167         5828         4445
#> 211     12496847     10548449      8672998      6725389      5697202
#> 212       614029       631261       556314       551923       543801
#> 213   1169868443   1239726690   1203889752   1168059630   1138592445
#> 214      7051228      7233059      7348115      7510019      7612487
#> 215   7588967743   8107916933   8496307557   8606119075   8672698068
#> 216      8926135      8963831      8968153      9164169      9253176
#> 217  21541583934  22665104212  22761994158  22711841046  22446427622
#> 218       309157       315892       313963       312791       304126
#> 219    135103362    142496860    143936875    143972049    136133234
#> 220       344713       319459       285001       258667       228632
#> 221    871034731    797200670    768662186    708914141    703089352
#> 222       275392       259812       270828       266207       275804
#> 223   1184140465   1134686863   1063325067    987383680    979257517
#> 224      4675588      4708194      4649607      4648539      4545673
#> 225   2685432841   3152624992   2930731458   3595769023   3851973068
#> 226      6354256      6391881      6277169      6282921         2313
#> 227   2457016000   2490412812   2420715530   2450127000       856692
#> 228           na           na           na           na       238950
#> 229           na           na           na           na    383587641
#> 230           na           na           na           na        28241
#> 231           na           na           na           na     27128028
#> 232           na           na           na            1      6116103
#> 233           na           na           na         4200   2075693084
#> 234       901231       910797       951410       973805      1084280
#> 235   5705818509   6550974389   6867336622   7195339009   7533319663
#> 236     10846666     10839634     10766903     10992748     11159470
#> 237  34580129842  36933500798  36956704564  37793350148  38137465901
#> 238         <NA>         <NA>         <NA>         <NA>         <NA>
#> 239         <NA>         <NA>         <NA>         <NA>         <NA>
#> 240     13575121     13890225     14217391     14578691     14939813
#> 241 775092700233 802608313085 833677393781 858349491121 913377582587
#> 242         <NA>         <NA>         <NA>         <NA>         <NA>
#> 243         <NA>         <NA>         <NA>         <NA>         <NA>
#> 244        52379        49773        44452        42457        39471
#> 245   5678516511   5755277470   5514606068   5311201527   4953551161
#> 246       168492       166395       166728       167204       167849
#> 247   7485288725   7227396522   7137868630   6955361244   6862328006
#> 248       209837       205933       201836       201103       199315
#> 249  13163805236  12982673992  12652474698  12266562771  11815879167
#> 250        24616        26734        23552        23110        19413
#> 251    734735424    828696480    818698116    840676911    604247140
#> 252        80366        77538        76793        76618        75998
#> 253   1364723538   1241249244   1202638030   1195753281   1140309551
#> 254       102772       101824        98210        97739        93779
#> 255   2099458962   2069945724   2021336146   2036430192   1744556691
#> 256         <NA>         <NA>         <NA>         <NA>         <NA>
#> 257         <NA>         <NA>         <NA>         <NA>         <NA>
#> 258     13528820     13847456     14176009     14536795     14900943
#> 259 772992984519 800538534476 831655510295 856312353177 911631979660
#> 260         <NA>         <NA>         <NA>         <NA>         <NA>
#> 261     13372839     13697340     14019916     14380762     14736799
#> 262 775670269585 803029436650 834116775498 858636268169 914344622665
#> 263         <NA>         <NA>         <NA>         <NA>         <NA>
#> 264         <NA>         <NA>         <NA>         <NA>         <NA>
#> 265       604919       632635       646385       656332       647594
#> 266    725315164    751411170    763876741    764665067    761571621
#> 267       228884       244546       243672       235575       202233
#> 268    642700862    700237164    717073063    714843331    637227195
#> 269       695203       658946       545575       528454       529911
#> 270    380641511    310314994    232027738    212555991    219098649
#> 271         <NA>         <NA>         <NA>         <NA>         <NA>
#> 272         <NA>         <NA>         <NA>         <NA>         <NA>
#> 273          516          484          383          476          504
#> 274      1187099      1280358      1020875      1370621      1779888
#> 275      6785541      6865218      6886974      6987867      6987516
#> 276   2148741575   2163715349   2159828169   2182889031   2164335282
#> 277           na           na           na           na           na
#> 278           na           na           na           na           na
#> 279        87144        53072        65656        69669       172463
#> 280     82136540     53219870     60432701     63701117    155368823
#> 281           na         2167         1968         2198         9884
#> 282           na      4208418      3515615      3516039      8780322
#> 283        66176        73848        72946        76687        72152
#> 284    204654686    223803208    219167257    230981905    195317114
#> 285       425708       466679       488111       495968       490518
#> 286    237876056    277700883    303251889    318694017    327309853
#> 287       353874       369734       361064       339057       340108
#> 288   1325203073   1511233606   1390472652   1464904517   1195363148
#> 289           na           na       837181       959170      1038320
#> 290           na           na    258273708    408482493    447751389
#> 291         1358         1348         1727         2508         3530
#> 292      6637456      7614125      9644957     14688103     17655288
#> 293         <NA>         <NA>         <NA>         <NA>         <NA>
#> 294         <NA>         <NA>         <NA>         <NA>         <NA>
#> 295     10661110     10841962     11051934     11297508     11595209
#> 296 150989694593 161155346854 169047496927 174498792428 187011774955
#> 297      1454325      1303536      1378829      1404986      1422619
#> 298  18688839391  20240080765  20998565088  21184436640  21876048488
#> 299         <NA>         <NA>         <NA>         <NA>         <NA>
#> 300         <NA>         <NA>         <NA>         <NA>         <NA>
#> 301      7657409      7986048      8235073      8378361      8497154
#> 302      6538619      6756173      6900914      7035077      7129901
#> 303   4242555661   4447182142   5082098631   4614243569   4602418245
#> 304       689180       717591       745936       775323       727601
#> 305    225346003    242420371    248105435    245119152    236763950
#> 306      1739740      1564079      1699040      1756501      1903850
#> 307    607583206    625250520    666653229    711652163    764656891
#> 308           na           na           na           na           na
#> 309   3860318458   4064351993   4663550837   4147710558   4074525304
#> 310         <NA>         <NA>         <NA>         <NA>         <NA>
#> 311         <NA>         <NA>         <NA>         <NA>         <NA>
#> 312      2055499      2215225      2373889      2311873      2536293
#> 313  16808304765  18906528203  19840668705  20733442006  23383469532
#> 314     10717942     10784667     10898086     11238516     11347382
#> 315 -26511138068 -27427000642 -27799874795 -28634556289 -28819418596
#> 316     12773441     12999892     13271975     13550389     13883675
#> 317  -9702833302  -8520472439  -7959206091  -7901114283  -5435949064
#> 318         <NA>         <NA>         <NA>         <NA>         <NA>
#> 319         <NA>         <NA>         <NA>         <NA>         <NA>
#> 320        24778        23831        24416        25535        26885
#> 321    287768824    283054395    295875560    363204200    348969088
#> 322        83733       115339       132679       160176       174411
#> 323    627309615    800118686    944665674   1099441299   1225338613
#> 324           52           48          147           24           39
#> 325       419528       393169      1106264       206932       311616
#> 326       108563       139218       157242       185735       201335
#> 327    915497967   1083566250   1241647498   1462852431   1574619317
#> 328        67769        57290        42043        38474        26977
#> 329    674574345    597671213    465330299    464658996    334245882
#> 330        25528        21455        15409        14835        12322
#> 331    543635879    461991367    376637761    378767978    320947189
#> 332         9760         8215         5499         5213         4299
#> 333    121900779     94436311     81145969     73267268     78835822
#> 334           na           na           na        77320       100463
#> 335           na           na           na    927134994   1995698566
#> 336         <NA>         <NA>         <NA>         <NA>         <NA>
#> 337         <NA>         <NA>         <NA>         <NA>         <NA>
#> 338           na           na           na       542743       609645
#> 339           na           na           na  12116797056  13388199836
#> 340           na           na           na       349410       306379
#> 341           na           na           na   6315871022   5003124559
#> 342       852907       864703       872527       876881       904127
#> 343  15821869781  16363425277  17376277523  18415500691  18377743967
#> 344      1360648      1421440      1483955      1504872      1529777
#> 345  10884565365  13332968239  13590520357  14136115948  11288479528
#> 346       206401       233643       231941       226521       233757
#> 347   2741453276   3305719421   3312222524   3531242624   3737153277
#> 348        11230        12331        12832        11418        11728
#> 349    536942024    595220486    507326946    518136243    566509295
#> 350       105804       100378        97804        96248        93729
#> 351    656261870    634362147    576057628    502547522    506329625
#> 352      1343820      1366333      1381035      1394711      1416665
#> 353  11850289498  11985354144  12201645620  12661898430  13030991708
#> 354       135973       153017       142372       139095       139998
#> 355   1151302574   1278279342   1237630857   1097779711   1176402440
#> 356         <NA>         <NA>         <NA>         <NA>         <NA>
#> 357         <NA>         <NA>         <NA>         <NA>         <NA>
#> 358         <NA>         <NA>         <NA>         <NA>         <NA>
#> 359        87849        96969        96942        97963        88718
#> 360   3167992096   3711928614   3819934288   4301093680   3611914566
#> 361       110189        96994        93205        88044        92892
#> 362  -2275103212  -1835493812  -1905780161  -1735465838  -2119556871
#> 363       198038       193963       190147       186007       181610
#> 364    892888884   1876434802   1914154127   2565627842   1492357695
#> 365        38064        41368        41983        45224        45364
#> 366   1951941644   2302503984   2338256385   2783374110   2589226106
#> 367         8039         7698         7585         7630         7875
#> 368   -287266028   -276711201   -306274787   -301828847   -348908749
#> 369        46103        49066        49568        52854        53239
#> 370   1664675616   2025792783   2031981598   2481545263   2240317357
#> 371         8587         8733         8864         7029         4929
#> 372     35726177     45518697     83675174     78994444     67489643
#> 373         4416         4128         3515         2366         1720
#> 374    123891356    126451888    110707092     71388141     51417648
#> 375          319          344          320          255          268
#> 376     13089814     12877028      9110495      9690915     10379590
#> 377           na           na           na          552          570
#> 378           na           na           na      6457280      6198520
#> 379        37336        36303        34590        32996        31093
#> 380    192022341    199370800    219478001    241250070    265245955
#> 381        42071        40775        38864        36169        33651
#> 382    329003511    338699716    343357871    328786406    333241713
#> 383       238693       237308       234439       233121       229624
#> 384   2192834812   3518009172   3519102680   4639392255   3331943696
#> 385         <NA>         <NA>         <NA>         <NA>         <NA>
#> 386         <NA>         <NA>         <NA>         <NA>         <NA>
#> 387       443892       429042       411511       396166       378822
#> 388  14798962425  14592013834  14082571148  13780308980  13652314729
#> 389        91844        89821        85628        80323        75855
#> 390  -1009522915   -982031156   -924163658   -877585431   -864858589
#> 391       535736       518863       497139       476489       454677
#> 392  13789439510  13609982678  13158407490  12902723549  12787456140
#> 393      1255479      1297545      1288418      1273815      1287682
#> 394  26324901724  27031896739  27828181568  28665064062  30274269318
#> 395        44580        49692        55312        61451        69918
#> 396   -835712790   -933560960  -1053877619  -1067166361  -1297166960
#> 397      1300059      1347237      1343730      1335266      1357600
#> 398  25489188934  26098335779  26774303949  27597897701  28977102358
#> 399       649183       689049       696679       738824       774392
#> 400  14924007992  15009806107  16500086649  17775281170  20489179667
#> 401          723          771          796          782          612
#> 402      3504981      6567374      6962770      6097787      3950962
#> 403         7883         7483         6927         6535         6710
#> 404     86488518     75765110     73830834     75083163     74731760
#> 405          810         1050          974          902          997
#> 406     11984566     13367672     10790142      9663078     10973431
#> 407           na           na         1063         1113         1106
#> 408           na           na      8642907     11113489     11121859
#> 409       298336       287113       271408       264053       255169
#> 410   1621665266   1648478834   1407037028   1333366691   1303371998
#> 411       307029       295646       280372       272603       263982
#> 412   1720138350   1737611616   1500300911   1429226421   1400199048
#> 413      1822799      1868012      1865006      1868199      1894511
#> 414  52478993105  52973945574  54925534407  56840578212  60849588155
#> 415         <NA>         <NA>         <NA>         <NA>         <NA>
#> 416       632535       614422       593904       574326       553365
#> 417  14682328394  15486417480  15072561617  15468351391  14279813835
#> 418      1374333      1438114      1454538      1477186      1523701
#> 419  42077872542  43133934669  45306372196  47854724134  51706599382
#> 420      1907016      1953358      1952589      1958228      1986386
#> 421  56760200936  58620352149  60378933813  63323075525  65986413217
#> 422         9289         9491         9653         7798         5534
#> 423     39231158     52086071     90637944     85092231     71440605
#> 424       346567       334153       317096       306801       295844
#> 425   2049141861   2076311332   1843658782   1758012827   1733440761
#> 426      1914037      1958951      1958116      1963560      1991255
#> 427  54671827917  56491954746  58444637087  61479970467  64181531851
#> 428         <NA>         <NA>         <NA>         <NA>         <NA>
#> 429           na           na       243566       262584       257346
#> 430           na           na   8049341133   9836908549   9511315629
#> 431           na           na       199869       254621       280066
#> 432           na           na   9455044055  13338770313  15027097220
#> 433         <NA>         <NA>         <NA>         <NA>         <NA>
#> 434         <NA>         <NA>         <NA>         <NA>         <NA>
#> 435         1410         1365         1234         1204         1172
#> 436      2364218      1808313      1746569      1326023      2134304
#> 437       719792       741337       743177       787187       812666
#> 438   4955628398   4939333850   5415525634   5612269905   6351588702
#> 439        59943        59273        59347        51494        50135
#> 440     22164787     23992363     24844685     26661691     29828561
#> 441         1053         1001         1057          961          833
#> 442      1133165       774259      1045253      1453868      1550546
#> 443         3468         3571         3338         3471         3794
#> 444     21594590     23912281     30454409     28287432     28135399
#> 445         3522         3497         3336         2996         3663
#> 446      3483517      5824927      5669148      4859673      6403739
#> 447        10820        14425        15591        16387        15953
#> 448     62473025    100826802    124283079    140418532    119217292
#> 449         <NA>         <NA>         <NA>         <NA>         <NA>
#> 450         <NA>         <NA>         <NA>         <NA>         <NA>
#> 451         3839         3724         4149         3015         3047
#> 452     29477898     29635575     28793368     22219175     22785501
#> 453          895          770         1246         1035         1062
#> 454      4435350      2389180      2403757      2072757      1907337
#> 455        51428        57357        68828        57770        56348
#> 456    350844225    369382362    385573770    329473840    357907674
#> 457       134694       143255       173102       174316       179174
#> 458   3089280885   3244529369   3599081923   3498897675   3737042296
#> 459         <NA>         <NA>         <NA>         <NA>         <NA>
#> 460         <NA>         <NA>         <NA>         <NA>         <NA>
#> 461        98732        95358        95954        99869       101872
#> 462   -850626452   -515367278   -399397679   -243006999   -577726659
#> 463      1158839      1206875      1257018      1315191      1370661
#> 464  30043500694  31196281406  32859807122  34455983414  36792276152
#> 465           na            1       712951       774716       834269
#> 466           na           86  32815454572  29093003429  31722763931
#> 467           na            1      1115458      1250877      1333118
#> 468           na           86  39600250934  47816804244  52393156742
#> 469         3201         2926         3158         2642         2501
#> 470     31339624     29340804     28655202     25685779     23806027
#> 471         1141          755         1345         1161         1293
#> 472      3367351      2874059      2973076      2733849      3390890
#> 473          904          825          862          932          874
#> 474     15864143     19341542     18859013     25816914     18473064
#> 475         4641         4549        10379         6528         6943
#> 476     33161856     33557182     42697591     35215214     41094601
#> 477         <NA>         <NA>         <NA>         <NA>         <NA>
#> 478         <NA>         <NA>         <NA>         <NA>         <NA>
#> 479        38115        36999        35241        34919        31372
#> 480    530165069    519018095    516776784    531329386    526416853
#> 481       142981       152907       158669       164952       168133
#> 482   1973288976   2105326730   2278968489   2367987933   2475366967
#> 483        28586        26203        25644        26166        26237
#> 484    808639593    781057844    793105777    824213495    877859816
#> 485       153026       164137       168953       174455       174149
#> 486   1696257547   1842990583   2003185522   2053681722   2123964959
#> 487         <NA>         <NA>         <NA>         <NA>         <NA>
#> 488         <NA>         <NA>         <NA>         <NA>         <NA>
#> 489        15004        17940        18176        21831        19129
#> 490   1002917893   1278214429   1396076541   2114624838   1728527387
#> 491           29           65           91          185          243
#> 492       730996      5365905      7930331     15558520     18426673
#> 493        12718        12516        14048        14404        15172
#> 494    711271068    808752604    949763986   1074635695   1222911701
#> 495        12108        14800        14630        18253        15272
#> 496   -637301298   -814568453   -867936084  -1437771721  -1011315493
#> 497         9201         8150         9661         9155        10159
#> 498    353105850    350472533    429553860    413341098    524126480
#> 499        21309        22950        24291        27408        25431
#> 500   -284195448   -464095920   -438382224  -1024430623   -487189013
#> 501         <NA>         <NA>         <NA>         <NA>         <NA>
#> 502         <NA>         <NA>         <NA>         <NA>         <NA>
#> 503       638955       706746       697726       737530       814620
#> 504  15343961120  18698468402  19454549056  21775476850  25509909782
#> 505       889161       943014       929911       963674      1040772
#> 506  37056912237  43803745477  46033732151  51138365825  57531346276
#> 507      1036346       996782       969152       936190       918858
#> 508  28408850270  28690840722  29009432544  28961873158  28964495714
#> 509           na           na           na          822         2473
#> 510           na           na           na     84507982    222976695
#> 511         <NA>         <NA>         <NA>         <NA>         <NA>
#> 512         <NA>         <NA>         <NA>         <NA>         <NA>
#> 513         1110         3294         3819          713          969
#> 514     32357740     29109886     41771992     30515436     31515492
#> 515          580          440          410          312          332
#> 516     13591153     19866812     18165185      2027052      2126076
#> 517         <NA>         <NA>         <NA>         <NA>         <NA>
#> 518         <NA>         <NA>         <NA>         <NA>         <NA>
#> 519       732738       744795       775528       763664       814942
#> 520   4944700465   6499831513   6315763638   6439577846  97020277085
#> 521        24396        25082        28466        31206        34152
#> 522   1752457483   1936351733   1895771992   1898611481   2230693885
#> 523        57106        58137        58634        59123        59651
#> 524    553861210    608347198    682943641    640490934    684975177
#> 525        45246        44393        42451        41242        40025
#> 526    376602783    405470413    434709047    388557826    405040386
#> 527        44124        44997        44349        44268        45532
#> 528    110283789    143509531    182046413    199869312    256395578
#> 529       623942       633390       652603       632044       673056
#> 530   2001353830   2335707190   2573949209   2625642214   2702343234
#> 531        18553        16200         7910         5575         9530
#> 532      1979260      1696590      1216534      1527597      1904676
#> 533         8932        10399         8931         8762         8336
#> 534    702594748    785896278    770613861    704993774    576653127
#> 535         4274         4314         5837         5322         5102
#> 536    303364628    283370040    300288697    264393548    265524146
#> 537       566473       590871       616170       596569       615580
#> 538    937139454   1068682215   1075084614   1077383783   1213781859
#> 539         <NA>         <NA>         <NA>         <NA>         <NA>
#> 540         <NA>         <NA>         <NA>         <NA>         <NA>
#> 541      2098593      2145508      2192661      2252792      2303981
#> 542  40662775479  42475309202  44430177886  46418033330  48659152597
#> 543      1724146      1762624      1796594      1838176      1870131
#> 544  22472268815  22659328322  22992641201  23135374002  25005622695
#> 545       962274      1021044      1072989      1132087      1170158
#> 546   2870943468   3173152487   3444468051   3760295022   4037396005
#> 547      2109838      2158533      2205174      2264801      2314244
#> 548  19254380902  20499458222  21740698520  22908197038  23427880988
#> 549           na           na           na           na           na
#> 550  44597593185  46331939031  48177807772  49803866062  52470899688
#> 551       811256       835643       865679       910210       935426
#> 552   7542017662   7826134911   8169702010   8580878859   8968129477
#> 553         3039         3435         3574         3782         3872
#> 554      1314239      1338286      1354683      1369988      1394519
#> 555 -11513026280 -11682573164 -11917279725 -11966211441 -12779624231
#> 556      2128534      2177364      2223936      2283980      2333817
#> 557  -3971008618  -3856438253  -3747577715  -3385332582  -3811494754
#> 558         <NA>         <NA>         <NA>         <NA>         <NA>
#> 559          741          661          532          659          689
#> 560      5086486      5355525      4394957      5812801      6951448
#> 561         3259         1110         1213         2232          625
#> 562     12799503      7761056      8863955      8693650      6044810
#> 563       752020       700069       251267       233385       147358
#> 564   1370153275   1377237764   1365503471   1448197454   1417251917
#> 565       135359       121530       104700       102459           na
#> 566    703916548    758572406    918317060    882717031           na
#> 567           na           na           na           na        70806
#> 568           na           na           na           na    125118897
#> 569           na           na           na           na           na
#> 570           na           na           na           na           na
#> 571           na           na           na           na           na
#> 572           na           na           na           na           na
#> 573           na           na           na           na           na
#> 574           na           na           na           na           na
#> 575         3434         3524         3218         4421         4365
#> 576     11632556     12556781     16228863     34483662     30238258
#> 577        17610        18000        17323        18575        19680
#> 578    846528429    919468511   1041307846   1189661419   1303775636
#> 579           na           na           na           na           na
#> 580           na           na           na           na           na
#> 581      5065814      5190987      5107653      5228125      5369375
#> 582 107482080298 115048001188 120696679614 127634951573 137077880417
#> 583         <NA>         <NA>         <NA>         <NA>         <NA>
#> 584         <NA>         <NA>         <NA>         <NA>         <NA>
#> 585        35452        35096        34832        33721        32646
#> 586     38695116     40650828     44839059     41065821     41493601
#> 587       200392       211040       212393       218302       363074
#> 588   3719730605   4472750101   4619965036   4913970333   5198711715
#> 589         1955         1487         1616         1392         1207
#> 590      1808139      1386265      2185181      1904722      2079987
#> 591         5490         4578         3736         3041         2519
#> 592     67149641     76785700     63251401     22622734     15578908
#> 593         5067         4604         6538         7226         6857
#> 594     13173978     12906419     12632032     14987170     15425385
#> 595       690700       692962       732282       750774       738677
#> 596   1865261030   1946482956   2124443863   2199536798   2259920477
#> 597       901231       910792       951408       973805      1084273
#> 598   5705818509   6550962269   6867316572   7194087578   7533210073
#> 599         <NA>         <NA>         <NA>         <NA>         <NA>
#> 600         <NA>         <NA>         <NA>         <NA>         <NA>
#> 601        12217        11751        10427        10708        18648
#> 602      5055019      4978498      4591729      4808999      8835952
#> 603       672516       640104       519067       501939       495783
#> 604    335628807    277893572    170008260    160646104    158369606
#> 605         5925         6587         4737         4021         3477
#> 606      8476975      9613983      7386212      6058629      5438432
#> 607          194           88           60           66           66
#> 608       135366       120379        84967       160324       100049
#> 609           na           na           na         1664         2185
#> 610           na           na           na      3157222      6260079
#> 611           na           na           na           na           na
#> 612           na           na           na           na           na
#> 613           na           na           na         2029         1918
#> 614           na           na           na     26073687     21906005
#> 615           na           na           na           na           na
#> 616           na           na           na           na           na
#> 617           87           58          100          119          113
#> 618       142296       102191       164198       213765       267140
#> 619          159          252          251          134          154
#> 620      6080629      6973369      3314090      1758510      2161889
#> 621         2547          652          671          566          596
#> 622      4709746      4353726      2183389      2362680      2154299
#> 623         2793          962         1022          819          863
#> 624     10932671     11429286      5661677      4334955      4583328
#> 625          139          449          259          263          299
#> 626       605112      1780406      1230169      1391853      1154284
#> 627          522          773          783          695          661
#> 628      2241506      4350274      4301130      3504520      3270090
#> 629           na           na         6609         7170         7028
#> 630           na           na      2644422      2557826      3896053
#> 631          412          381          366          278          278
#> 632      1021236      1128989       865402       494355       679891
#> 633         2373         1603         8017         8406         8266
#> 634     18257036      7259669      9041123      7948554      9000318
#> 635       695203       658946       545575       528454       529911
#> 636    380641511    310314994    232027738    212555991    219098649
#> 637         <NA>         <NA>         <NA>         <NA>         <NA>
#> 638         <NA>         <NA>         <NA>         <NA>         <NA>
#> 639          283          220          106          168          182
#> 640      3434342      3517546      2208874      2300758     17730187
#> 641         <NA>         <NA>         <NA>         <NA>         <NA>
#> 642         <NA>         <NA>         <NA>         <NA>         <NA>
#> 643         4064         2977         1487         1318         1190
#> 644       369943       472724       654732      1404522      1508996
#> 645         <NA>         <NA>         <NA>         <NA>         <NA>
#> 646         <NA>         <NA>         <NA>         <NA>         <NA>
#> 647         <NA>         <NA>         <NA>         <NA>         <NA>
#> 648         3861         3807         4166         3031         3068
#> 649    142588541    142207407    145320674    111891866    111464953
#> 650          911          807         1261         1046         1068
#> 651     12247931      7887901     13543922     11062253     10051838
#> 652        51496        59710        73828        74874        76092
#> 653   1347446221   1445441035   1613873203   1520348729   1639431313
#> 654        79874        80497        95651        97074       100528
#> 655   2000267791   2107845327   2321067884   2347791036   2473297026
#> 656         2921         3220         5749         6436         7333
#> 657     22401115     24811112     41420141     55951110     52852053
#> 658        65283        66929        70541        69856        69946
#> 659    390839206    434041210    453303610    436245175    444688731
#> 660       134692       143255       173102       174313       179164
#> 661   3089310161   3244529348   3599081932   3498897599   3736704346
#> 662         <NA>         <NA>         <NA>         <NA>         <NA>
#> 663        34712        39238        45923        52512        60138
#> 664         <NA>         <NA>         <NA>         <NA>         <NA>
#> 665         <NA>         <NA>         <NA>         <NA>         <NA>
#> 666         <NA>         <NA>         <NA>         <NA>         <NA>
#> 667          390          166          335          324          334
#> 668      3370207      2508549      4064126      3945346      5485460
#> 669         1305         1211         1413         1154         1295
#> 670     25450518     38178527     28913597     23984924     27661242
#> 671         1681         1375         1747         1471         1620
#> 672     28820294     40836114     33029794     27930270     33213723
#> 673         1061         1019         1189         1227         1209
#> 674     99073057     63478986     93960830    111249754     99479956
#> 675         1062         1019         1189         1227         1208
#> 676     99099622     63478986     93806030    111249754     99470670
#> 677          259          233          343          328          363
#> 678      8954378      8671606     11598360     10028662     10182349
#> 679         3397         3194         3472         2958         3083
#> 680    162832254    149192645    158043973    140019035    145009078
#> 681         3642         3411         3810         3283         3447
#> 682    171794118    158052294    169696887    150107509    155228389
#> 683          353          386         2384         4365         5585
#> 684      6666461      7572877     40987750     67063923     91087124
#> 685         5731         5849         9789        14996        17386
#> 686    152936094    159888068    225910571    310925988    363826116
#> 687         6067         6223        12137        19260        22850
#> 688    159706188    167665074    267252410    378563992    454917256
#> 689        17549        17601        15483        15800        16431
#> 690    124254033    126175123     92385788     76977491     85537537
#> 691        18137        17394        13557        14752        16278
#> 692    292516058    275102036    180563544    245469338    271819562
#> 693        35407        34734        28816        30329        32438
#> 694    417201239    401919841    272932822    322522144    357370801
#> 695        81079        79012        80379        82632        82841
#> 696   5092922630   5653308903   6048094744   6272571499   6090956881
#> 697      1117522      1165024      1214198      1266618      1318441
#> 698 102295852573 104523763871 112660234124 112280174808 120924195143
#> 699      1186554      1232418      1283188      1337917      1390185
#> 700 107490722758 110070091378 119378293460 118555814980 127021499050
#> 701        85301        82758        84579        89179        90952
#> 702   5239312019   5780981570   6197185188   6433647180   6285941410
#> 703      1130778      1177542      1227831      1285099      1339990
#> 704 103010448390 105062050880 110211159405 113075954350 121817558951
#> 705      1203733      1248418      1300685      1362431      1419202
#> 706 108235258713 110851130891 116411521752 119534717016 128107878797
#> 707         <NA>         <NA>         <NA>         <NA>         <NA>
#> 708         <NA>         <NA>         <NA>         <NA>         <NA>
#> 709       124159       122325       121868       121413       121027
#> 710   5422695653   5162210439   5199751313   5399408203   5651155619
#> 711       251711       259641       268975       277111       287433
#> 712  29366720870  29102804929  31323465501  31920620704  35929873099
#> 713       118273       116841       116594       115247       114871
#> 714   4372766027   4452573303   4643494371   4765053695   4744896927
#> 715         9234         9026         8984         9378        10238
#> 716    786309904    709865783    772438171    878367503    914698588
#> 717         1412         1429         1576         1645         1727
#> 718     40227039     43681100     41454339     47614742     47614742
#> 719          675          613          408          305          294
#> 720    154061254     29730094     40636741     15980820     59335692
#> 721       129594       127909       127562       126575       127130
#> 722   5353364224   5235850280   5498023622   5702978365   5767803985
#> 723       273489       280942       289361       296641       306817
#> 724  29436052298  29029165088  31025193192  31617050542  35813224733
#> 725          661          648          574          891          812
#> 726     10908849     13752275      9770690     17732268     12146430
#> 727       142354       146657       153041       158451       162773
#> 728   3664140081   3887016123   4120523503   4238762090   4317696992
#> 729        76493        78159        80294        81227        82196
#> 730    626619105    687765451    710693144    715876875    674087716
#> 731        10764        10452        10694        10722        10284
#> 732     72502313     60127416     59782745     56639099     54486533
#> 733        26560        25841        25142        24927        24467
#> 734    307035223    299195565    288093913    266446473    252038957
#> 735       205991       214377       217462       219492       220242
#> 736   3170182572   3286802566   3354920338   3395459141   3419656054
#> 737       203104       199601       197421       193471       187853
#> 738   1633774501   1530567963   1424101301   1360688768   1328830495
#> 739         4605         4551         4589         4376         4173
#> 740     43530532     49603772     44983316     42632177     26877962
#> 741       597020       607537       578443       559052       543664
#> 742   2841892868   3447383715   3756176570   3753886155   3661024251
#> 743       354060       373837       396670       409302       415606
#> 744    931379122    990471085    953763366    969838121    973268345
#> 745       268776       276429       300860       313815       322577
#> 746   1906454123   1924401905   2015785653   2109831789   2243713150
#> 747       123232       125192       128096       129921       130551
#> 748   1141614086   1114874839   1100443703   1114599566   1148636741
#> 749         2785         2556         1780         1554         1218
#> 750     15278312     32243638      9912375      8569066      7038404
#> 751       772784       800742       827407       854592       869952
#> 752   4093522793   4155986095   4079906949   4202838542   4372656640
#> 753       270179       274445       277587       281733       282805
#> 754    879573234    933249435    957529758    994361759   1008538663
#> 755      1097563      1140239      1181085      1229256      1274561
#> 756  29974246305  31170598849  32365845850  32782255282  33936124809
#> 757        89014        86846        85509        86745        87559
#> 758   5609240126   5793905401   6064789890   6143063697   6243232581
#> 759      1085483      1131120      1173878      1224645      1270631
#> 760  71833812960  72872071547  76232196251  77312111330  82472071220
#> 761      1162055      1205712      1247732      1299975      1346846
#> 762  77579772114  78583336335  82307498421  83454480784  88716190108
#> 763         <NA>         <NA>         <NA>         <NA>         <NA>
#> 764         <NA>         <NA>         <NA>         <NA>         <NA>
#> 765         1110         1138         1286         1223         1221
#> 766      3838131      3958433      6102283      5746066      7375683
#> 767          167          207          315          350          325
#> 768       558981       760615      2784425      1819847      1517632
#> 769         1473         1549         1751         1463         1246
#> 770      6784249      8906744     17577473     24957339     19868432
#> 771        20873        18645        16928        17263        17450
#> 772   -125174834    -58885066  -3027437550     -6945948  -1131496127
#> 773        41258        42337        42167        41596        42127
#> 774     11177386     -7585005     11633413      9369062      -338383
#> 775         <NA>         <NA>         <NA>         <NA>         <NA>
#> 776         <NA>         <NA>         <NA>         <NA>         <NA>
#> 777        97681        94079        94707        98590       100515
#> 778   -428792782    -58243685     67580193    222306145     -6162303
#> 779      1148122      1196084      1245323      1302724      1357358
#> 780  31104944198  32149845824  36394743286  35756740066  38178199732
#> 781      1230307      1275092      1325662      1386935      1443719
#> 782  35997433851  32090999701  36461855919  35977390993  38178747121
#> 783         8479         8521         8478         8265         8077
#> 784    426514043    455967020    480149385    465524098    578596566
#> 785        68927        73876        80718        86110        90434
#> 786   1077070011   1123109852   1264238777   1379087716   1450959673
#> 787        76849        81792        88639        93858        98026
#> 788   1481865442   1577519709   1741818605   1842255420   2025843461
#> 789        98732        95358        95954        99869       101867
#> 790   -850626452   -515367278   -399397679   -243006999   -577728099
#> 791      1158839      1206884      1257019      1315191      1370583
#> 792  30043500694  31196391143  32859819025  34455983414  36787119596
#> 793      1241983      1287315      1338407      1400471      1457966
#> 794  29192874242  30680914128  32460409443  34212976415  36214549493
#> 795         <NA>         <NA>         <NA>         <NA>         <NA>
#> 796         <NA>         <NA>         <NA>         <NA>         <NA>
#> 797        80383       127597       156140       164822       162486
#> 798    171208258    401539484    803049316    875939564    849617285
#> 799       138928       155773       115179       103676        96345
#> 800    837460025   1162014622   1040120381    999378519    961174770
#> 801         <NA>         <NA>         <NA>         <NA>         <NA>
#> 802         <NA>         <NA>         <NA>         <NA>         <NA>
#> 803           na           na           na           na           na
#> 804           na           na           na           na           na
#> 805           na           na           na           na           na
#> 806           na           na           na           na           na
#> 807         <NA>         <NA>         <NA>         <NA>         <NA>
#> 808         <NA>         <NA>         <NA>         <NA>         <NA>
#> 809           na           na           na           na           na
#> 810           na           na           na           na           na
#> 811         <NA>         <NA>         <NA>         <NA>         <NA>
#> 812         <NA>         <NA>         <NA>         <NA>         <NA>
#> 813           na           na           na           na           na
#> 814           na           na           na           na           na
#> 815           na           na           na           na           na
#> 816           na           na           na           na           na
#> 817         <NA>         <NA>         <NA>         <NA>         <NA>
#> 818         <NA>         <NA>         <NA>         <NA>         <NA>
#> 819        19907        19972        19766        19691        19840
#> 820    627760442   3123395419   3181315481    636366922    609636681
#> 821        19381        18896        18189        17571        17291
#> 822    743523302    747042935    730696795    727622988    719370377
#> 823        73291        73555        73395        72207        70254
#> 824   4157986821   4192053344   4237516973   4178101562   4175418225
#> 825         1275         1247         1142         1268         1335
#> 826     61459120     55356619     53377545     54449576     44789115
#> 827         1667         1660         1822         2502         2649
#> 828     62067645     69149730     61599834     79696913     79420287
#> 829         4340         4032         3603         3464         3360
#> 830    208650308    213626132    184110327    172584494    165918822
#> 831          202          175          116           80           61
#> 832     10396937     10768217      7334830      5305589      2588653
#> 833        80775        80669        80078        79521        77659
#> 834   4500560831   4540954042   4543939509   4490138134   4468135102
#> 835        23948        24156        23499        23049        22253
#> 836    664301283    668191705    682642505    659312327    636950700
#> 837         2169         2116         1487         1195         1214
#> 838     26267776     26731071     21565577     16976905     18106013
#> 839        81999        75422        64677        56271        52013
#> 840   1100198327   1119436456   1091737440   1011718256    923007823
#> 841          500          409          417          359          355
#> 842     10974970      8179352     13263935      8595985      8005373
#> 843        15726        14891        13519        11711        10415
#> 844    362146145    441729617    438548620    366055744    355213305
#>           2018_19       2019_20       2020_21       2021_22       2022_23
#> 1        15571381      15842477      16043882      16160962      16108843
#> 2        11478095      11805093      12160576      12114579      12647729
#> 3         4093286       4037384       3883306       4046383       3461114
#> 4         7981631       8087960       8147162       8181677       8124272
#> 5         7586313       7749482       7890161       7971593       7976058
#> 6            3437          5035          6559          7692          8513
#> 7        15297443      15568020      15821815      15953707      15865254
#> 8          273938        274457        222067        207255        243589
#> 9            <NA>          <NA>          <NA>          <NA>          <NA>
#> 10           <NA>          <NA>          <NA>          <NA>          <NA>
#> 11        4893619       4950255       4976299       4984485       4950907
#> 12        3991700       4053776       4093123       4127511       4117565
#> 13        3088632       3161711       3236351       3277830       3273490
#> 14        1632431       1673115       1718405       1744280       1758137
#> 15        1041042       1064044       1086490       1100649       1095203
#> 16         318671        328176        335357        338001        332312
#> 17         293915        302674        307604        310376        308828
#> 18         139137        139051        138763        137483        134717
#> 19             na            na            na            na            na
#> 20         171089        169675        151490        140347        137684
#> 21           1145             0             0             0             0
#> 22           <NA>          <NA>          <NA>          <NA>          <NA>
#> 23           <NA>          <NA>          <NA>          <NA>          <NA>
#> 24       10360103      10256310      10235657      10231960      10120508
#> 25        5039615       5468059       5717234       5850835       5917039
#> 26         171663        118108         90991         78167         71296
#> 27             na            na            na            na            na
#> 28           <NA>          <NA>          <NA>          <NA>          <NA>
#> 29           <NA>          <NA>          <NA>          <NA>          <NA>
#> 30         244840        253078        281879        283157        235291
#> 31        1882314       1885044       1871115       1893844       1916851
#> 32        1725805       1741550       1711044       1701808       1737064
#> 33        1739539       1774909       1788350       1790555       1801180
#> 34        1645057       1703646       1742855       1757295       1745985
#> 35        1460947       1489352       1530607       1568099       1584138
#> 36        1507997       1512320       1490955       1457143       1404409
#> 37        1347307       1371575       1416306       1443913       1419609
#> 38        1300778       1307696       1304071       1285892       1243727
#> 39        1044542       1076042       1109932       1129276       1126322
#> 40         689105        710051        739097        762393        775026
#> 41         435585        451785        469041        467606        472334
#> 42         547565        565429        588630        619981        646907
#> 43           <NA>          <NA>          <NA>          <NA>          <NA>
#> 44           <NA>          <NA>          <NA>          <NA>          <NA>
#> 45       12571944      12910768      13523950      13382440      13646896
#> 46   221972375771  232403153204  245395029093  274974351679  283350685187
#> 47          39411         40248         36225         32016         31457
#> 48       41816563      44602609      39260051      33416925      33921655
#> 49       10558410      10795197      11295965      11314773      11353402
#> 50    17263447291   17945016256   19573532365   21134707511   21654390846
#> 51         373471        449978        551628        660279        768537
#> 52      474050718     556504835     731577802     892040779    1013113323
#> 53       10549661      10791466      11289014      11306672      11351164
#> 54    17714892003   18479991287   20281467725   22001635385   22650228983
#> 55       11478095      11805093      12160576      12114579      12647729
#> 56   224850229334  235882931406  248482410562  276775836886  298010985918
#> 57         874302        909731       1063475        999583       1066821
#> 58     9122427481    9354941971   11345507048   10957611671   12042657337
#> 59       11246612      11583292      11905916      11881461      12420445
#> 60   215727801853  226527989435  237136903514  265818225215  285968328581
#> 61         617451        689639       1075270       1203736        934315
#> 62     7571025036    7634527367   13007427237   18798287453   12229634530
#> 63             na            na            na            na            na
#> 64             na            na            na            na            na
#> 65         831627       1052684       1144035       1184594       1167621
#> 66     3294079629    3660680383    4191369235    4695484151    4729554556
#> 67          12542         14752         12718         10834          9467
#> 68       67665869      76221054      61756446      56121488      51343558
#> 69          26390         18190         16218         14682         13106
#> 70       53785969      49160106      43038571      40083905      35693175
#> 71          17376         32007         40178         47273         52919
#> 72       43203003      58949295      76534282     102186031     130580056
#> 73              7            10            14            12            11
#> 74          17856         27305         20233         25250         14723
#> 75             na          3169          7707         11632         16446
#> 76             na       5103822      13984149      21458693      32287896
#> 77             na             1             2             3            10
#> 78             na          1456          1568         10854         32405
#> 79            638          1317          2245          3530          5150
#> 80         894197       1692427       3081486       5420953       9080790
#> 81             36            78           110           162           226
#> 82          53127         90303        146586        218050        348319
#> 83           <NA>          <NA>          <NA>          <NA>          <NA>
#> 84           <NA>          <NA>          <NA>          <NA>          <NA>
#> 85       12087597      12308793      12453213      12809967      12843712
#> 86   757860781830  787394496782  825857417011  893361347705  945449574030
#> 87       11668630      11957764      12113283      12469992      12565117
#> 88   196462184540  207970758357  212582502052  230702617179  249972463794
#> 89        2782183       4107744       4148536       3518990       4298019
#> 90    10126833710   14985863072   16006933182    9800458437   15706993595
#> 91         174219        214089        205260        141622        144817
#> 92     2564268705    2732565748    3221974000    2130718593    2184410636
#> 93           7000          2119          5270          4932          3754
#> 94        3047294       2359820       2238725       2060009       1906947
#> 95          32433           548           420           297           299
#> 96     1347068231      20800425      15143407       9797493      10952540
#> 97            157            88             5             3             6
#> 98        4658775        560510         52310         51913        106426
#> 99         127042          1741          1641          1875          2058
#> 100    1068387834      15248274      12175379      11712491      10955061
#> 101           598            28             4            27            19
#> 102       3181125        367130           859        154799         92314
#> 103            55             4             6             7             6
#> 104       4964979         56871        147469         25838         90905
#> 105           281             3             8             1             1
#> 106       2450025          7276         64308         33954          2312
#> 107         94824        278235        267897        290427        300206
#> 108    1044714628    3546212823    3911941025    3018486149    3185746043
#> 109             1             1             4             5             4
#> 110          2487          2943          4222         56683          9063
#> 111        255391        280648        269985        292642        302599
#> 112    3475428084    3583256252    3939528979    3040319320    3207954664
#> 113       1028321       1817213       1917047       1347252       1002634
#> 114    6788164111   12255249265   22502795242   10531437992    8204154908
#> 115        709739        726440        757704        721535        705020
#> 116    8658071145    9569895387   11323095231    9925276155   10347140516
#> 117         90428         69424         52988         43629         36326
#> 118    1310344502    1062952862     834644772     745682090     616892715
#> 119        221222        212678        208123        205816        203074
#> 120    7544094094    7517659651    7549017142    7952200110    8098989955
#> 121          4236          5061          5323          5070          3666
#> 122      86195214      82574826      86756682      94265935      78602629
#> 123           807           644           441           331           355
#> 124       4535454       7365177       3981533       3181515       3699698
#> 125          1171          2406           820           776          1113
#> 126      40939903      38376205      16685198      22491003      21445254
#> 127         60162        125662         93536         99174         98234
#> 128    1610325116    3043499318    2662467525    2488757916    2769936824
#> 129          5274           128           102            71            63
#> 130     223379076       3352732       4205515       2666491       2924257
#> 131         58049          7698          1963          1396          1454
#> 132    1534464443      46557091      31266022      19685906      23822477
#> 133        123485        133488         95601        100641         99751
#> 134    3368168635    3093409141    2697939062    2511110313    2796683558
#> 135          6966         17631         25088         23748         26133
#> 136     168239947     420811012     841755290     970738874    1072425502
#> 137          1733            56            50            29            27
#> 138      70278713       1843593       1087169        416765        871030
#> 139          9286          6829          1021           573           502
#> 140     254510985     278685712      33061134      19182661      14547897
#> 141         17985         24516         26159         24350         26662
#> 142     493029645     701340317     875903593     990338300    1087844429
#> 143         15879         14792         14522         15008         14075
#> 144     916689160     884080810     987172969    1044256308    1012676426
#> 145          <NA>          <NA>          <NA>          <NA>          <NA>
#> 146       8651531       8248972       8090592       7974857      10217120
#> 147   10122326802    8255499655    4640134490    3026233218   12908190137
#> 148        583169        461154        366508        322464       1519031
#> 149      93940571      90944562      63931187      75191337     255167910
#> 150       1007641       1170562       1144832       1235152       1315654
#> 151    1286538439    1672743378    1329741186    1675854162    1691150133
#> 152       2960871       2786610       2952778       2841628       3045331
#> 153   28718919559   25614488881   25282294453   34660108128   32089096504
#> 154       2953597       2775982       2937067       2828037       3018598
#> 155   11893271832   10536327227   10084464903   13884229317   12730008904
#> 156         48915         62716        108393        135657         97433
#> 157       7930434      11810682      17654940      23817294      19023011
#> 158        180718        179277        251515        176287        166897
#> 159     174758586     195888518     238534006     200728110     174597057
#> 160         13237         14898         16991         21600         19740
#> 161     164567974     132775356     206884668     253983490     162319533
#> 162         87523         92789        100332        107843        111127
#> 163    4632615277    5499785682    6094680486    7041265163    5766547449
#> 164        119879        126420        132378        152370        153976
#> 165    5018281834    5684176799    6329185640    7357425382    5978255576
#> 166           603           584           453           170           256
#> 167       4737195       2314547       2796920       1811627       2687562
#> 168          1149          1343          1440          1338          1289
#> 169     113388710     120449959     186619544     199928929     134796415
#> 170       5492794       5633590       5975054       6159445       5848729
#> 171  139618332403  143229816158  184392611839  209992529086  189512645491
#> 172        154403        131291        126658        108218        124851
#> 173     938736017     838450691     860013013     865739634    1035559252
#> 174         10034         11932         12212         13696          8184
#> 175      61847632      67234978      66398397      79071910      62566226
#> 176      15348380      15609454      15813209      15936026      15935249
#> 177 1000898846004 1039810182585 1128890927242 1213696334622 1254826444947
#> 178          <NA>          <NA>          <NA>          <NA>          <NA>
#> 179          <NA>          <NA>          <NA>          <NA>          <NA>
#> 180       3188372       3113283       2958281       3042693       3413039
#> 181    5231741986    5051500191    5149714211    5456921668    6922756680
#> 182        339609        332359        321287        323696        340218
#> 183    2993772837    2835311675    2659122003    2843821784    3166194072
#> 184             4             5            11             6             2
#> 185         33543         87732        134066         30231         19619
#> 186          4619          3514          2856          2556          2451
#> 187      10165571       8146718       6539411       7043491       6837368
#> 188       3532605       3449161       3282435       3368951       3755710
#> 189    8235714297    7895046316    7815509691    8307817174   10095807739
#> 190       1432739       1340160       1180940       1294807       1539048
#> 191    2054051925    1885915692    1830542675    1885895384    2524077744
#> 192       2265672       2338945       2422794       2499159       2605589
#> 193     694555853     741100017     798638655     862528569     957942973
#> 194       3062337       3073014       3046225       3037306       3157162
#> 195     717054311     727904930     744180046     776421640     876341214
#> 196        426624        453292        448959        460365        515426
#> 197      88785467      99206602     104286515     112897457     141825089
#> 198        529968        538212        559050        578301        641093
#> 199     159110175     167355256     184370297     203587530     246033092
#> 200         10694          7204          5648          4724          4618
#> 201       4404252       2385449       1815330       1590324       1689843
#> 202       6295295       6410667       6482676       6579855       6923888
#> 203    1663910058    1737952254    1833290843    1957025520    2223832211
#> 204        420226        429665        449155        476851        757337
#> 205     864006194     838195025     926729371    1004734067    1289568907
#> 206         93383         96807        106600        128323        158627
#> 207     238149512     236466026     274437567     328690329     387683552
#> 208         21689         25115         29154          4591          8282
#> 209      31536205      35449962      44308008      10224167      13934925
#> 210          2960          2136          1816          1505          1511
#> 211       4847596       3256485       3122220       3017535       2362687
#> 212        538258        553723        586725        611270        925757
#> 213    1138539507    1113367498    1248597166    1346666098    1693550071
#> 214       7522533       8272430       8503984       8722380       8841886
#> 215    8408561593    9816265109   11305431093   11976656413   11734030852
#> 216       9189048       9716126       9976657      10108685      10321491
#> 217   21500777380   22448546869   24033371468   25474060589   28271298617
#> 218        283779        290509        288174        282660        274585
#> 219     119604642     115641798     111937210     109805771     106983429
#> 220        191915        169792        146376        128483        145342
#> 221     679049538     588441696     479627794     462347142     678652287
#> 222        308352        315390        314784        346003        345595
#> 223     972906380     857312377     800609604     847845485    1004386423
#> 224       4325855       4456992       4319794       4357764       4480670
#> 225    4069647498    4110776506    4525240016    4691517529    9102941477
#> 226            na            na            na            na            na
#> 227            na            na            na            na            na
#> 228        265586        220826        209707        213234        302195
#> 229     436077270     406018757     411436343     513441741     713871201
#> 230         20399         16634         14341         12727         13076
#> 231      25617245      21811500      19643971      21808377      23658299
#> 232       6098748       6076251       6005558       5965337       6067228
#> 233    2073855990    2064378003    2075706377    2143428223    2247169683
#> 234       1117337       1158031       1230099       1289359       1287578
#> 235    8338852764    9127598531   11828042280   14452183011   14514188635
#> 236      11243927      11636389      11892025      12019520      12261158
#> 237   38216390077   39740527873   44285619738   48716437943   56663149885
#> 238          <NA>          <NA>          <NA>          <NA>          <NA>
#> 239          <NA>          <NA>          <NA>          <NA>          <NA>
#> 240      15355919      15616330      15819749      15943174      15941719
#> 241  962682455927 1000069637009 1084605307504 1164979896679 1198163292132
#> 242          <NA>          <NA>          <NA>          <NA>          <NA>
#> 243          <NA>          <NA>          <NA>          <NA>          <NA>
#> 244         40294         43820         49179         44261         37065
#> 245    5099240485   13725257860    6716383495   14760128612    5982189217
#> 246        168706        173047        172426        150380        135118
#> 247    7047902764    7679191176    7586438023    7264231340    6525297051
#> 248        200869        208226        212127        185837        164994
#> 249   12147143249   21404449036   14302821518   22024359952   12507486268
#> 250         18225         19334         28445         27035         19508
#> 251     568642065     603627059    1126785978    1531233954     998317513
#> 252         73849         79562         88301         75981         66761
#> 253    1062375963    1133632508    1504590896    1485119166    1232507046
#> 254         90647         97332        114394        100632         84766
#> 255    1631018028    1737259567    2631376874    3016353120    2230824559
#> 256          <NA>          <NA>          <NA>          <NA>          <NA>
#> 257          <NA>          <NA>          <NA>          <NA>          <NA>
#> 258      15317873      15572824      15768666      15897306      15903065
#> 259  961049115147  998329457383 1081968833404 1161957047466 1195924724265
#> 260          <NA>          <NA>          <NA>          <NA>          <NA>
#> 261      15143702      15396358      15619119      15754592      15758844
#> 262  964349274005 1002108767521 1085787005065 1164991618837 1199432739600
#> 263          <NA>          <NA>          <NA>          <NA>          <NA>
#> 264          <NA>          <NA>          <NA>          <NA>          <NA>
#> 265        662476        676261        678988        637027        648551
#> 266     777890614     804519183     864639172     753741147     780205502
#> 267        187712        173007        159368        151494        157407
#> 268     619815499     605852166     567899093     590262728     642274455
#> 269        517012        502162        501930        492923        484182
#> 270     231426669     244598911     259892740     256666619     245516193
#> 271          <NA>          <NA>          <NA>          <NA>          <NA>
#> 272          <NA>          <NA>          <NA>          <NA>          <NA>
#> 273           565           536           527           518           617
#> 274       1724915       1755882       1370462       2045368       2021078
#> 275       6998951       7028336       6943769       6667097       6480941
#> 276    2149142472    2154592966    2799061357    2686001725    2561944037
#> 277      10277316      10468674      10466070      10388070            na
#> 278    7670988611    7815609546    8016632779   12150893216            na
#> 279        153452        130673        126068        107614        124487
#> 280     139680724     124612561     128171093     128793719     154791902
#> 281          8975         10451         10623         11468          6990
#> 282       8210845       8722461       8550828       9632410       7850623
#> 283         63816         55167         66575         77837         70075
#> 284     190741193     159161071     204190339     319580499     290445722
#> 285        486823        769965       1367201        716774        543748
#> 286     342524257     610634483    1856777013     647507439     527614166
#> 287        357681        406226        352869        342512        362806
#> 288    1244013813    1153873844    1165571817     898446560    1021723085
#> 289       1060653       1147378       1299725       1231421       1339947
#> 290     467569875     489121791     720364320     752973986     782114247
#> 291          2662          5944          4489          5526          4676
#> 292      15809448      21907492      19789871      24193654      18842730
#> 293          <NA>          <NA>          <NA>          <NA>          <NA>
#> 294          <NA>          <NA>          <NA>          <NA>          <NA>
#> 295      11918415      12233048      12387991      12709677      12797445
#> 296  199430843024  211133051061  215887730605  233666833424  253049496542
#> 297       1454439       1423333       1443519       1474382       1457935
#> 298   23577755683   22541373874   23015637095   25342575268   27743683994
#> 299          <NA>          <NA>          <NA>          <NA>          <NA>
#> 300          <NA>          <NA>          <NA>          <NA>          <NA>
#> 301       8603520       8673472       8889406       9053073       9069741
#> 302       7177364       7214438       7337377       7437940       7397967
#> 303    4618216776    4587664753    4755669668    4832007045    4859642572
#> 304        730384        712060        708787        702570        729412
#> 305     233404033     234964344     232665753     226436975     225627868
#> 306       2067254       2141135       2392533       2640425       2807147
#> 307     832634526     865597376    1007863804    1172081011    1254136499
#> 308       6986981       6980309       6970657       6887154       6776073
#> 309    4018986283    3957031721    3980471617    3886363010    3831133941
#> 310          <NA>          <NA>          <NA>          <NA>          <NA>
#> 311          <NA>          <NA>          <NA>          <NA>          <NA>
#> 312       2045310       2166483       2435253       2323938       3401412
#> 313   21345935875   23002793304   31895514650   38656380025   32882855269
#> 314      12165629      12247496      12199862      12538239      11655044
#> 315  -35866049213  -35649421937  -36861365456  -40279219820  -34363815134
#> 316      14210939      14413979      14635115      14862177      15056456
#> 317  -14520113338  -12646628633   -4965850807   -1622839795   -1480959866
#> 318          <NA>          <NA>          <NA>          <NA>          <NA>
#> 319          <NA>          <NA>          <NA>          <NA>          <NA>
#> 320         26657         27634         30845         34111         30741
#> 321     360923434     430815519    1046383365     481944083     491043627
#> 322        192095        197700        222622        227737        187917
#> 323    1377573883    1477007699    1712932300    1982389917    1945128439
#> 324            71           308           371           435           429
#> 325        659970       3795672       4300486       5251949       5892659
#> 326        218823        225642        253838        262283        219087
#> 327    1739157287    1911618890    2763616151    2469585949    2442064725
#> 328         23500         19197         15217         13040         12279
#> 329     289279237     218281955     241867210     157377585     139964004
#> 330          9963          7945          6454          5473          4882
#> 331     265809206     212956334     185713284     159218305     146550165
#> 332          3668          3125          2350          2010          1755
#> 333      81922977      81721828      59163169      44022048      50830719
#> 334        103324         92739         54892         46875        107115
#> 335    2194377860    2084523950    1900006288    1510437131    3115770672
#> 336          <NA>          <NA>          <NA>          <NA>          <NA>
#> 337          <NA>          <NA>          <NA>          <NA>          <NA>
#> 338        662100        706857        742902        778879        800114
#> 339   14652201467   15836351360   16761927608   17607927561   18539133466
#> 340        287397        283550        255640        263989        266974
#> 341    4505435240    4381512149    3801217378    3977501059    5278735523
#> 342        935667        976347        985789       1030986       1054662
#> 343   19142291948   20202458299   20548456286   21570735343   22540718715
#> 344       1541498       1509855       1541614       1595375       1516964
#> 345   10752767605   10364420960   10639676768   11510430447   10723861453
#> 346        263932        258487        266926        270549        265689
#> 347    4480222830    4648850574    5069990866    5421037901    5732246811
#> 348         13445         11689          9339          8889          8751
#> 349     616028345     655555540     516284062     461447782     465934012
#> 350         90650        106897        111075        100979        102642
#> 351     528832589     653722077     550653811     544344180     548821296
#> 352       1398204       1292260       1145450       1015085       1145221
#> 353   13237951782   10536309797    8139662618    6524991660   10706386456
#> 354        158673        156549        154855        152425        148347
#> 355    1352694818    1382346289    1366890455    1394711410    1472884863
#> 356          <NA>          <NA>          <NA>          <NA>          <NA>
#> 357          <NA>          <NA>          <NA>          <NA>          <NA>
#> 358          <NA>          <NA>          <NA>          <NA>          <NA>
#> 359         78079         71317         82992         87403         71768
#> 360    3227930820    2717677175    3512526035    4947404270    4113090427
#> 361         99271        101798         87947         79482         86382
#> 362   -2795744391   -3462557989   -3094229393   -2399674059   -3029641664
#> 363        177350        173115        170939        166885        158150
#> 364     432186429    -744880814     418296642    2547730211    1083448763
#> 365         44227         41639         45732         55951         54155
#> 366    2634191592    2225805636    2220092250    3119308278    3121610817
#> 367          8073          7964          8048          7932          8276
#> 368    -369537852    -447468290    -505780608    -508457883    -570318322
#> 369         52300         49603         53780         63883         62431
#> 370    2264653740    1778337346    1714311642    2610850395    2551292495
#> 371          4615          4482          4030          3496          3100
#> 372      78041733      75895027      70872640      62749758      74130393
#> 373          1737          3715          3515          3278          2967
#> 374      52637873     142986647     149440685     141485614     134345177
#> 375           485           418           402           355           372
#> 376       9078130      10044838      11292323      13669193      12880771
#> 377           370           434           442           474           442
#> 378       3836117       5314710       5105741       5514986       5328844
#> 379         28160         21657         20748         19374         17774
#> 380     258931589     196692271     195589670     187774243     185076559
#> 381         30752         26224         25107         23481         21555
#> 382     324483709     355038466     361428419     348444036     337631351
#> 383        224700        218201        220436        225607        215638
#> 384    2294314727     602523039    1700307225    4747386812    3222979514
#> 385          <NA>          <NA>          <NA>          <NA>          <NA>
#> 386          <NA>          <NA>          <NA>          <NA>          <NA>
#> 387        361673        342494        340473        318656        293095
#> 388   13482819461   13117609967   14578386289   14439550558   13911306474
#> 389         73216         73840         63688         62754         57762
#> 390    -849762611    -937195633    -996677743    -902699871    -892868793
#> 391        434889        416334        404161        381410        350857
#> 392   12633056850   12180414334   13581708546   13536850687   13018437681
#> 393       1309224       1334183       1446893       1538575       1513978
#> 394   30689563531   30020269249   35144473130   35454682427   34868249271
#> 395         75859         80044         85451         95577         91199
#> 396   -1414221335   -1583331620   -1570040410   -1849854272   -2065766824
#> 397       1385083       1414227       1532344       1634152       1605177
#> 398   29275342196   28436937629   33574432720   33604828155   32802482447
#> 399        833200        898385       1038368       1177970       1186615
#> 400   23530628986   24456618505   27474663458   32965953895   35354119176
#> 401           577           633           488           396           353
#> 402       3130394       3181088       3195860       6103830       2259106
#> 403          6398          4561          4717          4243          3964
#> 404      70670684      72952630      76476428      72424160      68685638
#> 405          1402           865           921           848           745
#> 406      17343040      17945711      19727839      13195319      13754006
#> 407           781           837           852           845           831
#> 408       8812313       9980790       9397683      14121531      21316262
#> 409        248594        221988        221320        214650        201295
#> 410    1250266160    1052216372     964453467     945153804     982796164
#> 411        257175        228251        227810        220586        206835
#> 412    1347092197    1153095503    1070055417    1044894814    1086552070
#> 413       1933594       1958825       2082296       2183429       2122433
#> 414   64088805441   63917693877   73557553447   79056634093   80086228128
#> 415          <NA>          <NA>          <NA>          <NA>          <NA>
#> 416        533532        514284        502980        480441        443458
#> 417   13065243279   11435533520   14000005188   16084580898   14101886444
#> 418       1581238       1622164       1758576       1884193       1848417
#> 419   55070624922   54671893480   62763407820   69181632445   70707894118
#> 420       2025409       2050302       2173919       2275920       2208734
#> 421   68135868201   66107427000   76763413008   85266213343   84809780562
#> 422          5184          5053          4498          3882          3444
#> 423      81172127      79076115      74068500      68853588      76389499
#> 424        286318        253142        251553        242863        227262
#> 425    1671575906    1508133969    1431483836    1393338850    1424183421
#> 426       2030031       2054017       2177453       2279463       2212416
#> 427   66383120168   64520216916   75257860672   83804020905   83309207642
#> 428          <NA>          <NA>          <NA>          <NA>          <NA>
#> 429        244475        238727        250774        241648        216437
#> 430    9071349076    8599746332   10243120873   11123030447   11174562615
#> 431        289566        292425        305812        304731        294670
#> 432   15968829318   16071542997   19092126693   20390743644   20447551811
#> 433          <NA>          <NA>          <NA>          <NA>          <NA>
#> 434          <NA>          <NA>          <NA>          <NA>          <NA>
#> 435          1123          1232          1370          1236          1198
#> 436       1680715       1928354       2019464       4886449       3560641
#> 437        869458        938356       1101015       1229229       1246885
#> 438    7247545773    7427275426    8045235754    9613254061   10273269848
#> 439         55811         73816        119924        140718        125438
#> 440      28123270      27880776      41625517      45875288      45316760
#> 441           784          1238           918           866           752
#> 442       1236322       1741838       1427524       1001475       1045791
#> 443          3980          4517          3589          4118          3348
#> 444      30546796      30336655      39665462      38426600      28531607
#> 445          2712          2957          2973          3177          3233
#> 446       6937357       7607732       7637269      10207836      11266075
#> 447         15735         15555         15095         13961         10660
#> 448     117579562     116908426     113468808      98749909      72489617
#> 449          <NA>          <NA>          <NA>          <NA>          <NA>
#> 450          <NA>          <NA>          <NA>          <NA>          <NA>
#> 451          3519          2882          2641          3635          3660
#> 452      23937317      20474669      13661476      13259918      11777655
#> 453          1522          1345          1342          1396          1454
#> 454       3037717       2904911       2450379       4606087       3136843
#> 455         68107         64222         75233         80110         57697
#> 456     493640204     562702269     616817171     679106257     578276754
#> 457        201328        193978        206826        220589        203625
#> 458    4375894550    4501966476    4922679354    5447661344    5233935546
#> 459          <NA>          <NA>          <NA>          <NA>          <NA>
#> 460          <NA>          <NA>          <NA>          <NA>          <NA>
#> 461         80753         81659         86799         83595         78897
#> 462   -1113172774   -1301650277    -802533518    -488244196   -1027858991
#> 463       1455966       1515646       1598294       1612599       1617354
#> 464   38859600770   39082574270   48092658163   45547062025   48097585121
#> 465        887075       1018808       1122606       1138634       1167766
#> 466   33842596716   37591765805   47770858599   45989163279   48163417196
#> 467       1384224       1512376       1639368       1647177       1643663
#> 468   54969536508   58334954080   71226622647   72201211039   74601459354
#> 469          2885          2946          3177          3722          3529
#> 470      24934647      23070853      21855303      21652517      19428801
#> 471          2190          2482          2987          3046          2821
#> 472       9972733      16562786      23478327       3545268       3526653
#> 473           959           868           441           619           973
#> 474      31580664      28310665      17716884      21709254      42851129
#> 475          9298         10292         12742         13660         11440
#> 476      54287193      64759676      72697215      75545056      65384707
#> 477          <NA>          <NA>          <NA>          <NA>          <NA>
#> 478          <NA>          <NA>          <NA>          <NA>          <NA>
#> 479         29752         28460         26926         26259         23863
#> 480     566955839     597751723     581817841     595844844     574625706
#> 481        174270        184440        193512        201675        195989
#> 482    2679773901    3013534965    3152844927    3449191383    3375303304
#> 483         26227         25634         25802         25921         25319
#> 484     962744327    1066706208    1095774148    1117209614    1147700101
#> 485        179185        188863        196307        203947        196416
#> 486    2284447849    2544588313    2639035267    2928944405    2802278273
#> 487          <NA>          <NA>          <NA>          <NA>          <NA>
#> 488          <NA>          <NA>          <NA>          <NA>          <NA>
#> 489         16954         13417         13234         15713         13486
#> 490    1779555052    1366960022    1344948026    1786644884    1650177309
#> 491           349           349           276           251           293
#> 492      32404028      28511959      28093507      25413851      26014651
#> 493         17612         17948         15912         12273         12529
#> 494    1596602046    1618229545    1608901535    1199480640    1250333320
#> 495         12484          9272          9606         12987         10611
#> 496    -914890364    -651449068    -663851442   -1141808878   -1004738910
#> 497         13082         14714         13142          9126          9684
#> 498     764341386     931230550     955898458     580058485     630909572
#> 499         25566         23986         22748         22113         20295
#> 500    -150548978     279781482     292047016    -561750393    -373829338
#> 501          <NA>          <NA>          <NA>          <NA>          <NA>
#> 502          <NA>          <NA>          <NA>          <NA>          <NA>
#> 503        789584        885543       1326455       1475992       1128827
#> 504   21767661363   22485890515   38689889610   54198870451   37759697803
#> 505       1005776       1131147       1631576       1813305       1466552
#> 506   49625408864   51420514296   83047324962  117718595280   84262124996
#> 507        895687        966026       1048093       1174614       1169962
#> 508   29378479768   32754658223   34059197723   34500005940   35179346262
#> 509          2240          2797          4619          5710          4777
#> 510     175358799     217393302     364326782     488853480     426260008
#> 511          <NA>          <NA>          <NA>          <NA>          <NA>
#> 512          <NA>          <NA>          <NA>          <NA>          <NA>
#> 513          1298           800           490           548           583
#> 514      33752811      31512129      29904617      48506504      13363018
#> 515           248            62            66            66            51
#> 516       4205788       2663428       3231132       2796569       2270266
#> 517          <NA>          <NA>          <NA>          <NA>          <NA>
#> 518          <NA>          <NA>          <NA>          <NA>          <NA>
#> 519        834111        866744       1010161       1193194       1204190
#> 520    7521622065    8025158682    8390528595    8782379898    8644676059
#> 521         34757         35177         26304         25192         26271
#> 522    2258819640    2343562505    2043533437    2000422160    2011587558
#> 523         60733         64398         66122         66422         65951
#> 524     755746978     860525543     888201879     936896453     971061135
#> 525         38765         33093         32096         30818         30444
#> 526     426170122     401826954     393713634     396340530     413849735
#> 527         46554         50754         50433         49759         47772
#> 528     286451622     349310649     346813166     385329220     372644773
#> 529        687952        721850        872515       1055194       1063463
#> 530    3088927458    3367591465    3946712399    4399485848    4056928942
#> 531         10320          8110         10455         18889         20677
#> 532       1953881       2984701       2341385       3891298       3788900
#> 533          9173          8326          6062          6376          6152
#> 534     610428356     579035254     464024479     459709875     458434260
#> 535          4795          4824          3066          2960          3058
#> 536     254383134     217593242     170942703     173513660     182901322
#> 537        621280        686560        831692        990080       1024283
#> 538    1255764317    1251703408    1368401870    1422642495    1304464433
#> 539          <NA>          <NA>          <NA>          <NA>          <NA>
#> 540          <NA>          <NA>          <NA>          <NA>          <NA>
#> 541       2335511       2368203       2388065       2370900       2270671
#> 542   50652611304   51646192048   52073838992   52833192422   56103387603
#> 543       1878695       1882013       1872671       1838088       1740960
#> 544   25467845863   22776052907   19108044244   16771184762   23998246472
#> 545       1196083       1231460       1254196       1249355       1208377
#> 546    4285342432    4535683709    4689345892    4654740671    4591416121
#> 547       2342243       2368589       2389366       2371804       2269261
#> 548   24085424640   24467400979   24870476604   25208450396   25876383408
#> 549       2350959       2375696       2396328       2378879       2276226
#> 550   53838612935   51779137595   48667866740   46634375829   54466046001
#> 551        980706       1109882       1275522       1386138       1153490
#> 552    9410539965   10196496452   11370054408   12586860433   12145665536
#> 553          3857          3855          3700          3878          4001
#> 554       1377248       1272939       1127932       1000238       1129248
#> 555  -12596599515  -10321382613   -7960996725   -6386892826  -10553964557
#> 556       2361811       2386676       2407154       2390254       2286739
#> 557   -3186059550    -124886161    3409057683    6199967607    1591700979
#> 558          <NA>          <NA>          <NA>          <NA>          <NA>
#> 559           762           709           676           656           730
#> 560       6873778       6922108       5625028       8021405       7933956
#> 561           417           332           216           202           132
#> 562       6998270       8015192       3237416       2518222       3499010
#> 563        144280        107094        117051        163283        148980
#> 564    1394988416     993973613    1136356928    1274243416    1072554565
#> 565            na            na         37148         33991         37834
#> 566            na            na     105131877     127640301     121340122
#> 567         68541         54001         37148         33991         37834
#> 568     116126183     127226011     105131877     127641954     121340122
#> 569            26            na            na            na            na
#> 570        853199            na            na            na            na
#> 571          5038          7541          9383          8737          8200
#> 572      46246949      78412316     112527387     106975639     118674805
#> 573        149822        211308        212438        313134        185888
#> 574    1006529582    1600005257    1778820114    2105650149    1802698194
#> 575          4449          5503          6813         13517          9654
#> 576      22670976      20374094      29754323      31156220      23100444
#> 577         20531         21392         21635         22460         21164
#> 578    1390352617    1349488821    1457881640    1673832127    1735181218
#> 579          2903          5793          7692          7008          6814
#> 580       2397406       5062220       6742814       5975771       7514559
#> 581       5492794       5633590       5975054       6159445       5848729
#> 582  139618332403  143229816158  184392611839  209992529086  189512645491
#> 583          <NA>          <NA>          <NA>          <NA>          <NA>
#> 584          <NA>          <NA>          <NA>          <NA>          <NA>
#> 585         31361         32572         31687         30441         30103
#> 586      44164233      52957832      51737697      51427761      57188477
#> 587        447114        488898        591114        663660        679004
#> 588    6012109738    6648473158    9216499910   11755583424   11801068319
#> 589           585           900          1213          1170          1660
#> 590       2111652      14234917       8273214       8128295      11028165
#> 591          2123          1836          1592          1561          1440
#> 592      13469939      11822539      14670990       8749617       7135226
#> 593          6114          4865          4665          6614          6362
#> 594      13312918       7645786       9826694      11464288       8844866
#> 595        699733        705775        687904        683426        663223
#> 596    2253578734    2391743111    2526125804    2616065598    2628145083
#> 597       1117321       1157955       1230024       1289298       1287535
#> 598    8338747214    9126877343   11827134309   14451418983   14513410136
#> 599          <NA>          <NA>          <NA>          <NA>          <NA>
#> 600          <NA>          <NA>          <NA>          <NA>          <NA>
#> 601         21448         22863         25570         24901         23919
#> 602      10086524      10843854      12299592      12040271      11601619
#> 603        479078        462509        456382        447919        441873
#> 604     151687445     143601377     141289213     138467881     139607086
#> 605          2886          2609          2202          1915          1905
#> 606       4740011       4598784       3950071       3406685       3562420
#> 607           106           125           182           168           152
#> 608        184694        347788        510273        433520        402367
#> 609          2862          1463          3531          4280          4279
#> 610       6735859       9471170      12104536      15710960      12301963
#> 611           464           477           512           802          1004
#> 612       1116682       1316967       3007418       3303149       3776328
#> 613          2012          2089          2849          2854          1944
#> 614      24104565      26872715      32803227      29624661      19806727
#> 615           383           472           617           778           815
#> 616       4848681       6345202       9317085      11307971      11829804
#> 617            95            67            na            na            na
#> 618        248226        100757            na            na            na
#> 619           159           408            na            na            na
#> 620       1962276       1854494            na            na            na
#> 621          2497           506            na            na            na
#> 622       3169052       5320345            na            na            na
#> 623          2751           981            na            na            na
#> 624       5379554       7275596            na            na            na
#> 625           270           369           337           363           328
#> 626       1629908       2527919       1897682       1769983       1524546
#> 627           536          1001           832           803           647
#> 628       2981447       4023460       4856292       5115321       2777844
#> 629          1141          1505          1830          1990          1473
#> 630       3558624       3352135       3445574       2718579       2291317
#> 631           163           171           187           176           154
#> 632        476771        501416        652941        668171        442406
#> 633          2110          3046          3177          3301          2436
#> 634       8646750      10404930      10820543      10200489       6529808
#> 635        517012        502162        499968        488272        461523
#> 636     231426669     244598911     258425905     253456292     230911416
#> 637          <NA>          <NA>          <NA>          <NA>          <NA>
#> 638          <NA>          <NA>          <NA>          <NA>          <NA>
#> 639           167           187           172           163           198
#> 640       9986723       3019600       4808731       4240636       5941085
#> 641          <NA>          <NA>          <NA>          <NA>          <NA>
#> 642          <NA>          <NA>          <NA>          <NA>          <NA>
#> 643          1138           841            na            na            na
#> 644       2244414       2860698            na            na            na
#> 645          <NA>          <NA>          <NA>          <NA>          <NA>
#> 646          <NA>          <NA>          <NA>          <NA>          <NA>
#> 647          <NA>          <NA>          <NA>          <NA>          <NA>
#> 648          3540          2898          2691          3671          3683
#> 649     118520488      95253951      72440657      75995224      67807189
#> 650          1542          1379          1395          1441          1484
#> 651      17817437      16239626      17945658      23480154      21744480
#> 652         96417         92055        104916        112205         91423
#> 653    2189701857    2359102531    2645655880    2909731143    2531097814
#> 654        101601         99258         99391        105051        108820
#> 655    2553107085    2534547943    2730869627    3010177832    3225438374
#> 656          7892          8397          9093          9676          9994
#> 657      59076627      54642783      60783282      67208163      73761614
#> 658         68879         67132         68596         71799         72924
#> 659     444175684     448443582     483418228     504512928     538383574
#> 660        201329        193981        206827        220590        203626
#> 661    4375894556    4502057684    4922710322    5447663227    5233942664
#> 662          <NA>          <NA>          <NA>          <NA>          <NA>
#> 663         68742         82153            na            na            na
#> 664          <NA>          <NA>          <NA>          <NA>          <NA>
#> 665          <NA>          <NA>          <NA>          <NA>          <NA>
#> 666          <NA>          <NA>          <NA>          <NA>          <NA>
#> 667           281           303           398           399           337
#> 668       6533736       5506690       7091160       6600684       6598103
#> 669          2267          2551          3072          3040          2849
#> 670     121642621     134637459     109440206      56899413      50732289
#> 671          2547          2849          3480          3441          3187
#> 672     126903714     140840630     118485817      64875722      57787292
#> 673          1263          1102           551           721          1186
#> 674     134359999     133783545      93571193     107016628     170675952
#> 675          1263          1101           552           721          1186
#> 676     134359999     133684569      93671193     107016628     170675952
#> 677           196           256           351           284           286
#> 678       6648230       7304171       8452800       8149379       7339672
#> 679          3765          3583          3782          4352          4296
#> 680     165625634     148554177     145203989     149921755     152164029
#> 681          3961          3834          4126          4633          4580
#> 682     172678059     155788788     153777501     159138774     159535350
#> 683          3365          4135          5402          5588          5148
#> 684      62187423      70645586      95073357      95903643     100082899
#> 685         33755         40119         48491         53700         56490
#> 686     692827136     805458551     964749484    1092821399    1128715890
#> 687         37032         44145         53760         59155         61509
#> 688     754747659     876970091    1062428632    1189920337    1229859104
#> 689         15435         17696         22566         16211         15318
#> 690      67832852     107185128     256407017      88632640     111177935
#> 691         16891        136817        258898         47805         24286
#> 692     285233045    1302298964    5594571332     763237082     364182976
#> 693         32064        154054        280870         63734         39354
#> 694     353065983    1409623078    5851820217     851511925     475378118
#> 695         66128         66448         67055         65921         61763
#> 696    5579070378    5947688425    6708644757    7442603426    6697399076
#> 697       1384534       1431950       1487634       1511308       1511394
#> 698  122963933869  129957967470  150126656416  159686278238  150261179937
#> 699       1439840       1487343       1543740       1566384       1562817
#> 700  128550149016  135915906381  156842393012  167142706058  156952441483
#> 701         70864         72367         76749         73473         68793
#> 702    5722047280    6141189829    7077804988    7642138190    6923196450
#> 703       1423102       1477577       1555574       1569557       1573998
#> 704  124357022237  132464368912  157009182943  161841120729  152125050558
#> 705       1482528       1537906       1618968       1631342       1631698
#> 706  130081473069  138620446075  164095552339  169494071509  159037034370
#> 707          <NA>          <NA>          <NA>          <NA>          <NA>
#> 708          <NA>          <NA>          <NA>          <NA>          <NA>
#> 709        122026        121070        124490        126033        118947
#> 710    5654081664    5441290563    5787618979    6517902146    6391181826
#> 711        295815        311371        346342        348640        333963
#> 712   35440222423   42426904139   54791614423   54922128776   47372881186
#> 713        113912        113818        118804        116820        107194
#> 714    4565799179    4646744309    5337378112    5697817711    5217457325
#> 715         10286         11154         13570         13757         11685
#> 716     803202370     891952981    1324387132    1335976585    1360504741
#> 717          1803          1826          2076          2028          1921
#> 718      49743205      51436458      61343249      65463928      52237720
#> 719           220           193           165           130           115
#> 720      12213681       8628332      13291753       9065631      24414602
#> 721        126221        126991        134615        132735        120915
#> 722    5430958435    5598762080    6736400246    7108323855    6654614388
#> 723        317015        332512        365185        367579        353127
#> 724   35663345652   42269432622   53842833156   54331707068   47109448624
#> 725           835           750           376           411           625
#> 726      17325853      15143360       7244065       7427398      17221099
#> 727        165195        166602        166886        160563        155799
#> 728    4440215009    4168124271    4428802423    4658215718    4812869197
#> 729         81616         84368         91101         88692         83471
#> 730     652716428     647165661     724693153     729857489     728947308
#> 731         10359          9972         10015          9115          8715
#> 732      62335205      49194336      53023848      48656196      53652538
#> 733         24170         22949         21315         19098         19187
#> 734     241068281     218600301     201900810     186557816     196647240
#> 735        221876        221121        226008        217697        211496
#> 736    3465274144    3259657684    3363513959    3271672420    3303451053
#> 737        179878        169232        157516        146693        137528
#> 738    1293947125    1134661493     955160817     880775482    1171048040
#> 739          3966          3588          3172          2934          2804
#> 740      30183708      24005801      20351265      17741727      24509603
#> 741        529544        540743        557379        520714        511966
#> 742    3865084760    5675093160    6491736411    5617218535    5812967242
#> 743        420558        424089        442856        446749        448164
#> 744     992800880     980020527    1075907165    1086742387    1191128375
#> 745        326964        333192        346228        352196        356994
#> 746    2313669281    2341228127    2508778285    2734555722    3071345372
#> 747        134208        136434        140982        140781        138069
#> 748    1198288605    1176500426    1233242105    1367763050    1479700751
#> 749           956           814           677           590           518
#> 750       6084974       4978221       3963873       3843483       3759322
#> 751        882686        894529        930743        940316        943745
#> 752    4510843740    4502727301    4821891428    5192904642    5745933820
#> 753        284219        289919        308604        303565        300985
#> 754     984165620    1043189723    1205376863    1250507081    1281801308
#> 755       1316500       1360964       1423308       1429074       1424181
#> 756   34725807589   35218952720   37599864993   38343172517   38751405982
#> 757         73243         73176         75850         73894         69786
#> 758    6185064600    6769021293    7084136886    7349187713    7186333537
#> 759       1331635       1381848       1454834       1469666       1468884
#> 760   83892306686   91417260086  106608367648  113792089665  101814227012
#> 761       1393849       1443982       1519453       1532359       1527803
#> 762   90152975632   98198373392  113710578388  121151373272  109138727996
#> 763          <NA>          <NA>          <NA>          <NA>          <NA>
#> 764          <NA>          <NA>          <NA>          <NA>          <NA>
#> 765          1098          1145          1303          1214          1106
#> 766       7421626       7629987      13285137       9848393       8615664
#> 767           354           423           578           378           338
#> 768       3966713       2875140       3407460       3184014       2446068
#> 769          1218          1223          1231          1069           986
#> 770      20490583      17862387      17843365      18155461      14207081
#> 771         17895         37551         44167         42751         22110
#> 772    -116040755    -296952644    -401167502    -546886115     -16491647
#> 773         42688         45915         50290         53853        132329
#> 774      13128539     -65594703     -95376125     -85881345    -194507275
#> 775          <NA>          <NA>          <NA>          <NA>          <NA>
#> 776          <NA>          <NA>          <NA>          <NA>          <NA>
#> 777         79362         80338         85433         82241         77540
#> 778    -505262608    -716870826    -133679143     199908656    -347548122
#> 779       1442128       1500270       1580943       1593910       1597528
#> 780   40356192359   40772337643   49951746848   47480431267   50031679468
#> 781       1507754       1566351       1650590       1661815       1661238
#> 782   39858237808   40060088973   44828844646   47692514737   49692068446
#> 783          7979          8344          8668          8457          8161
#> 784     609455338     579599770     668055733     687423973     679886927
#> 785         93588         98643        111138        112998        115651
#> 786    1523730041    1683804766    1928124164    1946542726    2064080833
#> 787        101061        106452        119225        120902        123248
#> 788    2128850904    2262434601    2595846377    2633010958    2742376721
#> 789         80753         81659         86799         83595         78897
#> 790   -1113172774   -1301650277    -802533518    -488244196   -1027858991
#> 791       1455966       1515646       1598294       1612600       1617354
#> 792   38859600770   39082574270   48092658163   45547117421   48097585121
#> 793       1522543       1582597       1668803       1681322       1681884
#> 794   37746427996   37780923993   47290124645   45058817829   47069726130
#> 795          <NA>          <NA>          <NA>          <NA>          <NA>
#> 796          <NA>          <NA>          <NA>          <NA>          <NA>
#> 797        160754        177609        177832        108102         93428
#> 798     943000764    1669155620    2072903586    1371311233    1274629415
#> 799         84596         68882         47784         30990         26877
#> 800    1001289608    1410332848     979619755     400239917     337107825
#> 801          <NA>          <NA>          <NA>          <NA>          <NA>
#> 802          <NA>          <NA>          <NA>          <NA>          <NA>
#> 803            na            na          7840          9959          9952
#> 804            na            na     234276437     271556920     257765786
#> 805            na            na         54239         73750         84867
#> 806            na            na     999310055    1410303243    1762314373
#> 807          <NA>          <NA>          <NA>          <NA>          <NA>
#> 808          <NA>          <NA>          <NA>          <NA>          <NA>
#> 809            na            na          2486            na            na
#> 810            na            na      61180253            na            na
#> 811          <NA>          <NA>          <NA>          <NA>          <NA>
#> 812          <NA>          <NA>          <NA>          <NA>          <NA>
#> 813            na            na            na            na          4950
#> 814            na            na            na            na       4543018
#> 815            na            na            na            na         80573
#> 816            na            na            na            na      79730356
#> 817          <NA>          <NA>          <NA>          <NA>          <NA>
#> 818          <NA>          <NA>          <NA>          <NA>          <NA>
#> 819         20013         22015         22375         22843         21856
#> 820     612828451     592126742     637778299     646439671     574384568
#> 821         16676         17120         17064         16647         15246
#> 822     695692916     635898800     675712993     724170470     615677467
#> 823         67381         69297         66319         61520         53366
#> 824    4045831671    4093925412    4297853670    3974566468    3756105069
#> 825          1650          2388          1823          2268          2137
#> 826      48856904      50617618      52809459      46176623      43775593
#> 827          3434          5641          4747          6062          6034
#> 828      87933573      95804573     113856986     118546022     132482734
#> 829          3613          4453          3813          4099          3661
#> 830     168001105     155602246     172587440     157552716     140888119
#> 831            47            45            46            38            27
#> 832       1909140       1877247       1832606       1767034       1436269
#> 833         76125         81824         76748         73987         65225
#> 834    4352532393    4397827096    4638940161    4298608863    4074687784
#> 835         21083         20535         19690         17209         15092
#> 836     622726134     626174684     643329284     581212498     553919225
#> 837           988           984          2294          2157          2314
#> 838      15783498      17299894      42557417      44511478      50771312
#> 839         49205         51059         53444         55369         53973
#> 840     869451209     849270995     997125436    1125100935    1183627299
#> 841           326           348           346           274           234
#> 842       8882707       6212911      10827589       5124734       4625384
#> 843          9320          8375          7606          6636          6196
#> 844     284393168     290403701     234904544     214360218     218628679
ato_manifest()
#>                                                                                                                                                        url
#> 1 https://data.gov.au/data/dataset/03326c3f-c0d3-4af4-afc7-c6ccc0a02223/resource/f4a2a02f-92ca-49b4-bf4f-990e2226b687/download/ts23individual01byyear.xlsx
#>   title resource_id package_id licence
#> 1  <NA>        <NA>       <NA>    <NA>
#>                                                             sha256 size_bytes
#> 1 043e3fb9d7abd41ebb41ae6b006fbcda51ad95c7dd0287b5484eaea1f2de5658     396061
#>                  retrieved snapshot_date r_version ato_version
#> 1 2026-08-23T17:36:14+0000    2026-04-24     4.6.1       0.1.1
options(op)
# }
```
