
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
    1               mean -1.821965e-01
    2             median -1.817653e-01
    3               mode            NA
    4                min -4.818706e+00
    5                max  4.498051e+00
    6           skewness  1.352707e-02
    7           kurtosis -2.844129e-01
    8              acf_1  7.900314e-01
    9              acf_2  6.297091e-01
    10             acf_3  5.077755e-01
    11             acf_4  3.959916e-01
    12             acf_5  3.225894e-01
    13               IQR  2.248006e+00
    14                sd  1.642308e+00
    15      linear_trend  1.052231e-04
    16 spectral_centroid  4.984560e+02
    17    prop_above_3SD  0.000000e+00
    18        quantile_5 -2.794591e+00
    19       quantile_25 -1.290922e+00
    20       quantile_75  9.570832e-01
    21       quantile_95  2.580504e+00
