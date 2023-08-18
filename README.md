
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
    1                   mean  2.185171e-02
    2                 median  1.561318e-02
    3                   mode            NA
    4               skewness  8.887087e-02
    5               kurtosis -3.091315e-01
    6                   acf1  7.893576e-01
    7                   acf2  6.462741e-01
    8                   acf3  5.226971e-01
    9                   acf4  4.501546e-01
    10                  acf5  3.683029e-01
    11                   IQR  2.210935e+00
    12                    sd  1.591932e+00
    13          linear_trend  4.245567e-04
    14 fft_max_abs_amp_index  1.000000e+03
    15 fft_max_abs_amp_value  2.846243e+02
    16            quantile_5 -2.598372e+00
    17           quantile_25 -1.106233e+00
    18           quantile_75  1.104702e+00
    19           quantile_95  2.705316e+00
