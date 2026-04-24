# Company Taxation Statistics

Returns the annual Company Taxation Statistics tables. The Company
release ships tables covering entity type, turnover band, industry,
taxable status, source of income, and expense deductions. Pick the table
that matches your question:

## Usage

``` r
ato_companies(
  year = "latest",
  table = c("industry", "snapshot", "key_items_by_size", "entity_type",
    "industry_by_size", "sub_industry", "taxable_status", "source", "expenses"),
  industry = NULL
)
```

## Source

Australian Taxation Office Taxation Statistics Company Tables. Licensed
CC BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"`, `"latest"`, or a vector of years for a multi-year panel.
  Multi-year requests add a `year` column.

- table:

  One of `"snapshot"`, `"key_items_by_size"`, `"entity_type"`,
  `"industry"` (default), `"industry_by_size"`, `"sub_industry"`,
  `"taxable_status"`, `"source"`, or `"expenses"`.

- industry:

  Optional substring filter on industry name (applied only when the
  fetched table has an industry column).

## Value

An `ato_tbl`. Monetary values in nominal AUD of the reporting year.

## Details

- **snapshot** (T1): aggregate counts, total income, net tax across all
  companies (~1m entities)

- **key_items_by_size** (T2): net tax by company size band

- **entity_type** (T3): split by public/private/co-operative

- **industry** (T4, default): key items by 2-digit ANZSIC subdivision

- **industry_by_size** (T5): industry x turnover band

- **sub_industry** (T6): 4-digit ANZSIC class detail

- **taxable_status** (T7): items by taxable status

- **source** (T8): source of income

- **expenses** (T9): expense and deduction categories

**Classification break.** Releases from 2022-23 onwards use ANZSIC 2020;
earlier releases use ANZSIC 2006. A warning is emitted when the
requested year(s) are at or after this boundary, or when a multi-year
request spans it.

## References

Australian Taxation Office (annual). *Taxation Statistics: Company
tables explanatory notes*. Methodology notes on lodgement cut-off,
entity-type definitions, and turnover-band thresholds. Accessible from
<https://www.ato.gov.au/about-ato/research-and-statistics/in-detail/taxation-statistics/>.

Australian Bureau of Statistics (2020). *Australian and New Zealand
Standard Industrial Classification (ANZSIC)*, 2006 revision with 2020
update. Catalogue 1292.0.

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  s <- ato_companies(year = "2022-23", table = "snapshot")
  head(s)
  m <- ato_companies(year = "2022-23", industry = "mining")
  head(m)
  # Multi-year industry panel
  panel <- ato_companies(year = c("2021-22", "2022-23"))
})
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "taxation-statistics-2022-23".
options(op)
# }
```
