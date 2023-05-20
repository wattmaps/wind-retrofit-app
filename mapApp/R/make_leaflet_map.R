# make leaflet map function and needs to include input
make_leaflet_map <- function(input){
 
  # creating a reactive dataframe 
  # map_filter_df <- reactive({
  #    map_dat_test |>
  #      filter(t_state %in% c(input$t_state_input))
  #  })
   
 
  # use render leaflet function to create map
  renderLeaflet({
    
    # created pop-up text/graph
    popup_content <- paste("<b>Location:</b> ",
                           map_dat_test$t_county,
                           ", ",
                           map_dat_test$t_state, 
                           "<br>",
                           "<b>Project Name:</b> ",
                           map_dat_test$p_name, 
                           "<br>",
                           "<img src='images/plots/WID_1_plot.png' width='200'>")
    
    # building the map
    leaflet() |> 
      addProviderTiles(providers$NASAGIBS.ViirsEarthAtNight2012) |> #NASAGIBS.ModisTerraBands367CR
      addMarkers(map_dat_test, 
                 lng = map_dat_test$xlong, 
                 lat = map_dat_test$ylat,
                 #icon = map_icon,
                 popup = popup_content)
    
  })
  
}