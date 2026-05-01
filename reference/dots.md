# Make dot density plots

Make dot density plots

## Usage

``` r
dots(
  shp,
  cols,
  engine = engine_terra,
  divisor = 250,
  min_point = 0.1 * divisor
)
```

## Arguments

- shp:

  input shp with `sf` geometry.

- cols:

  \<[`tidy-select`](https://dplyr.tidyverse.org/reference/dplyr_tidy_select.html)\>
  columns to produce dots for.

- engine:

  backend to use. Default is `engine_terra`.

- divisor:

  Number of people per dot. Default is 250.

- min_point:

  Minimum number of people to generate one dot. Defaults to 10% of the
  divisor.

## Value

A ggplot

## Examples

``` r
data('suffolk')
# subset to first 20 rows for speed on CRAN
dots(suffolk[1:20, ], c(vap_black), divisor = 2000)
```
