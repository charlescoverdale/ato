# Working Holiday Maker tax data (not available)

**Defunct.** The ATO does not publish Working Holiday Maker aggregates
as open data. No resource matching working holiday makers, WHM or
backpackers exists in any ATO package on data.gov.au, in the current
Taxation Statistics release or in the archived ones. This function was
shipped in 0.1.0 on the assumption that such a table existed; it never
returned WHM data.

## Usage

``` r
ato_whm(year = "latest")
```

## Source

Australian Taxation Office Taxation Statistics. Licensed CC BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`. Ignored.

## Value

Never returns; always aborts.

## Details

It now aborts with a pointer to the published source rather than
resolving to an unrelated table. It will be removed in a future release.

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
try(ato_whm())
#> Error in ato_whm() : 
#>   Working Holiday Maker aggregates are not published as open data.
#> ℹ No ATO package on data.gov.au contains a WHM resource.
#> ℹ See <https://www.ato.gov.au/about-ato/research-and-statistics/>
#> ℹ Use `ato_individuals(year)` for all-individuals aggregates.
```
