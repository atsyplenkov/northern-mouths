#############################################################################
#
# Explore Northen mouths database
#
# Database created by D.Shkolny, D. Aibulatov
# Analysis made by A. Tsyplenkov atsyplenkov@gmail.com
#
#############################################################################

library(tidyverse)
library(readxl)
library(magrittr)

Sys.setlocale("LC_ALL", "Russian_Russia")
source("https://raw.githubusercontent.com/atsyplenkov/caucasus-sediment-yield/master/R/00_own-functions.R")

# 1) Read database
df <- read_xlsx("data/raw/Svodnaya_obschaya_2.xlsx", col_names = F, skip = 2) %>% 
  set_colnames(c("NN", "coord", "name", "type", "F", "F_gl", "F_ice",
                 "F_mouth", "L_sea_mouth", "L_ogib", "L_izr", "I_vzm",
                 "H_mean500", "ws_Li500", "ws_I500", "H_mean_aster",
                 "ws_Li_aster", "ws_I_aster", "island", "sea"))
  
# 2) Test lm
df %>% 
  select(-NN, -coord, -name) %>% 
  tidyr::drop_na() %>% 
  lm(type ~ ., data = .) %>% 
  summary()
