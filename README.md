# ato

[![CRAN status](https://www.r-pkg.org/badges/version/ato)](https://CRAN.R-project.org/package=ato) [![CRAN downloads](https://cranlogs.r-pkg.org/badges/ato)](https://cran.r-project.org/package=ato) [![Total Downloads](https://cranlogs.r-pkg.org/badges/grand-total/ato)](https://CRAN.R-project.org/package=ato) [![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable) [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

An R package for accessing statistical data published by the [Australian Taxation Office](https://www.ato.gov.au). Individual tax returns by postcode and occupation, company tax by industry, superannuation aggregates, Corporate Tax Transparency, GST, tax gaps, R&D tax incentive, and more.

## What is the ATO?

The Australian Taxation Office is the Commonwealth agency responsible for collecting federal taxes. In 2023-24 it collected **AUD 611 billion in net tax** (ATO Annual Report 2023-24), equivalent to around 87% of total Commonwealth receipts. It administers personal income tax, company tax, GST, fringe benefits tax, fuel tax credits, the Research and Development Tax Incentive, the Super Guarantee compliance regime, self-managed superannuation funds (SMSFs), and the Corporate Tax Transparency regime. Superannuation policy sits with Treasury; prudential regulation of APRA-regulated super funds is APRA's domain; conduct and disclosure are ASIC's.

The ATO's flagship public data release is **Taxation Statistics**: an annual XLSX-heavy publication covering roughly 14 million individual tax returns, 1 million company returns, and all APRA-regulated and self-managed superannuation funds. Each release ships 90-plus tables across Individuals, Companies, Partnerships, Trusts, Super, GST, FBT, CGT, Excise, and Activity Statement Ratios, plus a separate Corporate Tax Transparency release and a multi-year postcode series. Beyond Taxation Statistics, the 42 ATO datasets on data.gov.au include Tax Gaps estimates, Small Business Benchmarks, International Related Party Dealings (IRPD), R&D Tax Incentive claimants, HELP repayments, and the foreign-ownership register.

Taxation Statistics underlies much of the public income-distribution and top-incomes literature in Australia. Atkinson and Leigh (2007) used the ATO aggregates to reconstruct century-long top-income shares; the Burkhauser-Hahn-Wilkins and Wilkins series followed. Work from the Grattan Institute, e61 Institute, the ANU Tax and Transfer Policy Institute, and the Australia Institute routinely draws on these tables, and the **Corporate Tax Transparency** release drives an October-November news cycle every year as journalists tally which large entities paid zero tax. Where longitudinal microdata is needed, researchers apply for access to **ALife** (the ATO Longitudinal Information Files) through the ATO's DataLab; the Parliamentary Budget Office accesses richer microdata through separate arrangements.

## Why does this package exist?

The ATO's annual **Taxation Statistics** publication is free and available under Creative Commons, but getting it into R has always been tedious. The ATO's own statistics site at ato.gov.au renders via JavaScript and blocks bulk crawlers. The canonical machine interface is the data.gov.au CKAN mirror, but CKAN resource UUIDs change on every annual release, column names drift from year to year, table numbers shift (occupation data has been Table 13, 14, and 15 in different years), and the historical series from 1994-95 to 2008-09 is a ZIP bundle of legacy `.xls` files.

```r
# Without this package
api  <- "https://data.gov.au/data/api/3/action/package_show?id=taxation-statistics-2022-23"
resp <- jsonlite::fromJSON(api)
res  <- resp$result$resources
url  <- res$url[grep("postcode", res$name, ignore.case = TRUE)][1]
path <- tempfile(fileext = ".xlsx")
download.file(url, path)
df   <- readxl::read_excel(path, sheet = 1)
names(df) <- tolower(gsub("[^a-z0-9]+", "_", tolower(names(df))))
# ... rename, strip totals rows, parse postcodes as characters, ...

# With this package
library(ato)
ato_individuals_postcode(year = "2022-23", state = "NSW")
```

Resource URLs are resolved at runtime via `package_show`, so the package doesn't break when CKAN UUIDs rotate. Year is accepted in any sensible form (`"2022-23"`, `"2022/23"`, `2022`, `"latest"`). Column names are cleaned to snake_case. Data frames carry provenance (source URL, retrieval date, licence) in a lightweight `ato_tbl` S3 class.

## How does ato compare to grattan and taxstats?

Hugh Parsonage and the Grattan Institute have done the most work on Australian tax in R. Their contributions sit alongside this package rather than compete:

| Package | Role | Status |
|---|---|---|
| [**grattan**](https://github.com/HughParsonage/grattan) | Tax *calculator*. Computes income tax liabilities, transfer payments, CPI and wage inflators, and long-run fiscal projections under a given policy parameterisation | CRAN, active (v2026.1.1) |
| [**taxstats**](https://github.com/HughParsonage/taxstats) | Ships the ATO's 2% individual sample files as lazy-loaded data objects | GitHub DRAT, dormant since 2019 |
| **ato** | Data *access*. Fetches aggregate Taxation Statistics tables, postcode series, Corporate Tax Transparency, SMSF overviews, tax gaps | CRAN |

If you are modelling a policy change, use `grattan`. If you want to work with the 2% sample file, install `taxstats` from Hugh's DRAT. If you want the published aggregate statistics or the Corporate Tax Transparency release in a clean tidy data frame, use `ato`.

## Installation

```r
install.packages("ato")

# Or install the development version from GitHub
# install.packages("devtools")
devtools::install_github("charlescoverdale/ato")
```

## Quick start

```r
library(ato)

# All 42 ATO datasets on data.gov.au
cat <- ato_catalog()

# Individual tax returns by NSW postcode for 2022-23
p <- ato_individuals_postcode(year = "2022-23", state = "NSW")
head(p)

# Corporate Tax Transparency (4,110 entities in 2023-24)
top <- ato_top_taxpayers(year = "2023-24")
head(top)

# Company tax by industry
c <- ato_companies(year = "2022-23", industry = "mining")
head(c)
```

## Functions

| Function | Description | Coverage |
|---|---|---|
| `ato_catalog()` | Summary of every ATO dataset on data.gov.au: id, title, licence, resource count, last modified | Current (live) |
| `ato_download()` | Generic CKAN resource downloader with auto CSV or XLSX parsing | Any dataset |
| `ato_individuals()` | Individuals Table 1 snapshot (counts, taxable income, tax payable, deductions) | 1994-95 - present |
| `ato_individuals_postcode()` | Individual tax return items by 4-digit postcode and state | 1994-95 - present |
| `ato_individuals_occupation()` | Individuals by occupation, sex, and taxable income range (~1,000 occupations) | 1994-95 - present |
| `ato_companies()` | Company tax aggregates by ANZSIC industry, turnover band, entity type | 1994-95 - present |
| `ato_super_funds()` | APRA-regulated fund aggregates plus SMSF statistical overview | 1994-95 - present |
| `ato_top_taxpayers()` | Corporate Tax Transparency release: income, taxable income, tax payable for large entities | 2013-14 - present |
| `ato_gst()` | GST and Activity Statement Ratios tables | 2000-01 - present |
| `ato_industry()` | Industry aggregates joined across Individual and Company tables | 1994-95 - present |
| `ato_cache_info()` | Inspect the local cache | - |
| `ato_clear_cache()` | Clear locally cached files | - |

## Examples

### Individual tax by postcode

```r
library(ato)

p <- ato_individuals_postcode(year = "2022-23", state = "NSW")

# Top 10 postcodes by average taxable income
cols <- c("postcode", "number_of_individuals", "taxable_income_average")
head(p[order(-p$taxable_income_average), cols], 10)
```

### Corporate Tax Transparency

The Corporate Tax Transparency release is mandated by Part 5-25 of the *Taxation Administration Act 1953*. It names every Australian public or foreign-owned company with more than AUD 100 million total income, and every Australian-owned private company above AUD 100 million (the private-company threshold was lowered from AUD 200 million to AUD 100 million for the 2022-23 income year onwards). The 2023-24 release published 1 October 2025 covered 4,110 entities. Each release generates a press cycle as journalists compute how many large entities paid zero tax in the prior year.

```r
# 2023-24 release (published 1 October 2025)
top <- ato_top_taxpayers(year = "2023-24")
nrow(top)  # 4,110

# Ten largest taxpayers
cols <- c("name", "total_income", "taxable_income", "tax_payable")
head(top[order(-top$tax_payable), cols], 10)

# Entities with positive income but zero tax payable
zero <- top[top$total_income > 0 & (is.na(top$tax_payable) | top$tax_payable == 0), ]
nrow(zero)
```

### Occupation-level tax returns

```r
# All economists (any occupation with "economist" in the name)
occ <- ato_individuals_occupation(year = "2022-23", occupation = "economist")
head(occ)
```

### Top-income shares (Atkinson-Leigh style)

```r
# Build a simple top-1% share estimate from the Individuals snapshot
ind <- ato_individuals(year = "2022-23", table = "snapshot")
head(ind)
# (Pair with ABS SIH or ALife microdata for a full top-incomes analysis.)
```

### Catalogue inspection

```r
# Every ATO dataset on data.gov.au (42 packages)
cat <- ato_catalog()

# Filter to Taxation Statistics years
ts <- cat[grepl("^taxation-statistics-", cat$id), ]
ts[order(-as.numeric(substr(ts$id, 21, 24))), c("id", "n_resources", "modified")]
```

## Data source and licence

Data is published by the ATO at <https://www.ato.gov.au/about-ato/research-and-statistics/> and mirrored at <https://data.gov.au/data/organization/australiantaxationoffice>. Most datasets are licensed under **Creative Commons Attribution 2.5 Australia**; the Corporate Tax Transparency release and the Voluntary Tax Transparency Code are **CC BY 3.0 Australia**. This package caches downloads to `tools::R_user_dir("ato", "cache")`.

The mixed licence is preserved on each returned `ato_tbl`: the `ato_licence` attribute (inspectable via `print()`) reports CC BY 2.5 AU or 3.0 AU per table.

## Known limitations

- **No DOIs.** None of the ATO's 42 data.gov.au packages carries a DOI. Citations use URL plus retrieval date instead.
- **Silent updates.** `metadata_modified` changes without a version bump, so a 2022-23 release created in April 2025 can quietly become a different file by April 2026. The cache keys on URL only; run `ato_clear_cache()` to force a refresh.
- **Schema drift.** Table numbers and column names change each year (e.g. occupation data has been T13, T14, and T15). `ato` cleans names to snake_case on ingestion but does not normalise schemas across years. A cross-year join requires you to inspect `names(df)` first.
- **No microdata via this package.** The ATO's 2% Individual Sample File is distributed separately via Hugh Parsonage's [taxstats](https://github.com/HughParsonage/taxstats) DRAT repo. **ALife** (the ATO Longitudinal Information Files, the standard restricted-access longitudinal product used by Treasury, the RBA, PBO, and academic researchers) is accessed through the ATO's DataLab under a researcher application: `ato` does not provide ALife access and users needing longitudinal microdata should apply directly to the ATO.
- **2023-24 Taxation Statistics release.** Expected mid-2026 on the typical T+18-month cadence (the 2022-23 release landed in May 2025). Until published, `year = "latest"` resolves to 2022-23.
- **Bundled reference data is frozen.** `inst/extdata/abs_cpi_annual.csv`, `abs_erp_annual.csv`, and `budget_reference_totals.csv` are snapshots as of v0.3.0 (2026-04-24). For current-vintage analyses, fetch the live series from ABS via [`readabs`](https://github.com/mattcowgill/readabs) (cats. 6401.0 and 3101.0) or from Treasury's Final Budget Outcome PDFs.
- **No Python equivalent on PyPI.** The closest Python access is the raw [`ckanapi`](https://pypi.org/project/ckanapi/) client against data.gov.au. There is no `ato-py` package.
- **Proportional CPI deflation.** `ato_deflate()` applies a Laspeyres-style proportional adjustment, not a chain-linked index. This is standard for post-1949 Australian series and consistent with ABS SNA methodology (cat. 5204.0), but users comparing across major regime breaks (pre-1949, or across GST introduction) should deflate component-wise.

## Related packages

| Package | Description |
|---|---|
| [`hmrc`](https://github.com/charlescoverdale/hmrc) | UK parallel: HM Revenue and Customs tax receipts, VAT, fuel and tobacco duties, stamp duty, R&D tax credits, Income Tax by income range |
| [`grattan`](https://github.com/HughParsonage/grattan) | Australian tax calculator (Parsonage, Coates, Cowgill) |
| [`readabs`](https://github.com/mattcowgill/readabs) | Australian Bureau of Statistics economic data |
| [`readrba`](https://github.com/mattcowgill/readrba) | Reserve Bank of Australia statistical tables |
| [`readaec`](https://github.com/charlescoverdale/readaec) | Australian Electoral Commission |
| [`aemo`](https://github.com/charlescoverdale/aemo) | Australian Energy Market Operator (NEM prices, demand, dispatch) |
| [`cer`](https://github.com/charlescoverdale/cer) | Australian Clean Energy Regulator (carbon, renewables) |
| [`inflateR`](https://github.com/charlescoverdale/inflateR) | Inflation adjustment for price series (useful for real-term income distributions) |

## Citation

```r
citation("ato")
```
