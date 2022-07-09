#' Make dot density plots
#'
#' @param shp input shp with `sf` geometry.
#' @param cols <[`tidy-select`][dplyr::dplyr_tidy_select]> columns to produce dots for.
#' @param engine backend to use. Default is `engine_terra`.
#' @param divisor Number of people per dot. Default is 250.
#' @param min_point Minimum number of people to generate one dot. Defaults to 10% of the divisor.
#'
#' @return A ggplot
#' @export
#'
#' @examples
#' data('suffolk')
#' dots(suffolk, c(pop_white, pop_black), divisor = 1000)
dots <- function(shp, cols, engine = engine_terra, divisor = 250,
                 min_point = 0.1 * divisor) {
  cols <- rlang::enquo(cols)
  pts <- dots_points(shp, !!cols, engine, divisor, min_point)

  pts %>%
    ggplot2::ggplot() +
    ggplot2::geom_sf(data = shp, fill = NA, color = 'black') +
    ggplot2::geom_sf(ggplot2::aes(color = .data$dots_type))
}

#' Make dot density points
#'
#' @param shp input shp with `sf` geometry.
#' @param cols <[`tidy-select`][dplyr::dplyr_tidy_select]> columns to produce dots for.
#' @param engine backend to use. Default is `engine_terra`.
#' @param divisor Number of people per dot. Default is 250.
#' @param min_point Minimum number of people to generate one dot. Defaults to 10% of the divisor.
#'
#' @return tibble with `sf` geometries
#' @export
#'
#' @examples
#' data('suffolk')
#' dots_points(suffolk, c(pop_white, pop_black))
dots_points <- function(shp, cols, engine = engine_terra, divisor = 250,
                        min_point = 0.1 * divisor) {
  cols <- rlang::enquo(cols)
  cols <- shp %>%
    dplyr::select(!!cols) %>%
    dplyr::mutate(
      dplyr::across(.cols = !!cols, .fns = \(x) ifelse(x > min_point, ceiling(x / divisor), 0))
    )

  purrr::map_dfr(setdiff(names(cols), attr(cols, 'sf_column')),
                 function(x) {
                   engine(cols, x)
                 }
  )
}
