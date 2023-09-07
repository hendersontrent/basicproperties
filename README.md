
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

`basicproperties` currently calculates $516$ features from the following
domains:

- `"distribution"`—features which ignore temporal ordering and compute
  summary statistics of the distribution
- `"ACF"`—coefficients of the autocorrelation function up to a lag of
  $5$
- `"linearity"`—features associated with the linear trend of the time
  series
- `"quantiles"`—values for $100$ quantiles of the data
- `"fft"`—the first $100$ coefficients of the fast Fourier transform,
  including their real, imaginary, absolute, and angle components, as
  per the [`tsfresh`](https://github.com/blue-yonder/tsfresh/) package
  for Python

Users can compute all the features in `basicproperties` at once using
the main function `get_properties`. This can be run in a one-liner as it
only takes an input vector as an argument. Here is a demonstration on a
vector of $T = 1000$ samples generated from an AR(1) process:

``` r
library(basicproperties)
y <- arima.sim(model = list(ar = 0.8), n = 1000)
outs <- get_properties(y)
```

Here is a sample of twenty of the features:

         feature_name        values  feature_set
    1            mean -0.0682273117 distribution
    2          median -0.0285242011 distribution
    3            mode            NA distribution
    4             min -5.3285657460 distribution
    5             max  4.5480362786 distribution
    6        skewness -0.1532091500 distribution
    7        kurtosis -0.2380394101 distribution
    8           acf_1  0.8040463790          ACF
    9           acf_2  0.6564698047          ACF
    10          acf_3  0.5495283435          ACF
    11          acf_4  0.4743650582          ACF
    12          acf_5  0.3881577375          ACF
    13            IQR  2.2607101884 distribution
    14             sd  1.6758453734 distribution
    15   linear_trend -0.0003344607    linearity
    16 prop_above_3SD  0.0010000000 distribution
    17     quantile_1 -4.0865978434    quantiles
    18     quantile_2 -3.5270973394    quantiles
    19     quantile_3 -3.3587224511    quantiles
    20     quantile_4 -3.1733633912    quantiles

## Computational performance

`basicproperties` is highly computationally efficient, scaling nearly
linearly with time-series size. Computation time in seconds for a range
of time series lengths is presented below.

<img src="vignettes/comp-time.png" width="600" alt="Computation time for basicproperties." />
