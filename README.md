
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
vector of $T = 1000$ samples generated from an AR(1) process:

``` r
library(basicproperties)
y <- arima.sim(model = list(ar = 0.8), n = 1000)
outs <- get_properties(y)
outs
```

            feature_name        values
    1               mean  8.146526e-02
    2             median  1.432727e-01
    3               mode            NA
    4                min -4.941497e+00
    5                max  4.474004e+00
    6           skewness -1.442257e-01
    7           kurtosis -2.945387e-01
    8              acf_1  8.091851e-01
    9              acf_2  6.598851e-01
    10             acf_3  5.237733e-01
    11             acf_4  4.141441e-01
    12             acf_5  3.354786e-01
    13               IQR  2.367473e+00
    14                sd  1.688698e+00
    15      linear_trend  5.169243e-04
    16 spectral_centroid  4.998506e+02
    17    prop_above_3SD  0.000000e+00
    18        quantile_5 -2.810577e+00
    19       quantile_25 -1.120734e+00
    20       quantile_75  1.246739e+00
    21       quantile_95  2.716110e+00
