library(dplyr)

male.cancer <- read.csv(file = file.choose())
female.cancer <- read.csv(file = file.choose())

not_all_na <- function(x) any(!is.na(x))
process <- . %>%
  dplyr::select(where(not_all_na)) %>%
  distinct(ISO_3_CODE, .keep_all = T) %>%
  select(-c(RANK, CNTRY_TERR)) %>%
  filter(VALUE != "No data")

male.cancer.simple <- male.cancer %>% process
female.cancer.simple <- female.cancer %>% process


male.cancer.simple %>% View
female.cancer.simple %>% View
joined <- inner_join(male.cancer.simple, female.cancer.simple, by=c("ISO_3_CODE"), suffix=c(".male", ".female"))

write.csv(joined, file.choose(new=T), row.names=F)