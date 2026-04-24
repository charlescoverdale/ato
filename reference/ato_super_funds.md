# Superannuation fund aggregates

Returns Taxation Statistics Super Funds tables or Self-Managed
Superannuation Fund ('SMSF') aggregates, depending on `type`.

## Usage

``` r
ato_super_funds(year = "latest", type = c("apra", "smsf", "all"))
```

## Source

Australian Taxation Office Taxation Statistics Super Funds tables + SMSF
statistical overview. Licensed CC BY 2.5 AU.

## Arguments

- year:

  `"YYYY-YY"` or `"latest"`.

- type:

  One of `"apra"` (APRA-regulated funds, default), `"smsf"` (SMSF
  statistical overview), or `"all"`.

## Value

An `ato_tbl`.

## References

Australian Taxation Office (annual). *Taxation Statistics: Super funds
and SMSF explanatory notes*. Distinguishes reporting populations:
APRA-regulated large funds, SMSFs, and Pooled Superannuation Trusts.

Australian Prudential Regulation Authority (annual). *Annual
Superannuation Bulletin*. Complementary APRA-regulated fund statistics.

Commonwealth of Australia. *Superannuation Industry (Supervision) Act
1993* (SIS Act); *Superannuation Guarantee (Administration) Act 1992*
(SGAA).

Productivity Commission (2018). *Superannuation: Assessing Efficiency
and Competitiveness*. Inquiry report.

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  s <- ato_super_funds(year = "2022-23", type = "apra")
  head(s)
})
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "taxation-statistics-2022-23".
options(op)
# }
```
