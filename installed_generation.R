## data from https://pxweb.irena.org/pxweb/en/IRENASTAT

library(tidyverse)

## load in total installed capacity off and on grid
ic_on <- read.csv("data/ELECCAP_20220327-080750.csv", skip = 2)
ic_off <- read.csv("data/ELECCAP_20220327-080755.csv", skip = 2)

## load in total generation off and on grid
tg_off <- read.csv("data/ELECGEN_20220327-080917.csv", skip = 2)
tg_on <- read.csv("data/ELECGEN_20220327-080921.csv", skip = 2)

tg <- rbind(tg_off, tg_on)

tg_tech_tot <- tg %>% 
  mutate(tot = as.numeric(Electricity.generation.by.country.area..GWh.)) %>% 
  group_by(Technology) %>% 
  summarise(tot_gen=sum(tot, na.rm = TRUE))

    

