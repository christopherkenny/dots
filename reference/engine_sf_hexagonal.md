# Generate Hexagonal Points with `sf`

Uses
[`sf::st_sample()`](https://r-spatial.github.io/sf/reference/st_sample.html)
to produce points and spatial joins with input `shp`. Each engine
function takes the same arguments and produces comparable outputs. Final
number of points may be approximate for this method.

## Usage

``` r
engine_sf_hexagonal(shp, col)
```

## Arguments

- shp:

  input shp with `sf` geometry.

- col:

  character column name to produce points with

## Value

tibble with `sf` geometries

## Examples

``` r
set.seed(1)
data('suffolk')
engine_sf_hexagonal(suffolk[16:20,], 'pop_nhpi')
#> Simple feature collection with 20 features and 21 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: -7913815 ymin: 5205934 xmax: -7908374 ymax: 5212464
#> Projected CRS: WGS 84 / Pseudo-Mercator
#> # A tibble: 20 × 22
#>    GEOID    NAME    pop pop_white pop_black pop_hisp pop_aian pop_asian pop_nhpi
#>    <chr>    <chr> <dbl>     <dbl>     <dbl>    <dbl>    <dbl>     <dbl>    <dbl>
#>  1 2502500… 0408…  5671      3212       467      572        1      1131       17
#>  2 2502500… 0408…  5671      3212       467      572        1      1131       17
#>  3 2502500… 0408…  5671      3212       467      572        1      1131       17
#>  4 2502500… 0408…  5671      3212       467      572        1      1131       17
#>  5 2502500… 0408…  5671      3212       467      572        1      1131       17
#>  6 2502500… 0408…  5671      3212       467      572        1      1131       17
#>  7 2502500… 0408…  5671      3212       467      572        1      1131       17
#>  8 2502500… 0408…  5671      3212       467      572        1      1131       17
#>  9 2502500… 0408…  5671      3212       467      572        1      1131       17
#> 10 2502500… 0408…  5671      3212       467      572        1      1131       17
#> 11 2502500… 0408…  5671      3212       467      572        1      1131       17
#> 12 2502500… 0408…  5671      3212       467      572        1      1131       17
#> 13 2502500… 0408…  5671      3212       467      572        1      1131       17
#> 14 2502500… 0408…  5671      3212       467      572        1      1131       17
#> 15 2502500… 0408…  5671      3212       467      572        1      1131       17
#> 16 2502500… 0408…  5671      3212       467      572        1      1131       17
#> 17 2502500… 0408…  5671      3212       467      572        1      1131       17
#> 18 2502500… 0604…  2371      2024        16       94        3       147        2
#> 19 2502500… 0604…  2371      2024        16       94        3       147        2
#> 20 2502500… 1207…  4337       163      2237     1695        7        33        1
#> # ℹ 13 more variables: pop_other <dbl>, pop_two <dbl>, vap <dbl>,
#> #   vap_white <dbl>, vap_black <dbl>, vap_hisp <dbl>, vap_aian <dbl>,
#> #   vap_asian <dbl>, vap_nhpi <dbl>, vap_other <dbl>, vap_two <dbl>,
#> #   dots_type <chr>, geometry <POINT [m]>
```
