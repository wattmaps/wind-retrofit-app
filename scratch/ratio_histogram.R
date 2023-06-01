map_data

colnames(map_data)

cpc_state <- map_data |> 
  group_by(state = t_state) |> 
  summarise(total_cap = sum(slr_cpc))


hist <- ggplot(map_data, aes(x = slr_wn)) +
  geom_histogram(bins = round(sqrt(nrow(map_data))),
                 col = "#E76F51",
                 fill = "#F4A261") + theme_minimal() +
  labs(x = "Solar to Wind Ratio",
       y = "Freqency",
       title = "Distribution of Ratios") + 
  theme(plot.title = element_text(hjust = 0.5))
hist

#### --------------------
# Capacity by state graph
#### --------------------

# loading state names
library(datasets)
abrrev <- state.abb
names <- state.name
state_names <- data.frame(state = abrrev, state_names = names)

# making new df
state_data <- map_data |> 
  group_by(state = state) |> 
  summarise(total_cap = sum(slr_cpc)) |> 
  full_join(state_names, by = "state") |> 
  filter(total_cap >= 2000) |> 
  mutate(total_cap = total_cap/1000)


# plotting
state_data |> 
  ggplot(aes(x = reorder(state_names, total_cap), 
             y = total_cap)) +
  geom_col(col = "#E76F51",
           fill = "#F4A261") +
  geom_text(aes(label = round(total_cap, 1)), 
            hjust = -0.2, vjust = 0.5, 
            color = "#264653", 
            size = 3) +  # Add text labels
  theme_minimal() +
  theme_minimal() +
  coord_flip() +  
  labs(x = "State",
       y = "Total Solar Capacity (GW)") +
  theme(plot.title = element_text(hjust = 0.5),
        panel.background = element_rect(fill = "#F5F9FA" , 
                                        color = "#264653"),
        plot.background = element_rect(fill = "#F5F9FA",
                                       color = NA))


#### --------------------
# Average Ratio
#### --------------------

avg_ratio_df <- map_data |> 
  filter(slr_wn > 0)

avg_ratio <- mean(avg_ratio_df$slr_wn)


#### --------------------
# Time Series Graph
#### --------------------
solar_1316 <- read_csv("/Users/colleenmccamy/Documents/MEDS/Capstone/code/wind-retrofit-app/mapApp/data/solar_capacity_factor_PID1316.csv")

wind_1316 <- read_csv("/Users/colleenmccamy/Documents/MEDS/Capstone/code/wind-retrofit-app/mapApp/data/wind_capacity_factor_PID1316.csv") 

wind_1316 <- wind_1316 |> 
  rename("wind_gen" = energy_generation) |> 
  select(wind_gen)

solar_1316 <- solar_1316 |> 
  rename("solar_gen" = energy_generation) |> 
  mutate(hour = (hour - 1))

gen_1316 <- cbind(wind_1316, solar_1316)

gen_1316_2012 <- gen_1316[1:8765, ]

# setting the start time
origin <- offset <- as.POSIXct("2012-01-01 00:00") +
  as.difftime(min(gen_1316_2012$hour), unit = "hours")

# creating date time column
gen_1316_2012$datetime <- as.POSIXct(gen_1316_2012$hour * 3600, origin = origin)

# Extract day, hour, month, and year
gen_1316_2012$day <- day(gen_1316_2012$datetime)
gen_1316_2012$hour <- hour(gen_1316_2012$datetime)
gen_1316_2012$month <- month(gen_1316_2012$datetime)
gen_1316_2012$year <- year(gen_1316_2012$datetime)

# writing the dataframe to call into shiny
write_csv(gen_1316_2012, "/Users/colleenmccamy/Documents/MEDS/Capstone/code/wind-retrofit-app/mapApp/data/gen_2012_pid_1316.csv")

pid_1316_gen <- read_csv("/Users/colleenmccamy/Documents/MEDS/Capstone/code/wind-retrofit-app/mapApp/data/gen_2012_pid_1316.csv")

pid_1316_gen <- pid_1316_gen |> 
  select(-datetime) |> 
  mutate(date_hr = as.POSIXct(paste(pid_1316_gen$year, 
                                 pid_1316_gen$month, 
                                 pid_1316_gen$day, 
                                 pid_1316_gen$hour, 
                                 sep = "-"),
                            format = "%Y-%m-%d-%H"))

pid_1316_gen$date <- as.Date(pid_1316_gen$date_hr)

pid_1316_gen <- pid_1316_gen |> 
  mutate(hour = row_number()) |> 
  mutate(day_year = yday(date))

pid_1316_gen |> 
  filter(date == ymd("2012-01-02")) |> 
  ggplot() +
  geom_area(aes(x = hour, y = solar_gen),
            fill = "#f7dc97",
            col = "#E9C46A") + 
  geom_area(aes(x = hour, y = wind_gen),
            fill = "#7dc9c1",
            col = "#2A9D8F",
            alpha = 0.5) +
  theme_minimal() +
  scale_x_continuous(limits = c(0, 23)) +
  labs(x = "Capacity Factor for Energy Generation",
       y = "Hour of the Day")

# capacity by 




column(5, 
       
       # Title
       tags$h3("Solar to Wind Ratios"),
       
       # adding gap
       div(class = "gap"),
       
       # START tabsetPanel graph 1 ---
       
       tabsetPanel(
         type = "pills",
         
         # start average ratio tabPanel ----
         tabPanel(title = "Average",
                  
                  # adding divider line
                  tags$hr(class = "divider"),
                  
                  tags$h4("Average Solar to Wind Ratio for Viable Sites", 
                          style = "text-align: center;"),
                  
                  # average ratio graphic
                  tags$img(src = "images/avg_ratio_graphic.jpg", 
                           alt = "1.01 solar to 1 wind",
                           style = "max-width: 100%; overflow: hidden;"),
                  
                  tags$h6("*Caclulated for sites with a solar capacity greater than 0 GW", 
                          style = "text-align: right;"),
                  
                  
         ), # end tabsetPanel avg ratio 
         
         # start tabsetPanel ratio dist ----
         tabPanel(title = "Distribution",
                  
                  # adding divider line
                  tags$hr(class = "divider"),
                  
                  # plot title and centering
                  tags$h4("Distribution of Ratios", 
                          style = "text-align: center;"),
                  
                  # calling the distribution
                  plotOutput("ratio_distribution")
                  
                  
         ) # end tabsetPanel ratio dist
         
       ) # END tabsetPanel
       
)













