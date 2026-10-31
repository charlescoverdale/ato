# CRAN submission comments: ato 0.1.2

## Reason for this submission

Data-correctness release. Three bundled reference tables (CPI,
population and Commonwealth budget totals) did not match the official
sources they cite. They are rebuilt from those sources and extended to
the latest year. Results of the deflation, per-capita and reconciliation
helpers change accordingly; see NEWS.md.

## R CMD check results

0 errors | 0 warnings | 0 notes (CRAN settings, R 4.5.2, macOS).

Network tests are skipped on CRAN, and network examples are wrapped in
`try()` inside `\donttest{}`.

## Downstream dependencies

None on CRAN.
