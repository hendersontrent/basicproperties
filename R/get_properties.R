#' Calculate all features in the package on an input vector
#'
#' @importFrom stats sd median acf quantile
#'
#' @param y \code{numeric} vector of values
#' @return \code{data.frame} that contains the summary statistics for each feature
#' @author Trent Henderson
#' @export
#' @examples
#' y <- arima.sim(model = list(ar = 0.8), n = 1000)
#' outs <- get_properties(y)
#'

get_properties <- function(y){

  if(anyNA(y) || !is.numeric(y) || length(y) < 5){
    stop("Input time series vector y should not have any missing or non-numeric values and should be longer than 10 time points.")
  }

  # Calculate ACF once for efficiency

  acfv <- stats::acf(y, lag.max = length(y) - 1, plot = FALSE, na.action = na.pass)

  # Return all features

  outData <- data.frame(feature_name = c("mean", "median", "mode", "skewness", "kurtosis",
                                         "acf1", "acf2", "acf3", "acf4", "acf5",
                                         "sd", "quantile_5", "quantile_25", "quantile_75", "quantile_95"),
                        values = c(mean(y, na.rm = TRUE), stats::median(y, na.rm = TRUE), calc_mode(y),
                                   skewness(y), kurtosis(y),
                                   acfv$acf[2], acfv$acf[3], acfv$acf[4], acfv$acf[5], acfv$acf[6],
                                   stats::sd(y, na.rm = TRUE),
                                   as.numeric(stats::quantile(y, probs = 0.05, na.rm = FALSE)),
                                   as.numeric(stats::quantile(y, probs = 0.25, na.rm = FALSE)),
                                   as.numeric(stats::quantile(y, probs = 0.75, na.rm = FALSE)),
                                   as.numeric(stats::quantile(y, probs = 0.95, na.rm = FALSE))))

  return(outData)
}
