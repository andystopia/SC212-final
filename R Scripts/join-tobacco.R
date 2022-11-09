library(dplyr)

dataset <- read.csv(file="../datasets/prelim-data-with-some-country-codes.csv")
combined.cancer.com <- read.csv(file="../datasets/cancer-atlas-lung-cancer-combined.csv")

left_join(
  dataset,
  combined.cancer.com %>%
    rename(ALPHA3 = ISO_3_CODE) %>%
    select(-CNTRY_TERR.male), by=c("ALPHA3")
  ) %>% write.csv(file=file.choose(new=T))
