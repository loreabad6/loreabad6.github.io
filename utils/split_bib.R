library(bib2df)
library(tidyverse)

backup_options = options()
options(encoding = "UTF-8")
bibdf = bib2df("E:/Bib_files/MyPublications.bib",
               separate_names = FALSE)
names = paste0("utils/", sort(unique(bibdf$CATEGORY)), ".bib")

bibdf %>%
  mutate(JOURNAL = str_replace_all(JOURNAL, "u¨", "{\\\\\"{u}}")) %>%
  arrange(CATEGORY) %>%
  group_by(CATEGORY) %>%
  slice_max(n = 8, order_by = c(YEAR), with_ties = F) %>%
  group_split() %>%
  map2(names, df2bib)

options(backup_options)
