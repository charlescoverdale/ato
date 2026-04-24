# Print an ato_tbl

Prints a provenance header (title, source, licence, retrieval time,
dimensions) followed by the data frame.

## Usage

``` r
# S3 method for class 'ato_tbl'
print(x, ...)
```

## Arguments

- x:

  An `ato_tbl` object.

- ...:

  Passed to the next print method.

## Value

Invisibly returns `x`.

## Examples

``` r
x <- data.frame(postcode = "2000", taxable_income = 82000)
x <- structure(x, ato_title = "Demo", ato_source = "https://data.gov.au",
               ato_licence = "CC BY 2.5 AU", ato_retrieved = Sys.time(),
               class = c("ato_tbl", "data.frame"))
print(x)
#> # ato_tbl: Demo
#> # Source:   https://data.gov.au
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-04-24 13:49 UTC 
#> # Rows: 1  Cols: 2
#> 
#>   postcode taxable_income
#> 1     2000          82000
```
