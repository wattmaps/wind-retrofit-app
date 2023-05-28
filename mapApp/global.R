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
library(fontawesome)
library(plotly)

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
map_data <- read_csv("data/results.csv")
abrrev <- state.abb
names <- state.name
state_names <- data.frame(state = abrrev, state_names = names)

map_data <- map_data |> 
  full_join(state_names, by = "state")|> 
  mutate(en_comm = case_when(energy_community == 1 ~ "TRUE",
                             energy_community == 0 ~ "FALSE")) |> 
  mutate(en_bur = case_when(energy_brdn == 1 ~ "TRUE",
                            energy_brdn == 0 ~ "FALSE"))

# data for state bar graph
state_data <- map_data |> 
  group_by(state = state) |> 
  summarise(total_cap = sum(slr_cpc, na.rm = TRUE)) |> 
  full_join(state_names, by = "state") |> 
  filter(total_cap >= 2000) |> 
  mutate(total_cap = total_cap/1000)


# data for the time series graph
pid_1316_gen <- read_csv("data/gen_2012_pid_1316.csv")

# needed date information for the time series graph
pid_1316_gen <- pid_1316_gen |> 
  select(-datetime) |> 
  mutate(date_hr = as.POSIXct(paste(pid_1316_gen$year, 
                                    pid_1316_gen$month, 
                                    pid_1316_gen$day, 
                                    pid_1316_gen$hour, 
                                    sep = "-"),
                              format = "%Y-%m-%d-%H")) |> 
  mutate(day_year = yday(date_hr))
# adding date column for the time series graph
pid_1316_gen$date <- as.Date(pid_1316_gen$date_hr)


