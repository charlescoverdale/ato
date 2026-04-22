# HTTP helpers — httr2 wrapper with local caching

#' @noRd
ato_user_agent <- function() {
  paste0("ato R package/", utils::packageVersion("ato"),
         " (+https://github.com/charlescoverdale/ato)")
}

#' @noRd
ato_request <- function(url, timeout = 120) {
  httr2::request(url) |>
    httr2::req_user_agent(ato_user_agent()) |>
    httr2::req_throttle(rate = 5 / 10) |>
    httr2::req_timeout(timeout) |>
    httr2::req_retry(max_tries = 3) |>
    httr2::req_error(is_error = function(r) FALSE)
}

#' Download a file to the cache and return the local path
#' @noRd
ato_download_cached <- function(url, cache = TRUE) {
  d <- ato_cache_dir()
  ext <- tools::file_ext(url)
  ext <- if (nzchar(ext)) paste0(".", ext) else ""
  file <- file.path(d, paste0(ato_digest_url(url), ext))

  if (cache && file.exists(file)) return(file)

  cli::cli_progress_step("Downloading {.url {url}}")

  resp <- tryCatch(
    ato_request(url) |>
      httr2::req_perform(path = file),
    error = function(e) {
      if (file.exists(file)) unlink(file)
      cli::cli_abort(c(
        "Download failed.",
        "x" = conditionMessage(e)
      ))
    }
  )

  if (!is.null(resp) && httr2::resp_status(resp) >= 400L) {
    unlink(file, force = TRUE)
    cli::cli_abort(c(
      "HTTP {httr2::resp_status(resp)} from {.url {url}}."
    ))
  }
  file
}

#' @noRd
ato_digest_url <- function(url) {
  chars <- utf8ToInt(url)
  weights <- seq_along(chars)
  checksum <- sum(as.numeric(chars) * weights) %% (2^31 - 1)
  sprintf("%010.0f_%04d", as.numeric(checksum), nchar(url) %% 10000L)
}
