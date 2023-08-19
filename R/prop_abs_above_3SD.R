#' Calculate the proportion of values in a time series greater than absolute 3*SD
#'
#' @importFrom stats sd
#'
#' @param y \code{numeric} vector of values
#' @param na.rm \code{Boolean} denoting whether missing values be removed. Defaults to \code{FALSE}
#' @return \code{numeric} scalar denoting the proportion of values in \code{y} greater than absolute 3*SD
#' @author Trent Henderson
#' @export
#' @examples
#' y <- arima.sim(model = list(ar = 0.8), n = 1000)
#' outs <- prop_abs_above_3SD(y)
#'

prop_abs_above_3SD <- function(y, na.rm = FALSE){
  return(length(y[abs(y) > 3 * stats::sd(y, na.rm = na.rm)]) / length(y))
}

