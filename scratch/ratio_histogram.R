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
  group_by(state = t_state) |> 
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
