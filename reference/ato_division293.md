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

  `"YYYY-YY"` or `"latest"`. Ignored.

## Value

Never returns; always aborts.

## Details

**Defunct.** Division 293 assessments are not published as a labelled
series in Taxation Statistics. There is no "Table 3b", and no Division
293 column appears in the Individuals or SuperFunds detailed tables of
the current release. Version 0.1.0 fell back to Individuals Table 3 (sex
by taxable status by age range by taxable income range) and labelled the
result "ATO Division 293", which was wrong.

It now aborts rather than mislabelling an unrelated table, and will be
removed in a future release.

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
try(ato_division293())
#> Error in ato_division293() : 
#>   Division 293 assessments are not published in Taxation Statistics.
#> ℹ No Division 293 column exists in the Individuals or SuperFunds tables.
#> ℹ Concessional contributions detail: `ato_individuals(year)` Tables 20 to 24
#>   via `ato_download()`.
#> ℹ See <https://www.ato.gov.au/about-ato/research-and-statistics/>
```
