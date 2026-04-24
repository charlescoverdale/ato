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
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "taxation-statistics-2022-23".
options(op)
# }
```
