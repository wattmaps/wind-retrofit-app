# user interface ----
ui <- fluidPage(
  
  # adding css sytle file ----
  header = tags$head(
    tags$link(rel = "stylesheet", 
              type = "text/css", 
              href = "sass_styles.css")),
  
  # Add title above navbar using fluidRow and column
  fluidRow(
    column(
      width = 12,
      h2("Co-Locating a Power Couple", 
         align = "center")
    )
  ), 
  
  ### --------------------
  ### START Navbar Page ----
  ### --------------------  
  
  navbarPage(
    
    # adding css style file ----
    header = tags$head(
      tags$link(rel = "stylesheet", 
                type = "text/css", 
                href = "sass_styles.css"),
      tags$style(HTML(".navbar { height: 50px; }"))),
    
    title = NULL,
    #collapsible = TRUE,
    
    #title = "Co-Locate App",
    
    ### --------------------
    ### Page 1 Home --------
    ### --------------------
    
    # (Page 1) home tabPanel
    tabPanel(title = "Home",
             
             # START fluid page - home
             fluidPage(
               
               # START row 1
               fluidRow(
                 
                 column(1), # left padding
                 
                 # row 1 column 2
                 column(6,
                        
                        includeMarkdown("text/abstract.md")),
                 
                 # row 1 column 3
                 column(4,
                        
                        tags$img(src = "images/wind_solar_square.jpg", 
                                 alt = "wind and solar",
                                 style = "max-width: 80%; border-radius: 50%; overflow: hidden; padding-top: 16px;") 
                        
                 ),
                 
                 
                 column(1) # right padding
                 
               )
               # END row 1
               
               
             ), 
             # END fluid page
             
             
    ), # END (Page 1) home tabPanel
    
    ### --------------------
    ### Page 2 About App ---
    ### --------------------
    
    # (Page 2) how to tabPanel
    tabPanel(title = "How to Use the App",
             # START fluid page - about
             fluidPage( 
               
               # START row 1 - how to
               fluidRow(
                 
                 column(1), # row 1 - left padding
                 
                 # START row 1 - column 2 data
                 column(10, 
                        includeMarkdown("text/how_to.md")
                 ),
                 # END row 1 - column 2
                 
                 column(1) # row 1 - right padding
                 
               ),
               # END row 1 - how to
               
               # START row 2 - data & terms
               fluidRow(
                 
                 column(1), # row 1 - left padding
                 
                 # START row 1 - column 2
                 column(3,
                        #REPLACE
                        "Test text"),
                 # ENDS row 1 - column 2
                 
                 # START row 1 - column 3 data
                 column(5, 
                        includeMarkdown("text/data_explanation.md")),
                 # END row 1 - column 3
                 
                 column(1), # row 1 - left padding
                 
               ),
               # END row 2 - data & terms
               
               # START row 3 - Terms & warnings
               fluidRow(
                 
                 column(1), # row 1 - right padding
                 
                 # START row 3 - column 1
                 column(5, 
                        #REPLACE
                        "Test text"),
                 # END row 3 - column 1
                 
                 # START row 3 - column 2
                 column(5, 
                        #REPLACE
                        "Test text"),
                 # START row 3 - column 3
                 
                 column(1), # row 1 - right padding
                 
               )
               # START row 3 - Terms & warnings
               
             ) # END fluid page - about
             
    ), # END (Page 2) how to tabPanel
    
    ### --------------------
    ### Page 3 Findings ---
    ### --------------------
    
    # (Page 2) tabular data tabPanel
    tabPanel(title =  "Findings",
             
             # START fluid page - data
             fluidPage( 
               # START row 1 - graphs
               fluidRow(
                 
                 column(1), # row 1 - right padding
                 
                 # START row 1 - column 1 graph1
                 column(5,
                        
                        tags$h3("Potential Solar Capacity"),
                        # changing the tab color
                        tags$style(HTML("
  .tabbable > .nav > li > a {
    background-color: #F5F9FA;
    color: #264653;
  }
  
  .tabbable > .nav > li[class=active] > a {
    background-color: #2A9D8F;
    color: white;
  }
")),
                        
                        # START tabsetPanel graph 1 ----
                        tabsetPanel(
                          type = "pills",
                          
                          # start graph 1 tabPanel ----
                          tabPanel(title = "Total",
                                   
                                   # title
                                   tags$h4("Total Solar Potential for Retrofitting Exisiting Wind", 
                                           style = "text-align: center;"),
                                   
                                   # total capacity graphic
                                   tags$img(src = "images/total_solar_cap.jpg", 
                                            alt = "1.01 solar to 1 wind",
                                            style = "max-width: 100%; overflow: hidden;"),
                                   
                          ), # end tabsetPanel graph 1
                          
                          # start tabsetPanel graph 2 ----
                          tabPanel(title = "Capacity by States",
                                   
                                   # plot title
                                   tags$h4("Potential Solar Capacity for Top States", 
                                           style = "text-align: center;"),
                                   
                                   # calling the capacity by state plot
                                   plotOutput("cpc_state")
                                   
                          ) # end tabsetPanel graph 2
                          
                        ) # END tabsetPanel
                        
                 ), # END (Page 2) data viz tabPanel
                 
                 column(5, 
                        
                        # Title
                        tags$h3("Solar to Wind Ratios"),
                                             
                        # START tabsetPanel graph 1 ---

                        tabsetPanel(
                          type = "pills",
                          
                          # start graph 1 tabPanel ----
                          tabPanel(title = "Average",
                                   
                                   tags$h4("Average Solar to Wind Ratio for Viable Sites", 
                                           style = "text-align: center;"),
                                   
                                   # average ratio graphic
                                   tags$img(src = "images/avg_ratio_graphic.jpg", 
                                             alt = "1.01 solar to 1 wind",
                                            style = "max-width: 100%; overflow: hidden;"),
                                   
                                   tags$h6("*Caclulated for sites with a solar capacity greater than 0 GW", 
                                           style = "text-align: right;"),
                                  
                                   
                          ), # end tabsetPanel graph 1
                          
                          # start tabsetPanel graph 2 ----
                          tabPanel(title = "Distribution",
                                   
                                   # plot title and centering
                                   tags$h4("Distribution of Ratios", 
                                           style = "text-align: center;"),
                                   
                                   # calling the distribution
                                   plotOutput("ratio_distribution")
                                  
                                   
                          ) # end tabsetPanel graph 2
                          
                        ) # END tabsetPanel
                        
                 ),
                 # END row 1 - column 2 - graph2
                 column(1) # row 1 - right padding
               ),
               # ENDS ROW 1
               
               
               # START row 2 - Map text 
               fluidRow(
                 
                 # START row 2 - column 1 padding
                 column(1,
                 ),
                 # ENDS row 2 - column 1 - padding
                 
                 # START row 2 - column 2 - map text
                 column(10, 
                        
                        #INSET TABLE
                        "Table"
                 ),
                 # END row 2  - column 2 - map text
                 
                 # START row 2 - column 3 padding
                 column(1),
                 # ENDS row 2 - column 1 - padding
                 
                 
               )
               # END row 2 - map text 
               
             ),
             # END fluid page
             
             
    ), # END (Page 2) tabular data 
    
    
    ### --------------------
    ### Page 4 Map ---------
    ### --------------------
    
    # (Page 4) data viz tabPanel
    tabPanel(title =  "Explore the Map",
             
             # START fluid page - map
             fluidPage( 
               # START row 1 - map
               fluidRow(
                 
                 column(1), # column 1 - left padding
                 
                 # START row 1 - column 2 - map
                 column(10, 
                        
                        # REPLACE
                        "Map text - above"
                 ),
                 # END row 1 - column 2 - map
                 
                 column(1), # column 3 - right padding
                 
               ),
               # END row 1
               
               # START row 2 - Map text 
               fluidRow(
                 
                 column(1), # column 1 - left padding
                 
                 # START row 2 - column 2 - map text
                 column(10, 
                        
                        # adding the leaflet output
                        
                        
                        leafletOutput(outputId = "test_map", 
                                      height = "560px")
                 ),
                 # END row 2 - column 2 - map text
                 
                 column(1), # column 3 - right padding
                 
               ),
               # END row 2 - map text 
               
               # START row 3 - Map text 
               fluidRow(
                 
                 column(1), # column 1 - left padding
                 
                 # START row 3 - column 2 - select states
                 column(5, 
                        
                        # state picker
                        
                        paste("FILTERING OPTIONS"),
                        
                        shinyWidgets::pickerInput(inputId = "t_state_input",
                                                  label = "Select state:",
                                                  choices = unique(map_data$t_state), 
                                                  options = shinyWidgets::pickerOptions(actionsBox = TRUE), 
                                                  # creates "Select All / Deselect All" buttons
                                                  selected = c("CA", "IA", "MA"),
                                                  multiple = TRUE
                        ) # end state picker
                 ),
                 # END row 3 - column 2 - select states
                 
                 # START row 3 - column 2 - slider
                 column(5, 
                        
                        # start solar cap. slider
                        
                        paste("Filter By Solar Capacity"),
                        
                        sliderInput(inputId = "ratio_input",
                                    label = "Select a range of the solar to wind ratio:",
                                    min = 0, #min(map_data$slr_cpc), 
                                    max = 1.5, #max(map_data$slr_cpc), 
                                    value = c(0,1.5) #c(min(map_data$slr_cpc), max(map_data$slr_cpc))
                        ) # end solar cap. slider
                 ),
                 # END row 3 - column 3 - slider
                 
                 column(1), # column 3 - right padding
                 
               )
               # END row 2 - map text 
               
             ) # END fluid page - maps
             
    ), # END (Page 4) data viz tabsetPanel
    
    ### --------------------
    ### Page 5 Data ---------
    ### --------------------
    
    # (Page 5) tabular data tabPanel
    tabPanel(title =  "Explore the Data",
             
             # START fluid page - data
             fluidPage( 
               
               # START row 1 - Map text 
               fluidRow(
                 
                 # START row 1 - column 1 padding
                 column(1,
                 ),
                 # ENDS row 1 - column 1 - padding
                 
                 # START row 1 - column 4 - download button
                 column(2, 
                        selectInput("dataset", "Choose a dataset:",
                                    choices = c("map data", "graph data")),
                        
                        # Button
                        downloadButton("downloadData", "Download")
                 ),
                 # END row 1  - column 4 - download button
                 
                 
                 # START row 1 - column 5 - data table
                 column(8, 
                        
                        #INSET TABLE
                        tableOutput("table")
                 ),
                 # END row 1  - column 5 - data table
                 
                 
                 # START row 1 - column 4 padding
                 column(1,
                        
                 ),
                 # ENDS row 1 - column 4 - padding
                 
                 
               )
               # END row 1 - map text 
               
             ),
             # END fluid page
             
             
    ) # END (Page 5) tabular data 
    
    
    
    ### --------------------
    ### END Navbar Page ----
    ### --------------------  
    
  ) # End of Navbar
  
) # END of UI



