library(dplyr)
library(stringdist)

countries <- data.frame(values=c("American Samoa","United States of America", "Canada", "United Kingdom"))
country_map <- data.frame(values=c("America", "American Samoa", "United Kingdom", "Canada", "France"), codes=c("US", "AS", "UK", "CA", "FR"))

vals <- stringdistmatrix(countries$values, country_map$values, weight=c(.9, .05, .11, 1))
output <- data.frame(vals) %>% rowwise() %>% mutate(m = which.min(across())) %>% select(m)
