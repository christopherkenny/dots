
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dots <img src="man/figures/logo.png" align="right" height="138" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/christopherkenny/dots/workflows/R-CMD-check/badge.svg)](https://github.com/christopherkenny/dots/actions)
[![dots status
badge](https://christopherkenny.r-universe.dev/badges/dots)](https://christopherkenny.r-universe.dev/dots)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![CRAN
status](https://www.r-pkg.org/badges/version/dots)](https://CRAN.R-project.org/package=dots)
![CRAN downloads](http://cranlogs.r-pkg.org/badges/grand-total/dots)
<!-- badges: end -->

`dots` provides tools to make dot density maps.

## Installation

You can install the stable version of `dots` from CRAN with:

``` r
install.packages('dots')
```

You can install the development version of `dots` from
[GitHub](https://github.com/) with:

``` r
remotes::install_github('christopherkenny/dots')
```

## Example

The main function in `dots` is `dots()`.

``` r
library(dots)
library(sf)
#> Linking to GEOS 3.13.1, GDAL 3.11.0, PROJ 9.6.0; sf_use_s2() is TRUE
library(ggplot2)
data('suffolk')
dots::dots(suffolk, c(pop_black, pop_white), divisor = 1000, engine = engine_sf_random) + 
  scale_color_viridis_d() + 
  theme_void()
```

<img src="man/figures/README-example-1.png" width="100%" />

You can also use `dots_points()` to only make the randomized points.

``` r
dots::dots_points(suffolk, c(pop_black, pop_white), divisor = 1000, engine = engine_sf_random) |> 
  ggplot() + 
  geom_sf(data = suffolk) + 
  geom_sf(aes(color = dots_type)) + 
  scale_color_viridis_d() + 
  theme_void()
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />
