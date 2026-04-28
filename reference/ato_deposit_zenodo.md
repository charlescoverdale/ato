# Prepare a Zenodo deposit payload for the session manifest

Builds the JSON metadata payload Zenodo expects for a data deposit,
using the current
[`ato_manifest()`](https://charlescoverdale.github.io/ato/reference/ato_manifest.md)
and the snapshot pin set via
[`ato_snapshot()`](https://charlescoverdale.github.io/ato/reference/ato_snapshot.md).
The function does NOT upload by default; it returns the payload and
saved manifest path so you can inspect before calling with
`upload = TRUE`.

## Usage

``` r
ato_deposit_zenodo(
  title = NULL,
  description = NULL,
  creators = list(list(name = "Anonymous")),
  keywords = c("ATO", "taxation", "Australia", "reproducibility"),
  upload = FALSE,
  sandbox = FALSE,
  token = Sys.getenv("ZENODO_TOKEN")
)
```

## Arguments

- title:

  Deposit title. Defaults to "ATO data snapshot YYYY-MM-DD" using the
  current snapshot pin.

- description:

  Free-text description. Defaults to a short auto-generated note listing
  the datasets fetched.

- creators:

  List of creator records. Each should be a list with `name`, optional
  `affiliation`, `orcid`. Defaults to a single anonymous entry; override
  for published work.

- keywords:

  Character vector of keywords. Defaults to
  `c("ATO", "taxation", "Australia", "reproducibility")`.

- upload:

  Logical; if `TRUE`, POSTs the deposit to Zenodo and uploads the
  manifest CSV. Default `FALSE` (dry run).

- sandbox:

  Logical; if `TRUE`, uses Zenodo Sandbox (sandbox.zenodo.org) for
  testing. Default `FALSE`.

- token:

  Zenodo personal access token. Defaults to
  `Sys.getenv("ZENODO_TOKEN")`.

## Value

A list with `payload` (the JSON metadata), `manifest_path` (where the
CSV manifest was staged), and if `upload = TRUE`, `deposit_id`,
`doi_prereserve`, and `url`.

## Details

To upload, supply a Zenodo personal access token via the `ZENODO_TOKEN`
environment variable (or the `token` argument). Tokens can be generated
at <https://zenodo.org/account/settings/applications/>.

## See also

Other reproducibility:
[`ato_manifest()`](https://charlescoverdale.github.io/ato/reference/ato_manifest.md),
[`ato_manifest_clear()`](https://charlescoverdale.github.io/ato/reference/ato_manifest_clear.md),
[`ato_manifest_write()`](https://charlescoverdale.github.io/ato/reference/ato_manifest_write.md),
[`ato_sha256()`](https://charlescoverdale.github.io/ato/reference/ato_sha256.md),
[`ato_snapshot()`](https://charlescoverdale.github.io/ato/reference/ato_snapshot.md)

## Examples

``` r
# \donttest{
ato_snapshot("2026-04-24")
ato_deposit_zenodo(
  title = "ATO data snapshot for working paper v1",
  creators = list(list(name = "Coverdale, Charles")),
  upload = FALSE
)
#> ✔ Dry run: payload built, manifest staged at
#>   /tmp/RtmpiVpGVb/ato_manifest_20260428_191337.csv.
#> ℹ Call with `upload = TRUE` to deposit to Zenodo.
# }
```
