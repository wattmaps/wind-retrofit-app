# server instructions ----
server <- function(input, output) {
  
  ### -------------
  # Explore the Map 
  # ---------------
  
  # setting input for filtering the map data
  map_filter_df <- reactive({
    map_data |>
      filter(state_names %in% c(input$state_input)) |> 
      filter(slr_cpc >= input$slr_input[1] & 
               slr_cpc <= input$slr_input[2]) |> 
      filter(en_comm %in% c(input$en_comm_input)) #|> 
     # filter(en_bur %in% c(input$en_bur_input))
  })
  
  # sourcing the map script file
  #source("maps/test_map.R")
  
  icons <- awesomeIcons(
    icon = 'map-marker-alt',
    iconColor = '#F5F9FA',
    library = 'ion',
    markerColor = "orange"
  )
  
  # Call the function that creates the map
  output$test_map <- renderLeaflet({
    popup_content <- paste(
      "<div line-height: 1.7;'>",
      
      "<span style='color: #787d87;'> <b>Project:</b> ", 
      map_filter_df()$p_name,
      "</span><br>",
      
      "<span style='color: #787d87;'> <b>Location:</b> ", 
      map_filter_df()$t_county, ",", 
      map_filter_df()$t_state, 
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
    
    
    # mapping the data with leaflet
    test_map <- leaflet() |> 
      addProviderTiles(providers$CartoDB.Positron) |> 
      addAwesomeMarkers(map_filter_df(), 
                 lng = map_filter_df()$lon, 
                 lat = map_filter_df()$lat,
                 icon = icons,
                 popup = popup_content)
  })
  
  ### -------------
  # Tabular Data
  # ---------------
  
  # Reactive value for selected dataset ----
  datasetInput <- reactive({
    switch(input$dataset,
           "energy attributes" = energy_data,
           "spatial attributes" = spatial_data,
           "transmission attributes" = transmission_data,
           "location attributes" = location_data,
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
  
  
  # automatically stopping the app when browser is closed
  #session$onSessionEnded(stopApp)
  
  
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
  
  # reactive dataframe for timeseries
  pid_1316_gen_df <- reactive({
    pid_1316_gen |>
      filter(as.numeric(day_year) == input$hour_input) 
  })
  
  # timeseries capacity factor map
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
                                           color = NA))
    
  })
  
  ### -------------
  # Methods & Sources
  # ---------------
  
  data_description <- read_csv("data/data_descrip.csv")
  
  output$data_description <- renderDataTable({
    data_description
  })
  
}