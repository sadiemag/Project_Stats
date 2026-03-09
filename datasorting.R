library(tidyverse)
library(readxl)
library(dplyr)

statsdata <- real.excel("statsdata.xlsx")

wide_statsdata <- statsdata %>%
  select('Country Name', `2016 [YR2016]`, `Series Name`) %>%  # keep only relevant columns
  pivot_wider(
    names_from = 'Series Name',
    values_from = '2016 [YR2016]'
    )

#i cant ge the NAs to go away but if anyone can try that would be good
 
  



