# server instructions ----
server <- function(input, output) {
  
  ### -------------
  # Main Map 
  # ---------------
  
  # setting input for filtering the map data
  map_filter_df <- reactive({
    map_dat |>
      filter(t_state %in% c(input$t_state_input))
    })
  
  # sourcing the map script file
  source("maps/test_map.R")
  
  # Call the function that creates the map
  output$test_map <- renderLeaflet({
    test_map
  })
  
  # automatically stopping the app when browser is closed
  #session$onSessionEnded(stopApp)
}