# Industry aggregates across entity types

Derived helper that returns an ANZSIC industry breakdown based on either
individual, company, or all entities for the year.

## Usage

``` r
ato_industry(
  year = "latest",
  entity = c("company", "individual", "all"),
  anzsic = NULL
)
```

## Source

Australian Taxation Office Taxation Statistics. Licensed CC BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

- entity:

  One of `"individual"`, `"company"` (default), or `"all"`.

- anzsic:

  Optional substring filter on industry name.

## Value

An `ato_tbl`.

## See also

Other gst:
[`ato_gst()`](https://charlescoverdale.github.io/ato/reference/ato_gst.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  i <- ato_industry(year = "2022-23", entity = "company",
                    anzsic = "manufacturing")
  head(i)
})
#> # ato_tbl: ATO industry 2022-23 (company)
#> # Source:   https://data.gov.au/data/organization/australiantaxationoffice
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-09-19 10:26 UTC 
#> # Snapshot: 2026-04-24
#> # Rows: 6  Cols: 252
#> 
#>    broad_industry2                                  fine_industry2 companies_no
#> 1 C. Manufacturing         111 Meat and Meat Product Manufacturing          574
#> 2 C. Manufacturing                          112 Seafood Processing          114
#> 3 C. Manufacturing                 113 Dairy Product Manufacturing          454
#> 4 C. Manufacturing              114 Fruit and Vegetable Processing          366
#> 5 C. Manufacturing                   115 Oil and Fat Manufacturing           77
#> 6 C. Manufacturing 116 Grain Mill and Cereal Product Manufacturing          156
#>   other_sales_of_goods_and_services_no other_sales_of_goods_and_services
#> 1                                  378                       35749520724
#> 2                                   70                         552109049
#> 3                                  305                       16874945784
#> 4                                  232                        1656905150
#> 5                                   56                         801743759
#> 6                                  114                        6199355941
#>   gross_distribution_from_partnerships_no gross_distribution_from_partnerships
#> 1                                       1                                23649
#> 2                                       2                                44781
#> 3                                       1                               -37530
#> 4                                       2                                66713
#> 5                                       0                                    0
#> 6                                       2                              6408415
#>   gross_distribution_from_trusts_no gross_distribution_from_trusts
#> 1                                34                       34834961
#> 2                                 7                        2566536
#> 3                                13                        4954679
#> 4                                 8                        1508239
#> 5                                 2                         750972
#> 6                                 5                         183192
#>   gross_interest_no gross_interest
#> 1               217       45973623
#> 2                50        1843159
#> 3               198       14719190
#> 4               116        4209528
#> 5                30         660653
#> 6                57       23202449
#>   gross_rent_and_other_leasing_and_hiring_income_no
#> 1                                                51
#> 2                                                11
#> 3                                                35
#> 4                                                17
#> 5                                                 4
#> 6                                                11
#>   gross_rent_and_other_leasing_and_hiring_income total_dividends_no
#> 1                                       28309391                 35
#> 2                                        2080676                  9
#> 3                                        9609759                 13
#> 4                                        1084882                  7
#> 5                                         556280                  2
#> 6                                        4527658                  5
#>   total_dividends fringe_benefit_employee_contributions_no
#> 1        51078342                                       46
#> 2         2427034                                       11
#> 3         3736941                                       53
#> 4          218603                                       24
#> 5         9796303                                        8
#> 6       155311512                                       19
#>   fringe_benefit_employee_contributions
#> 1                               1759285
#> 2                                108914
#> 3                               4051393
#> 4                                153729
#> 5                                 54288
#> 6                                439329
#>   assessable_government_industry_payments_no
#> 1                                         65
#> 2                                         17
#> 3                                         86
#> 4                                         29
#> 5                                         13
#> 6                                          8
#>   assessable_government_industry_payments
#> 1                                39606605
#> 2                                  542099
#> 3                                 5102773
#> 4                                 1537536
#> 5                                  781450
#> 6                                  957597
#>   unrealised_gains_on_revaluation_of_assets_to_fair_value_no
#> 1                                                          2
#> 2                                                          1
#> 3                                                          2
#> 4                                                          0
#> 5                                                          0
#> 6                                                          1
#>   unrealised_gains_on_revaluation_of_assets_to_fair_value other_gross_income_no
#> 1                                                 2175624                   285
#> 2                                                       1                    64
#> 3                                                 2710958                   256
#> 4                                                       0                   160
#> 5                                                       0                    32
#> 6                                                 1932479                    77
#>   other_gross_income total_income3_no total_income3 cost_of_sales_no
#> 1          882670501              516   36835952705              343
#> 2          104119139              103     665841388               73
#> 3          671757717              411   17591551664              331
#> 4           78027844              328    1743930185              261
#> 5           43407216               67     857750921               56
#> 6          423579745              138    6815898317              118
#>   cost_of_sales contractor_sub_contractor_and_commission_expenses_no
#> 1   27613635099                                                  126
#> 2     459249122                                                   15
#> 3   12670084470                                                   95
#> 4    1116419848                                                   60
#> 5     605288422                                                   14
#> 6    3383400588                                                   32
#>   contractor_sub_contractor_and_commission_expenses superannuation_expenses_no
#> 1                                         764939089                        296
#> 2                                           3407120                         58
#> 3                                          56773070                        258
#> 4                                          20658513                        178
#> 5                                           2564727                         40
#> 6                                          37175352                         88
#>   superannuation_expenses bad_debts_no bad_debts
#> 1               257257381           59   9037299
#> 2                 5402245            9    215058
#> 3               150932885           51   9134981
#> 4                18169908           23   5855640
#> 5                 4411292            3    290957
#> 6                44663273           19    447146
#>   lease_expenses_within_australia_no lease_expenses_within_australia
#> 1                                 48                        39312449
#> 2                                  5                           47009
#> 3                                 46                       136238189
#> 4                                 24                         5188405
#> 5                                  4                          444980
#> 6                                 19                        17176931
#>   lease_expenses_overseas_no lease_expenses_overseas rent_expenses_no
#> 1                          1                   24076              250
#> 2                          0                       0               56
#> 3                          1                  100000              256
#> 4                          0                       0              186
#> 5                          0                       0               31
#> 6                          0                       0               77
#>   rent_expenses interest_expenses_within_australia_no
#> 1     187961680                                   241
#> 2       3795629                                    52
#> 3      88955587                                   226
#> 4      28663867                                   134
#> 5       3383980                                    37
#> 6      13629940                                    72
#>   interest_expenses_within_australia interest_expenses_overseas_no
#> 1                          111249109                            10
#> 2                            3503041                             1
#> 3                           61123508                             9
#> 4                            4839077                             3
#> 5                            3991043                             2
#> 6                           80918331                             7
#>   interest_expenses_overseas depreciation_expenses_no depreciation_expenses
#> 1                  143803616                      335             577014181
#> 2                    2317733                       66              12404730
#> 3                   36020843                      290             406275434
#> 4                   18768112                      209              47800299
#> 5                    4030754                       46              24324396
#> 6                   40434577                       98             170222567
#>   motor_vehicle_expenses_no motor_vehicle_expenses repairs_and_maintenance_no
#> 1                       377               82645476                        339
#> 2                        67                4843488                         64
#> 3                       276               53631467                        277
#> 4                       187                4038235                        196
#> 5                        41                2592454                         40
#> 6                        83                8577427                         85
#>   repairs_and_maintenance all_other_expenses_no all_other_expenses
#> 1               516132366                   539         5583412072
#> 2                 4254220                   108          154091867
#> 3               199479693                   440         3784421247
#> 4                21893267                   347          474568063
#> 5                 6071128                    71          126920348
#> 6               112269264                   147         2239999447
#>   total_expenses_no total_expenses total_profit_or_loss_no total_profit_or_loss
#> 1               545    35892647885                     544            943304820
#> 2               109      653531262                     110             12310126
#> 3               442    17729535988                     443           -137984324
#> 4               349     1772914109                     348            -28983924
#> 5                72      784356175                      72             73394746
#> 6               148     6181725416                     147            634172901
#>   net_capital_gain_no net_capital_gain
#> 1                  11          6069399
#> 2                   3           960147
#> 3                   7         80318545
#> 4                   2           109235
#> 5                   2           405947
#> 6                   1             7305
#>   non_deductible_exempt_income_expenditure_no
#> 1                                           0
#> 2                                           0
#> 3                                           3
#> 4                                           1
#> 5                                           1
#> 6                                           0
#>   non_deductible_exempt_income_expenditure franking_credits_no franking_credits
#> 1                                        0                  24         14043065
#> 2                                        0                   7           840100
#> 3                                    65732                  12          1754689
#> 4                                     1056                   3            66716
#> 5                                    11727                   2          3911691
#> 6                                        0                   3          3179578
#>   australian_franking_credits_from_a_new_zealand_company_no
#> 1                                                         1
#> 2                                                         0
#> 3                                                         0
#> 4                                                         1
#> 5                                                         0
#> 6                                                         0
#>   australian_franking_credits_from_a_new_zealand_company
#> 1                                                    500
#> 2                                                      0
#> 3                                                      0
#> 4                                                  10147
#> 5                                                      0
#> 6                                                      0
#>   other_assessable_income_no other_assessable_income non_deductible_expenses_no
#> 1                         65               284943992                        362
#> 2                         10                 6103046                         74
#> 3                         46                25758907                        321
#> 4                         16                31550077                        232
#> 5                         14                 1632632                         50
#> 6                         24                28713465                        106
#>   non_deductible_expenses
#> 1              1483620829
#> 2                29353181
#> 3              1142487214
#> 4               149398029
#> 5                33818402
#> 6               377040881
#>   accounting_expenditure_in_item_6_subject_to_r_d_tax_incentive_no
#> 1                                                               21
#> 2                                                                2
#> 3                                                               42
#> 4                                                               17
#> 5                                                                5
#> 6                                                                9
#>   accounting_expenditure_in_item_6_subject_to_r_d_tax_incentive subtotal_no
#> 1                                                      59597530         542
#> 2                                                        260973         110
#> 3                                                      47267407         443
#> 4                                                       7796997         350
#> 5                                                       4074662          71
#> 6                                                      14576180         147
#>     subtotal deduction_for_decline_in_value_of_depreciating_assets_no
#> 1 2791580135                                                      294
#> 2   49827573                                                       49
#> 3 1159668170                                                      229
#> 4  159948333                                                      164
#> 5  117249807                                                       33
#> 6 1057690310                                                       76
#>   deduction_for_decline_in_value_of_depreciating_assets
#> 1                                             677562425
#> 2                                              11039539
#> 3                                             405349441
#> 4                                              45916854
#> 5                                              20377501
#> 6                                             502831471
#>   immediate_deduction_for_capital_expenditure_no
#> 1                                             10
#> 2                                              1
#> 3                                              8
#> 4                                              7
#> 5                                              2
#> 6                                              2
#>   immediate_deduction_for_capital_expenditure capital_works_deductions_no
#> 1                                    11616990                          38
#> 2                                      224708                           9
#> 3                                     2140620                          40
#> 4                                     1516148                          11
#> 5                                      242586                           8
#> 6                                      169209                          15
#>   capital_works_deductions section_40_880_deduction_no section_40_880_deduction
#> 1                 46635886                          27                  5230293
#> 2                   746097                           1                      713
#> 3                 28285100                          26                  6913425
#> 4                  2320448                           8                   720894
#> 5                  5778864                           2                     4554
#> 6                 16774773                          10                  5216790
#>   exempt_income_no exempt_income
#> 1                0             0
#> 2                1          7471
#> 3                2       3342081
#> 4                1        236624
#> 5                0             0
#> 6                3        289216
#>   other_income_not_included_in_assessable_income_no
#> 1                                                60
#> 2                                                12
#> 3                                                64
#> 4                                                22
#> 5                                                15
#> 6                                                21
#>   other_income_not_included_in_assessable_income other_deductible_expenses_no
#> 1                                      152838248                          202
#> 2                                       11005393                           42
#> 3                                       64768372                          170
#> 4                                       12198843                           98
#> 5                                        1775169                           32
#> 6                                      178930761                           61
#>   other_deductible_expenses small_business_skills_and_training_boost_no
#> 1                1222885460                                           8
#> 2                  19501739                                           0
#> 3                 317968805                                          12
#> 4                  82568607                                           9
#> 5                   7465963                                           2
#> 6                 153026305                                           1
#>   small_business_skills_and_training_boost
#> 1                                     8893
#> 2                                        0
#> 3                                    34878
#> 4                                     5835
#> 5                                     1771
#> 6                                      217
#>   small_business_techonolgy_investment_boost_no
#> 1                                            63
#> 2                                            19
#> 3                                            90
#> 4                                            68
#> 5                                            11
#> 6                                            34
#>   small_business_techonolgy_investment_boost tax_losses_deducted_no
#> 1                                     463839                    106
#> 2                                     122298                     27
#> 3                                     493733                     89
#> 4                                     375125                     74
#> 5                                      71890                     16
#> 6                                     144157                     30
#>   tax_losses_deducted
#> 1            46279160
#> 2             3032545
#> 3           103556942
#> 4             6989849
#> 5            35918220
#> 6             7911165
#>   tax_losses_transferred_in_from_or_to_a_foreign_bank_branch_or_a_pe_of_a_foreign_financial_entity_no
#> 1                                                                                                   1
#> 2                                                                                                   0
#> 3                                                                                                   1
#> 4                                                                                                   0
#> 5                                                                                                   0
#> 6                                                                                                   0
#>   tax_losses_transferred_in_from_or_to_a_foreign_bank_branch_or_a_pe_of_a_foreign_financial_entity
#> 1                                                                                            20308
#> 2                                                                                                0
#> 3                                                                                             1320
#> 4                                                                                                0
#> 5                                                                                                0
#> 6                                                                                                0
#>   subtraction_items_subtotal_no subtraction_items_subtotal
#> 1                           394                 2170587675
#> 2                            83                   45705843
#> 3                           341                  933004291
#> 4                           250                  152849227
#> 5                            55                   72874648
#> 6                           115                  865294064
#>   taxable_income_or_loss_no taxable_income_or_loss opening_stock_no
#> 1                       484              620992460              209
#> 2                        93                4121730               48
#> 3                       379              226663878              198
#> 4                       300                9134097              118
#> 5                        60               44375159               32
#> 6                       128              192396246               76
#>   opening_stock purchases_and_other_costs_no purchases_and_other_costs
#> 1    3235473053                          273               26537104113
#> 2      40445051                           56                 403447521
#> 3    1833263972                          256               12880727869
#> 4     306614218                          192                1009217334
#> 5     111440198                           46                 575102076
#> 6    1104115361                           98                3553493731
#>   closing_stock_no closing_stock trade_debtors_no trade_debtors
#> 1              213    2914217936              225    2530989577
#> 2               45      58098653               50      21001090
#> 3              198    2345699336              220    1694724114
#> 4              126     326518465              129     204831361
#> 5               34     120764409               40      84600364
#> 6               76    1305378391               88     763796387
#>   all_current_assets_no all_current_assets total_assets_no total_assets
#> 1                   488         7828413833             500  30261856389
#> 2                   100          218842701             103    448741183
#> 3                   401         7828251290             406  16688312913
#> 4                   301          779997180             313   1584164566
#> 5                    68          306599552              69    780119846
#> 6                   136         4005583061             138   7746052401
#>   trade_creditors_no trade_creditors all_current_liabilities_no
#> 1                242      1805581111                        446
#> 2                 49        32481099                         88
#> 3                222      1732158069                        362
#> 4                131       158411945                        267
#> 5                 35        48457484                         64
#> 6                 78       572381889                        122
#>   all_current_liabilities total_liabilities_no total_liabilities total_debt_no
#> 1              5380539118                  478       11576485738           116
#> 2               125360268                   99         285841688            16
#> 3              6091685893                  391       10917489705           106
#> 4               846000415                  306        1049563948            51
#> 5               277761543                   68         348286111            13
#> 6              2330910916                  134        4442826796            29
#>   total_debt franked_dividends_paid_no franked_dividends_paid
#> 1 4622221726                       112              246525225
#> 2   81606797                        23                8063279
#> 3 1967538276                        66              128354037
#> 4  466790449                        39               21981141
#> 5  188987884                        10                5069695
#> 6 2160388083                        32               97899697
#>   unfranked_dividends_paid_no unfranked_dividends_paid
#> 1                          10                  3805905
#> 2                           2                   852289
#> 3                           6                   651211
#> 4                           6                   158504
#> 5                           0                        0
#> 6                           5                    45872
#>   opening_franking_account_balance_no opening_franking_account_balance
#> 1                                 269                       2115011116
#> 2                                  53                         51476072
#> 3                                 190                        773832205
#> 4                                 120                        246058413
#> 5                                  36                         95978099
#> 6                                  65                        528813437
#>   closing_franking_account_balance_no closing_franking_account_balance
#> 1                                 290                       2397672972
#> 2                                  55                         52765241
#> 3                                 209                        818647120
#> 4                                 131                        249144502
#> 5                                  40                        110303198
#> 6                                  71                        477803400
#>   financial_information_aggregated_turnover_no
#> 1                                           32
#> 2                                            2
#> 3                                           39
#> 4                                           30
#> 5                                            6
#> 6                                           12
#>   financial_information_aggregated_turnover excess_franking_offsets_no
#> 1                              130406598927                          5
#> 2                                   7618417                          0
#> 3                               47153885985                          6
#> 4                                3005957509                          0
#> 5                                1142537823                          2
#> 6                                3959702729                          1
#>   excess_franking_offsets loans_to_shareholders_and_their_associates_no
#> 1                  277070                                            48
#> 2                       0                                            10
#> 3                 1215267                                            36
#> 4                       0                                            32
#> 5                   30819                                             5
#> 6                  857143                                            16
#>   loans_to_shareholders_and_their_associates total_salary_and_wage_expenses_no
#> 1                                  124757889                               260
#> 2                                    7127926                                53
#> 3                                   28153293                               233
#> 4                                   20391189                               151
#> 5                                    1856695                                39
#> 6                                   51090588                                81
#>   total_salary_and_wage_expenses payments_to_associated_persons_no
#> 1                     2954929188                               133
#> 2                       53666964                                29
#> 3                     1777658623                               116
#> 4                      178241191                                71
#> 5                       48898928                                22
#> 6                      543142173                                37
#>   payments_to_associated_persons gross_foreign_income_no gross_foreign_income
#> 1                       24526009                      11              2797225
#> 2                        4001480                       1               147295
#> 3                       16912568                       9             14362064
#> 4                        8314002                       2              3559854
#> 5                        5459085                       1              1605534
#> 6                        7108293                       5             23417263
#>   net_foreign_income_no net_foreign_income total_tofa_gains_no total_tofa_gains
#> 1                    11            1105413                  32        110883229
#> 2                     1             147295                   2         19575061
#> 3                     8            1462848                  25         24458392
#> 4                     2            3550429                   3          1971945
#> 5                     1            1605534                   3           118505
#> 6                     5           22657442                  11         32025524
#>   total_tofa_losses_no total_tofa_losses
#> 1                   35         230223997
#> 2                    1          40153021
#> 3                   24         105162961
#> 4                    3          18904117
#> 5                    4           4535032
#> 6                   11         123852896
#>   intangible_depreciating_assets_first_deducted_no
#> 1                                               12
#> 2                                                1
#> 3                                                9
#> 4                                                1
#> 5                                                0
#> 6                                                7
#>   intangible_depreciating_assets_first_deducted
#> 1                                       4250277
#> 2                                        289116
#> 3                                      14223861
#> 4                                         15499
#> 5                                             0
#> 6                                       1223723
#>   other_depreciating_assets_first_deducted_no
#> 1                                          82
#> 2                                           8
#> 3                                          74
#> 4                                          30
#> 5                                          13
#> 6                                          21
#>   other_depreciating_assets_first_deducted
#> 1                                547550951
#> 2                                  4367236
#> 3                                295978591
#> 4                                 33971822
#> 5                                 10119876
#> 6                                402330186
#>   opt_out_of_temporary_full_expensing_value_of_assets_you_are_opting_out_for_no
#> 1                                                                             8
#> 2                                                                             1
#> 3                                                                            13
#> 4                                                                             3
#> 5                                                                             2
#> 6                                                                             3
#>   opt_out_of_temporary_full_expensing_value_of_assets_you_are_opting_out_for
#> 1                                                                   22534599
#> 2                                                                     150202
#> 3                                                                  124759691
#> 4                                                                     314274
#> 5                                                                     658872
#> 6                                                                    5043828
#>   opt_out_of_temporary_full_expensing_temporary_full_expensing_deductions_no
#> 1                                                                         92
#> 2                                                                         19
#> 3                                                                         74
#> 4                                                                         54
#> 5                                                                         14
#> 6                                                                         23
#>   opt_out_of_temporary_full_expensing_temporary_full_expensing_deductions
#> 1                                                               266525080
#> 2                                                                 2733626
#> 3                                                               112304703
#> 4                                                               130222453
#> 5                                                                 5844802
#> 6                                                               498913407
#>   total_adjustable_values_at_end_of_income_year_no
#> 1                                               97
#> 2                                               11
#> 3                                               63
#> 4                                               27
#> 5                                               13
#> 6                                               22
#>   total_adjustable_values_at_end_of_income_year
#> 1                                    2738228738
#> 2                                      48715972
#> 3                                    1814054471
#> 4                                     201010342
#> 5                                     125362225
#> 6                                    1161694712
#>   termination_value_of_other_depreciating_assets_no
#> 1                                                29
#> 2                                                 1
#> 3                                                12
#> 4                                                 1
#> 5                                                 3
#> 6                                                 8
#>   termination_value_of_other_depreciating_assets
#> 1                                        5081287
#> 2                                          44818
#> 3                                        2853832
#> 4                                          30661
#> 5                                         260909
#> 6                                        7733428
#>   deduction_for_certain_assets_no deduction_for_certain_assets
#> 1                              38                      5042060
#> 2                              12                       997087
#> 3                              50                      5873579
#> 4                              42                      8527620
#> 5                               6                      1129867
#> 6                              17                      4257132
#>   deduction_for_general_small_business_pool_no
#> 1                                           10
#> 2                                            5
#> 3                                           15
#> 4                                           11
#> 5                                            1
#> 6                                            7
#>   deduction_for_general_small_business_pool
#> 1                                    198481
#> 2                                    170162
#> 3                                    402704
#> 4                                    380987
#> 5                                    117230
#> 6                                   1479186
#>   tax_losses_carried_forward_to_later_income_years_no
#> 1                                                 228
#> 2                                                  56
#> 3                                                 265
#> 4                                                 203
#> 5                                                  42
#> 6                                                  85
#>   tax_losses_carried_forward_to_later_income_years
#> 1                                        745996684
#> 2                                         79174625
#> 3                                        638523401
#> 4                                        213443618
#> 5                                        110513742
#> 6                                         96344992
#>   net_capital_losses_carried_forward_to_later_income_years_no
#> 1                                                          34
#> 2                                                          12
#> 3                                                          25
#> 4                                                          11
#> 5                                                           5
#> 6                                                           5
#>   net_capital_losses_carried_forward_to_later_income_years
#> 1                                                 58661924
#> 2                                                  5441757
#> 3                                                150312998
#> 4                                                 22812070
#> 5                                                   821346
#> 6                                                 40988144
#>   tax_loss_2019_20_carried_back_to_2018_19_no
#> 1                                           0
#> 2                                           0
#> 3                                           0
#> 4                                           0
#> 5                                           0
#> 6                                           0
#>   tax_loss_2019_20_carried_back_to_2018_19
#> 1                                        0
#> 2                                        0
#> 3                                        0
#> 4                                        0
#> 5                                        0
#> 6                                        0
#>   tax_loss_2020_21_carried_back_to_2018_19_no
#> 1                                           1
#> 2                                           0
#> 3                                           0
#> 4                                           0
#> 5                                           0
#> 6                                           0
#>   tax_loss_2020_21_carried_back_to_2018_19
#> 1                                    12618
#> 2                                        0
#> 3                                        0
#> 4                                        0
#> 5                                        0
#> 6                                        0
#>   tax_loss_2020_21_carried_back_to_2019_20_no
#> 1                                           2
#> 2                                           0
#> 3                                           0
#> 4                                           0
#> 5                                           0
#> 6                                           1
#>   tax_loss_2020_21_carried_back_to_2019_20
#> 1                                    83909
#> 2                                        0
#> 3                                        0
#> 4                                        0
#> 5                                        0
#> 6                                    64224
#>   tax_loss_2021_22_carried_back_to_2018_19_no
#> 1                                           0
#> 2                                           0
#> 3                                           0
#> 4                                           0
#> 5                                           0
#> 6                                           0
#>   tax_loss_2021_22_carried_back_to_2018_19
#> 1                                        0
#> 2                                        0
#> 3                                        0
#> 4                                        0
#> 5                                        0
#> 6                                        0
#>   tax_loss_2021_22_carried_back_to_2019_20_no
#> 1                                           1
#> 2                                           0
#> 3                                           0
#> 4                                           0
#> 5                                           0
#> 6                                           1
#>   tax_loss_2021_22_carried_back_to_2019_20
#> 1                                     1572
#> 2                                        0
#> 3                                        0
#> 4                                        0
#> 5                                        0
#> 6                                   158558
#>   tax_loss_2021_22_carried_back_to_2020_21_no
#> 1                                           0
#> 2                                           0
#> 3                                           1
#> 4                                           0
#> 5                                           0
#> 6                                           0
#>   tax_loss_2021_22_carried_back_to_2020_21
#> 1                                        0
#> 2                                        0
#> 3                                   168373
#> 4                                        0
#> 5                                        0
#> 6                                        0
#>   tax_loss_2022_23_carried_back_to_2018_19_no
#> 1                                           7
#> 2                                           1
#> 3                                           6
#> 4                                           0
#> 5                                           0
#> 6                                           0
#>   tax_loss_2022_23_carried_back_to_2018_19
#> 1                                 43757809
#> 2                                    50515
#> 3                                  9057412
#> 4                                        0
#> 5                                        0
#> 6                                        0
#>   tax_loss_2022_23_carried_back_to_2019_20_no
#> 1                                          11
#> 2                                           2
#> 3                                           3
#> 4                                           2
#> 5                                           1
#> 6                                           3
#>   tax_loss_2022_23_carried_back_to_2019_20
#> 1                                  3176419
#> 2                                   229598
#> 3                                  4790743
#> 4                                   749792
#> 5                                   462893
#> 6                                   193896
#>   tax_loss_2022_23_carried_back_to_2020_21_no
#> 1                                           6
#> 2                                           0
#> 3                                           9
#> 4                                           3
#> 5                                           1
#> 6                                           2
#>   tax_loss_2022_23_carried_back_to_2020_21
#> 1                                   401557
#> 2                                        0
#> 3                                 17279972
#> 4                                   203260
#> 5                                   721919
#> 6                                    42842
#>   tax_loss_2022_23_carried_back_to_2021_22_no
#> 1                                          11
#> 2                                           2
#> 3                                           5
#> 4                                           6
#> 5                                           2
#> 6                                           3
#>   tax_loss_2022_23_carried_back_to_2021_22 income_tax_liability_2018_19_no
#> 1                                 17999260                               8
#> 2                                   319717                               1
#> 3                                   189822                               7
#> 4                                   312711                               0
#> 5                                    41878                               0
#> 6                                 17203423                               0
#>   income_tax_liability_2018_19 income_tax_liability_2019_20_no
#> 1                  17377244.65                              13
#> 2                     12628.82                               2
#> 3                   6308791.72                               4
#> 4                         0.00                               2
#> 5                         0.00                               1
#> 6                         0.00                               3
#>   income_tax_liability_2019_20 income_tax_liability_2020_21_no
#> 1                  18446266.60                               6
#> 2                     65967.32                               0
#> 3                   3950879.28                               9
#> 4                     35633.24                               3
#> 5                    115723.30                               1
#> 6                    179308.07                               2
#>   income_tax_liability_2020_21 income_tax_liability_2021_22_no
#> 1                    119290.52                              12
#> 2                         0.00                               2
#> 3                   3443445.65                               5
#> 4                     74838.38                               6
#> 5                    196960.66                               3
#> 6                     11048.92                               3
#>   income_tax_liability_2021_22 aggregated_turnover_for_2019_20_no
#> 1                  12610055.95                                  3
#> 2                    391254.25                                  0
#> 3                     73774.25                                  1
#> 4                    156197.17                                  0
#> 5                     49111.00                                  0
#> 6                  49645131.50                                  0
#>   aggregated_turnover_for_2019_20 aggregated_turnover_for_2020_21_no
#> 1                          372187                                  2
#> 2                               0                                  0
#> 3                         1788239                                  4
#> 4                               0                                  0
#> 5                               0                                  0
#> 6                               0                                  1
#>   aggregated_turnover_for_2020_21 aggregated_turnover_for_2021_22_no
#> 1                           41721                                  5
#> 2                               0                                  0
#> 3                        62942555                                  4
#> 4                               0                                  1
#> 5                               0                                  1
#> 6                          673463                                  1
#>   aggregated_turnover_for_2021_22 loss_carry_back_tax_offset_no
#> 1                      3427248817                            24
#> 2                               0                             3
#> 3                        30755437                            14
#> 4                          108398                             6
#> 5                           77508                             3
#> 6                      1888285000                             7
#>   loss_carry_back_tax_offset
#> 1                 19504689.7
#> 2                   149452.0
#> 3                  6179437.2
#> 4                   162342.4
#> 5                   306672.0
#> 6                  5168046.8
#>   total_amount_of_psi_included_at_item_6_income_labels_no
#> 1                                                       0
#> 2                                                       1
#> 3                                                       0
#> 4                                                       2
#> 5                                                       0
#> 6                                                       0
#>   total_amount_of_psi_included_at_item_6_income_labels
#> 1                                                    0
#> 2                                               187718
#> 3                                                    0
#> 4                                                 5960
#> 5                                                    0
#> 6                                                    0
#>   total_amount_of_deductions_against_psi_included_at_item_6_expense_labels_no
#> 1                                                                           0
#> 2                                                                           1
#> 3                                                                           0
#> 4                                                                           0
#> 5                                                                           0
#> 6                                                                           0
#>   total_amount_of_deductions_against_psi_included_at_item_6_expense_labels
#> 1                                                                        0
#> 2                                                                    65804
#> 3                                                                        0
#> 4                                                                        0
#> 5                                                                        0
#> 6                                                                        0
#>   foreign_income_tax_offset_no foreign_income_tax_offset
#> 1                           10                 523774.62
#> 2                            1                  16573.61
#> 3                            7                 151812.21
#> 4                            2                 369607.00
#> 5                            0                      0.00
#> 6                            3                1112602.00
#>   non_refundable_r_d_tax_offset_no non_refundable_r_d_tax_offset
#> 1                               16                    22579450.6
#> 2                                0                           0.0
#> 3                               17                    12354272.5
#> 4                                1                      836367.8
#> 5                                1                      824892.1
#> 6                                5                    54467897.7
#>   non_refundable_r_d_tax_offset_carried_forward_from_previous_year_no
#> 1                                                                   7
#> 2                                                                   0
#> 3                                                                  12
#> 4                                                                   0
#> 5                                                                   1
#> 6                                                                   0
#>   non_refundable_r_d_tax_offset_carried_forward_from_previous_year
#> 1                                                          4677246
#> 2                                                                0
#> 3                                                          8012133
#> 4                                                                0
#> 5                                                          3306993
#> 6                                                                0
#>   non_refundable_r_d_tax_offset_to_be_utilised_in_current_year_no
#> 1                                                              14
#> 2                                                               0
#> 3                                                              10
#> 4                                                               1
#> 5                                                               1
#> 6                                                               3
#>   non_refundable_r_d_tax_offset_to_be_utilised_in_current_year
#> 1                                                   18200353.3
#> 2                                                          0.0
#> 3                                                   12235634.7
#> 4                                                     836367.8
#> 5                                                     824892.1
#> 6                                                    2301993.9
#>   non_refundable_r_d_tax_offset_carried_forward_to_next_year_no
#> 1                                                            12
#> 2                                                             0
#> 3                                                            10
#> 4                                                             0
#> 5                                                             1
#> 6                                                             2
#>   non_refundable_r_d_tax_offset_carried_forward_to_next_year
#> 1                                                    9056344
#> 2                                                          0
#> 3                                                    8130770
#> 4                                                          0
#> 5                                                    3306993
#> 6                                                   52165904
#>   refundable_r_d_tax_offset_no refundable_r_d_tax_offset
#> 1                            5                 1484762.9
#> 2                            2                  113523.3
#> 3                           25                 7253828.6
#> 4                           16                 2506135.1
#> 5                            4                 1330885.1
#> 6                            4                 1340644.8
#>   taxable_or_net_income_no taxable_or_net_income tax_on_taxable_income_no
#> 1                      295             950360473                      295
#> 2                       47              21646791                       47
#> 3                      163             393383170                      163
#> 4                      124              61940113                      123
#> 5                       33              51713640                       33
#> 6                       57             244357943                       57
#>   tax_on_taxable_income gross_tax_no gross_tax
#> 1             281103856          295 281103856
#> 2               5781951           47   5781951
#> 3             116239461          163 116239461
#> 4              17175164          123  17175164
#> 5              15207692           33  15207692
#> 6              72638353           56  72621312
#>   non_refundable_non_carry_forward_tax_offsets_no
#> 1                                              27
#> 2                                               9
#> 3                                              17
#> 4                                               4
#> 5                                               3
#> 6                                               5
#>   non_refundable_non_carry_forward_tax_offsets subtotal_1_no subtotal_1
#> 1                                     14003974           293  267377245
#> 2                                      1098278            46    4712634
#> 3                                      1945872           156  115409901
#> 4                                       510416           123   16664765
#> 5                                      4061691            30   11176821
#> 6                                      3439022            56   69182290
#>   non_refundable_carry_forward_tax_offsets_no
#> 1                                          22
#> 2                                           0
#> 3                                          18
#> 4                                           1
#> 5                                           2
#> 6                                           5
#>   non_refundable_carry_forward_tax_offsets subtotal_2_no subtotal_2
#> 1                               27970432.1           287  248247515
#> 2                                      0.0            46    4712634
#> 3                               20366405.1           154  103174266
#> 4                                 836367.8           123   15828397
#> 5                                4131885.1            30   10351929
#> 6                               54467897.7            56   66464563
#>   refundable_tax_offsets_no refundable_tax_offsets subtotal_3_no subtotal_3
#> 1                        32               24011724           285  244628067
#> 2                         6                 291869            45    4617286
#> 3                        40               13641968           145  102362485
#> 4                        23                2681725           118   15355989
#> 5                         7                1637557            28   10255771
#> 6                        11                6510559            55   66450550
#>   franking_deficit_tax_offset_no franking_deficit_tax_offset tax_payable_no
#> 1                              0                           0            285
#> 2                              0                           0             45
#> 3                              0                           0            145
#> 4                              0                           0            118
#> 5                              0                           0             28
#> 6                              0                           0             56
#>   tax_payable tax_withheld_from_interest_or_investments_no
#> 1   244628067                                            8
#> 2     4617286                                            1
#> 3   102362485                                            3
#> 4    15355989                                            5
#> 5    10255771                                            1
#> 6    66467591                                            1
#>   tax_withheld_from_interest_or_investments other_credits_no other_credits
#> 1                                   59456.0                1      41651.79
#> 2                                      24.0                0          0.00
#> 3                                     447.0                0          0.00
#> 4                                     504.0                0          0.00
#> 5                                     115.6                1          3.00
#> 6                                     160.0                1        359.46
#>   eligible_credits_no eligible_credits remainder_of_refundable_tax_offsets_no
#> 1                   9        101107.79                                     29
#> 2                   1            24.00                                      4
#> 3                   3           447.00                                     39
#> 4                   5           504.00                                     22
#> 5                   2           118.60                                      7
#> 6                   2           519.46                                     10
#>   remainder_of_refundable_tax_offsets payg_instalments_raised_no
#> 1                          20392275.3                        246
#> 2                            167626.4                         41
#> 3                          12830187.5                        154
#> 4                           2209316.7                        106
#> 5                           1541398.9                         24
#> 6                           6496545.8                         52
#>   payg_instalments_raised amount_due_or_refundable_no amount_due_or_refundable
#> 1               234505634                         356              -10370950.6
#> 2                 2531793                          59                1917842.1
#> 3               103700468                         222              -14168617.1
#> 4                12899859                         168                 246309.6
#> 5                 7937946                          42                 776307.2
#> 6                54792870                          73                5177655.6
#>   net_tax_no   net_tax  entity
#> 1        287 248247515 company
#> 2         46   4712634 company
#> 3        154 103174266 company
#> 4        123  15828397 company
#> 5         30  10351929 company
#> 6         57  66481604 company
options(op)
# }
```
