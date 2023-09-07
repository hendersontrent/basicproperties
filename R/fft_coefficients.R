
# Helper function

complex_agg <- function(y, agg) {
  if (agg == "real") {
    return(Re(y))
  } else if (agg == "imag") {
    return(Im(y))
  } else if (agg == "abs") {
    return(Mod(y))
  } else if (agg == "angle") {
    return(Arg(y) * 180 / pi) # Convert radians to degrees
  }
}

#' Calculate the first 100 FFT coefficients for a time-series vector as per the tsfresh package for Python
#'
#' @importFrom stats fft
#' @param y \code{numeric} vector of values
#' @param attrs \code{character} vector denoting which components to calculate. Can be one of \code{"real"}, \code{"imag"}, \code{"abs"}, or \code{"angle"}. Defaults to all through \code{c("real", "imag", "abs", "angle")}
#' @return \code{data.frame} of results
#' @references Christ, M., Braun, N., Neuffer, J., and Kempa-Liehr A.W. (2018). Time Series FeatuRe Extraction on basis of Scalable Hypothesis tests (tsfresh -- A Python package). Neurocomputing 307
#' @author Trent Henderson
#' @export
#'

fft_coefficients <- function(y, attrs = c("real", "imag", "abs", "angle")) {
  stopifnot(all(attrs %in% c("real", "imag", "abs", "angle")))
  fft <- stats::fft(y)

  results <- list()
  for (i in 1:length(attrs)) {
    attr <- attrs[i]
    res <- sapply(0:99, function(coeff) {
      if (coeff < length(fft)) {
        complex_agg(fft[coeff + 1], attr)
      } else {
        NaN
      }
    })
    feature_name <- sprintf('fft_coefficient_%s_%d', attr, 0:99)
    results[[attr]] <- res
  }

  df <- data.frame(coeff = 0:99, results)

  df <- reshape(df, varying = 2:5, v.names = "values",
                times = c("real", "imag", "abs", "angle"),
                timevar = "feature_name",
                direction = "long")

  df$feature_name <- paste0("fft_coefficient_", df$feature_name, "_", df$coeff)
  df$feature_set <- "fft"
  df <- df[, c("feature_set", "feature_name", "values")]
  rownames(df) <- NULL
  return(df)
}
