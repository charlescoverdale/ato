# Methodology: hand-computed worked examples

Every formula function in `ato` is verifiable with pen and paper. This
vignette walks through the three arithmetic methods and confirms each
against a hand calculation. A referee checking a published result
against the package can use this page as the reference implementation.

## 1. `ato_deflate()`

### Formula

Proportional (Laspeyres-style) adjustment:

$${real}_{t}\; = \;{nominal}_{t} \times \frac{CPI_{\text{base}}}{CPI_{t}}$$

Source: Diewert (1998), ; ABS cat. 6461.0, Concepts, Sources and
Methods.

### Hand calculation

Take AUD 100 in 2012-13 nominal and deflate to 2022-23 real AUD.

From `ato_crosswalk("cpi")`:

``` r
cpi <- ato_crosswalk("cpi")
cpi[cpi$financial_year %in% c("2012-13", "2022-23"), ]
#>    financial_year cpi_all_groups_australia base_2011_12
#> 19        2012-13                    101.7        1.025
#> 29        2022-23                    132.9        1.339
```

Reading off the table: - $CPI_{2012\text{-}13} = 101.7$ -
$CPI_{2022\text{-}23} = 132.9$

Hand calculation:

$$100 \times \frac{132.9}{101.7}\; = \; 100 \times 1.30678\; = \; 130.68$$

Package output:

``` r
ato_deflate(100, year = "2012-13", base = "2022-23")
#> [1] 130.6785
```

The package returns exactly 130.6785 (to four decimals), which matches
the hand calculation to within rounding.

### Sanity: identity at the base year

``` r
ato_deflate(100, year = "2022-23", base = "2022-23")
#> [1] 100
```

As expected: when the source year equals the base year the index ratio
is 1 and the real-term value equals the nominal value.

## 2. `ato_reconcile()`

### Formula

$$\Delta\; = \; V - R,\qquad\pi\; = \;\frac{V - R}{R}$$

where $V$ is the value from Taxation Statistics and $R$ is the Final
Budget Outcome reference total for the same year and measure.

### Hand calculation

From `ato_crosswalk("budget")`:

``` r
bud <- ato_crosswalk("budget")
bud[bud$financial_year == "2022-23" &
    bud$measure == "individuals_income_tax_net", ]
#>   financial_year                    measure value_aud_billion
#> 3        2022-23 individuals_income_tax_net             316.4
#>                                   source
#> 3 Final Budget Outcome 2022-23 Table 4.2
#>                                                                         definition
#> 3 Gross income tax on individuals less refunds (cash basis, Commonwealth receipts)
#>   note
#> 3 <NA>
```

Reference: $R = 316.4 \times 10^{9}$ AUD.

Suppose we fetch the ATO 2022-23 Individuals snapshot and sum the
`tax_payable` column. Say our sum is $V = 310.0 \times 10^{9}$
(hypothetical; real sums typically fall 1 to 3 per cent below the
cash-basis FBO).

Hand:

$$\Delta = 310.0 - 316.4 = - 6.4{\mspace{6mu}\text{(AUD billion)}}$$

$$\pi = \frac{- 6.4}{316.4} = - 0.02023 = - 2.02\%$$

Package output:

``` r
res <- ato_reconcile(310.0e9, "2022-23", "individuals_income_tax_net")
res[, c("diff_aud", "pct_diff")]
#>   diff_aud    pct_diff
#> 1 -6.4e+09 -0.02022756
```

Agrees with hand calculation.

### Warning threshold

The package warns when `abs(pct_diff) > 0.05`. Test:

``` r
res <- tryCatch(
  ato_reconcile(400e9, "2022-23", "individuals_income_tax_net"),
  warning = function(w) {
    message("Captured warning: ", conditionMessage(w))
    NULL
  }
)
#> Captured warning: Reconciliation diff 26.4% for "individuals_income_tax_net" ("2022-23").
#> ℹ ATO data: "400,000,000,000".
#> ℹ Reference: "316,400,000,000".
#> ℹ Expected 1-3% accrual-vs-cash gap; investigate larger.
```

At $V = 400{\mspace{6mu}\text{AUD billion}}$, the diff is +83.6 billion
and $\pi = 26.4\%$ which exceeds the 5% threshold, so the warning fires.

## 3. `ato_per_capita()`

### Formula

$${per\_ capita}_{t}\; = \;\frac{x_{t}}{{ERP}_{t}}$$

where ${ERP}_{t}$ is the ABS Estimated Resident Population at 30 June of
the financial year end (cat. 3101.0).

### Hand calculation

From `ato_crosswalk("erp")`:

``` r
erp <- ato_crosswalk("erp")
erp[erp$financial_year == "2022-23", ]
#>    financial_year erp_june_australia_thousands note
#> 29        2022-23                        26638 <NA>
```

ERP 2022-23 = 26,638 thousand = 26,638,000 persons.

Commonwealth individual income tax for 2022-23 = AUD 316.4 billion (from
[`ato_reconcile()`](https://charlescoverdale.github.io/ato/reference/ato_reconcile.md)
reference).

Hand:

$$\frac{316.4 \times 10^{9}}{26.638 \times 10^{6}}\; = \; 11,878{\mspace{6mu}\text{AUD per person}}$$

Package output:

``` r
ato_per_capita(316.4e9, "2022-23")
#> [1] 11877.77
```

Agrees.

## 4. `ato_sha256()`

### Specification

SHA-256 as defined in NIST FIPS 180-4. For the empty string, the
published digest is:

    e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

### Verification

``` r
f <- tempfile()
file.create(f)
#> [1] TRUE
ato_sha256(f)
#> [1] "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
```

Matches the NIST FIPS 180-4 reference digest exactly. The package-level
test suite also cross-checks against
[`openssl::sha256`](https://jeroen.r-universe.dev/openssl/reference/hash.html)
for further independence.

## Summary

| Function         | Formula         | Reference                     | Status   |
|------------------|-----------------|-------------------------------|----------|
| `ato_deflate`    | Laspeyres ratio | Diewert 1998 + ABS 6461.0     | Verified |
| `ato_reconcile`  | (V - R) / R     | FBO + ATO tax gap methodology | Verified |
| `ato_per_capita` | x / ERP         | ABS 3101.0                    | Verified |
| `ato_sha256`     | NIST FIPS 180-4 | `digest` + `openssl`          | Verified |

A reviewer can reproduce each worked example on paper and confirm the
package output. Any disagreement is a bug in the package; please file an
issue.
