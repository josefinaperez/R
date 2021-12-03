library(tidyverse)

fill_with_color <- function(df, new_color, xrange, yrange) {
  return (df %>% mutate(color = if_else((x %in% xrange) & (y %in% yrange), new_color, color)))
}

x <- 0:26
y <- 0:26

skin <- '#eccfa8'

jaique <- data.frame(crossing(x,y), color='#26C485')

##pelo
jaique <- jaique %>% fill_with_color('black', 1:4, 25:25) %>% 
  fill_with_color('black', 2:5, 24:24) %>%
  fill_with_color('black', 2:10, 23:23) %>% 
  fill_with_color('black', 4:14, 22:22) %>% 
  fill_with_color('black', 5:19, 21:21) %>% 
  fill_with_color('black', 7:21, 20:20) %>% 
  fill_with_color('black', 7:22, 19:19) %>% 
  fill_with_color('black', 7:22, 18:18)

##piel
  jaique <- jaique %>% fill_with_color(skin, 7:22, 17:17) %>% 
  fill_with_color(skin, 8:21, 16:16) %>% 
  fill_with_color(skin, 8:21, 15:15) %>% 
  fill_with_color(skin, 9:20, 14:14) %>% 
  fill_with_color(skin, 9:20, 13:13) %>% 
  fill_with_color(skin, 10:19, 12:12) %>% 
  fill_with_color(skin, 10:19, 11:11) %>% 
  fill_with_color(skin, 11:18, 10:10) %>% 
  fill_with_color(skin, 11:17, 9:9) %>% 
  fill_with_color(skin, 12:17, 8:8) %>% 
  fill_with_color(skin, 12:17, 7:7) %>% 
  fill_with_color(skin, 13:16, 6:6) %>% 
  fill_with_color(skin, 13:16, 5:5) %>% 
  fill_with_color(skin, 14:16, 4:4) 
  
  ##ojos
  jaique <- jaique %>% fill_with_color('white', 10:12, 16:16) %>% 
    fill_with_color('black', 11:11, 16:16) %>% 
    fill_with_color('white', 18:20, 16:16) %>% 
    fill_with_color('black', 19:19, 16:16)
  
  ##faso y mano
  jaique <- jaique %>% fill_with_color('white', 23:23, 2:5) %>% 
    fill_with_color('red', 23:23, 6:6) %>% 
    fill_with_color(skin, 22:24, 0:1)
    
    

jaique %>% ggplot() + geom_point(mapping=aes(x=x, y=y),color=jaique$color, shape=15, size=9, show.legend = F) +
  xlim(0,26) + ylim(0,26) +
  coord_equal() +
  theme_void()

ggsave('jaique.jpg')
