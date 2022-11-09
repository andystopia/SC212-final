library(dplyr)

dataset <- read.csv(file="../datasets/prelim-data.csv")
country.codes <- read.csv(file="../datasets/country-codes.csv")


left_join(dataset, country.codes %>% select(Country, ALPHA3), by=c("Country")) %>% write.csv(file=file.choose(new=T), row.names=F)