# CRAN submission comments: ato 0.1.1

## Reason for this submission

This is a bug-fix release for ato 0.1.0, currently on CRAN. There are no
new features, and no user-facing arguments changed.

Two defects in 0.1.0 combined to leave most of the package returning
either nothing or the wrong table, in both cases without raising an
error. My apologies: 0.1.0 was tested against explicitly pinned years,
which masked a failure in the default argument that the affected
functions rely on.

## The failures and the fixes

1. **Catalogue search returned zero results.** `ato_ckan_search()`
   joined the organisation filter and the query terms with `+`, which
   `URLencode(reserved = TRUE)` escaped to `%2B`. Solr read that as a
   literal character. This broke `year = "latest"`, the default on 27
   exported functions. The terms are now joined with a space.

2. **The wrong worksheet was parsed.** `ato_fetch_xlsx()` read sheet 1
   of each workbook. Nearly every ATO workbook opens with a "Notes" or
   "Information" sheet and puts the table on the second, so most
   functions returned front matter rather than data. Front-matter sheets
   are now detected by name and skipped. `ato_individuals()` returns 846
   rows rather than 17.

3. **The wrong resource was selected.** `ato_ckan_resolve()` took the
   first resource matching a single regex, in package order. The
   Snapshot workbooks sit early in a Taxation Statistics package and
   their filenames contain "postcode" and "occupation", so they shadowed
   the detailed Individuals tables. Six functions were silently
   returning an unrelated table. Resolution now takes a priority vector
   of patterns plus an exclude pattern.

4. **Filters were silently ignored.** `ato_find_col()` matched column
   names exactly, so ATO footnote markers defeated it: the postcode
   table's state column is `state_territory1`, not `state_territory`.
   Filters therefore returned unfiltered data. Matching now tolerates a
   trailing footnote digit, and a requested filter that cannot be
   applied warns that the data is being returned unfiltered.

The back catalogue is repaired alongside these. All six core series now
resolve for every release from 2011-12 to 2023-24, verified year by
year.

## Behaviour changes worth flagging

* `year = "latest"` now resolves to Taxation Statistics 2023-24, which
  the ATO published in June 2026.

* `ato_whm()`, `ato_division293()` and `ato_compliance()` now abort with
  an explanation and a pointer to the real source. No open data exists
  behind any of the three. In 0.1.0 the first two fell back to an
  unrelated Individuals table and labelled the result as the requested
  series. All three are candidates for removal in a later release.

  The package Description advertised all three. Since they cannot return
  data, that text has been removed: the DESCRIPTION was promising
  datasets the package has never been able to supply.

* `ato_top_taxpayers()` now honours its `year` argument. Corporate Tax
  Transparency releases carry late amendments for earlier income years,
  so a 2023-24 request previously returned 4,198 rows spanning three
  income years rather than the 4,110 rows the ATO published for 2023-24.

* `ato_fbt()`, `ato_payg()` and `ato_charities()` searched for
  standalone data.gov.au packages that have never existed. All three are
  table families inside Taxation Statistics and now resolve there.

## Examples hardened against an unreachable Zenodo

Every `\donttest{}` example that makes a network call is now wrapped in
`try()`, so a build machine that cannot reach Zenodo gets a printed
condition rather than an example ERROR. 1 block was affected. The
`options(op)` cache restore stays outside the `try()` so it always runs.

I verified that every generated example still parses: each Rd file with
examples was extracted with `tools::Rd2ex(commentDonttest = FALSE)` and
passed to `parse()` without error.

## R CMD check results

0 errors | 0 warnings | 0 notes

Local check: macOS (aarch64), R 4.5.2, `devtools::check(cran = TRUE)`,
run 19 August 2026, including `--run-donttest`.

The local run also emits "checking for future file timestamps: unable to
verify current time". That is the usual artefact of the checking machine
being unable to reach worldclockapi.com, and is unrelated to the
package.

## Other changes

* `Language` in DESCRIPTION corrected from `en-US` to `en-GB`, matching
  the prose throughout. This clears 53 spurious spell-check hits, and
  `spelling::spell_check_package()` is now clean.

* A deleted OECD URL (HTTP 410) cited by `ato_international()` has been
  repointed at Revenue Statistics 2025. Note for anyone rechecking it:
  oecd.org returns 403 to every non-browser client, valid path or not,
  so automated URL checking cannot distinguish a live OECD path from a
  deleted one.

* README code examples are now executed against live data before
  release. The postcode example referenced two columns that do not exist
  in the underlying table, so it could never have run. The dataset count
  is corrected from 42 to 43, and stated coverage from "1994-95 to
  present" to "2011-12 to present", which is the earliest release
  shipping individual tables as separate resources.

## Test suite

Network-dependent tests are wrapped in `skip_on_cran()` and a custom
`skip_if_offline()`. An `ATO_LIVE_TESTS` environment variable gates
optional live-fetch tests.

New in this release: `test-resolution.R`, covering query encoding,
resource priority and exclusion against a mocked package, and column
matching. All of that is offline. One live test asserts that
`year = "latest"` resolves to a well-formed current release slug. It is
deliberately not behind `ATO_LIVE_TESTS`, because gating every live test
behind an opt-in is precisely why 0.1.0 shipped with a broken default.

## Notes on data access

All sources are public, free, and require no authentication. Downloaded
data is cached to `tools::R_user_dir("ato", "cache")` on first use.
`\donttest` examples redirect the cache to `tempdir()` via
`options(ato.cache_dir = ...)`, so no files are written to the user's
home filespace.

## Downstream dependencies

None.
