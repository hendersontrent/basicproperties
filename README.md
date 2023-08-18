
# basicproperties <img src="man/figures/logo.png" align="right" width="120" />

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
    1                   mean -1.791849e-01
    2                 median -1.058263e-01
    3                   mode            NA
    4               skewness  7.213616e-03
    5               kurtosis -1.856208e-01
    6                   acf1  7.833621e-01
    7                   acf2  6.069703e-01
    8                   acf3  4.571642e-01
    9                   acf4  3.413539e-01
    10                  acf5  2.569032e-01
    11                   IQR  2.094598e+00
    12                    sd  1.534451e+00
    13          linear_trend  1.114138e-04
    14 fft_max_abs_amp_index  9.870000e+02
    15 fft_max_abs_amp_value  1.859987e+02
    16            quantile_5 -2.740207e+00
    17           quantile_25 -1.249722e+00
    18           quantile_75  8.448753e-01
    19           quantile_95  2.351898e+00
