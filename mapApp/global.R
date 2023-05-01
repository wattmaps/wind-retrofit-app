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

# converting sass file to css 
sass(
  input = sass_file("www/styles.scss"),
  output = "www/sass_styles.css"
     )


### ---------------
# Reading in Data
### ---------------

# data for the map
map_dat <- read_csv("/Users/colleenmccamy/Documents/MEDS/Capstone/code/wind-retrofit-app/mapApp/data/WID1_dat_clean.csv")

map_dat_test <- read_csv("/Users/colleenmccamy/Documents/MEDS/Capstone/code/wind-retrofit-app/mapApp/data/map_test_data_clean.csv")
