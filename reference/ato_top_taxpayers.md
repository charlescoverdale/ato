# Corporate Tax Transparency

Returns the ATO's annual Corporate Tax Transparency release, mandated by
Part 5-25 of the *Taxation Administration Act 1953*. Covers every
Australian public company, foreign-owned company, or Australian-owned
private company above the AUD 100 million total-income threshold (the
private-company threshold was lowered from AUD 200 million to AUD 100
million for the 2022-23 income year onwards, making all three categories
uniform). The 2023-24 release was published 1 October 2025 and covered
4,110 entities.

## Usage

``` r
ato_top_taxpayers(
  year = "latest",
  entity_type = c("all", "public", "private", "foreign"),
  sheet = c("income_tax", "prrt")
)
```

## Source

Australian Taxation Office Corporate Tax Transparency release. Licensed
CC BY 3.0 AU.

## Arguments

- year:

  `"YYYY-YY"` (e.g. `"2023-24"`) or `"latest"`.

- entity_type:

  One of `"all"` (default), `"public"`, `"private"`, or `"foreign"`.
  Matches the CTT `Entity type` column values `"Australian public"`,
  `"Australian private"`, `"Foreign-owned"`.

- sheet:

  One of `"income_tax"` (default, the ~4,000-entity income-tax sheet) or
  `"prrt"` (petroleum resource rent tax filers, typically 10-20
  entities).

## Value

An `ato_tbl` with one row per disclosed entity. All monetary values are
nominal AUD of the reporting year.

## Details

The underlying XLSX has three sheets:

- **Information** (cover/metadata, ~7 rows).

- **Income tax details** (the headline dataset, ~4,000 entities: total
  income, taxable income, tax payable).

- **PRRT details** (petroleum resource rent tax filers, typically 10-20
  entities).

Licensed under **CC BY 3.0 Australia** (the Corporate Tax Transparency
and Voluntary Tax Transparency Code releases use CC BY 3.0 AU; most
other Taxation Statistics use CC BY 2.5 AU).

## References

Commonwealth of Australia. *Taxation Administration Act 1953*, Part 5-25
(Corporate Tax Transparency).

Australian Taxation Office (annual). *Report of entity tax information*.
The statutory Corporate Tax Transparency release.

Commonwealth Treasury (2013). *Improving the transparency of Australia's
business tax system: Exposure draft explanatory memorandum*. Rationale
for the Part 5-25 regime.

## See also

Other discovery:
[`ato_catalog()`](https://charlescoverdale.github.io/ato/reference/ato_catalog.md),
[`ato_charities()`](https://charlescoverdale.github.io/ato/reference/ato_charities.md),
[`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md),
[`ato_download()`](https://charlescoverdale.github.io/ato/reference/ato_download.md),
[`ato_excise()`](https://charlescoverdale.github.io/ato/reference/ato_excise.md),
[`ato_fbt()`](https://charlescoverdale.github.io/ato/reference/ato_fbt.md),
[`ato_help()`](https://charlescoverdale.github.io/ato/reference/ato_help.md),
[`ato_irpd()`](https://charlescoverdale.github.io/ato/reference/ato_irpd.md),
[`ato_payg()`](https://charlescoverdale.github.io/ato/reference/ato_payg.md),
[`ato_rdti()`](https://charlescoverdale.github.io/ato/reference/ato_rdti.md),
[`ato_sme_benchmarks()`](https://charlescoverdale.github.io/ato/reference/ato_sme_benchmarks.md),
[`ato_tax_gaps()`](https://charlescoverdale.github.io/ato/reference/ato_tax_gaps.md),
[`ato_vttc()`](https://charlescoverdale.github.io/ato/reference/ato_vttc.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  top <- ato_top_taxpayers(year = "2023-24")
  head(top)
  # Petroleum resource rent tax sheet
  prrt <- ato_top_taxpayers(year = "2023-24", sheet = "prrt")
  head(prrt)
})
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "corporate-transparency".
options(op)
# }
```
