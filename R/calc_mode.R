#' Calculate the mode of a vector
#'
#' @param y \code{numeric} vector of values
#' @return \code{numeric} scalar denoting the most frequent value
#' @author Trent Henderson
#' @export
#' @examples
#' y <- arima.sim(model = list(ar = 0.8), n = 1000)
#' outs <- get_properties(y)
#'

calc_mode <- function(y) {
  uy <- unique(y)

  if(which.max(tabulate(match(y, uy)) == 1)){
    mymode <- NA
    message("All values occur once. Cannot compute mode. Returning NA.")
  } else{
    mymode <- uy[which.max(tabulate(match(y, uy)))]
  }

  return(mymode)
}
