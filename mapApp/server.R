# server instructions ----
server <- function(input, output) {
  
  ### -------------
  # Main Map 
  # ---------------
  
  # setting input for filtering the map data
  map_filter_df <- reactive({
    map_data |>
      filter(t_state %in% c(input$t_state_input))
  })
  
  # sourcing the map script file
  #source("maps/test_map.R")
  
  # Call the function that creates the map
  output$test_map <- renderLeaflet({
    popup_content <- paste("<b>Solar Capacity:</b>",
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
  
  # automatically stopping the app when browser is closed
  #session$onSessionEnded(stopApp)
}