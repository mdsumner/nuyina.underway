
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nuyina.underway

<!-- badges: start -->

<!-- badges: end -->

The goal of nuyina.underway is to get the Nuyina underway data.

This layer `underway:nuyina_underway` is published at this address, but
we regularly cache this in convenient tabular form and only request from
the service what data is new.

‘<https://data.aad.gov.au/geoserver/ows?service=WFS&acceptversions=2.0.0&request=GetCapabilities>’.

The cache lives here, and can be read at any time with Parquet readers
(Arrow, GDAL, etc):

‘<https://github.com/mdsumner/uwy.new/releases/download/v0.0.1/nuyina_underway.parquet>’

## Installation

You can install the development version of nuyina.underway like so:

``` r
remotes::install_github("mdsumner/nuyina.underway")
```

## Example

This is a basic example.

``` r
library(nuyina.underway)
d <- nuyina_underway() ; print(length(names(d)))
#> [1] 87
d |> dplyr::select(datetime, longitude, latitude, platform_pitch_fore_up,sea_water_temperature) |> tail()
#> # A tibble: 6 × 5
#>   datetime            longitude latitude platform_pitch_fore_up
#>   <dttm>                  <dbl>    <dbl>                  <dbl>
#> 1 2025-06-12 22:28:00      150.    -46.0                  -0.11
#> 2 2025-06-12 22:29:00      150.    -46.0                  -0.52
#> 3 2025-06-12 22:30:00      150.    -46.0                   0.16
#> 4 2025-06-12 22:31:00      150.    -46.0                   0.14
#> 5 2025-06-12 22:32:00      150.    -46.0                   0.02
#> 6 2025-06-12 22:33:00      150.    -46.0                  -0.06
#> # ℹ 1 more variable: sea_water_temperature <dbl>
```

## Code of Conduct

Please note that the nuyina.underway project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
