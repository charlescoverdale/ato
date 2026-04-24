# Cite an ato_tbl (or URL) in BibTeX and plain-text form

Returns a citation suitable for footnotes, papers, and Treasury-grade
briefs. Uses the provenance attributes attached to every `ato_tbl`:
source URL, licence, retrieval date, title, snapshot pin, and SHA-256
digest.

## Usage

``` r
ato_cite(x, style = c("text", "bibtex", "apa"), doi = NULL)
```

## Arguments

- x:

  Either an `ato_tbl` (as returned by any `ato_*` data function) or a
  character URL pointing to an ATO data.gov.au resource.

- style:

  One of `"text"` (default, plain-text footnote), `"bibtex"`, or
  `"apa"`.

- doi:

  Optional DOI (e.g. from
  [`ato_deposit_zenodo()`](https://charlescoverdale.github.io/ato/reference/ato_deposit_zenodo.md))
  to include in BibTeX output as a `doi` field and APA suffix.

## Value

A character string. For `style = "bibtex"`, a complete `@misc{}` entry.

## Details

BibTeX output includes the SHA-256 digest (first 12 hex chars) and
snapshot pin (when set via
[`ato_snapshot()`](https://charlescoverdale.github.io/ato/reference/ato_snapshot.md))
in the `note` field, which is what research reviewers need to verify the
provenance of a downstream result.

## See also

Other discovery:
[`ato_catalog()`](https://charlescoverdale.github.io/ato/reference/ato_catalog.md),
[`ato_charities()`](https://charlescoverdale.github.io/ato/reference/ato_charities.md),
[`ato_download()`](https://charlescoverdale.github.io/ato/reference/ato_download.md),
[`ato_excise()`](https://charlescoverdale.github.io/ato/reference/ato_excise.md),
[`ato_fbt()`](https://charlescoverdale.github.io/ato/reference/ato_fbt.md),
[`ato_help()`](https://charlescoverdale.github.io/ato/reference/ato_help.md),
[`ato_irpd()`](https://charlescoverdale.github.io/ato/reference/ato_irpd.md),
[`ato_payg()`](https://charlescoverdale.github.io/ato/reference/ato_payg.md),
[`ato_rdti()`](https://charlescoverdale.github.io/ato/reference/ato_rdti.md),
[`ato_sme_benchmarks()`](https://charlescoverdale.github.io/ato/reference/ato_sme_benchmarks.md),
[`ato_tax_gaps()`](https://charlescoverdale.github.io/ato/reference/ato_tax_gaps.md),
[`ato_top_taxpayers()`](https://charlescoverdale.github.io/ato/reference/ato_top_taxpayers.md),
[`ato_vttc()`](https://charlescoverdale.github.io/ato/reference/ato_vttc.md)

## Examples

``` r
x <- data.frame(a = 1)
x <- structure(x,
  ato_source = "https://data.gov.au/data/dataset/example.xlsx",
  ato_licence = "CC BY 2.5 AU",
  ato_retrieved = as.POSIXct("2026-04-23 00:00:00", tz = "UTC"),
  ato_title = "ATO individuals 2022-23",
  ato_sha256 = "abc123def456",
  ato_snapshot_date = "2026-04-23",
  class = c("ato_tbl", "data.frame"))

ato_cite(x)
#> [1] "Australian Taxation Office. ATO individuals 2022-23. Retrieved 2026-04-23 from https://data.gov.au/data/dataset/example.xlsx. Licensed under CC BY 2.5 AU. Snapshot: 2026-04-23. SHA-256: abc123def456."
ato_cite(x, style = "bibtex")
#> [1] "@misc{ato_ato_individuals_2022_23,\n  author = {{Australian Taxation Office}},\n  title  = {{ATO individuals 2022-23}},\n  year   = {2026},\n  note   = {Retrieved 2026-04-23; licensed under CC BY 2.5 AU; snapshot 2026-04-23; sha256:abc123def456},\n  url    = {https://data.gov.au/data/dataset/example.xlsx}\n}"
# DOI style: supply any minted DOI (Zenodo, DataCite, etc.).
# The placeholder below is illustrative only.
ato_cite(x, style = "apa", doi = "10.5281/zenodo.XXXXXXXX")
#> [1] "Australian Taxation Office. (2026). ATO individuals 2022-23 [Data set]. data.gov.au. https://data.gov.au/data/dataset/example.xlsx https://doi.org/10.5281/zenodo.XXXXXXXX"
```
