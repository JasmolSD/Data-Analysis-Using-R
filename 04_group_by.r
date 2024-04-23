library(tidyverse)
library(ggplot2)
library(patchwork)

ss <- read.csv('./r_bridge/code/squirrels_subset.csv')

sscatter <- ss %>%
  ggplot() +
  aes(x = long, y = lat) +
  geom_point()

ss_long_hist <- ss %>%
  ggplot() +
  aes(x = long) +
  geom_histogram()

# moving average
ss_density <- ss %>%
  ggplot() +
  aes(x = long) +
  geom_density()

# sscatter / ss_long_hist
# ss_long_hist / ss_density

# group by fur color and display multiple plots
# use facet_wrap to break out the vars(primary_fur_color)
ss_group <- ss %>%
  ggplot() +
  aes(x = long) +
  geom_histogram() +
  facet_wrap(vars(primary_fur_color), ncol = 1)

# ss_group

# differentiate by color
ss_long_hist_color <- ss %>%
  ggplot() +
  aes(x = long, fill = primary_fur_color) +
  geom_histogram()

ss_long_hist_color

# identify relative levels of squirrel fur colors (unstacked)
# use position = dodge
ss_long_hist_color <- ss %>%
  ggplot() +
  aes(x = long, fill = primary_fur_color) +
  geom_histogram(position = 'dodge')
  
ss_long_hist_color


