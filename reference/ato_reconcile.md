# Reconcile an aggregate against Commonwealth budget totals

Compares a scalar (or data frame total) against the published Final
Budget Outcome figure for the same year and revenue line. Useful as a
sanity check on an ATO Taxation Statistics sum before reporting it in a
paper or brief.

## Usage

``` r
ato_reconcile(value, year, measure, sum_column = NULL)
```

## Arguments

- value:

  Numeric; the figure to check, in AUD (not AUD billions). An `ato_tbl`
  can also be passed: pass `sum_column` to pick which numeric column to
  sum.

- year:

  Financial year, e.g. `"2022-23"`.

- measure:

  One of the measure codes in `ato_crosswalk("budget")`, for example
  `"individuals_income_tax_net"`, `"company_tax_net"`, `"gst_net"`,
  `"fuel_excise_and_customs"`, `"taxation_receipts"`.

- sum_column:

  Column name to sum when `value` is a data frame. Default `NULL`
  (errors if multiple numeric columns exist).

## Value

A one-row data frame: `measure`, `year`, `value_aud`, `reference_aud`,
`diff_aud`, `pct_diff`, `source`. Emits a warning if
`abs(pct_diff) > 0.05`.

## Details

Discrepancies between ATO Taxation Statistics aggregates and the Final
Budget Outcome (FBO) are expected and meaningful:

- Taxation Statistics are based on assessments made by a cut-off date
  (usually October of the following calendar year) and may exclude
  late-lodging returns.

- FBO figures are cash-basis Commonwealth receipts; Taxation Statistics
  are accrual-basis tax assessed.

- GST, excise, and fuel credits have timing and refund effects that
  further distort the cash-vs-assessment gap.

A 1-3 per cent gap is consistent with the accrual-to-cash reconciliation
Treasury publishes in the FBO statement of revenues; larger gaps warrant
investigation. The bundled reference totals in
`inst/extdata/budget_reference_totals.csv` are read from the cash
receipts table of each Final Budget Outcome (2019-20 to 2025-26) by
`data-raw/budget_reference_totals.R`, with the edition and table cited
in the `source` column of each row.

## References

Commonwealth of Australia (various years). *Final Budget Outcome*. The
Treasury, Canberra. <https://budget.gov.au/content/fbo/index.htm>

Australian Bureau of Statistics (various years). *Taxation Revenue,
Australia*. Catalogue 5506.0.

Australian Taxation Office (annual). *Australian tax gaps – overview*,
methodology notes on accrual-vs-cash reconciliation.

## See also

Other harmonisation:
[`ato_crosswalk()`](https://charlescoverdale.github.io/ato/reference/ato_crosswalk.md),
[`ato_deflate()`](https://charlescoverdale.github.io/ato/reference/ato_deflate.md),
[`ato_harmonise()`](https://charlescoverdale.github.io/ato/reference/ato_harmonise.md),
[`ato_per_capita()`](https://charlescoverdale.github.io/ato/reference/ato_per_capita.md),
[`ato_schema_map()`](https://charlescoverdale.github.io/ato/reference/ato_schema_map.md),
[`ato_to_taxstats()`](https://charlescoverdale.github.io/ato/reference/ato_to_taxstats.md)

## Examples

``` r
ato_reconcile(value = 290e9,
              year = "2022-23",
              measure = "individuals_income_tax_net")
#>                      measure    year value_aud reference_aud   diff_aud
#> 1 individuals_income_tax_net 2022-23   2.9e+11   2.96658e+11 -6.658e+09
#>      pct_diff
#> 1 -0.02244335
#>                                                                    source
#> 1 Final Budget Outcome 2022-23, Table 1.3 (cash receipts), Outcome column
```
