# Tax Expenditures and Insights Statement (TEIS)

Returns the Treasury TEIS annual table of concession-by-concession tax
expenditure estimates in AUD millions. TEIS is the authoritative
cost-of-concessions dataset used in PBO and Grattan tax reform costings.

## Usage

``` r
ato_tax_expenditures(year = "latest")
```

## Source

Treasury Tax Expenditures and Insights Statement
<https://treasury.gov.au/tax-expenditures-insights-statement>.

## Arguments

- year:

  Reference year for the TEIS release, e.g. `"2024"` or `"latest"`.
  Treasury publishes one TEIS per calendar year.

## Value

An `ato_tbl` with one row per tax expenditure: label, category,
estimated revenue forgone in AUD millions by year.

## Details

TEIS is published by Treasury, not ATO; the function attempts a CKAN
search on data.gov.au for the TEIS release, and falls back to the
Treasury web URL if not indexed.

Key concessions covered: CGT main residence exemption, CGT 50% discount,
superannuation earnings tax concession, franking credit refundability,
work-related deductions, fuel tax credit scheme, R&D tax incentive, GST
food exemption, and many more.

## References

Commonwealth of Australia (annual). *Tax Expenditures and Insights
Statement*. The Treasury, Canberra.
<https://treasury.gov.au/tax-expenditures-insights-statement>

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
[`ato_whm()`](https://charlescoverdale.github.io/ato/reference/ato_whm.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try(head(ato_tax_expenditures("latest")))
#> Error in ato_tax_expenditures("latest") : 
#>   TEIS not found on data.gov.au.
#> ℹ Fetch manually from <https://treasury.gov.au/publication/tax-expenditures>
#> ℹ then pass the URL to `ato_download()`.
options(op)
# }
```
