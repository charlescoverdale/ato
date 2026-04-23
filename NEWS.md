# ato 0.1.0

Initial CRAN submission. First public release.

## Data-access functions

### Discovery

* `ato_catalog()`: list all ATO datasets on data.gov.au with their
  resources, licences, and modification dates.
* `ato_download()`: generic resource downloader with local cache.

### Individuals

* `ato_individuals()`: Taxation Statistics Individual snapshot
  (Table 1).
* `ato_individuals_postcode()`: individual tax return items by
  postcode and state (Individuals Table 6). Accepts a vector of
  years (e.g. `year = 2018:2022`) and returns a stacked panel
  with a `year` column.
* `ato_individuals_occupation()`: individual tax return items by
  occupation (ANZSCO), sex, and income range.

### Companies and superannuation

* `ato_companies()`: Company Taxation Statistics across all nine
  Company Tables via `table = ...`: snapshot, key_items_by_size,
  entity_type, industry (default), industry_by_size,
  sub_industry, taxable_status, source, expenses.
* `ato_super_funds()`: APRA-regulated superannuation fund and
  Self-Managed Superannuation Fund ('SMSF') aggregates.

### Other entities, transparency, and aggregates

* `ato_top_taxpayers()`: Corporate Tax Transparency release with
  sheet switch between `income_tax` and `prrt` (Petroleum
  Resource Rent Tax filers).
* `ato_gst()`: Goods and Services Tax tables and Activity
  Statement Ratios.
* `ato_industry()`: industry-level aggregates derived from
  Individual and Company tables.

### Integrity, incentives, and international

* `ato_tax_gaps()`: annual Tax Gap estimates across tax heads
  (individuals, small business, large corporate, GST, excise,
  PRRT, superannuation guarantee). Treasury cites this series in
  every MYEFO.
* `ato_rdti()`: Research and Development Tax Incentive
  claimants, expenditure, and offset data.
* `ato_irpd()`: International Related Party Dealings across
  annual packages from 2019-20 (Table 1 totals, Table 2 by
  jurisdiction, Table 3 chart-data index). Core BEPS and
  transfer-pricing dataset.

### Excise, small business, and education loans

* `ato_excise()`: excise rate schedule, Fuel Tax Credit rates,
  beer clearances, and spirits and other excisable beverages.
* `ato_sme_benchmarks()`: Small Business Benchmarks
  (industry-specific cost-to-turnover and related ratios).
* `ato_help()`: Study and Training Support Loan statistics
  covering HELP (around 3 million borrowers, AUD 80 billion-plus
  outstanding debt), AASL (Australian Apprenticeship Support
  Loans), and VSL (VET Student Loans).

### Utilities

* `ato_cite()`: citation helper producing plain text, BibTeX, or
  APA output from an `ato_tbl` or URL.
* `ato_cache_info()`, `ato_clear_cache()`: cache management.

## Data handling

* ATO confidentiality-suppression tokens (`np`, `n.p.`, `*`, and
  others) are coerced to `NA` by both `ato_fetch_csv()` and
  `ato_fetch_xlsx()` so numeric columns stay numeric.
* XLSX header auto-detection: scans up to 15 rows to find the
  column-header row, handling ATO workbooks that lead with a
  title, narrative, or Notes sheet.
* Every returned `ato_tbl` carries provenance attributes (source
  URL, CC licence, retrieval time, title) exposed via `print()`
  and `ato_cite()`.

## Data source

Data is published by the Australian Taxation Office on
data.gov.au and ato.gov.au. Most Taxation Statistics datasets
are licensed under Creative Commons Attribution 2.5 Australia;
Corporate Tax Transparency and the Voluntary Tax Transparency
Code are licensed under Creative Commons Attribution 3.0
Australia. All downloads are cached locally on first use.
