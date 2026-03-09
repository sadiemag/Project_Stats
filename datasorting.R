library(tidyverse)
library(readxl)
library(dplyr)

statsdata <- real.excel("statsdata.xlsx")

wide_statsdata <- statsdata %>%
  select(`Country Name`, `Series Name`, `2016 [YR2016]`) %>%
  pivot_wider(
    names_from = `Series Name`, 
    values_from = `2016 [YR2016]`,
    values_fn = list(`2016 [YR2016]` = mean)
  ) %>%
  filter(!is.na(`GDP per capita (current US$)`) & !is.na(`Life expectancy at birth, total (years)`))

summary(wide_statsdata)
  



