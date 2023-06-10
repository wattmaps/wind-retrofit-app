# server instructions ----
server <- function(input, output) {
  
  
  ### -------------
  # Findings Tab
  # ---------------
  
  
  ### ---- ratio distribution histogram
  
  output$ratio_distribution <- renderPlot({
    
    ggplot(map_data, aes(x = slr_wn)) +
      geom_histogram(bins = round(sqrt(nrow(map_data))),
                     col = "#264653",
                     fill = "#2A9D8F") +
      theme_minimal() +
      labs(x = "Solar to Wind Ratio",
           y = "Frequency") +
      theme(plot.title = element_text(hjust = 0.5),
            panel.background = element_rect(fill = "#F5F9FA" , 
                                            color = "#264653"),
            plot.background = element_rect(fill = "#F5F9FA",
                                           color = NA))
    
  })
  
  
  ### ---- capacity by state map
  output$cpc_state <- renderPlot({
    state_data |> 
      ggplot(aes(x = reorder(state_names, total_cap), 
                 y = total_cap)) +
      geom_col(fill = "#E76F51",
               col = "#264653") +
      geom_text(aes(label = round(total_cap, 1)), 
                hjust = -0.2, vjust = 0.5, 
                color = "#264653", 
                size = 3) +  # Add text labels
      theme_minimal() +
      theme_minimal() +
      coord_flip() +  
      labs(x = NULL,
           y = "Total Solar Capacity (GW)") +
      theme(plot.title = element_text(hjust = 0.5),
            panel.background = element_rect(fill = "#F5F9FA" , 
                                            color = "#264653"),
            plot.background = element_rect(fill = "#F5F9FA",
                                           color = NA))
    
  })
  
  ### ---- capacity by state map
  output$cpc_state <- renderPlot({
    state_data |> 
      ggplot(aes(x = reorder(state_names, total_cap), 
                 y = total_cap)) +
      geom_col(fill = "#E76F51",
               col = "#264653") +
      geom_text(aes(label = round(total_cap, 1)), 
                hjust = -0.2, vjust = 0.5, 
                color = "#264653", 
                size = 3) +  # Add text labels
      theme_minimal() +
      theme_minimal() +
      coord_flip() +  
      labs(x = NULL,
           y = "Total Solar Capacity (GW)") +
      theme(plot.title = element_text(hjust = 0.5),
            panel.background = element_rect(fill = "#F5F9FA" , 
                                            color = "#264653"),
            plot.background = element_rect(fill = "#F5F9FA",
                                           color = NA))
    
  })
  
  ### ---- capacity by state map
  output$cpc_state <- renderPlot({
    state_data |> 
      ggplot(aes(x = reorder(state_names, total_cap), 
                 y = total_cap)) +
      geom_col(fill = "#E76F51",
               col = "#264653") +
      geom_text(aes(label = round(total_cap, 1)), 
                hjust = -0.2, vjust = 0.5, 
                color = "#264653", 
                size = 3) +  # Add text labels
      theme_minimal() +
      theme_minimal() +
      coord_flip() +  
      labs(x = NULL,
           y = "Total Solar Capacity (GW)") +
      theme(plot.title = element_text(hjust = 0.5),
            panel.background = element_rect(fill = "#F5F9FA" , 
                                            color = "#264653"),
            plot.background = element_rect(fill = "#F5F9FA",
                                           color = NA))
    
  })
  
  # reactive dataframe for timeseries
  pid_1316_gen_df <- reactive({
    pid_1316_gen |>
      filter(as.numeric(day_year) == input$hour_input) 
  })
  
  # timeseries capacity factor plot
  output$cp_time_series <- renderPlot({
    pid_1316_gen_df() |> 
      ggplot() +
      geom_area(aes(x = as.numeric(hour), 
                    y = solar_gen),
                fill = "#f7dc97",
                col = "#E9C46A") + 
      geom_area(aes(x = hour, y = wind_gen),
                fill = "#7dc9c1",
                col = "#2A9D8F",
                alpha = 0.5) +
      theme_minimal() +
      scale_x_continuous(limits = c(0, 23)) +
      labs(x = "Hour of the Day",
           y = "Capacity Factor for Energy Generation"
      ) +
      theme(panel.background = element_rect(fill = "#F5F9FA" , 
                                            color = "#264653"),
            plot.background = element_rect(fill = "#F5F9FA",
                                           color = NA)) +
      theme(plot.title = element_text(hjust = 0.5),
            panel.background = element_rect(fill = "#F5F9FA" , 
                                            color = "#264653"),
            plot.background = element_rect(fill = "#F5F9FA",
                                           color = NA))
    
  })
  
  
  # environmental score ridge plot
  output$env_score_ridge <- renderPlot({
    
    env_ridge_data |> 
      ggplot(aes(x = env_sens_score, 
                 y = region, fill = region)) +
      geom_density_ridges(alpha = 0.9) +
      scale_x_continuous(breaks = seq(0, 150, 25)) +
      scale_discrete_manual(values = region_colors,
                            aesthetics = 'fill') +
      theme_minimal() +
      theme(plot.title = element_text(hjust = 0.5),
            panel.background = element_rect(fill = "#F5F9FA" , 
                                            color = "#264653"),
            plot.background = element_rect(fill = "#F5F9FA",
                                           color = NA),
            legend.background = element_rect(fill = "#F5F9FA")) +
      labs(x = "Environmental Sensitivity Score",
           y = "US Region",
           fill = "Region")
    
  })
  
  
  # RCI of Energy Community PIDs by State
  output$rci_plot <- renderPlot({
    rci_plot_data |>   
      ggplot(aes(x = rci, y = region, fill = region)) +
      geom_density_ridges(alpha = 0.9) +
      scale_x_continuous(breaks = seq(0, 100, 25)) +
      scale_discrete_manual(values = region_colors, 
                            aesthetics = 'fill') +
      labs(x = "Rural Capacity Index",
           y = NULL, 
           fill = NULL) +
      theme_ridges() +
      theme(plot.title = element_text(hjust = 0.5),
            panel.background = element_rect(fill = "#F5F9FA" , 
                                            color = "#264653"),
            plot.background = element_rect(fill = "#F5F9FA",
                                           color = NA),
            axis.title.x = element_text(hjust = 0.5)) +
      guides(fill = "none")  # Remove the fill legend
  })
  
  
  
  
  ### Solar Capacity of Energy Community PIDs for States
  output$energy_comm_solar_cap <- renderPlot({
    
    energy_comm_solar_cap |>
      mutate(state_names = reorder(state_names, total_slr_cpc)) |>
      ggplot(aes(x = state_names, 
                 y = total_slr_cpc)) +
      geom_col(fill = '#264653') +
      geom_text(aes(label = format(round(total_slr_cpc), 
                                   big.mark = ",")), 
                hjust = -0.2, vjust = 0.5, 
                color = "#264653", 
                size = 3) +
      theme_light() +
      coord_flip() +
      labs(x = NULL,
           y = "Total Solar Capacity (MW)") +
      theme(plot.title = element_text(hjust = 0.5),
            panel.background = element_rect(fill = "#F5F9FA" , 
                                            color = "#264653"),
            plot.background = element_rect(fill = "#F5F9FA",
                                           color = NA))
    
  })
  
  
  # Average ratio by state map
  output$state_ratio <- renderLeaflet({
    popup_content <- paste(
      "<div line-height: 1.7;'>",
      
      "<span style='color: #787d87;'> <b>State:</b> ", 
      us_states_regions$name.x,
      "</span><br>",
      
      "<span style='color: #787d87;'> <b>Average Ratio:</b> ", 
      round(us_states_regions$avg_slr_wn, 2), 
      "</span><br>",
      
      "</div>"
    )
    
    
    
    # Create a color palette for the continuous fill
    color_palette <- colorNumeric(
      palette = "Blues",
      domain = us_states_regions$avg_slr_wn,  
      na.color = "#E9E9E9"
    )
    
    # Create the Leaflet plot with continuous fill
    leaflet() |> 
      addProviderTiles(providers$CartoDB.Positron) |> 
      addProviderTiles(providers$Esri.WorldImagery) |> 
      addPolygons(
        data = us_states_regions,
        fillColor = ~color_palette(avg_slr_wn),  # Fill polygons based on ratio using color_palette
        color = "white",  # Border color of polygons
        weight = 1,  # Border weight of polygons
        fillOpacity = 1,  
        popup = popup_content
      ) |> 
      addLegend(
        "bottomright",  # Position of the legend on the map
        pal = color_palette,  # Color palette
        values = us_states_regions$avg_slr_wn,  
        title = "Solar to Wind Ratio",  
        opacity = 1
      )
    
  })
  
  
  # Average ratio by state map
  output$state_cap <- renderLeaflet({
    popup_content <- paste(
      "<div line-height: 1.7;'>",
      
      "<span style='color: #787d87;'> <b>State:</b> ", 
      us_states_regions$name,
      "</span><br>",
      
      "<span style='color: #787d87;'> <b>Average Ratio:</b> ", 
      round(us_states_regions$total_solar, 2), 
      "</span><br>",
      
      "</div>"
    )
    
    # Create a color palette for the continuous fill
    color_palette <- colorNumeric(
      palette = "Oranges",  # Choose a color palette (e.g., "Blues")
      domain = us_states_regions$total_solar,
      na.color = "#E9E9E9"
    )
    
    # Create the Leaflet plot with continuous fill
    leaflet() |> 
      addProviderTiles(providers$CartoDB.Positron) |> 
      addPolygons(
        data = us_states_regions,
        fillColor = ~color_palette(total_solar),  # Fill polygons based on ratio using color_palette
        color = "gray",  # Border color of polygons
        weight = 1,  # Border weight of polygons
        fillOpacity = 1,  # Fill opacity of polygons
        popup = ~paste("State: ", name.x, "<br>Total Solar Capacity: ", format(round(total_solar), big.mark = ","), "MW")
      ) |> 
      addLegend(
        "bottomright",  # Position of the legend on the map
        pal = color_palette,  # Color palette
        values = us_states_regions$total_solar,  # Values corresponding to the color palette
        title = "Total Solar Capacity (MW)",  # Title of the legend
        opacity = 1  # Opacity of the legend
      )
    
  })
  
  
  ### -------------
  # Explore the Map 
  # ---------------
  
  # setting input for filtering the map data
  map_filter_df <- reactive({
    map_data |>
      filter(state_names %in% c(input$state_input)) |> 
      filter(slr_cpc >= input$slr_input[1] & 
               slr_cpc <= input$slr_input[2]) |> 
      filter(en_comm %in% c(input$en_comm_input))
  })
  
  
  icons <- awesomeIcons(
    icon = 'map-marker-alt',
    iconColor = '#F5F9FA',
    library = 'ion',
    markerColor = "orange"
  )
  
  # creating leaflet map
  # Call the function that creates the map
  output$colocation_map <- renderLeaflet({
    popup_content <- paste(
      "<div line-height: 1.7;'>",
      
      "<span style='color: #787d87;'> <b>Project:</b> ", 
      map_filter_df()$p_name,
      "</span><br>",
      
      "<span style='color: #787d87;'> <b>Location:</b> ", 
      map_filter_df()$county, ",", 
      map_filter_df()$state_names, 
      "</span><br>",
      
      "<span style='color: #787d87;'><b>Environmental Sensitivity Score:</b> ", 
      map_filter_df()$env_sens_score, 
      "</span><br>",
      
      "<span style='color: #264653;'><b>Solar Capacity:</b> ", 
      round(map_filter_df()$slr_cpc), 
      " MW</span><br>",
      
      "<span style='color: #264653;'><b>Annual Revenue:</b> $", 
      format(round(map_filter_df()$revenue), big.mark = ","), 
      "</span><br>",
      
      "<span style='color: #264653;'><b>Solar to Wind Ratio:</b> ", 
      round(map_filter_df()$slr_wn, 2), 
      "</span><br>",
      
      "</div>"
    )
    
    # Create the Leaflet map
    colocation_map <- leaflet() |> 
      addProviderTiles(providers$Esri.WorldImagery, group = "Satelite Imagery") |> 
      addProviderTiles(providers$CartoDB.Positron, group = "State Map") |> 
      addAwesomeMarkers(
        data = map_filter_df(),
        lng = ~lon,
        lat = ~lat,
        icon = icons,
        popup = popup_content
      ) |> 
      addLayersControl(
        baseGroups = c("Satelite Imagery", "State Map"),
        options = layersControlOptions(collapsed = FALSE)
      )
  })
  
  ### -------------
  # Tabular Data
  # ---------------
  
  # Reactive value for selected dataset ----
  datasetInput <- reactive({
    switch(input$dataset,
           "energy attributes" = energy_data,
           "techno-economic attributes" = techno_data,
           "transmission attributes" = transmission_data,
           "location attributes" = location_data,
           "all data" = map_data,
           "metadata" = metadata)
  })
  
  # Table of selected dataset ----
  output$table <- renderDataTable({
    datasetInput()
  })
  
  
  # Downloadable csv of selected dataset ----
  output$downloadData <- downloadHandler(
    filename = function() {
      paste(input$dataset, ".csv", sep = "")
    },
    content = function(file) {
      write.csv(datasetInput(), file, row.names = FALSE)
    }
  )
  
  
  ### -------------
  # Methods & Sources
  # ---------------
  
  # data description table
  data_description <- read_csv("data/data_descrip.csv")
  
  # data description table output
  output$data_description <- renderDataTable({
    data_description
  })

}



