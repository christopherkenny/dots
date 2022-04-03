bb <- st_sfc(st_polygon(list(rbind(c(0,0), c(1,0), c(1,1), c(0,0)))))
grid <- st_as_sf(st_make_grid(bb, n = 6, crs = 3857)) %>%
    rename(geometry=x)
minissouri <- grid %>%
    mutate(row = rep(6:1, each=6),
           col = rep(1:6, 6),
           city1 = row <= 2 & col >= 5,
           city2 = row >= 5 & col <= 2,
           pop = 4,
           pop = if_else(city1, 10, pop),
           pop = if_else(city2, 7, pop),
           dem = 1,
           dem = if_else(city1, 8, dem),
           dem = if_else(city2, 5, dem),
           rep = 3,
           rep = if_else(city1, 2, rep),
           rep = if_else(city2, 2, rep)) %>%
    relocate(geometry, .after=rep) %>%
    redist_map(ndists=3, pop_tol=0.1)

minissouri_buff <- st_buffer(minissouri, -.02)
minissouri_buff2 <- st_buffer(minissouri, -.002)

test_r <- sf::st_sample(minissouri_buff,
                      size = minissouri$rep,
                      type = 'random',
                      exact = TRUE,
                      by_polygon = TRUE)
test_d <- sf::st_sample(minissouri_buff,
                        size = minissouri$dem,
                        type = 'random',
                        exact = TRUE,
                        by_polygon = TRUE)
minissouri %>% ggplot() +
    geom_sf(aes(fill = dem/(dem + rep), alpha = 0.5), color = 'white', lwd = 1) +
    scale_fill_gradient2(low = '#e41a1c', high = '#377eb8', na.value = '#4daf4a', midpoint = 0.5,
                         space = 'Lab', guide = 'colourbar',limits = c(0,1)) +
    geom_sf(data = test_r, color = 'red') +
    geom_sf(data = test_d, color = 'blue') +
    guides(fill = 'none', alpha = 'none') +
    theme_void()
