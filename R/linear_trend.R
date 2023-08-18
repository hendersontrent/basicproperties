#' Calculate the linear trend of a time series
#'
#' @importFrom stats lm
#'
#' @param y \code{numeric} vector of values
#' @return \code{numeric} scalar denoting the most frequent value
#' @author Trent Henderson
#' @export
#' @examples
#' y <- arima.sim(model = list(ar = 0.8), n = 1000)
#' outs <- linear_trend(y)
#'

linear_trend <- function(y){
  tmp <- data.frame(y = y)
  tmp$timepoint <- seq.int(from = 1, to = nrow(tmp), by = 1)
  trend <- stats::lm(y ~ timepoint, data = tmp)$coefficients[2]
  return(trend)
}
