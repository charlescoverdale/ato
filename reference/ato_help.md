# Study and Training Support Loan data (HELP, AASL, VSL)

Returns aggregate statistics on Australia's three main education-loan
schemes:

- **HELP** (Higher Education Loan Program, ~3m borrowers, AUD 80bn+
  outstanding debt)

- **AASL** (Australian Apprenticeship Support Loans, previously Trade
  Support Loans)

- **VSL** (VET Student Loans, vocational education loans)

## Usage

``` r
ato_help(scheme = c("help", "aasl", "vsl"))
```

## Source

Australian Taxation Office Study and Training Support Loans statistics.
Licensed CC BY 2.5 AU.

## Arguments

- scheme:

  One of `"help"` (default), `"aasl"`, or `"vsl"`.

## Value

An `ato_tbl`. All dollar values in nominal AUD.

## Details

Headline covers: new loans by income range, outstanding debt by age and
gender, repayment rates, median debt on entry. Used by Treasury (PBO
costings of HELP indexation changes) and education policy researchers.

## References

Commonwealth of Australia. *Higher Education Support Act 2003*; *VET
Student Loans Act 2016*.

Australian Department of Education (annual). *Higher Education
Statistics: HELP statistics collection*.

Norton, A. and Cherastidtham, I. (2018). *Mapping Australian higher
education*. Grattan Institute. Methodology reference for HELP repayment
projections.

## See also

Other discovery:
[`ato_catalog()`](https://charlescoverdale.github.io/ato/reference/ato_catalog.md),
[`ato_charities()`](https://charlescoverdale.github.io/ato/reference/ato_charities.md),
[`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md),
[`ato_download()`](https://charlescoverdale.github.io/ato/reference/ato_download.md),
[`ato_excise()`](https://charlescoverdale.github.io/ato/reference/ato_excise.md),
[`ato_fbt()`](https://charlescoverdale.github.io/ato/reference/ato_fbt.md),
[`ato_irpd()`](https://charlescoverdale.github.io/ato/reference/ato_irpd.md),
[`ato_payg()`](https://charlescoverdale.github.io/ato/reference/ato_payg.md),
[`ato_rdti()`](https://charlescoverdale.github.io/ato/reference/ato_rdti.md),
[`ato_sme_benchmarks()`](https://charlescoverdale.github.io/ato/reference/ato_sme_benchmarks.md),
[`ato_tax_gaps()`](https://charlescoverdale.github.io/ato/reference/ato_tax_gaps.md),
[`ato_top_taxpayers()`](https://charlescoverdale.github.io/ato/reference/ato_top_taxpayers.md),
[`ato_vttc()`](https://charlescoverdale.github.io/ato/reference/ato_vttc.md)

## Examples

``` r
# \donttest{
op <- options(ato.cache_dir = tempdir())
try({
  help <- ato_help(scheme = "help")
  head(help)
})
#> ℹ Downloading <https://data.gov.au/data/dataset/ce4c58ec-c930-4a05-8a37-f244d96…
#> ✔ Downloading <https://data.gov.au/data/dataset/ce4c58ec-c930-4a05-8a37-f244d96…
#> 
#> # ato_tbl: ATO HELP statistics
#> # Source:   https://data.gov.au/data/dataset/ce4c58ec-c930-4a05-8a37-f244d960e5f8/resource/0661912a-d114-4155-8b42-63ab1417adea/download/help-statistics-2024-25.xlsx
#> # Licence:  CC BY 2.5 AU
#> # Retrieved: 2026-04-28 19:13 UTC 
#> # Snapshot: 2026-04-24
#> # SHA-256:  70c7ebc3840087c7...
#> # Rows: 6  Cols: 2
#> 
#>                         higher_education_loan_program
#> 1 HELP statistics, 2005–06 to 2024–25 financial years
#> 2                                                <NA>
#> 3                                              Notes:
#> 4                                                <NA>
#> 5                                                <NA>
#> 6                                                <NA>
#>                                                                                                                                     
#> 1                                                                                                                               <NA>
#> 2                                                                                                                               <NA>
#> 3                                                                                                                               <NA>
#> 4                                                   The symbol 'n/a' used in this publication means not applicable or not available.
#> 5                                                                        Totals may not equal the sum of components due to rounding.
#> 6 In order to meet privacy regulations, some items may not be included, or data for some groups may be aggregated with other groups.
options(op)
# }
```
