
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
    1          mean -0.2348005061
    2        median -0.2550122812
    3          mode            NA
    4      skewness -0.1014782490
    5      kurtosis  0.1587664487
    6          acf1  0.8245322465
    7          acf2  0.6640152887
    8          acf3  0.5251296278
    9          acf4  0.4204586434
    10         acf5  0.3399235353
    11          IQR  2.3254584201
    12           sd  1.7309513289
    13 linear_trend  0.0003046953
    14   quantile_5 -3.1409333654
    15  quantile_25 -1.3391953938
    16  quantile_75  0.9862630263
    17  quantile_95  2.5538607800
