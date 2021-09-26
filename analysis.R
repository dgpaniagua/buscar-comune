library(tidyverse)
load("rda/comuni.rda")

comune <- "t..in."

comuni %>% filter(str_detect(comuni$name, regex(comune, ignore_case = TRUE)))
