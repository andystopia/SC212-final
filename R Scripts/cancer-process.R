library(dplyr)

male.cancer <- read.csv(file = file.choose())
female.cancer <- read.csv(file = file.choose())

not_all_na <- function(x) any(!is.na(x))
male.cancer.simple <- male.cancer %>% dplyr::select(where(not_all_na))
female.cancer.simple <- female.cancer %>% dplyr::select(where(not_all_na))

joined <- inner_join(male.cancer.simple, female.cancer.simple, by=c("ISO_3_CODE"), suffix=c(".male", ".female"))%>%
  select(-c("CNTRY_TERR.female"))

write.csv(joined, file.choose(new=T), row.names=F)