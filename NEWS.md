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
