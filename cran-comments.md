# CRAN submission comments — ato 0.1.0

## New submission

This is a new package providing R access to Australian Taxation
Office ('ATO') Taxation Statistics and related datasets via the
data.gov.au CKAN API. Coverage includes:

* Taxation Statistics (Individuals, Companies, Superannuation,
  Partnerships, Trusts, GST, FBT, Excise, Capital Gains)
* Corporate Tax Transparency (annual November/December release)
* Small Business Benchmarks
* Tax Gaps
* Research and Development Tax Incentive
* International Related Party Dealings

## R CMD check results

0 errors | 0 warnings | 0 notes

## Test suite

Network-dependent tests are wrapped in `skip_on_cran()` and
`skip_if_offline()`. An `ATO_LIVE_TESTS` environment variable
controls whether optional live-fetch tests run.

## Notes on data access

* All data sources are public and free.
* No authentication required.
* Downloaded data is cached to `tools::R_user_dir("ato", "cache")`
  on first use.
* `\donttest` examples redirect the cache to `tempdir()` via
  `options(ato.cache_dir = ...)` so no files are written to the
  user's home filespace.
* Data is published under Creative Commons Attribution 2.5
  Australia or 3.0 Australia (dataset-dependent).

## Downstream dependencies

None.
