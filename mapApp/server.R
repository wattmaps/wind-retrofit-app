# server instructions ----
server <- function(input, output) {
  
  ### -------------
  # Main Map 
  # ---------------
  
  # setting input for filtering the map data
  map_filter_df <- reactive({
    map_dat_test |>
      filter(t_state %in% c(input$t_state_input))
  })
  
  # sourcing the map script file
  #source("maps/test_map.R")
  
  # Call the function that creates the map
  output$test_map <- renderLeaflet({
    popup_content <- paste("<b>Location:</b> ",
                           map_dat_test$t_county,
                           ", ",
                           map_dat_test$t_state, 
                           "<br>",
                           "<b>Project Name:</b> ",
                           map_dat_test$p_name, 
                           "<br>",
                           "<img src='images/plots/WID_1_plot.png' width='200'>")
    
    # mapping the data with leaflet
    test_map <- leaflet() |> 
      addProviderTiles(providers$NASAGIBS.ViirsEarthAtNight2012) |> #NASAGIBS.ModisTerraBands367CR
      addMarkers(map_filter_df(), 
                 lng = map_filter_df()$xlong, 
                 lat = map_filter_df()$ylat,
                 #icon = map_icon,
                 popup = popup_content)
  })
  
  # automatically stopping the app when browser is closed
  #session$onSessionEnded(stopApp)
}