# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#' Calculate tailedness of the value distribution
#'
#' @param y a numerical time-series input vector
#' @return scalar value
#' @author Trent Henderson
#' @export
#' @examples
#' y <- stats::arima.sim(model = list(ar = 0.8), n = 1000)
#' kurtosis(y)
#'
kurtosis <- function(y) {
    .Call('_basicproperties_kurtosis', PACKAGE = 'basicproperties', y)
}

#' Calculate adjusted Fisher-Pearson coefficient of skewness
#'
#' @param y a numerical time-series input vector
#' @return scalar value
#' @author Trent Henderson
#' @export
#' @examples
#' y <- stats::arima.sim(model = list(ar = 0.8), n = 1000)
#' skewness(y)
#'
skewness <- function(y) {
    .Call('_basicproperties_skewness', PACKAGE = 'basicproperties', y)
}

