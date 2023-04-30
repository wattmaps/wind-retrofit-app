# server instructions ----
server <- function(input, output) {
  
  # automatically stopping the app when browser is closed
  session$onSessionEnded(stopApp)
}