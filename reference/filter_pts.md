# Filter Points to a Region

Filter Points to a Region

## Usage

``` r
filter_pts(pts, shp, cond = TRUE)
```

## Arguments

- pts:

  points with `sf` geometry to filter

- shp:

  shp to filter to

- cond:

  geometry subset to reduce shp to

## Value

tibble with `sf` geometries

## Examples

``` r
data(suffolk)
pts <- dots_points(suffolk, pop, divisor = 1000)
filter_pts(pts, suffolk, pop < 1000)
#> Simple feature collection with 4 features and 2 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: -7911622 ymin: 5203534 xmax: -7911538 ymax: 5214545
#> Projected CRS: WGS 84 / Pseudo-Mercator
#>   pop dots_type                 geometry
#> 1   1       pop POINT (-7911538 5203534)
#> 2   1       pop POINT (-7911544 5214545)
#> 3   1       pop POINT (-7911581 5209779)
#> 4   1       pop POINT (-7911622 5208838)
```
