# CRAN submission comments: ato 0.1.0

## New submission

First public release. Provides R access to Australian Taxation
Office (ATO) public datasets via the data.gov.au Comprehensive
Knowledge Archive Network (CKAN) API, plus related Treasury,
ABS, RBA, and OECD tax-system reference data.

### Scope

* Taxation Statistics: Individuals (snapshot + 6 tables +
  postcode / occupation / age / sex / state cuts), Companies
  (9 tables), Superannuation (APRA + SMSF), GST, Excise,
  Capital Gains, Medicare Levy, Division 293, Petroleum
  Resource Rent Tax, Fuel Tax Credits, Working Holiday Maker.
* Corporate Tax Transparency (income tax + PRRT sheets).
* Small Business Benchmarks.
* Tax Gaps.
* Research and Development Tax Incentive.
* International Related Party Dealings.
* Study and Training Support Loans (HELP / AASL / VSL).
* ATO compliance activity.
* Treasury Tax Expenditures and Insights Statement.

### Reproducibility spine

Every returned `ato_tbl` carries provenance attributes
(source URL, CC licence, retrieval time, title, SHA-256
digest, snapshot date). The package ships:

* `ato_snapshot()`: pin a session vintage.
* `ato_sha256()` + sidecar verification on every cache hit.
* `ato_manifest()`: session registry of every fetch, exportable
  as data frame, YAML, JSON, or CSV for paper appendices.
* `ato_deposit_zenodo()`: stage a Zenodo deposit payload (dry
  run by default).
* `ato_cite()`: citation helper, text / BibTeX / APA.

### Harmonisation and reconciliation

Bundled crosswalks (ANZSIC 2006 to 2020, ANZSCO 2013 to 2021,
postcode-state, ABS CPI, ABS ERP, Final Budget Outcome totals),
plus `ato_harmonise()`, `ato_reconcile()`, `ato_deflate()`,
`ato_per_capita()`.

### Interop

`ato_to_taxstats()` / `ato_schema_map()` bridge to Hugh
Parsonage's `taxstats` 2 per cent microdata sample schema. A
vignette shows end-to-end interop with the CRAN-resident
`grattan` policy calculator.

## R CMD check results

0 errors | 0 warnings | 0 notes on Mac ARM64, R 4.5.2.

## Test suite

Network-dependent tests are wrapped in `skip_on_cran()` and a
custom `skip_if_offline()`. An `ATO_LIVE_TESTS` environment
variable controls whether optional live-fetch tests run.

## Notes on data access

* All data sources are public and free. No authentication
  required.
* Downloaded data is cached to `tools::R_user_dir("ato", "cache")`
  on first use.
* `\donttest` examples redirect the cache to `tempdir()` via
  `options(ato.cache_dir = ...)` so no files are written to
  the user's home filespace.
* Data is published under Creative Commons Attribution 2.5
  Australia for most Taxation Statistics tables, and 3.0
  Australia for Corporate Tax Transparency and the Voluntary
  Tax Transparency Code.
* Data.gov.au CKAN API returns are parsed via `httr2` +
  `jsonlite`.
* Taxation Statistics XLSX tables parsed via `readxl` with
  auto header-row detection.

## Downstream dependencies

None.
