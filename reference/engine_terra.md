# Generate Points with `terra`

Uses
[`terra::dots()`](https://rspatial.github.io/terra/reference/dots.html)
to produce points and transforms back to `sf`. Each engine function
takes the same arguments and produces comparable outputs.

## Usage

``` r
engine_terra(shp, col)
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
engine_terra(suffolk, 'pop_nhpi')
#> Simple feature collection with 281 features and 21 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: -7922420 ymin: 5198066 xmax: -7900159 ymax: 5225812
#> Projected CRS: WGS 84 / Pseudo-Mercator
#> First 10 features:
#>          GEOID                                                          NAME
#> 1  25025000577 Chelsea City Ward 1 Precinct 2, Suffolk County, Massachusetts
#> 2  25025000107                           0107, Suffolk County, Massachusetts
#> 3  25025000107                           0107, Suffolk County, Massachusetts
#> 4  25025000107                           0107, Suffolk County, Massachusetts
#> 5  25025000107                           0107, Suffolk County, Massachusetts
#> 6  25025000408                           0408, Suffolk County, Massachusetts
#> 7  25025000408                           0408, Suffolk County, Massachusetts
#> 8  25025000408                           0408, Suffolk County, Massachusetts
#> 9  25025000408                           0408, Suffolk County, Massachusetts
#> 10 25025000408                           0408, Suffolk County, Massachusetts
#>     pop pop_white pop_black pop_hisp pop_aian pop_asian pop_nhpi pop_other
#> 1  2151       152        82     1846        0        21        1        28
#> 2  3331       938        90     2027        6       115        4        51
#> 3  3331       938        90     2027        6       115        4        51
#> 4  3331       938        90     2027        6       115        4        51
#> 5  3331       938        90     2027        6       115        4        51
#> 6  5671      3212       467      572        1      1131       17        29
#> 7  5671      3212       467      572        1      1131       17        29
#> 8  5671      3212       467      572        1      1131       17        29
#> 9  5671      3212       467      572        1      1131       17        29
#> 10 5671      3212       467      572        1      1131       17        29
#>    pop_two  vap vap_white vap_black vap_hisp vap_aian vap_asian vap_nhpi
#> 1       21 1532       117        63     1306        0        16        1
#> 2      100 2601       816        71     1509        6        83        4
#> 3      100 2601       816        71     1509        6        83        4
#> 4      100 2601       816        71     1509        6        83        4
#> 5      100 2601       816        71     1509        6        83        4
#> 6      242 5527      3177       439      531        1      1102       17
#> 7      242 5527      3177       439      531        1      1102       17
#> 8      242 5527      3177       439      531        1      1102       17
#> 9      242 5527      3177       439      531        1      1102       17
#> 10     242 5527      3177       439      531        1      1102       17
#>    vap_other vap_two                 geometry dots_type
#> 1         12      17 POINT (-7907316 5218899)  pop_nhpi
#> 2         35      77 POINT (-7908588 5217959)  pop_nhpi
#> 3         35      77 POINT (-7908288 5218027)  pop_nhpi
#> 4         35      77 POINT (-7907796 5217923)  pop_nhpi
#> 5         35      77 POINT (-7908653 5218117)  pop_nhpi
#> 6         28     232 POINT (-7913679 5212058)  pop_nhpi
#> 7         28     232 POINT (-7913271 5212151)  pop_nhpi
#> 8         28     232 POINT (-7913643 5212287)  pop_nhpi
#> 9         28     232 POINT (-7913567 5212302)  pop_nhpi
#> 10        28     232 POINT (-7913672 5211553)  pop_nhpi
```
