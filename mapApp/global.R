# load libraries ----
library(shiny)
library(markdown)
library(sass)
library(sf)
library(leaflet)
library(tidyverse)
library(ggplot2)
library(lubridate)
library(shinyWidgets)
library(jsonlite)
library(datasets)
library(fresh)

# converting sass file to css 
sass(
  input = sass_file("www/styles.scss"),
  output = "www/sass_styles.css"
     )

### ---------------
# Reading in Data
### ---------------

# data for the map
map_dat <- read_csv("data/WID1_dat_clean.csv")
map_data <- read_csv("data/map_data.csv")
abrrev <- state.abb
names <- state.name
state_names <- data.frame(state = abrrev, state_names = names)

state_data <- map_data |> 
  group_by(state = t_state) |> 
  summarise(total_cap = sum(slr_cpc)) |> 
  full_join(state_names, by = "state") |> 
  filter(total_cap >= 2000) |> 
  mutate(total_cap = total_cap/1000)
