# load libraries ----
library(shiny)
library(shinyjs)
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
library(DT)
library(ggridges)
library(usmap)
library(htmltools)
library(shinyjs)
library(spData)


# converting sass file to css 
sass(
  input = sass_file("www/styles.scss"),
  output = "www/sass_styles.css"
     )

### ---------------
# Reading in Data
### ---------------

# data for the map
map_data <- read_csv("data/wattmaps_dat_1288_final.csv")
abrrev <- state.abb
names <- state.name
state_names <- data.frame(state = abrrev, state_names = names)

map_data <- map_data |> 
  full_join(state_names, by = "state")|> 
  mutate(en_comm = case_when(energy_community == 1 ~ "TRUE",
                             energy_community == 0 ~ "FALSE"))

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

energy_cols <- c("pid", "p_name", "p_year", "t_cap", "t_count", "slr_cpc", "wnd_cpc", "slr_wn", "tx_cpct", "revenue", "cost", "profit", "county", "state_names")

techno_cols <- c("pid", "p_name", "slr_cpc", "env_sens_score", "dac_sts", "energy_brdn", "foss_emplmt", "coal_emplmt", "outage_n"  , "outage_dur", "rci", "energy_community", "county","state_names")

transmission_cols <- c("pid", "p_name", "max_volt", "min_volt", "distance_km")

location_cols <- c("pid", "p_name", "p_year","lat", "lon", "fips", "county", "state_names" )
   

# data for the tables
energy_data <- map_data |> 
  select(all_of(energy_cols)) |> 
  rename("state" = "state_names")

techno_data <- map_data |> 
  select(all_of(transmission_cols))#|> 
  #rename("state" = map_data$state_names)

transmission_data <- map_data |> 
  select(all_of(transmission_cols))

location_data <- map_data |> 
  select(all_of(location_cols))#|> 
  #rename("state" = "state_names")

# placeholder for metadata
metadata <- map_data |> 
  select("pid")

# storing colors for the ridge plot
region_colors <- c('#B3D1DC', '#67A2B9', '#5496B1', '#4987A0', 
                   '#41778D', '#38677A', '#2F5767', '#264653')

state_colors <- c('#B3D1DC', '#67A2B9', 
                  '#5496B1', '#4987A0', '#41778D', 
                  '#38677A', '#264653')


env_ridge_data <- map_data %>%
  filter(!region == 'East South Central') # remove East South Central

states_vec <- c('TX','WA', 'CA', 'OR','IL', 'WV', 'MI')

rci_plot_data <- map_data |> 
  filter(energy_community == 1) |> 
  mutate(state = as.factor(state)) |> 
  filter(state %in% states_vec) 

energy_comm_solar_cap <- map_data |> 
  filter(energy_community == 1) |> 
  group_by(state) |> 
  summarize(total_slr_cpc = sum(slr_cpc, na.rm = TRUE)) |> 
  arrange(total_slr_cpc) |> 
  mutate(state = factor(state, levels = state)) 


### static graphs of capacity and ratios

# Find average ratio by state
avg_ratio_states <- map_data |> 
  group_by(state) |> 
  summarize(avg_slr_wn = mean(slr_wn, na.rm = TRUE),
            total_solar = sum(slr_cpc, na.rm = TRUE))


### Join state polygons with regions

# Create data frame of state names and state abbreviations
state_abbre <- tibble(state = state.name) |> 
  bind_cols(tibble(abb = state.abb))


# Find centroids of all states
state_centroids <- st_centroid(spData::us_states) |>  
  janitor::clean_names() |> 
  # Add common key in factor class
  mutate(state = as.factor(name)) |> 
  # Join to abbreviation data frame by common key
  left_join(state_abbre, by = 'state') |> 
  # Select state name and state abbreviation columns
  dplyr::select(name, abb) |> 
  rename(state = abb)

# Join centroids with state average solar PV ratios
us_state_avgs <- state_centroids |> 
  # Unlist and remove point geometry 
  mutate(lon = unlist(map(state_centroids$geometry, 1)),
         lat = unlist(map(state_centroids$geometry, 2))) |> 
  st_drop_geometry() |> 
  #dplyr::select(c(state, lon, lat)) |> 
  # Join to state average solar PV ratios by common key
  full_join(avg_ratio_states, by = 'state') |> 
  drop_na()

# # Create polygon base layer
 us_states_regions <- us_states |>  janitor::clean_names() |> 
   # Add common key in factor class
   mutate(state = as.factor(name)) |> 
   # Join to abbreviation data frame by common key
   left_join(state_abbre, by = 'state') |> 
   # Select state name and state abbreviation columns
   dplyr::select(name, abb) |> 
   rename(state = abb) |>
   full_join(us_state_avgs, by = 'state')
 