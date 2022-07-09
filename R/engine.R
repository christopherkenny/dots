#' Generate Points with `terra`
#'
#' Uses `terra::dots()` to produce points and transforms back to `sf`.
#' Each engine function takes the same arguments and produces comparable outputs.
#'
#' @param shp input shp with `sf` geometry.
#' @param col character column name to produce points with
#'
#' @return tibble with `sf` geometries
#' @export
#'
#' @examples
#' set.seed(1)
#' data('suffolk')
#' engine_terra(suffolk, 'pop_nhpi')
engine_terra <- function(shp, col) {
  shp |>
    terra::vect() |>
    terra::dots(col, 1) |>
    sf::st_as_sf() |>
    dplyr::mutate(dots_type = col)
}

#' Generate Random Points with `sf`
#'
#' Uses `sf::st_sample()` to produce points and spatial joins with input `shp`.
#' Each engine function takes the same arguments and produces comparable outputs.
#'
#' @param shp input shp with `sf` geometry.
#' @param col character column name to produce points with
#'
#' @return tibble with `sf` geometries
#' @export
#'
#' @examples
#' set.seed(1)
#' data('suffolk')
#' engine_sf_random(suffolk[16:20,], 'pop_nhpi')
engine_sf_random <- function(shp, col) {
  sf::st_sample(x = sf::st_geometry(shp), size = shp[[col]],
                type = 'random', exact = TRUE) |>
    dplyr::as_tibble() |>
    sf::st_as_sf() |>
    dplyr::mutate(dots_type = col) |>
    sf::st_join(y = shp) |>
    dplyr::relocate(.data$dots_type, .data$geometry, .after = dplyr::everything())
}

#' Generate Regular Points with `sf`
#'
#' Uses `sf::st_sample()` to produce points and spatial joins with input `shp`.
#' Each engine function takes the same arguments and produces comparable outputs.
#' Final number of points may be approximate for this method.
#'
#' @param shp input shp with `sf` geometry.
#' @param col character column name to produce points with
#'
#' @return tibble with `sf` geometries
#' @export
#'
#' @examples
#' set.seed(1)
#' data('suffolk')
#' engine_sf_regular(suffolk[16:20,], 'pop_nhpi')
engine_sf_regular <- function(shp, col) {
  shp <- shp[shp[[col]] > 0, ]
  sf::st_sample(x = sf::st_geometry(shp), size = shp[[col]],
                type = 'regular', exact = TRUE) |>
    dplyr::as_tibble() |>
    sf::st_as_sf() |>
    dplyr::mutate(dots_type = col) |>
    sf::st_join(y = shp) |>
    dplyr::relocate(.data$dots_type, .data$geometry, .after = dplyr::everything())
}

#' Generate Hexagonal Points with `sf`
#'
#' Uses `sf::st_sample()` to produce points and spatial joins with input `shp`.
#' Each engine function takes the same arguments and produces comparable outputs.
#' Final number of points may be approximate for this method.
#'
#' @param shp input shp with `sf` geometry.
#' @param col character column name to produce points with
#'
#' @return tibble with `sf` geometries
#' @export
#'
#' @examples
#' set.seed(1)
#' data('suffolk')
#' engine_sf_hexagonal(suffolk[16:20,], 'pop_nhpi')
engine_sf_hexagonal <- function(shp, col) {
  shp <- shp[shp[[col]] > 0, ]
  sf::st_sample(x = sf::st_geometry(shp), size = shp[[col]],
                type = 'hexagonal', exact = TRUE) |>
    dplyr::as_tibble() |>
    sf::st_as_sf() |>
    dplyr::mutate(dots_type = col) |>
    sf::st_join(y = shp) |>
    dplyr::relocate(.data$dots_type, .data$geometry, .after = dplyr::everything())
}

#' Generate Random Points with `sp`
#'
#' Uses `sp::spsample()` with method "random" to produce points, converts back to `sf`,
#' and spatial joins with input `shp`.
#' Each engine function takes the same arguments and produces comparable outputs.
#' Final number of points may be approximate for this method.
#'
#' @param shp input shp with `sf` geometry.
#' @param col character column name to produce points with
#'
#' @return tibble with `sf` geometries
#' @export
#'
#' @examples
#' set.seed(1)
#' data('suffolk')
#' engine_sp_random(suffolk[16:20,], 'pop_nhpi')
engine_sp_random <- function(shp, col) {
  shp <- shp[shp[[col]] > 0, ]
  spdata <- sf::as_Spatial(shp)
  purrr::map_dfr(seq_len(nrow(spdata)), function(i) {
    sp::spsample(spdata[i, ], shp[[col]][i], type = 'regular', iter = 15) |>
      sf::st_as_sf() |>
      dplyr::mutate(dots_type = col) |>
      sf::st_join(y = shp) |>
      dplyr::relocate(.data$dots_type, .data$geometry, .after = dplyr::everything()) |>
      suppressWarnings() # proj warning
  })
}

#' Generate Regular Points with `sp`
#'
#' Uses `sp::spsample()` with method "regular" to produce points, converts back to `sf`,
#' and spatial joins with input `shp`.
#' Each engine function takes the same arguments and produces comparable outputs.
#' Final number of points may be approximate for this method.
#'
#' @param shp input shp with `sf` geometry.
#' @param col character column name to produce points with
#'
#' @return tibble with `sf` geometries
#' @export
#'
#' @examples
#' set.seed(1)
#' data('suffolk')
#' engine_sp_regular(suffolk[16:20,], 'pop_nhpi')
engine_sp_regular <- function(shp, col) {
  shp <- shp[shp[[col]] > 0, ]
  spdata <- sf::as_Spatial(shp)
  purrr::map_dfr(seq_len(nrow(spdata)), function(i) {
    sp::spsample(spdata[i, ], shp[[col]][i], type = 'regular', iter = 15) |>
      sf::st_as_sf() |>
      dplyr::mutate(dots_type = col) |>
      sf::st_join(y = shp) |>
      dplyr::relocate(.data$dots_type, .data$geometry, .after = dplyr::everything()) |>
      suppressWarnings() # proj warning
  })
}

#' Generate Stratified Points with `sp`
#'
#' Uses `sp::spsample()` with method "regular" to produce points, converts back to `sf`,
#' and spatial joins with input `shp`.
#' Each engine function takes the same arguments and produces comparable outputs.
#' Final number of points may be approximate for this method.
#'
#' @param shp input shp with `sf` geometry.
#' @param col character column name to produce points with
#'
#' @return tibble with `sf` geometries
#' @export
#'
#' @examples
#' set.seed(1)
#' data('suffolk')
#' engine_sp_stratified(suffolk[16:20, ], 'pop_nhpi')
engine_sp_stratified <- function(shp, col) {
  shp <- shp[shp[[col]] > 0, ]
  spdata <- sf::as_Spatial(shp)
  purrr::map_dfr(seq_len(nrow(spdata)), function(i) {
    sp::spsample(spdata[i, ], shp[[col]][i], type = 'stratified', iter = 15) |>
      sf::st_as_sf() |>
      dplyr::mutate(dots_type = col) |>
      sf::st_join(y = shp) |>
      dplyr::relocate(.data$dots_type, .data$geometry, .after = dplyr::everything()) |>
      suppressWarnings() # proj warning
  })
}

#' Generate Nonaligned Points with `sp`
#'
#' Uses `sp::spsample()` with method "nonaligned" to produce points, converts back to `sf`,
#' and spatial joins with input `shp`.
#' Each engine function takes the same arguments and produces comparable outputs.
#' Final number of points may be approximate for this method.
#'
#' @param shp input shp with `sf` geometry.
#' @param col character column name to produce points with
#'
#' @return tibble with `sf` geometries
#' @export
#'
#' @examples
#' set.seed(1)
#' data('suffolk')
#' engine_sp_nonaligned(suffolk[16:20, ], 'pop_nhpi')
engine_sp_nonaligned <- function(shp, col) {
  shp <- shp[shp[[col]] > 0, ]
  spdata <- sf::as_Spatial(shp)
  purrr::map_dfr(seq_len(nrow(spdata)), function(i) {
    sp::spsample(spdata[i, ], shp[[col]][i], type = 'nonaligned', iter = 15) |>
      sf::st_as_sf() |>
      dplyr::mutate(dots_type = col) |>
      sf::st_join(y = shp) |>
      dplyr::relocate(.data$dots_type, .data$geometry, .after = dplyr::everything()) |>
      suppressWarnings() # proj warning
  })
}

#' Generate Hexagonal Points with `sp`
#'
#' Uses `sp::spsample()` with method "hexagonal" to produce points, converts back to `sf`,
#' and spatial joins with input `shp`.
#' Each engine function takes the same arguments and produces comparable outputs.
#' Final number of points may be approximate for this method.
#'
#' @param shp input shp with `sf` geometry.
#' @param col character column name to produce points with
#'
#' @return tibble with `sf` geometries
#' @export
#'
#' @examples
#' set.seed(1)
#' data('suffolk')
#' engine_sp_hexagonal(suffolk[16:20, ], 'pop_nhpi')
engine_sp_hexagonal <- function(shp, col) {
  shp <- shp[shp[[col]] > 0, ]
  spdata <- sf::as_Spatial(shp)
  purrr::map_dfr(seq_len(nrow(spdata)), function(i) {
    sp::spsample(spdata[i, ], shp[[col]][i], type = 'hexagonal', iter = 15) |>
      sf::st_as_sf() |>
      dplyr::mutate(dots_type = col) |>
      sf::st_join(y = shp) |>
      dplyr::relocate(.data$dots_type, .data$geometry, .after = dplyr::everything()) |>
      suppressWarnings() # proj warning
  })
}

#' Generate Clustered Points with `sp`
#'
#' Uses `sp::spsample()` with method "clustered" to produce points, converts back to `sf`,
#' and spatial joins with input `shp`.
#' Each engine function takes the same arguments and produces comparable outputs.
#' Final number of points may be approximate for this method.
#'
#' @param shp input shp with `sf` geometry.
#' @param col character column name to produce points with
#'
#' @return tibble with `sf` geometries
#' @export
#'
#' @examples
#' set.seed(1)
#' data('suffolk')
#' engine_sp_clustered(suffolk[16:20, ], 'pop_nhpi')
engine_sp_clustered <- function(shp, col) {
  shp <- shp[shp[[col]] > 0, ]
  spdata <- sf::as_Spatial(shp)
  purrr::map_dfr(seq_len(nrow(spdata)), function(i) {
    sp::spsample(spdata[i, ], shp[[col]][i], type = 'clustered', iter = 15) |>
      sf::st_as_sf() |>
      dplyr::mutate(dots_type = col) |>
      sf::st_join(y = shp) |>
      dplyr::relocate(.data$dots_type, .data$geometry, .after = dplyr::everything()) |>
      suppressWarnings() # proj warning
  })
}
