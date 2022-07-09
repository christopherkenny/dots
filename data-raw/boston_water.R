library(tidyverse)

boston_water <- tigris::area_water('MA', 'Suffolk') %>%
  sf::st_transform(3857) %>%
  filter(!is.na(FULLNAME)) %>%
  arrange(desc(AWATER)) %>%
  group_by(FULLNAME) %>%
  summarize(
    area = sum(AWATER)
    ) %>%
  rename(name = FULLNAME) %>%
  arrange(desc(area)) %>%
  slice(1:10) %>%
  rmapshaper::ms_simplify(keep = 0.1)
sf::st_crs(boston_water)$wkt <- gsub("°|º", "\\\u00b0", sf::st_crs(boston_water)$wkt)

usethis::use_data(boston_water, overwrite = TRUE, compress = 'xz')
