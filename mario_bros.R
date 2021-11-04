library(tidyverse)

red <- '#ea5a32'
brown <- '#573e20'
beige <- '#f8dcb9'
yellow <- '#ede54f'
blue <- '#2a5deb'
background <- '#ffffff'

fill_with_color <- function(df, new_color, xrange, yrange) {
  return (df %>% mutate(color = if_else((x %in% xrange) & (y %in% yrange), new_color, color)))
}

x <- 1:16
y <- 1:16
mario <- data.frame(crossing(x,y), color=background)

mario <- mario %>% fill_with_color(red, 4:8, 16:16) %>% 
  fill_with_color(red, 3:11, 15:15) %>% 
  fill_with_color(red, 3:4, 9:9) %>% 
  fill_with_color(red, 2:4, 8:8) %>% 
  fill_with_color(red, 1:4, 7:7) %>% 
  fill_with_color(red, 3:3, 6:6) %>% 
  fill_with_color(red, 6:7, 8:9) %>%
  fill_with_color(red, 9:10, 9:9) %>% 
  fill_with_color(red, 9:11, 8:8) %>%
  fill_with_color(red, 9:12, 7:7) %>% 
  fill_with_color(red, 10:10, 6:6)

mario <- mario %>% fill_with_color(beige, 6:7, 14:14) %>%
  fill_with_color(beige, 9:9, 14:14) %>% 
  fill_with_color(beige, 3:3, 12:13) %>%
  fill_with_color(beige, 5:7, 13:13) %>%
  fill_with_color(beige, 9:11, 13:13) %>%
  fill_with_color(beige, 6:8, 12:12) %>%
  fill_with_color(beige, 10:12, 12:12) %>%
  fill_with_color(beige, 4:7, 11:11) %>%
  fill_with_color(beige, 4:9, 10:10) %>%
  fill_with_color(beige, 1:2, 4:6) %>%
  fill_with_color(beige, 3:3, 5:5) %>%
  fill_with_color(beige, 11:12, 4:6) %>%
  fill_with_color(beige, 10:10, 5:5)

mario <- mario %>% fill_with_color(brown, 3:5, 14:14) %>%
  fill_with_color(brown, 4:4, 12:13) %>%
  fill_with_color(brown, 5:5, 12:12) %>%
  fill_with_color(brown, 2:2, 11:13) %>%
  fill_with_color(brown, 3:3, 11:11) %>%
  fill_with_color(brown, 9:9, 12:12) %>%
  fill_with_color(brown, 8:11, 11:11) %>%
  fill_with_color(brown, 3:4, 2:2) %>%
  fill_with_color(brown, 2:4, 1:1) %>%
  fill_with_color(brown, 9:10, 2:2) %>%
  fill_with_color(brown, 9:11, 1:1)

mario <- mario %>% fill_with_color('black', 8:8, 13:14)

mario <- mario %>% fill_with_color(blue, 5:5, 7:9) %>% 
  fill_with_color(blue, 8:8, 7:9) %>%
  fill_with_color(blue, 6:7, 4:7) %>%
  fill_with_color(blue, 5:5, 7:9) %>%
  fill_with_color(blue, 4:9, 4:5) %>% 
  fill_with_color(blue, 4:4, 3:6) %>%
  fill_with_color(blue, 8:8, 3:5) %>%
  fill_with_color(blue, 3:3, 3:4) %>%
  fill_with_color(blue, 5:5, 3:3) %>%
  fill_with_color(blue, 9:9, 6:6) %>%
  fill_with_color(blue, 9:9, 3:3) %>%
  fill_with_color(blue, 10:10, 3:4)

mario <- mario %>% fill_with_color(yellow, 5:5, 6:6) %>% 
  fill_with_color(yellow, 8:8, 6:6)

mario %>% ggplot() + geom_point(mapping=aes(x=x, y=y),color=mario$color, shape=15, size=9, show.legend = F) +
  xlim(0,14) + ylim(1,16) +
  coord_equal() +
  theme_void()