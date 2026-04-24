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
#> Error in ato_ckan_package(package_id) : 
#>   Package not found: "higher-education-loan-program-help".
options(op)
# }
```
