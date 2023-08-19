#' Calculate the spectral centroid of a time series
#'
#' @importFrom stats fft
#'
#' @param y \code{numeric} vector of values
#' @return \code{numeric} scalar denoting the spectral centroid obtained through the FFT
#' @author Trent Henderson
#' @export
#' @examples
#' y <- arima.sim(model = list(ar = 0.8), n = 1000)
#' outs <- spectral_centroid(y)
#'

spectral_centroid <- function(y){
  fft_out <- stats::fft(y)
  fft_abs <- abs(fft_out)
  centroid <- sum(fft_abs * (seq_along(fft_abs) ^ 1)) / sum(fft_abs)
  return(centroid)
}
