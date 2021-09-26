library(tidyverse)
comuni <- read.csv("data/comuni_list.csv", sep = ";")
comuni <- comuni %>% select(name = Denominazione.in.italiano, 
                            geo_region = Ripartizione.geografica, 
                            region = Denominazione.Regione, 
                            region_unita = Denominazione.dell.Unità.territoriale.sovracomunale...valida.a.fini.statistici.) %>% group_by(name) %>% summarize(geo_region = first(geo_region), region = first(region), region_unita = first(region_unita))
save(comuni, file = "rda/comuni.rda")
