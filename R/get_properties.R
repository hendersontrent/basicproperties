#' Calculate all features in the package on an input vector
#'
#' @importFrom stats sd median acf quantile IQR na.pass
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

  acfv <- stats::acf(y, lag.max = length(y) - 1, plot = FALSE, na.action = stats::na.pass)$acf

  # Extract ACF information based on length of input time series

  if(length(y) < 6){
    acfv <- acfv[2:length(acfv)]
    acfv <- append(acfv, rep(NA, times = length(y) - length(acfv))) # Pad short time series ACF values with NAs to avoid errors below
  } else{
    acfv <- acfv[2:length(acfv)]
  }

  # Return all features

  outData <- data.frame(feature_name = c("mean", "median", "mode", "min", "max", "skewness", "kurtosis",
                                         "acf_1", "acf_2", "acf_3", "acf_4", "acf_5", "IQR",
                                         "sd", "linear_trend", "spectral_centroid", "prop_above_3SD",
                                         "quantile_5", "quantile_25", "quantile_75", "quantile_95"),
                        values = c(mean(y, na.rm = TRUE), stats::median(y, na.rm = TRUE), calc_mode(y),
                                   min(y, na.rm = TRUE), max(y, na.rm = TRUE), skewness(y), kurtosis(y),
                                   acfv[1], acfv[2], acfv[3], acfv[4], acfv[5],
                                   stats::IQR(y, na.rm = TRUE), stats::sd(y, na.rm = TRUE),
                                   linear_trend(y), spectral_centroid(y), prop_abs_above_3SD(y, na.rm = TRUE),
                                   as.numeric(stats::quantile(y, probs = 0.05, na.rm = FALSE)),
                                   as.numeric(stats::quantile(y, probs = 0.25, na.rm = FALSE)),
                                   as.numeric(stats::quantile(y, probs = 0.75, na.rm = FALSE)),
                                   as.numeric(stats::quantile(y, probs = 0.95, na.rm = FALSE))))

  return(outData)
}
