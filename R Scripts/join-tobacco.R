library(dplyr)

dataset <- read.csv(file="../datasets/prelim-data-with-some-country-codes.csv")
combined.cancer.com <- read.csv(file="../datasets/cancer-atlas-lung-cancer-combined.csv")
combined.cancer.com.dis <- combined.cancer.com %>% distinct

left_join(
  dataset,
  combined.cancer.com.dis %>%
    rename(ALPHA3 = ISO_3_CODE) %>%
    select(-CNTRY_TERR.male), by=c("ALPHA3")
  ) %>% View
