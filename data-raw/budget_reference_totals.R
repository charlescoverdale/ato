# Build inst/extdata/budget_reference_totals.csv from the Final Budget
# Outcome (FBO), Part 1, Australian Government general government (cash)
# receipts table (Table 1.3 from 2021-22; Tables 4 and 5 earlier).
#
# Every value is the "Outcome" column of that table for the FBO's own
# financial year, read from the PDF; nothing is typed in by hand. The
# archive keeps each FBO under the folder of the Budget it followed, which
# is not always the FBO year (the 2022-23 FBO sits under "2022-23-october"),
# so the outcome year is read from the table header rather than the URL.
#
# Requires pdftools. Run from the package root:
#   Rscript data-raw/budget_reference_totals.R

folders <- c("2019-20", "2020-21", "2021-22", "2022-23-october",
             "2023-24", "2024-25", "2025-26", "2026-27")
urls <- sprintf("https://archive.budget.gov.au/%s/fbo/download/01_part_1.pdf",
                folders)

# Table 1.3 row label -> measure code and definition.
rows <- data.frame(
  label = c("Total individuals and other withholding tax",
            "Fringe benefits tax",
            "Company tax",
            "Superannuation fund taxes",
            "Goods and services tax",
            "Petrol", "Diesel", "Other fuel products",
            "Total excise and customs duty",
            "Taxation receipts"),
  measure = c("individuals_income_tax_net",
              "fringe_benefits_tax",
              "company_tax_net",
              "superannuation_fund_taxes",
              "gst_net",
              "fuel_petrol", "fuel_diesel", "fuel_other",
              "excise_and_customs_duty",
              "taxation_receipts"),
  stringsAsFactors = FALSE
)

definitions <- c(
  individuals_income_tax_net = "Gross income tax withholding plus gross other individuals, less refunds (cash)",
  fringe_benefits_tax = "Fringe benefits tax (cash)",
  company_tax_net = "Company tax (cash)",
  superannuation_fund_taxes = "Superannuation fund taxes (cash)",
  gst_net = "Goods and services tax (cash)",
  fuel_excise_and_customs = "Excise and customs duty on petrol, diesel and other fuel products (cash, before fuel tax credits, which are payments)",
  excise_and_customs_duty = "Total excise and customs duty, net of refunds and drawbacks (cash)",
  taxation_receipts = "Total taxation receipts (cash)"
)

parse_fbo <- function(url) {
  path <- tempfile(fileext = ".pdf")
  ok <- tryCatch(utils::download.file(url, path, mode = "wb", quiet = TRUE),
                 error = function(e) 1L, warning = function(w) 1L)
  if (!identical(ok, 0L)) return(NULL)
  x <- unlist(strsplit(pdftools::pdf_text(path), "\n"))
  # The cash receipts table is Table 1.3 from the 2021-22 FBO and Table 4
  # or 5 before that, and may run over a page ("(continued)").
  title <- "Table [0-9.]+: Australian Government general government (sector )?\\(cash\\) receipts"
  start <- grep(paste0(title, " *$"), x)[1]
  if (is.na(start)) return(NULL)
  later <- grep("^ *Table [0-9.]+:", x)
  later <- later[later > start & !grepl("\\(continued\\)", x[later])]
  end <- if (length(later)) later[1] - 1L else length(x)
  tbl <- x[start:end]
  # Header line names the outcome year twice ("2024-25  2024-25"); the
  # first financial year in the header is the FBO year.
  hdr <- grep("[0-9]{4}[-–][0-9]{2}", tbl, value = TRUE)[1]
  fy <- sub("–", "-", regmatches(hdr, regexpr("[0-9]{4}[-–][0-9]{2}", hdr)))
  get <- function(label) {
    line <- grep(paste0("^ *", label, " {2,}"), tbl, value = TRUE)[1]
    if (is.na(line)) return(NA_real_)
    rest <- sub(paste0("^ *", label), "", line)
    nums <- regmatches(rest, gregexpr("-?[0-9][0-9,]*", rest))[[1]]
    # Columns: estimate at Budget, outcome, change. Take the outcome.
    as.numeric(gsub(",", "", nums[2]))
  }
  vals <- vapply(rows$label, get, numeric(1))
  table_no <- regmatches(x[start], regexpr("Table [0-9.]+", x[start]))
  data.frame(financial_year = fy, measure = rows$measure,
             value_aud_m = unname(vals), table = table_no, source_url = url,
             stringsAsFactors = FALSE)
}

raw <- do.call(rbind, lapply(urls, parse_fbo))
stopifnot(!anyNA(raw$value_aud_m))

fuel <- aggregate(value_aud_m ~ financial_year + table + source_url,
                  data = raw[grepl("^fuel_", raw$measure), ], FUN = sum)
fuel$measure <- "fuel_excise_and_customs"
out <- rbind(raw[!grepl("^fuel_", raw$measure), ],
             fuel[, names(raw)])

out <- data.frame(
  financial_year = out$financial_year,
  measure = out$measure,
  value_aud_billion = round(out$value_aud_m / 1000, 3),
  source = sprintf("Final Budget Outcome %s, %s (cash receipts), Outcome column",
                   out$financial_year, out$table),
  definition = unname(definitions[out$measure]),
  source_url = out$source_url,
  stringsAsFactors = FALSE
)
out <- out[order(out$measure, out$financial_year), ]
stopifnot(!anyDuplicated(out[, c("financial_year", "measure")]))
write.csv(out, "inst/extdata/budget_reference_totals.csv", row.names = FALSE)
message(nrow(out), " rows; years ", paste(sort(unique(out$financial_year)), collapse = ", "))
