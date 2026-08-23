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

  `"YYYY-YY"` or `"latest"`. Applies to `by = "industry"` only; the
  rates file is a single all-years workbook.

- by:

  One of `"industry"` (default, claim totals by ANZSIC division, from
  Taxation Statistics), `"fuel"` or `"period"` (both return the
  historical entitlement-rate schedule by fuel type, from Excise Data).

## Value

An `ato_tbl`.

## Details

FTC data lives in two different places and this function routes between
them. Claim totals by industry are an Excise table inside the annual
Taxation Statistics release (`tsNNexcise04ftcbyindustryyear.xlsx`).
Entitlement rates are in the separate, more frequently updated Excise
Data package (`historical-ftc-rates-*.xlsx`, rates by fuel type back to
2006). Earlier versions looked for both in Excise Data, where the
industry table has never been published.

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
#> ℹ Downloading <https://data.gov.au/data/dataset/faea4485-f407-457d-97f8-3f0822c…
#> ✔ Downloading <https://data.gov.au/data/dataset/faea4485-f407-457d-97f8-3f0822c…
#> 
#> # ato_tbl: ATO fuel tax credits latest (industry)
#> # Source:   https://data.gov.au/data/dataset/faea4485-f407-457d-97f8-3f0822ccd654/resource/c12e48ca-4b65-499c-8455-a3ced570e800/download/ts24excise04ftcbyindustryyear.xlsx
#> # Licence:  CC BY 3.0 AU
#> # Retrieved: 2026-08-23 17:35 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  70fd11f4cb4bdf94...
#> # Rows: 6  Cols: 6
#> 
#>   financial_year1                      broad_industry2
#> 1         2006–07 a. Agriculture, Forestry and Fishing
#> 2         2006–07 a. Agriculture, Forestry and Fishing
#> 3         2006–07 a. Agriculture, Forestry and Fishing
#> 4         2006–07 a. Agriculture, Forestry and Fishing
#> 5         2006–07 a. Agriculture, Forestry and Fishing
#> 6         2006–07 a. Agriculture, Forestry and Fishing
#>                             fine_industry2 claims_no entities_no    claims
#> 1  011 Nursery and Floriculture Production      2270          na   3772888
#> 2       012 Mushroom and Vegetable Growing      9505          na  28806433
#> 3           013 Fruit and Tree Nut Growing     20060          na  25647865
#> 4 014 Sheep, Beef Cattle and Grain Farming    156510          na 307332381
#> 5                   015 Other Crop Growing     16400          na  64401162
#> 6                 016 Dairy Cattle Farming     25160          na  31727049
options(op)
# }
```
