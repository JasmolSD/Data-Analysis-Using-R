library(tidyverse)
library(ggplot2)

squirrel_subset <- read_csv('./r_bridge/code/squirrels_subset.csv')

squirrel_subset <- squirrel_subset %>%
  mutate(date_f = as.Date.character(date, format = '%m%d%Y'))

## Task 1: Do the core work
## - Make a line plot that shows the squirrels observed by date

squirrel_subset %>%
  group_by(date_f) %>%
  summarise(count_of_squirrels = n()) %>%
  ggplot() +
  aes(x = date_f, y = count_of_squirrels) +
  geom_line()

## Challenge Task 2: Add on to the core work
## - We haven't covered this yet, so it is ABSOLUTELY optional.
## - But, what if you wanted to make a separate line plot for each of the
##   colors of squirrels?

## - To do so, you'd have to change how you're grouping (to count colors
##   separately), and then you'd have to bring that color variable (which
##   is a data feature) into your final line plot.

## If you're interested, try it!
squirrel_subset %>%
  group_by(date_f, primary_fur_color) %>%
  summarise(count_of_squirrels = n()) %>%
  ggplot() +
  aes(x = date_f, y = count_of_squirrels, color = primary_fur_color) +
  geom_line()
