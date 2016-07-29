###############################################################################
##
###############################################################################

## Preliminaries
###############################################################################
require(foreign)
require(dplyr)
require(tidyr)
## 

## first need to figure out the table of modules vs waves
## so we have five wave folders
data.dirs <- list.files("data", pattern = "*rel5-0-0_ALL_datasets_stata")
waves<- as.numeric(substring(data.dirs,7,7))

## extract module names from each wave folder
FunWaveModExtract <- function(wave) {
  x <- list.files(paste0("data/", data.dirs[wave]), pattern = ".dta")
  paste(wave, substr(x, 18, regexpr(".dta", x)-1), sep="-")
}

## make nice df
data.frame(combo = unlist(lapply(waves, function(x) FunWaveModExtract(x)))) %>%
  separate(combo, into = c("wave", "module"), sep="-") %>%
  table() %>% t() %>%
  as.data.frame.matrix() -> lookup.module.wave

## OK, so what am I doing. Lets get a balanced panel of the mental health and social 
## Networks data, and see how far we get. 
modules <- c("mh", "sn")
waves <- c(1, 2, 3, 4, 5)

lapply(waves, function(x) lapply(modules, function(y) {
  if(lookup.module.wave[modules, waves][`y`,x]) print(y)
  }
))




file.name <- paste0("data/sharew", wave, "_rel5-0-_ALL_datasets_stata/sharew", wave, "_rel5-0-0_", module, ".dta")


