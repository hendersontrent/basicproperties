
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
    1               mean -5.996035e-02
    2             median -1.146497e-01
    3               mode            NA
    4                min -4.533425e+00
    5                max  4.563805e+00
    6           skewness  4.532278e-02
    7           kurtosis -1.347295e-01
    8              acf_1  7.763910e-01
    9              acf_2  5.994091e-01
    10             acf_3  4.621034e-01
    11             acf_4  3.631312e-01
    12             acf_5  2.733970e-01
    13               IQR  2.078805e+00
    14                sd  1.537748e+00
    15      linear_trend -4.893868e-05
    16 spectral_centroid  5.001209e+02
    17    prop_above_3SD  0.000000e+00
    18        quantile_5 -2.545688e+00
    19       quantile_25 -1.099322e+00
    20       quantile_75  9.794829e-01
    21       quantile_95  2.471458e+00
