
# basicproperties

R package for the calculation of a set of very basic statistical
properties of time-series data.

## Installation

You can install the development version of `basicproperties` from GitHub
using the following:

``` r
devtools::install_github("hendersontrent/basicproperties")
```

## Usage

Users can compute all the features in `basicproperties` at once using
the main function `get_properties`. This can be run in a one-liner as it
only takes an input vector as an argument. Here is a demonstration on a
vector of $1000$ samples generated from an AR(1) process:

``` r
library(basicproperties)
y <- arima.sim(model = list(ar = 0.8), n = 1000)
outs <- get_properties(y)
outs
```

                feature_name        values
    1                   mean  1.312816e-01
    2                 median  1.243673e-01
    3                   mode            NA
    4               skewness  9.191888e-02
    5               kurtosis  4.030102e-01
    6                   acf1  7.662411e-01
    7                   acf2  5.695227e-01
    8                   acf3  4.259890e-01
    9                   acf4  3.170189e-01
    10                  acf5  2.250465e-01
    11                   IQR  1.813596e+00
    12                    sd  1.552524e+00
    13          linear_trend -2.736828e-04
    14 fft_max_abs_amp_index  9.830000e+02
    15 fft_max_abs_amp_value  2.318233e+02
    16            quantile_5 -2.312469e+00
    17           quantile_25 -8.393946e-01
    18           quantile_75  9.742012e-01
    19           quantile_95  2.932869e+00
