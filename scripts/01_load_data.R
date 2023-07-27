#### Example Repo ----
## Coder:   Your Name
## Date:    July 2023
## Version: V01


#### load packages ----
library(tidyverse)
library(openxlsx)
library(janitor)


#### set values ----
FILES <- dir("data")


#### read data ----
for(i in seq_along(FILES)) {
  if(str_detect(FILES[i], "[.]csv")) {
    temp <- read_csv(paste0("data/", FILES[i]))
  }
  if(str_detect(FILES[i], "[.]xls")) {
    temp <- loadWorkbook(paste0("data/", FILES[i]))
  }
  filename <- str_replace(str_replace(FILES[i], "[.]csv", ""), "[.]xlsx", "")
  assign(paste0("data_", filename), temp)
  rm(temp)
}; rm(i)
