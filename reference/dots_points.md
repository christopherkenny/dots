# Make dot density points

Make dot density points

## Usage

``` r
dots_points(
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

tibble with `sf` geometries

## Examples

``` r
data('suffolk')
# subset to first 20 rows for speed on CRAN
dots_points(suffolk[1:20, ], c(vap_black))
#> Simple feature collection with 35 features and 2 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: -7921798 ymin: 5200245 xmax: -7903669 ymax: 5221822
#> Projected CRS: WGS 84 / Pseudo-Mercator
#> First 10 features:
#>    vap_black dots_type                 geometry
#> 1          1 vap_black POINT (-7907377 5221132)
#> 2          2 vap_black POINT (-7910081 5205016)
#> 3          2 vap_black POINT (-7909522 5205168)
#> 4          1 vap_black POINT (-7919028 5203556)
#> 5          1 vap_black POINT (-7914983 5208191)
#> 6          1 vap_black POINT (-7921798 5204235)
#> 7          1 vap_black POINT (-7909213 5204162)
#> 8          1 vap_black POINT (-7912179 5214350)
#> 9          1 vap_black POINT (-7907742 5219117)
#> 10         3 vap_black POINT (-7913848 5208345)
```
