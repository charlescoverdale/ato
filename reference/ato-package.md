# ato: Australian Taxation Office Data

Tidy R access to Australian Taxation Office ('ATO') Taxation Statistics
and related datasets via the 'data.gov.au' CKAN API.

## Main function families

- [`ato_catalog()`](https://charlescoverdale.github.io/ato/reference/ato_catalog.md),
  [`ato_download()`](https://charlescoverdale.github.io/ato/reference/ato_download.md):
  discovery and generic resource access.

- [`ato_individuals()`](https://charlescoverdale.github.io/ato/reference/ato_individuals.md),
  [`ato_individuals_postcode()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_postcode.md),
  [`ato_individuals_occupation()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_occupation.md):
  individual tax return items.
  [`ato_individuals_postcode()`](https://charlescoverdale.github.io/ato/reference/ato_individuals_postcode.md)
  accepts a vector of years for time-series panels.

- [`ato_companies()`](https://charlescoverdale.github.io/ato/reference/ato_companies.md):
  company tax across Tables 1-9 (snapshot, by size, by entity type, by
  industry, by industry-and-size, by sub-industry, by taxable status, by
  source, by expenses).

- [`ato_super_funds()`](https://charlescoverdale.github.io/ato/reference/ato_super_funds.md):
  APRA-regulated super funds and SMSFs.

- [`ato_top_taxpayers()`](https://charlescoverdale.github.io/ato/reference/ato_top_taxpayers.md):
  Corporate Tax Transparency release (Income tax or PRRT sheet).

- [`ato_gst()`](https://charlescoverdale.github.io/ato/reference/ato_gst.md),
  [`ato_industry()`](https://charlescoverdale.github.io/ato/reference/ato_industry.md):
  GST and industry aggregates.

- [`ato_tax_gaps()`](https://charlescoverdale.github.io/ato/reference/ato_tax_gaps.md):
  annual Tax Gap estimates across tax heads.

- [`ato_rdti()`](https://charlescoverdale.github.io/ato/reference/ato_rdti.md):
  Research and Development Tax Incentive claimants.

- [`ato_irpd()`](https://charlescoverdale.github.io/ato/reference/ato_irpd.md):
  International Related Party Dealings (BEPS / transfer pricing).

- [`ato_excise()`](https://charlescoverdale.github.io/ato/reference/ato_excise.md):
  excise rates, fuel tax credits, beer and spirits clearances.

- [`ato_sme_benchmarks()`](https://charlescoverdale.github.io/ato/reference/ato_sme_benchmarks.md):
  Small Business Benchmarks.

- [`ato_help()`](https://charlescoverdale.github.io/ato/reference/ato_help.md):
  HELP / AASL / VSL student-loan statistics.

- [`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md):
  citation helper (BibTeX, APA, plain text).

- [`ato_cache_info()`](https://charlescoverdale.github.io/ato/reference/ato_cache_info.md),
  [`ato_clear_cache()`](https://charlescoverdale.github.io/ato/reference/ato_clear_cache.md):
  cache management.

## Caveats for users of ATO data

**Nominal AUD.** All monetary values are in nominal Australian dollars
of the reporting year. Use `inflateR::inflate()` or ABS CPI series for
real-term comparisons across years.

**Fiscal year convention.** `"2022-23"` refers to the Australian income
year from 1 July 2022 to 30 June 2023.

**Confidentiality suppression.** The ATO replaces values with `"np"`
(not published), `"*"`, `"\u2021"`, or similar tokens when fewer than
ten taxpayers (or fewer than 50 returns for postcode data) fall in a
cell. The package coerces these to `NA` so numeric columns stay numeric.
Summing a column with `na.rm = TRUE` is the correct default; be explicit
about what you do with suppressed cells in any distributional analysis.

**Schema drift.** Column names and table numbering shift year-to-year
(e.g. occupation data has been T13, T14, T15 in different years). The
package cleans names to snake_case on ingestion but does not normalise
schemas across years. A cross-year join requires explicit column
mapping.

**Classification migration.** ANZSIC 2006 to ANZSIC 2020 and ANZSCO 2013
to ANZSCO 2021 recodes affect industry and occupation series. Users
stacking across releases should inspect the classification version used
in each release.

**Silent revisions.** CKAN `metadata_modified` timestamps change without
a version bump when the ATO republishes a corrected file. Run
[`ato_clear_cache()`](https://charlescoverdale.github.io/ato/reference/ato_clear_cache.md)
to force a refresh.

**Microdata is out of scope.** The 2% Individual Sample File is
distributed separately through Hugh Parsonage's
[taxstats](https://github.com/HughParsonage/taxstats) DRAT repo. ALife
(the ATO Longitudinal Information Files) is restricted-access microdata
via the ATO DataLab and requires a researcher application; it is not
provided by this package.

**Citation.** Use
[`ato_cite()`](https://charlescoverdale.github.io/ato/reference/ato_cite.md)
on any returned `ato_tbl` to produce a Treasury-grade footnote, APA
reference, or BibTeX entry with the source URL, licence, retrieval date,
and title.

## Data source

Taxation Statistics are published annually by the ATO on
<https://www.ato.gov.au/about-ato/research-and-statistics/> and mirrored
at <https://data.gov.au/data/organization/australiantaxationoffice>.
Most datasets are licensed under Creative Commons Attribution 2.5
Australia; Corporate Tax Transparency and the Voluntary Tax Transparency
Code are CC BY 3.0 Australia.

## See also

Useful links:

- <https://charlescoverdale.github.io/ato/>

- <https://github.com/charlescoverdale/ato>

- Report bugs at <https://github.com/charlescoverdale/ato/issues>

## Author

**Maintainer**: Charles Coverdale <charlesfcoverdale@gmail.com>
