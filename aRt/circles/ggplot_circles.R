library(tidyverse)

colors <- c('#11052C', '#3D087B', '#F43B86', '#FFE459')

axis_lim <- 10
axis_center <- axis_lim / 2

circles <- data.frame(i=23:60) ##empieza en 23 para dejar el hueco en el medio, 
#no dibujando radios mas chicos

circles <- circles %>% mutate(radius = 3400 / i)
## mientras i -> infinito, el r -> 0 , para eso el r = 3400 / i. 
## 3400 porque sino el radio queda muy chico para el tamaño del plot. Fui 
## probando valores

rombos <- data.frame(axis_x= seq(axis_center - 0.6, axis_center + 0.6, by=0.5))
## puntos del centro de los rombos

circles %>% ggplot() + theme_void() + 
  theme(panel.background = element_rect(fill=colors[1])) +
  xlim(0,axis_lim) +
  ylim(0,axis_lim) +
  geom_point(mapping=aes(x=axis_center, y=axis_center),
             size=circles$radius, ## multiplicar el radio para q no quede
             ## tan chico
             color = colors[2],
             shape = 1) + 
  geom_point(data=rombos,
             mapping=aes(x=axis_x, y=axis_center),
             color=colors[3],
             shape=5,
             size=20) +
  geom_point(data=rombos, ## rombos espejitos
             mapping=aes(x=axis_x + 0.2, y=axis_center),
             color=colors[4],
             shape=5,
             size=20)

