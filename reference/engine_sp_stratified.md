# Generate Stratified Points with `sp`

Uses
[`sp::spsample()`](https://edzer.github.io/sp/reference/spsample.html)
with method "regular" to produce points, converts back to `sf`, and
spatial joins with input `shp`. Each engine function takes the same
arguments and produces comparable outputs. Final number of points may be
approximate for this method.

## Usage

``` r
engine_sp_stratified(shp, col)
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
engine_sp_stratified(suffolk[16:20, ], 'pop_nhpi')
#> Simple feature collection with 22 features and 21 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: -7914076 ymin: 5206034 xmax: -7908214 ymax: 5212462
#> Projected CRS: WGS 84 / Pseudo-Mercator
#> First 10 features:
#>          GEOID                                NAME  pop pop_white pop_black
#> 1  25025000408 0408, Suffolk County, Massachusetts 5671      3212       467
#> 2  25025000408 0408, Suffolk County, Massachusetts 5671      3212       467
#> 3  25025000408 0408, Suffolk County, Massachusetts 5671      3212       467
#> 4  25025000408 0408, Suffolk County, Massachusetts 5671      3212       467
#> 5  25025000408 0408, Suffolk County, Massachusetts 5671      3212       467
#> 6  25025000408 0408, Suffolk County, Massachusetts 5671      3212       467
#> 7  25025000408 0408, Suffolk County, Massachusetts 5671      3212       467
#> 8  25025000408 0408, Suffolk County, Massachusetts 5671      3212       467
#> 9  25025000408 0408, Suffolk County, Massachusetts 5671      3212       467
#> 10 25025000408 0408, Suffolk County, Massachusetts 5671      3212       467
#>    pop_hisp pop_aian pop_asian pop_nhpi pop_other pop_two  vap vap_white
#> 1       572        1      1131       17        29     242 5527      3177
#> 2       572        1      1131       17        29     242 5527      3177
#> 3       572        1      1131       17        29     242 5527      3177
#> 4       572        1      1131       17        29     242 5527      3177
#> 5       572        1      1131       17        29     242 5527      3177
#> 6       572        1      1131       17        29     242 5527      3177
#> 7       572        1      1131       17        29     242 5527      3177
#> 8       572        1      1131       17        29     242 5527      3177
#> 9       572        1      1131       17        29     242 5527      3177
#> 10      572        1      1131       17        29     242 5527      3177
#>    vap_black vap_hisp vap_aian vap_asian vap_nhpi vap_other vap_two dots_type
#> 1        439      531        1      1102       17        28     232  pop_nhpi
#> 2        439      531        1      1102       17        28     232  pop_nhpi
#> 3        439      531        1      1102       17        28     232  pop_nhpi
#> 4        439      531        1      1102       17        28     232  pop_nhpi
#> 5        439      531        1      1102       17        28     232  pop_nhpi
#> 6        439      531        1      1102       17        28     232  pop_nhpi
#> 7        439      531        1      1102       17        28     232  pop_nhpi
#> 8        439      531        1      1102       17        28     232  pop_nhpi
#> 9        439      531        1      1102       17        28     232  pop_nhpi
#> 10       439      531        1      1102       17        28     232  pop_nhpi
#>                    geometry
#> 1  POINT (-7913687 5211679)
#> 2  POINT (-7913682 5211798)
#> 3  POINT (-7913563 5211842)
#> 4  POINT (-7913630 5211963)
#> 5  POINT (-7913563 5211930)
#> 6  POINT (-7913323 5211900)
#> 7  POINT (-7913688 5212149)
#> 8  POINT (-7913607 5212174)
#> 9  POINT (-7913411 5212130)
#> 10 POINT (-7913218 5212217)
```
