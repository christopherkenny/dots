dots <- function(data, .cols, reduce = 100) {

}

pts <- sf::st_sample(x = test, size = round(test$pop/500))

data %>% ggplot2::ggplot() +
  ggplot2::geom_sf(fill = NA) +
  ggplot2::geom_sf(data = pts, size = 0.5, alpha = 0.5) +
  ggplot2::theme_void()
library(ggplot2)

pts %>% ggplot() + geom_sf()
data <- test
