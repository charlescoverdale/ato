# ato 0.1.1 (in development)

Policy-audit patch release. Fixes three defects that produced
silently wrong answers and adds one new helper.

## Bug fixes

* `ato_fetch_csv()` and `ato_fetch_xlsx()` now coerce the ATO's
  confidentiality-suppression tokens (`np`, `n.p.`, `*`, double
  dagger, etc.) to `NA`. Previously these stayed as character
  strings, silently coercing whole numeric columns to character
  and breaking `sum(..., na.rm = TRUE)`. The full token list is
  in the internal `ATO_SUPPRESSION_TOKENS` vector.
* `ato_top_taxpayers(entity_type = "private")` regex fixed. The
  prior `"private|australian.owned"` pattern contained a dead
  alternative because the Corporate Tax Transparency data uses
  the label "Australian private", not "Australian-owned". The
  package now correctly returns private-company rows.
* `ato_individuals(table = "all")` removed. The docstring
  claimed to concatenate all per-year Individuals tables; the
  implementation fell through `ato_ckan_resolve` which returns
  only the first match. Users wanting detailed tables should
  use the dedicated functions (postcode, occupation) or
  `ato_download()` with a custom pattern.
* `ato_individuals_occupation(sex = ...)` now matches full
  tokens (`"male"`, `"female"`) rather than first-letter prefix,
  and short forms `"m"`/`"f"` are normalised internally. The
  prior prefix match silently dropped rows labelled
  `"Not stated"`.

## New features

* `ato_top_taxpayers(sheet = "prrt")` exposes the Petroleum
  Resource Rent Tax sheet in the Corporate Tax Transparency
  XLSX. The default `sheet = "income_tax"` retains v0.1.0
  behaviour.
* `ato_cite(x)` produces a citation for any `ato_tbl` or URL in
  plain-text (default), BibTeX, or APA style. Includes the
  source URL, CC licence, retrieval date, and dataset title
  from the `ato_tbl` provenance attributes.

## Documentation

* New package-level caveats section covering nominal AUD,
  fiscal year convention (1 July to 30 June), confidentiality
  suppression, schema drift, ANZSIC and ANZSCO classification
  migrations, silent CKAN revisions, and microdata scope.
* `ato_top_taxpayers` now documents the AUD 100 million
  threshold (lowered from 200 million for private entities from
  2022-23 onwards) and the Part 5-25 *Taxation Administration
  Act 1953* statutory basis.
* `ato_individuals_postcode` documents the 50-return privacy
  suppression threshold.
* `ato_individuals_occupation` documents the ANZSCO 2013 to
  ANZSCO 2021 migration.

# ato 0.1.0

Initial CRAN submission. First public release.

## New functions

### Discovery

* `ato_catalog()`: list all ATO datasets on data.gov.au with their
  resources, licences, and modification dates.
* `ato_download()`: generic resource downloader with local cache.

### Individuals

* `ato_individuals()`: Taxation Statistics Individual snapshot
  (Table 1) or selected detailed tables.
* `ato_individuals_postcode()`: individual tax return items by
  postcode and state (Individuals Table 6).
* `ato_individuals_occupation()`: individual tax return items by
  occupation, sex, and income range (Individuals Table 14).

### Companies and superannuation

* `ato_companies()`: Company Taxation Statistics by industry
  (ANZSIC), entity type, and turnover band.
* `ato_super_funds()`: APRA-regulated superannuation fund and
  Self-Managed Superannuation Fund ('SMSF') aggregates.

### Other entities and aggregates

* `ato_top_taxpayers()`: Corporate Tax Transparency release
  (annual November/December).
* `ato_gst()`: Goods and Services Tax Taxation Statistics and
  Activity Statement Ratios.
* `ato_industry()`: industry-level aggregates derived from
  Individual and Company tables.

### Cache management

* `ato_cache_info()`: inspect the local cache.
* `ato_clear_cache()`: clear locally cached files.

## Data source

Data is published by the Australian Taxation Office on data.gov.au
and ato.gov.au. Most Taxation Statistics datasets are licensed
under Creative Commons Attribution 2.5 Australia; Corporate Tax
Transparency and the Voluntary Tax Transparency Code are licensed
under Creative Commons Attribution 3.0 Australia. All downloads
are cached locally on first use.
