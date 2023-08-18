#include <Rcpp.h>
using namespace Rcpp;

//' Calculate adjusted Fisher-Pearson coefficient of skewness
//'
//' @param y a numerical time-series input vector
//' @return scalar value
//' @author Trent Henderson
//' @export
//' @examples
//' y <- stats::arima.sim(model = list(ar = 0.8), n = 1000)
//' skewness(y)
//'
// [[Rcpp::export]]
double skewness(NumericVector y){

   int n = y.size();
   double total = 0;
   double mean;

   // Calculate mean

   for (int i = 0; i < n; ++i) {
     total += y[i];
   }

   mean = total / n;

   // Calculate standard deviation

   double total_sd = 0;
   double sigma;

   for(int i = 0; i < n; ++i) {
     total_sd += (y[i]-mean)*(y[i]-mean);
   }

   sigma = std::sqrt((total_sd/n));

   // Calculate G

   double G = std::sqrt((n*(n-1)))/(n-2);

   // Calculate skewness

   double total_skew = 0;

   for (int i = 0; i < n; ++i) {
     total_skew += ((y[i]-mean)*(y[i]-mean)*(y[i]-mean))/n;
   }

   double skewness = total_skew/(sigma*sigma*sigma);

   // Adjust skewness

   double adj_skewness = G * skewness;
   return adj_skewness;
}
