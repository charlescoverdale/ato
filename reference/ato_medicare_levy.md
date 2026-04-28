# Medicare Levy and Medicare Levy Surcharge

Returns aggregate Medicare Levy and MLS data from Taxation Statistics
Individuals. The 2% Medicare Levy is on most taxable income; MLS is an
additional 1.0 to 1.5% on high-income earners without adequate private
hospital cover. Used in private health insurance reform analysis.

## Usage

``` r
ato_medicare_levy(year = "latest", component = c("levy", "surcharge"))
```

## Source

Australian Taxation Office Taxation Statistics Individuals. Licensed CC
BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

- component:

  One of `"levy"` (default, standard Medicare Levy) or `"surcharge"`
  (MLS).

## Value

An `ato_tbl`.

## References

Commonwealth of Australia. *Medicare Levy Act 1986*; *A New Tax System
(Medicare Levy Surcharge – Fringe Benefits) Act 1999*.

Productivity Commission (2015). *Efficiency in Health*. Analysis of
Medicare Levy and MLS distributional effects.

## See also

Other specialist:
[`ato_compliance()`](https://charlescoverdale.github.io/ato/reference/ato_compliance.md),
[`ato_division293()`](https://charlescoverdale.github.io/ato/reference/ato_division293.md),
[`ato_fuel_tax_credits()`](https://charlescoverdale.github.io/ato/reference/ato_fuel_tax_credits.md),
[`ato_international()`](https://charlescoverdale.github.io/ato/reference/ato_international.md),
[`ato_prrt()`](https://charlescoverdale.github.io/ato/reference/ato_prrt.md),
[`ato_rba()`](https://charlescoverdale.github.io/ato/reference/ato_rba.md),
[`ato_state_tax()`](https://charlescoverdale.github.io/ato/reference/ato_state_tax.md),
[`ato_tax_expenditures()`](https://charlescoverdale.github.io/ato/reference/ato_tax_expenditures.md),
[`ato_whm()`](https://charlescoverdale.github.io/ato/reference/ato_whm.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try(ato_medicare_levy(year = "2022-23", component = "surcharge"))
#> Error in ato_ckan_resolve(id, pattern) : 
#>   No resource in "taxation-statistics-2022-23" matches
#> "medicare.levy.surcharge|mls|surcharge".
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
