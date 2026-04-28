# Industry aggregates across entity types

Derived helper that returns an ANZSIC industry breakdown based on either
individual, company, or all entities for the year.

## Usage

``` r
ato_industry(
  year = "latest",
  entity = c("company", "individual", "all"),
  anzsic = NULL
)
```

## Source

Australian Taxation Office Taxation Statistics. Licensed CC BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

- entity:

  One of `"individual"`, `"company"` (default), or `"all"`.

- anzsic:

  Optional substring filter on industry name.

## Value

An `ato_tbl`.

## See also

Other gst:
[`ato_gst()`](https://charlescoverdale.github.io/ato/reference/ato_gst.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  i <- ato_industry(year = "2022-23", entity = "company",
                    anzsic = "manufacturing")
  head(i)
})
#> Warning: Could not find "industry" column. Tried: "industry", "industry_description",
#> "broad_industry", and "anzsic_industry".
#> # ato_tbl: ATO industry 2022-23 (company)
#> # Source:   https://data.gov.au/data/organization/australiantaxationoffice
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-04-28 19:14 UTC 
#> # Snapshot: 2026-04-24
#> # Rows: 6  Cols: 3
#> 
#>                          taxation_statistics_2022_23
#> 1                                 Table 4: Companies
#> 2 Selected items, by industry2, 2022–23 income year1
#> 3                                               <NA>
#> 4                                             Notes:
#> 5                                               <NA>
#> 6                                               <NA>
#>                                                                                             
#> 1                                                                                       <NA>
#> 2                                                                                       <NA>
#> 3                                                                                       <NA>
#> 4                                                                                       <NA>
#> 5                                Totals may not equal the sum of components due to rounding.
#> 6 To meet privacy regulations, some items may be combined with other groups or not included.
#>    entity
#> 1 company
#> 2 company
#> 3 company
#> 4 company
#> 5 company
#> 6 company
options(op)
# }
```
