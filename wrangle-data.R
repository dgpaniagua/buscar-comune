library(tidyverse)
comunes <- read.csv("data/comunes_list.csv", sep = ";")
comunes <- comunes %>% select(codice = Codice.Comune.formato.alfanumerico, name = Denominazione.in.italiano, geo_region = Ripartizione.geografica, region = Denominazione.Regione, region_unita = Denominazione.dell.Unità.territoriale.sovracomunale...valida.a.fini.statistici.)
save(comunes, file = "rda/comunes.rda")