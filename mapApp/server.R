# server instructions ----
server <- function(input, output) {
  
  ### -------------
  # Main Map 
  # ---------------
  
  # setting input for filtering the map data
  map_filter_df <- reactive({
    map_data |>
      filter(t_state %in% c(input$t_state_input)) |> 
      filter(slr_wn >= input$ratio_input[1] & 
               slr_wn <= input$ratio_input[2])
  })
  
  # sourcing the map script file
  #source("maps/test_map.R")
  
  # Call the function that creates the map
  output$test_map <- renderLeaflet({
    popup_content <- paste("<b>Project:</b>",
                           map_data$p_name,
                           "<br>",
                           "<b>Location:</b>",
                           map_data$t_county, ",",
                           map_data$t_state,
                           "<br>",
                           "<b>Solar Capacity:</b>",
                           round(map_data$slr_cpc, 2),
                           " MW ",
                           "<br>",
                           "<b>Annaul Revenue</b> ",
                           "$",
                           format(round(map_data$revenue, 2), 
                                  big.mark = ","),                      
                           "<br>",
                           "<b>Solar to Wind Ratio:</b> ",
                           round(map_data$slr_wn,3), 
                           "<br>") #,
                           #"<img src='/images/plots/WID_1_plot.png' width='400'>")
    
    # mapping the data with leaflet
    test_map <- leaflet() |> 
      addProviderTiles(providers$CartoDB.Positron) |> 
      addMarkers(map_filter_df(), 
                 lng = map_filter_df()$lon, 
                 lat = map_filter_df()$lat,
                 #icon = map_icon,
                 popup = popup_content)
  })
  
  ### -------------
  # Tabular Data
  # ---------------
  
  # Reactive value for selected dataset ----
  datasetInput <- reactive({
    switch(input$dataset,
           "map data" = map_data,
           "graph data" = map_dat)
  })
  
  # Table of selected dataset ----
  output$table <- renderTable({
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
}