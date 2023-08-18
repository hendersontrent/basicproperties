#include <Rcpp.h>
using namespace Rcpp;

//' Calculate tailedness of the value distribution
//'
//' @param y a numerical time-series input vector
//' @return scalar value
//' @author Trent Henderson
//' @export
//' @examples
//' y <- stats::arima.sim(model = list(ar = 0.8), n = 1000)
//' kurtosis(y)
//'
// [[Rcpp::export]]
double kurtosis(NumericVector y){

   int n = y.size();
   double total = 0;
   double mean;

   // Calculate mean

   for (int i = 0; i < n; ++i) {
     total += y[i];
   }

   mean = total / n;

   // Calculate fourth moment

   double moment4 = 0;

   for (int i = 0; i < n; ++i) {
     moment4 += (y[i]-mean)*(y[i]-mean)*(y[i]-mean)*(y[i]-mean);
   }

   // Calculate second moment

   double moment2 = 0;

   for (int i = 0; i < n; ++i) {
     moment2 += (y[i]-mean)*(y[i]-mean);
   }

   // Calculate kurtosis

   double r = n * moment4 / (moment2*moment2);
   double kurtosis = r * ((1 - 1 / n) * (1 - 1 / n)) - 3;
   return kurtosis;
}
