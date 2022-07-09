#' Filter Points to a Region
#'
#' @param pts points with `sf` geometry to filter
#' @param shp shp to filter to
#' @param cond geometry subset to reduce shp to
#'
#' @return tibble with `sf` geometries
#' @export
#'
#' @examples
#' data(suffolk)
#' pts <- dots_points(suffolk, pop, divisor = 1000)
#' filter_pts(pts, suffolk, pop < 1000)
filter_pts <- function(pts, shp, cond = TRUE) {
  shp <- shp[[attr(shp, 'sf_column')]][rlang::eval_tidy(rlang::enquo(cond), shp)]
  rmapshaper::ms_clip(target = pts, clip = sf::st_as_sf(shp))
}
