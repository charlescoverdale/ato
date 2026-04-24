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
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "taxation-statistics-2022-23".
options(op)
# }
```
