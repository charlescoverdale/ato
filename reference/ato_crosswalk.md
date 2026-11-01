# Load a bundled ATO crosswalk table

Returns one of the bundled classification crosswalks. Used internally by
[`ato_harmonise()`](https://charlescoverdale.github.io/ato/reference/ato_harmonise.md)
and available for user-level panel work.

## Usage

``` r
ato_crosswalk(name = c("anzsic", "anzsco", "postcode", "cpi", "erp", "budget"))
```

## Arguments

- name:

  One of `"anzsic"`, `"anzsco"`, `"postcode"`, `"cpi"`, `"erp"`,
  `"budget"`.

## Value

A data frame.

## Details

Bundled crosswalks (at division/major-group level):

- `"anzsic"`: ANZSIC 2006 to 2020 (19 divisions, complete)

- `"anzsco"`: ANZSCO 2013 to 2021 (8 major groups, complete)

- `"postcode"`: postcode first-digit to state anchors

- `"cpi"`: ABS CPI annual, base 2011-12 = 1.0

- `"erp"`: ABS Estimated Resident Population, June 30 annual

- `"budget"`: Final Budget Outcome reference totals

For 4-digit ANZSIC, 6-digit ANZSCO, or postcode-to-SA2/LGA/CED
crosswalks, fetch the full tables from ABS. The bundled
division/major-group level covers cross-year ATO Taxation Statistics
joins at the industry headings used in all ATO tables.

## References

Australian Bureau of Statistics (2006). *Australian and New Zealand
Standard Industrial Classification (ANZSIC)*. Catalogue 1292.0.

Australian Bureau of Statistics (2020). *ANZSIC 2006 Update*, cat.
1292.0, divisional structure. Used by ATO Taxation Statistics from
2022-23.

Australian Bureau of Statistics (2013). *Australian and New Zealand
Standard Classification of Occupations (ANZSCO)*. Catalogue 1220.0.

Australian Bureau of Statistics (2022). *ANZSCO Revised Edition*, cat.
1220.0. Used by ATO Taxation Statistics from 2022-23 onward.

## See also

Other harmonisation:
[`ato_deflate()`](https://charlescoverdale.github.io/ato/reference/ato_deflate.md),
[`ato_harmonise()`](https://charlescoverdale.github.io/ato/reference/ato_harmonise.md),
[`ato_per_capita()`](https://charlescoverdale.github.io/ato/reference/ato_per_capita.md),
[`ato_reconcile()`](https://charlescoverdale.github.io/ato/reference/ato_reconcile.md),
[`ato_schema_map()`](https://charlescoverdale.github.io/ato/reference/ato_schema_map.md),
[`ato_to_taxstats()`](https://charlescoverdale.github.io/ato/reference/ato_to_taxstats.md)

## Examples

``` r
ato_crosswalk("anzsic")
#>    anzsic_2006_code                               anzsic_2006_name
#> 1                 A               Agriculture Forestry and Fishing
#> 2                 B                                         Mining
#> 3                 C                                  Manufacturing
#> 4                 D       Electricity Gas Water and Waste Services
#> 5                 E                                   Construction
#> 6                 F                                Wholesale Trade
#> 7                 G                                   Retail Trade
#> 8                 H                Accommodation and Food Services
#> 9                 I               Transport Postal and Warehousing
#> 10                J       Information Media and Telecommunications
#> 11                K               Financial and Insurance Services
#> 12                L         Rental Hiring and Real Estate Services
#> 13                M Professional Scientific and Technical Services
#> 14                N            Administrative and Support Services
#> 15                O               Public Administration and Safety
#> 16                P                         Education and Training
#> 17                Q              Health Care and Social Assistance
#> 18                R                   Arts and Recreation Services
#> 19                S                                 Other Services
#>    anzsic_2020_code                               anzsic_2020_name relationship
#> 1                 A               Agriculture Forestry and Fishing   one-to-one
#> 2                 B                                         Mining   one-to-one
#> 3                 C                                  Manufacturing   one-to-one
#> 4                 D       Electricity Gas Water and Waste Services   one-to-one
#> 5                 E                                   Construction   one-to-one
#> 6                 F                                Wholesale Trade   one-to-one
#> 7                 G                                   Retail Trade   one-to-one
#> 8                 H                Accommodation and Food Services   one-to-one
#> 9                 I               Transport Postal and Warehousing   one-to-one
#> 10                J       Information Media and Telecommunications   one-to-one
#> 11                K               Financial and Insurance Services   one-to-one
#> 12                L         Rental Hiring and Real Estate Services   one-to-one
#> 13                M Professional Scientific and Technical Services   one-to-one
#> 14                N            Administrative and Support Services   one-to-one
#> 15                O               Public Administration and Safety   one-to-one
#> 16                P                         Education and Training   one-to-one
#> 17                Q              Health Care and Social Assistance   one-to-one
#> 18                R                   Arts and Recreation Services   one-to-one
#> 19                S                                 Other Services   one-to-one
ato_crosswalk("cpi")
#>    financial_year cpi_all_groups_australia base_2011_12
#> 1         1994-95                     63.4        0.634
#> 2         1995-96                     66.1        0.661
#> 3         1996-97                     67.0        0.670
#> 4         1997-98                     66.9        0.669
#> 5         1998-99                     67.8        0.678
#> 6         1999-00                     69.4        0.694
#> 7         2000-01                     73.6        0.736
#> 8         2001-02                     75.7        0.757
#> 9         2002-03                     78.0        0.780
#> 10        2003-04                     79.9        0.799
#> 11        2004-05                     81.8        0.818
#> 12        2005-06                     84.4        0.844
#> 13        2006-07                     86.9        0.869
#> 14        2007-08                     89.8        0.898
#> 15        2008-09                     92.6        0.926
#> 16        2009-10                     94.8        0.948
#> 17        2010-11                     97.7        0.977
#> 18        2011-12                    100.0        1.000
#> 19        2012-13                    102.2        1.022
#> 20        2013-14                    105.0        1.050
#> 21        2014-15                    106.8        1.068
#> 22        2015-16                    108.3        1.083
#> 23        2016-17                    110.1        1.101
#> 24        2017-18                    112.3        1.123
#> 25        2018-19                    114.1        1.141
#> 26        2019-20                    115.7        1.157
#> 27        2020-21                    117.5        1.175
#> 28        2021-22                    122.8        1.228
#> 29        2022-23                    131.4        1.314
#> 30        2023-24                    136.9        1.369
#> 31        2024-25                    140.2        1.402
#> 32        2025-26                    145.4        1.454
```
