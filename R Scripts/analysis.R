library(dplyr)
file <- read.csv(file=file.choose())

# https://stackoverflow.com/questions/2643939/remove-columns-from-dataframe-where-all-values-are-na

not_all_na <- function(x) any(!is.na(x))

# or %>% write.csv(file=file.choose(new=TRUE))
file %>% select(where(not_all_na)) %>% View
