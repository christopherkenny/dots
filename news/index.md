# Changelog

## dots 0.0.3

CRAN release: 2025-09-12

- Replaces magrittr pipe with base pipe.

## dots 0.0.1

- Added a `NEWS.md` file to track changes to the package.
- Creates
  [`dots()`](http://christophertkenny.com/dots/reference/dots.md) and
  [`dots_points()`](http://christophertkenny.com/dots/reference/dots_points.md)
  to create dot density plots and points for dot density plots.
- Creates engine functions for point types from `terra`, `sf`, and `sp`.
- Creates water clipping via
  [`clip_water()`](http://christophertkenny.com/dots/reference/clip_water.md).
- Creates point filtering via
  [`filter_pts()`](http://christophertkenny.com/dots/reference/filter_pts.md).
- Adds an intro dot density vignette.
- Adds package logo.
- Adds tests with `testthat`.
- Adds `pkgdown` site.
- Adds GitHub Actions to run R CMD check.
