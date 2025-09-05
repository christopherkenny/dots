suffolk <- censable::build_dec(geography = 'voting district', state = 'MA', county = 'Suffolk') |>
  sf::st_transform(3857)
suffolk <- rmapshaper::ms_simplify(suffolk, keep_shapes = TRUE)
sf::st_crs(suffolk)$wkt <- gsub("°|º", "\\\u00b0", sf::st_crs(suffolk)$wkt)

usethis::use_data(suffolk, overwrite = TRUE, compress = 'xz')
