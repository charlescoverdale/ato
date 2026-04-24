# Division 293 tax assessments (high-income super contributions)

Returns Division 293 tax data: number of assessments, average Division
293 liability, and distribution by income band. Division 293 applies an
extra 15% tax on concessional super contributions for individuals with
combined income plus low-tax super contributions above AUD 250,000.
Central to retirement-income reform analysis (e.g. Grattan's "Better
Super" proposals).

## Usage

``` r
ato_division293(year = "latest")
```

## Source

Australian Taxation Office Taxation Statistics Individuals. Licensed CC
BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

## Value

An `ato_tbl`.

## Details

Published as part of the Individuals Taxation Statistics (Table 3b in
recent releases).

## References

Commonwealth of Australia. *Income Tax Assessment Act 1997*, Division
293. Extra 15 per cent tax on concessional super contributions for
high-income earners.

Daley, J., Coates, B. and Wood, D. (2018). *Money in retirement: more
than enough*. Grattan Institute. Uses Division 293 distributional data
in reform analysis.

## See also

Other specialist:
[`ato_compliance()`](https://charlescoverdale.github.io/ato/reference/ato_compliance.md),
[`ato_fuel_tax_credits()`](https://charlescoverdale.github.io/ato/reference/ato_fuel_tax_credits.md),
[`ato_international()`](https://charlescoverdale.github.io/ato/reference/ato_international.md),
[`ato_medicare_levy()`](https://charlescoverdale.github.io/ato/reference/ato_medicare_levy.md),
[`ato_prrt()`](https://charlescoverdale.github.io/ato/reference/ato_prrt.md),
[`ato_rba()`](https://charlescoverdale.github.io/ato/reference/ato_rba.md),
[`ato_state_tax()`](https://charlescoverdale.github.io/ato/reference/ato_state_tax.md),
[`ato_tax_expenditures()`](https://charlescoverdale.github.io/ato/reference/ato_tax_expenditures.md),
[`ato_whm()`](https://charlescoverdale.github.io/ato/reference/ato_whm.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try(ato_division293(year = "2022-23"))
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "taxation-statistics-2022-23".
options(op)
# }
```
