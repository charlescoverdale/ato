# Build inst/extdata/abs_cpi_annual.csv and inst/extdata/abs_erp_annual.csv
# from the ABS Data API.
#
# CPI: All groups CPI, weighted average of the eight capital cities,
# original series (ABS dataflow CPI, key 1.10001.10.50.Q). The financial-
# year value is the mean of the four quarterly index numbers (September to
# June), re-referenced so that 2011-12 = 100, the base the package's
# deflator has always used. Only complete financial years are kept.
#
# ERP: estimated resident population of Australia at 30 June (ABS
# dataflow ERP_Q, key 1.3.TOT.AUS.Q, June quarter), in thousands. These
# are the ABS's current estimates, including the revisions that followed
# the 2021 Census.
#
# Run from the package root: Rscript data-raw/abs_reference_series.R

abs_csv <- function(dataflow, key) {
  url <- sprintf("https://data.api.abs.gov.au/rest/data/ABS,%s/%s?startPeriod=1994-Q3",
                 dataflow, key)
  resp <- httr2::request(url) |>
    httr2::req_headers(Accept = "application/vnd.sdmx.data+csv") |>
    httr2::req_user_agent("ato data-raw (https://github.com/charlescoverdale/ato)") |>
    httr2::req_perform()
  df <- utils::read.csv(text = httr2::resp_body_string(resp),
                        stringsAsFactors = FALSE)
  df[order(df$TIME_PERIOD), c("TIME_PERIOD", "OBS_VALUE")]
}

fy_label <- function(start) sprintf("%d-%02d", start, (start + 1L) %% 100L)

# ---- CPI --------------------------------------------------------------------
cpi <- abs_csv("CPI,2.0.0", "1.10001.10.50.Q")
yr <- as.integer(substr(cpi$TIME_PERIOD, 1, 4))
qtr <- as.integer(substr(cpi$TIME_PERIOD, 7, 7))
cpi$fy_start <- ifelse(qtr >= 3L, yr, yr - 1L)
n_q <- tapply(cpi$OBS_VALUE, cpi$fy_start, length)
avg <- tapply(cpi$OBS_VALUE, cpi$fy_start, mean)
avg <- avg[n_q == 4L]
base <- avg[["2011"]]
cpi_out <- data.frame(
  financial_year = fy_label(as.integer(names(avg))),
  cpi_all_groups_australia = round(100 * as.numeric(avg) / base, 1),
  base_2011_12 = round(as.numeric(avg) / base, 3)
)
stopifnot(cpi_out$cpi_all_groups_australia[cpi_out$financial_year == "2011-12"] == 100)
write.csv(cpi_out, "inst/extdata/abs_cpi_annual.csv", row.names = FALSE,
          quote = FALSE)
message("CPI: ", nrow(cpi_out), " financial years, ",
        cpi_out$financial_year[1], " to ", tail(cpi_out$financial_year, 1))

# ---- ERP --------------------------------------------------------------------
erp <- abs_csv("ERP_Q,1.0.0", "1.3.TOT.AUS.Q")
erp <- erp[grepl("-Q2$", erp$TIME_PERIOD), ]
june <- as.integer(substr(erp$TIME_PERIOD, 1, 4))
erp_out <- data.frame(
  financial_year = fy_label(june - 1L),
  erp_june_australia_thousands = round(erp$OBS_VALUE / 1000),
  note = ""
)
erp_out$note[1] <- "ABS Estimated Resident Population at 30 June (ERP_Q, current estimates)"
write.csv(erp_out, "inst/extdata/abs_erp_annual.csv", row.names = FALSE)
message("ERP: ", nrow(erp_out), " years, ", erp_out$financial_year[1], " to ",
        tail(erp_out$financial_year, 1))
