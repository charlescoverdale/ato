# ato

[![CRAN status](https://www.r-pkg.org/badges/version/ato)](https://CRAN.R-project.org/package=ato) [![CRAN downloads](https://cranlogs.r-pkg.org/badges/ato)](https://cran.r-project.org/package=ato) [![Total Downloads](https://cranlogs.r-pkg.org/badges/grand-total/ato)](https://CRAN.R-project.org/package=ato) [![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable) [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

An R package for accessing statistical data published by the [Australian Taxation Office](https://www.ato.gov.au). Individual tax returns by postcode and occupation, company tax by industry, superannuation aggregates, Corporate Tax Transparency, GST, tax gaps, R&D tax incentive, and more.

## What is the ATO?

The Australian Taxation Office is the Commonwealth agency responsible for collecting federal taxes. In 2023-24 it collected **AUD 610.6 billion in net tax** from AUD 769.7 billion gross (Commissioner of Taxation annual report 2023-24), equivalent to around 87% of the AUD 704.5 billion total Commonwealth revenue reported in the Final Budget Outcome. It administers personal income tax, company tax, GST, fringe benefits tax, fuel tax credits, the Research and Development Tax Incentive, the Super Guarantee compliance regime, self-managed superannuation funds (SMSFs), and the Corporate Tax Transparency regime. Superannuation policy sits with Treasury; prudential regulation of APRA-regulated super funds is APRA's domain; conduct and disclosure are ASIC's.

The ATO's flagship public data release is **Taxation Statistics**: an annual XLSX-heavy publication covering 16.6 million individual tax returns, 1.3 million company returns, and all APRA-regulated and self-managed superannuation funds (2023-24 entity counts). Each release ships 90-plus tables across Individuals, Companies, Partnerships, Trusts, Super, GST, FBT, CGT, Excise, and Activity Statement Ratios, plus a separate Corporate Tax Transparency release and a multi-year postcode series. Beyond Taxation Statistics, the 43 ATO datasets on data.gov.au include Tax Gaps estimates, Small Business Benchmarks, International Related Party Dealings (IRPD), R&D Tax Incentive claimants, HELP repayments, and the foreign-ownership register.

Taxation Statistics underlies much of the public income-distribution and top-incomes literature in Australia. Atkinson and Leigh (2007) used the ATO aggregates to reconstruct century-long top-income shares; the Burkhauser-Hahn-Wilkins and Wilkins series followed. Work from the Grattan Institute, e61 Institute, the ANU Tax and Transfer Policy Institute, and the Australia Institute routinely draws on these tables, and the **Corporate Tax Transparency** release drives an October-November news cycle every year as journalists tally which large entities paid zero tax. Where longitudinal microdata is needed, researchers apply for access to **ALife** (the ATO Longitudinal Information Files) through the ATO's DataLab; the Parliamentary Budget Office accesses richer microdata through separate arrangements.

## Why does this package exist?

The ATO's annual **Taxation Statistics** publication is free and available under Creative Commons, but getting it into R has always been tedious. The ATO's own statistics site at ato.gov.au renders via JavaScript and blocks bulk crawlers. The canonical machine interface is the data.gov.au CKAN mirror, but CKAN resource UUIDs change on every annual release, column names drift from year to year, table numbers shift (occupation data was Individuals Table 13 up to 2012-13 and Tables 14 and 15 from 2013-14), and the historical series from 1994-95 to 2008-09 is a separate package of 36 mixed ZIP, `.xls` and PDF resources rather than per-table workbooks.

```r
# Without this package
api  <- "https://data.gov.au/data/api/3/action/package_show?id=taxation-statistics-2023-24"
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
ato_individuals_postcode(year = "2023-24", state = "NSW")
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

# All 43 ATO datasets on data.gov.au
cat <- ato_catalog()

# Individual tax returns by NSW postcode for 2023-24
p <- ato_individuals_postcode(year = "2023-24", state = "NSW")
head(p)

# Corporate Tax Transparency (4,110 entities in 2023-24)
top <- ato_top_taxpayers(year = "2023-24")
head(top)

# Company tax by industry
c <- ato_companies(year = "2023-24", industry = "mining")
head(c)
```

## Functions

| Function | Description | Coverage |
|---|---|---|
| `ato_catalog()` | Summary of every ATO dataset on data.gov.au: id, title, licence, resource count, last modified | Current (live) |
| `ato_download()` | Generic CKAN resource downloader with auto CSV or XLSX parsing | Any dataset |
| `ato_individuals()` | Individuals Table 1 snapshot (counts, taxable income, tax payable, deductions) | 2011-12 - present |
| `ato_individuals_postcode()` | Individual tax return items by 4-digit postcode and state | 2011-12 - present |
| `ato_individuals_occupation()` | Individuals by occupation, sex, and taxable income range (~1,000 occupations) | 2011-12 - present |
| `ato_companies()` | Company tax aggregates by ANZSIC industry, turnover band, entity type | 2011-12 - present |
| `ato_super_funds()` | APRA-regulated fund aggregates plus SMSF statistical overview | 2011-12 - present |
| `ato_top_taxpayers()` | Corporate Tax Transparency release: income, taxable income, tax payable for large entities | 2013-14 - present |
| `ato_gst()` | GST and Activity Statement Ratios tables | 2011-12 - present |
| `ato_industry()` | Industry aggregates joined across Individual and Company tables | 2011-12 - present |

Coverage starts at 2011-12 because that is the earliest Taxation
Statistics release on data.gov.au that ships individual tables as
separate resources: it has 101, where 2009-10 and 2010-11 have
three apiece (a PDF, an index and a ZIP). Earlier years live in
`taxation-statstics-1994-95-to-2008-09`. Reach either with
`ato_download()` directly.

One caveat on the back catalogue: `ato_individuals_occupation()`
resolves correctly for 2011-12 and 2012-13 but those releases
publish a coarser occupation table (about 100 rows, against 3,000
or more from 2013-14 onwards). That is the ATO's own change of
granularity, not a parsing artefact.
| `ato_cache_info()` | Inspect the local cache | - |
| `ato_clear_cache()` | Clear locally cached files | - |

## Examples

### Individual tax by postcode

```r
library(ato)

p <- ato_individuals_postcode(year = "2023-24", state = "NSW")

# Table 6 reports counts and totals, not averages, and carries the
# ATO's footnote digits in the column names. Find the two columns
# you need rather than hardcoding a year's spelling of them.
n_col  <- grep("^individuals_no$", names(p), value = TRUE)
inc_col <- grep("^taxable_income_or_loss[0-9]*$", names(p), value = TRUE)[1]

# Top 10 postcodes by mean taxable income per individual
p$mean_taxable_income <- p[[inc_col]] / p[[n_col]]
cols <- c("postcode", n_col, inc_col, "mean_taxable_income")
head(p[order(-p$mean_taxable_income), cols], 10)
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
occ <- ato_individuals_occupation(year = "2023-24", occupation = "economist")
head(occ)
```

### Top-income shares (Atkinson-Leigh style)

```r
# Build a simple top-1% share estimate from Individuals Table 1
ind <- ato_individuals(year = "2023-24")
head(ind)
# (Pair with ABS SIH or ALife microdata for a full top-incomes analysis.)
```

### Catalogue inspection

```r
# Every ATO dataset on data.gov.au (43 packages)
cat <- ato_catalog()

# Filter to Taxation Statistics years
ts <- cat[grepl("^taxation-statistics-", cat$id), ]
ts[order(-as.numeric(substr(ts$id, 21, 24))), c("id", "n_resources", "modified")]
```

## Data source and licence

Data is published by the ATO at <https://www.ato.gov.au/about-ato/research-and-statistics/> and mirrored at <https://data.gov.au/data/organization/australiantaxationoffice>. Of the 43 ATO packages, 31 are licensed **Creative Commons Attribution 2.5 Australia** and 12 are **CC BY 3.0 Australia**, the latter including the Corporate Tax Transparency release and the Voluntary Tax Transparency Code. This package caches downloads to `tools::R_user_dir("ato", "cache")`.

The mixed licence is preserved on each returned `ato_tbl`: the `ato_licence` attribute (inspectable via `print()`) reports CC BY 2.5 AU or 3.0 AU per table.

## Related packages

| Package | Description |
|---|---|
| [`hmrc`](https://github.com/charlescoverdale/hmrc) | UK parallel: HM Revenue and Customs tax receipts, VAT, duties, R&D tax credits, Income Tax by income range |
| [`cer`](https://github.com/charlescoverdale/cer) | Australian Clean Energy Regulator (carbon, renewables) |
| [`aemo`](https://github.com/charlescoverdale/aemo) | Australian Energy Market Operator (NEM prices, demand, dispatch) |
| [`inflateR`](https://github.com/charlescoverdale/inflateR) | Inflation adjustment for price series (useful for real-term income distributions) |
| [`inequality`](https://github.com/charlescoverdale/inequality) | Inequality and poverty measurement |
| [`grattan`](https://github.com/HughParsonage/grattan) | Australian tax calculator (Parsonage, Coates, Cowgill) |
| [`readabs`](https://github.com/mattcowgill/readabs) | Australian Bureau of Statistics economic data |
| [`readrba`](https://github.com/mattcowgill/readrba) | Reserve Bank of Australia statistical tables |

## Citation

```r
citation("ato")
```

## Issues

Please report bugs or requests at <https://github.com/charlescoverdale/ato/issues>.

## Keywords

ATO, Australian Taxation Office, Australian tax data, taxation statistics, individual tax, company tax, corporate tax, capital gains tax, GST, superannuation, excise duty, fringe benefits tax, R&D tax incentive, HELP debt, Medicare levy, tax gap, compliance, data.gov.au, R package, Australian government data
