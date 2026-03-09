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
  
wide_statsdata %>%
  summarise(
    Mean = mean(`Life expectancy at birth, total (years)`),
    Median = median(`Life expectancy at birth, total (years)`),
    Std_Dev = sd(`Life expectancy at birth, total (years)`),
    Min = min(`Life expectancy at birth, total (years)`),
    Max = max(`Life expectancy at birth, total (years)`),
    IQR = IQR(`Life expectancy at birth, total (years)`)
  )

wide_statsdata %>% filter(`Life expectancy at birth, total (years)` == min(`Life expectancy at birth, total (years)`))

wide_statsdata %>% filter(`Life expectancy at birth, total (years)` == max(`Life expectancy at birth, total (years)`))
