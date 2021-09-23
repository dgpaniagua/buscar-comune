library(tidyverse)
load("rda/comunes.rda")

comunes %>% filter(str_detect(comunes$name, regex(".a.at.....", ignore_case = TRUE)))