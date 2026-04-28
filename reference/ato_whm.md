# Working Holiday Maker tax data

Returns aggregate Working Holiday Maker tax data: number of backpackers,
total earnings, tax paid. Relevant for migration and labour-market
policy analysis.

## Usage

``` r
ato_whm(year = "latest")
```

## Source

Australian Taxation Office Taxation Statistics. Licensed CC BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

## Value

An `ato_tbl`.

## References

Commonwealth of Australia. *Migration Act 1958*, visa subclasses 417 and
462; *Working Holiday Maker Reform Act 2016*. Establishes the 15 per
cent flat tax rate from the first dollar of WHM earnings.

Productivity Commission (2016). *Migrant Intake into Australia*.
Includes WHM labour-market analysis.

## See also

Other specialist:
[`ato_compliance()`](https://charlescoverdale.github.io/ato/reference/ato_compliance.md),
[`ato_division293()`](https://charlescoverdale.github.io/ato/reference/ato_division293.md),
[`ato_fuel_tax_credits()`](https://charlescoverdale.github.io/ato/reference/ato_fuel_tax_credits.md),
[`ato_international()`](https://charlescoverdale.github.io/ato/reference/ato_international.md),
[`ato_medicare_levy()`](https://charlescoverdale.github.io/ato/reference/ato_medicare_levy.md),
[`ato_prrt()`](https://charlescoverdale.github.io/ato/reference/ato_prrt.md),
[`ato_rba()`](https://charlescoverdale.github.io/ato/reference/ato_rba.md),
[`ato_state_tax()`](https://charlescoverdale.github.io/ato/reference/ato_state_tax.md),
[`ato_tax_expenditures()`](https://charlescoverdale.github.io/ato/reference/ato_tax_expenditures.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try(ato_whm(year = "2022-23"))
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■                 
#> Waiting 2s for throttling delay ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> Error in ato_ckan_resolve(id, "working.holiday.maker|whm|backpacker") : 
#>   No resource in "taxation-statistics-2022-23" matches
#> "working.holiday.maker|whm|backpacker".
#> ℹ Available: "Detailed table Index", "Snapshot - Table 1", "Snapshot - Table
#>   2", "Snapshot - Table 3", "Snapshot - Table 4", "Snapshot - Table 5",
#>   "Snapshot – Table 6", "Snapshot – Table 7", "Industry Benchmarks", "Table F1:
#>   Individual Financial Ratios", "Table F2: Company financial ratios", "Table
#>   F3: Partnerships financial ratios", "Table F4: Trusts financial ratios",
#>   "Table F5: All entities financial ratios", "Table A1: Individual activity
#>   statement ratios", "Table A2: Company activity statement ratios", "Table A3:
#>   Partnership activity statement ratios", "Table A4: Trust activity statement
#>   ratios", …, "Charities - Table 3", and "Charities - Table 4"
options(op)
# }
```
