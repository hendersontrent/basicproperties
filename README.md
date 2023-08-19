
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
    1               mean  2.725310e-01
    2             median  2.932492e-01
    3               mode            NA
    4                min -4.897013e+00
    5                max  5.069449e+00
    6           skewness -7.305070e-02
    7           kurtosis  3.611708e-04
    8              acf_1  7.929462e-01
    9              acf_2  6.219461e-01
    10             acf_3  4.916159e-01
    11             acf_4  3.763371e-01
    12             acf_5  2.810531e-01
    13               IQR  2.091867e+00
    14                sd  1.559759e+00
    15      linear_trend  3.260936e-04
    16 spectral_centroid  4.969835e+02
    17    prop_above_3SD  3.000000e-03
    18        quantile_5 -2.343232e+00
    19       quantile_25 -7.410463e-01
    20       quantile_75  1.350820e+00
    21       quantile_95  2.758837e+00
