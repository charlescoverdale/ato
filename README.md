# ato

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/ato)](https://CRAN.R-project.org/package=ato)
[![CRAN downloads](https://cranlogs.r-pkg.org/badges/ato)](https://cran.r-project.org/package=ato)
[![R-CMD-check](https://github.com/charlescoverdale/ato/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/charlescoverdale/ato/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Tidy R access to Australian Taxation Office Taxation Statistics
via the data.gov.au CKAN API: individual tax returns by
postcode and occupation, company tax by industry, superannuation
aggregates, Corporate Tax Transparency, GST, and more.

## Installation

``` r
install.packages("ato")

# Development:
# install.packages("pak")
pak::pak("charlescoverdale/ato")
```

## Quick start

``` r
library(ato)

# All ATO datasets on data.gov.au
cat <- ato_catalog()

# Individual tax returns by postcode (2022-23)
p <- ato_individuals_postcode(year = "2022-23", state = "NSW")
head(p)

# Corporate Tax Transparency — Top 500/1000 release
top <- ato_top_taxpayers(year = "2023-24")
head(top)

# Company tax by industry
c <- ato_companies(year = "2022-23", industry = "mining")
head(c)
```

## What's included

| Family | Functions | Source |
|---|---|---|
| Discovery | `ato_catalog()`, `ato_download()` | data.gov.au CKAN |
| Individuals | `ato_individuals()`, `ato_individuals_postcode()`, `ato_individuals_occupation()` | Taxation Statistics Individuals |
| Companies | `ato_companies()` | Taxation Statistics Companies |
| Super | `ato_super_funds()` | Taxation Statistics + SMSF overview |
| Corporate transparency | `ato_top_taxpayers()` | Corporate Tax Transparency |
| GST + industry | `ato_gst()`, `ato_industry()` | Taxation Statistics GST + derived |
| Cache | `ato_cache_info()`, `ato_clear_cache()` | — |

## Data source and licence

Data is published by the ATO on
<https://www.ato.gov.au/about-ato/research-and-statistics/> and
mirrored on <https://data.gov.au/data/organization/australiantaxationoffice>.
Most datasets are under Creative Commons Attribution 2.5
Australia; Corporate Tax Transparency and the Voluntary Tax
Transparency Code are CC BY 3.0 Australia. This package caches
downloads to `tools::R_user_dir("ato", "cache")`.

## Known quirks

* CKAN resource UUIDs change per annual release. `ato` resolves
  them dynamically via `package_show` rather than hardcoding URLs.
* Column names drift year-to-year. Column names are snake-cased
  on ingestion but schemas are not normalised across years.
* The 2023-24 Taxation Statistics release is expected Q1-Q2 2026.
  Until published, `year = "latest"` resolves to 2022-23.

## Related packages

* [`hmrc`](https://github.com/charlescoverdale/hmrc): UK parallel
  (HM Revenue and Customs)
* [`carbondata`](https://github.com/charlescoverdale/carbondata),
  [`cer`](https://github.com/charlescoverdale/cer): carbon markets
* [`inflateR`](https://github.com/charlescoverdale/inflateR):
  inflation adjustment (for real-term income distributions)

## Citation

``` r
citation("ato")
```
