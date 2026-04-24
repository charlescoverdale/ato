# ATO compliance program outcomes

Returns the ATO's annual compliance program outcomes: audit yield (tax
raised from audits), settled disputes, collectable debt, and compliance
cost recovery. These appear in the ATO annual report and related
data.gov.au releases.

## Usage

``` r
ato_compliance(year = "latest", metric = c("overview", "debt", "audit"))
```

## Source

Australian Taxation Office annual report data. Licensed CC BY 3.0 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

- metric:

  One of `"overview"` (default), `"debt"` (collectable vs insolvency vs
  disputed), or `"audit"` (liabilities raised by program area).

## Value

An `ato_tbl`.

## See also

Other specialist:
[`ato_division293()`](https://charlescoverdale.github.io/ato/reference/ato_division293.md),
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
try(ato_compliance(year = "2022-23", metric = "debt"))
#> Error in ato_compliance(year = "2022-23", metric = "debt") : 
#>   No compliance dataset found for metric "debt".
#> ℹ Try `ato_catalog()` to browse available datasets.
options(op)
# }
```
