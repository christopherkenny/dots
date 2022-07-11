#' Remove Water
#'
#' @param shp input shp with `sf` geometry.
#' @param water water shapes to remove with `sf` geometry
#' @param filter_islands logical. Should additional filtering be done to remove small areas?
#' @param ... additional arguments to pass to `rmapshaper::ms_filter_islands()`.
#'  Only used if `filter_islands = TRUE`.
#'
#' @return tibble with `sf` geometries
#' @export
#'
#' @examples
#' \donttest{
#' # time to run varies greatly, depending on machine
#' data(suffolk)
#' data(boston_water)
#' clip_water(suffolk, boston_water[10, ])
#' }
clip_water <- function(shp, water, filter_islands = FALSE, ...) {
  shp <- shp %>%
    sf::st_difference(y = water) %>%
    rmapshaper::ms_clip(clip = shp, remove_slivers = TRUE)

  if (filter_islands) {
    shp <- shp %>%
      rmapshaper::ms_filter_islands(...)
  }

  shp
}
