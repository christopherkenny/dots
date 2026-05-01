# Remove Water

Remove Water

## Usage

``` r
clip_water(shp, water, filter_islands = FALSE, ...)
```

## Arguments

- shp:

  input shp with `sf` geometry.

- water:

  water shapes to remove with `sf` geometry

- filter_islands:

  logical. Should additional filtering be done to remove small areas?

- ...:

  additional arguments to pass to
  [`rmapshaper::ms_filter_islands()`](http://andyteucher.ca/rmapshaper/reference/ms_filter_islands.md).
  Only used if `filter_islands = TRUE`.

## Value

tibble with `sf` geometries

## Examples

``` r
# \donttest{
# time to run varies greatly, depending on machine
data(suffolk)
data(boston_water)
clip_water(suffolk, boston_water[10, ])
#> Warning: attribute variables are assumed to be spatially constant throughout all geometries
#> Simple feature collection with 295 features and 22 fields
#> Geometry type: GEOMETRY
#> Dimension:     XY
#> Bounding box:  xmin: -7924935 ymin: 5195183 xmax: -7898484 ymax: 5228645
#> Projected CRS: WGS 84 / Pseudo-Mercator
#> First 10 features:
#>    vap_white pop_nhpi pop_other  vap vap_black pop_two pop_white pop_asian
#> 1        403        0        29 1949       139      65       469        57
#> 2        790        0        36 1841       338     142       879       487
#> 3       1176        0         7 1387        25      68      1278        56
#> 4       1525        0         3 1634        11      22      1721        29
#> 5       1212        0        24 1967       203     103      1441       117
#> 6        689        0        26 1374       140      79       757        84
#> 7        933        0         4 1131        26      50      1114        76
#> 8       1252        0        24 1827       188      80      1445       260
#> 9       1793        0        19 2340       111      73      1905       172
#> 10       117        1        28 1532        63      21       152        21
#>    vap_aian             name pop_aian pop_hisp pop_black  pop
#> 1         0 Little Mystic Ch        1     1818       169 2608
#> 2         4 Little Mystic Ch        4      284       483 2315
#> 3         0 Little Mystic Ch        0       83        25 1517
#> 4         0 Little Mystic Ch        1       55        11 1842
#> 5         4 Little Mystic Ch        4      478       254 2421
#> 6         0 Little Mystic Ch        0      485       163 1594
#> 7         0 Little Mystic Ch        0      103        40 1387
#> 8         4 Little Mystic Ch        4      146       220 2179
#> 9         4 Little Mystic Ch        4      214       113 2500
#> 10        0 Little Mystic Ch        0     1846        82 2151
#>                                                             NAME       GEOID
#> 1  Chelsea City Ward 3 Precinct 4, Suffolk County, Massachusetts 25025000587
#> 2                            1605, Suffolk County, Massachusetts 25025001605
#> 3                            0511, Suffolk County, Massachusetts 25025000511
#> 4                            0609, Suffolk County, Massachusetts 25025000609
#> 5                            2002, Suffolk County, Massachusetts 25025002002
#> 6                            1106, Suffolk County, Massachusetts 25025001106
#> 7                            2012, Suffolk County, Massachusetts 25025002012
#> 8                            1610, Suffolk County, Massachusetts 25025001610
#> 9                            0506, Suffolk County, Massachusetts 25025000506
#> 10 Chelsea City Ward 1 Precinct 2, Suffolk County, Massachusetts 25025000577
#>    vap_asian vap_hisp vap_nhpi   area vap_other vap_two
#> 1         54     1288        0 575502        17      48
#> 2        385      187        0 575502        29     108
#> 3         51       72        0 575502         6      57
#> 4         29       47        0 575502         3      19
#> 5         99      357        0 575502        20      72
#> 6         82      384        0 575502        26      53
#> 7         60       71        0 575502         4      37
#> 8        206      106        0 575502        13      58
#> 9        157      201        0 575502        17      57
#> 10        16     1306        1 575502        12      17
#>                          geometry
#> 1  POLYGON ((-7908080 5221634,...
#> 2  POLYGON ((-7909969 5205478,...
#> 3  POLYGON ((-7911480 5215211,...
#> 4  POLYGON ((-7906488 5212416,...
#> 5  POLYGON ((-7919232 5204078,...
#> 6  POLYGON ((-7915314 5208587,...
#> 7  POLYGON ((-7921409 5204517,...
#> 8  POLYGON ((-7909061 5205002,...
#> 9  POLYGON ((-7912189 5215053,...
#> 10 POLYGON ((-7907417 5219562,...
# }
```
