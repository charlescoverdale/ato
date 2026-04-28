# Fuel Tax Credits by industry and claim period

Returns the Fuel Tax Credits scheme data: entitlement rates by fuel
type, claim totals by industry. FTC is a major implicit fossil-fuel
subsidy and is a key lens for decarbonisation policy cost-benefit
analysis.

## Usage

``` r
ato_fuel_tax_credits(year = "latest", by = c("industry", "fuel", "period"))
```

## Source

Australian Taxation Office Excise and Fuel Tax Credit data. Licensed CC
BY 3.0 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

- by:

  One of `"industry"` (default, by ANZSIC division), `"fuel"` (by fuel
  type), or `"period"` (quarterly rates).

## Value

An `ato_tbl`.

## Details

The ATO publishes FTC data as part of the Excise Data release and in
standalone FTC tables.

## References

Commonwealth of Australia. *Fuel Tax Act 2006*; *Fuel Tax (Consequential
and Transitional Provisions) Act 2006*.

Denniss, R. and Grudnoff, M. (2021). *Fossil fuel subsidies in
Australia*. The Australia Institute. FTC-as- subsidy framing used in
decarbonisation policy analysis.

Intergovernmental Panel on Climate Change (2022). *Climate Change 2022:
Mitigation of Climate Change*. Chapter 13 covers fossil-fuel subsidy
reform.

## See also

Other specialist:
[`ato_compliance()`](https://charlescoverdale.github.io/ato/reference/ato_compliance.md),
[`ato_division293()`](https://charlescoverdale.github.io/ato/reference/ato_division293.md),
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
try(head(ato_fuel_tax_credits(year = "latest", by = "industry")))
#> Error in ato_ckan_resolve(ATO_PACKAGE_IDS$excise, pattern) : 
#>   No resource in "excise-data" matches
#> "fuel.*(credit|ftc).*industry|ftc.*industry".
#> ℹ Available: "Spirits and other excisable beverage clearances", "Historical
#>   Excise Rates", "Historical FTC rates", and "Beer Clearance Summary Data"
options(op)
# }
```
