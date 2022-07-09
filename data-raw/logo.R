devtools::load_all()
library(tidyverse)
rock <- geomander::get_alarm('NY') %>%
  filter(county == 'Rockland County')
set.seed(1)
rock %>%
  dots_points(cols = c(pre_20_rep_tru, pre_20_dem_bid), divisor = 25) %>%
  ggplot() +
  #geom_sf(data = rock, fill = NA) +
  geom_sf(aes(color = dots_type), size = 0.25) +
  scale_color_manual(name = '', values = c('pre_20_rep_tru' = '#A0442C', 'pre_20_dem_bid' = '#0063B1'),
                     guide = 'none') +
  ggredist::theme_map()
ggsave('data-raw/rockland.png', width = 5, height = 7)

