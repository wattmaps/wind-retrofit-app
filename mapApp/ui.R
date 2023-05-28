# user interface ----
ui <- fluidPage(
  
  # adding css sytle file ----
  header = tags$head(
    tags$link(rel = "stylesheet", 
              type = "text/css", 
              href = "sass_styles.css")),
  
  # establishing gap amount
  tags$style(HTML("
    .gap {
      margin-top: 24px;
    }
  ")),
  
  # establishing a divider
  tags$style(HTML("
    .divider {
      border-top: 2px solid #b0bbbf; 
      margin: 20px 0;
    }
  ")),
  
  # establishing a divider main
  tags$style(HTML("
    .divider-main {
      border-top: 4px solid #264653; 
      margin: 20px 0;
    }
  ")),
  
  # establishing the slider theme
  chooseSliderSkin(
    skin =  "Flat",
    color = "#F4A261"
  ),
  
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

# adding gap
div(class = "gap"),

                        
                        # START tabsetPanel graph 1 ----
                        tabsetPanel(
                          type = "pills",
                          
                          # start graph 1 tabPanel ----
                          tabPanel(title = "Total",
                                   
                                   # adding gap
                                   div(class = "gap"),
                                   
                                   # Add the divider line
                                   tags$hr(class = "divider"),
                                   
                                   # title
                                   tags$h4("Total Solar Potential for Retrofitting Exisiting Wind", 
                                           style = "text-align: center;"),
                      
                                   
                                   
                                   # total capacity graphic
                                   tags$img(src = "images/total_solar_cpc.jpg", 
                                            alt = "116 GW potential solar",
                                            style = "max-width: 100%; overflow: hidden;"),
                                   
                          ), # end tabsetPanel graph 1
                          
                          # start tabsetPanel graph 2 ----
                          tabPanel(title = "Capacity by States",
                                   
                                   # adding divider line
                                   tags$hr(class = "divider"),
                                   
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
                        
                        # adding gap
                        div(class = "gap"),
                                             
                        # START tabsetPanel graph 1 ---

                        tabsetPanel(
                          type = "pills",
                          
                          # start average ratio tabPanel ----
                          tabPanel(title = "Average",
                                   
                                   # adding divider line
                                   tags$hr(class = "divider"),
                                   
                                   tags$h4("Average Solar to Wind Ratio for Viable Sites", 
                                           style = "text-align: center;"),
                                   
                                   # average ratio graphic
                                   tags$img(src = "images/avg_ratio_graphic.jpg", 
                                            alt = "1.01 solar to 1 wind",
                                            style = "max-width: 100%; overflow: hidden;"),
                                   
                                   tags$h6("*Caclulated for sites with a solar capacity greater than 0 GW", 
                                           style = "text-align: right;"),
                                   
                                   
                          ), # end tabsetPanel avg ratio 
                          
                          # start tabsetPanel ratio dist ----
                          tabPanel(title = "Distribution",
                                   
                                   # adding divider line
                                   tags$hr(class = "divider"),
                                   
                                   # plot title and centering
                                   tags$h4("Distribution of Ratios", 
                                           style = "text-align: center;"),
                                   
                                   # calling the distribution
                                   plotOutput("ratio_distribution")
                                   
                                   
                          ) # end tabsetPanel ratio dist
                          
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
                        
                        # adding gap
                        div(class = "gap"),
                        # adding gap
                        div(class = "gap"),
                 ),
                 # END row 2  - column 2 - map text
                 
                 # START row 2 - column 3 padding
                 column(1),
                 # ENDS row 2 - column 1 - padding
                 
                 
               ),

               # END row 2 - map text 

fluidRow(
  # START row 2 - wind solar complementary 
  column(12,
         
         # adding gap
         div(class = "gap"),
         
         # Add the divider line
         tags$hr(class = "divider-main"),
         
         # adding gap
         div(class = "gap"),
         
         )
  
),
# END row 2 - wind solar complementary

               
               # START row 2 - Map text 
fluidRow(
  # START row 2 - wind solar complementary 
  column(1),
  # ENDS row 2 - column 1 - padding
  
  # START row 2 - column 2 - complementary graph
  column(10, 
         
         tags$h3("Wind and Solar Complementary Capacity Factors",
                 style = "text-align: center;"),
         
         # adding gap
         div(class = "gap"),
         
         # calling the distribution
         plotOutput("cp_time_series"),
         
        
  ),
  # END row 2 - complementary graph
  
),
               # END row 2 - wind solar complementary


fluidRow(
  # START row 2 - wind solar complementary 
  column(1),
  # ENDS row 2 - column 1 - padding
  
  # START row 2 - column 2 - complementary graph
  column(5, 

         # adding gap
         div(class = "gap"),
         
         sliderInput(inputId = "hour_input",
                     label = "Select a Day of the Year:",
                     min = min(pid_1316_gen$day_year, na.rm = TRUE), 
                     max = round(max(pid_1316_gen$day_year, 
                                     na.rm = TRUE)-1), 
                     value = 68),
         
  ),
  # END row 2 - complementary graph
  
  column(5, 
         
         # adding gap
         div(class = "gap"),
         
         tags$body("This graph looks at wind and solar capacity factors for 2012 for Neosho Ridge wind project in Neosho County, Kansas. The ratio for solar to wind is 1.17 with an estimated annual solar capacity of 357 MW and wind capacity of 305 MW.")
         
         
  ),
  # END row 2 - complementary graph
  
),

# END row 2 - wind solar complementary

fluidRow(
  # START row 2 - wind solar complementary 
  column(12,
         
         # adding gap
         div(class = "gap"),
         
         # Add the divider line
         tags$hr(class = "divider-main"),
         
         # adding gap
         div(class = "gap"),
         
  )
  
),

# START row 2 - Map text 
fluidRow(
  # START row 2 - wind solar complementary 
  column(1),
  # ENDS row 2 - column 1 - padding
  
  # START row 2 - column 2 - complementary graph
  column(10, 
         
         tags$h3("Techno-Economic Analysis",
                 style = "text-align: center;"),
         
         # adding gap
         div(class = "gap"),
         
         # calling the distribution
         #plotOutput("cp_time_series"),
         
         
  ),
  # END row 2 - complementary graph
  
),
# END row 2 - wind solar complementary

# END row 2 - wind solar complementary
               
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
               
               # START row 3 - Filter title
               fluidRow(
                 
                 column(1), # column 1 - left padding
                 
                 # START row 3 - column 2 - select states
                 column(10, 
                        
                        # adding gap
                        div(class = "gap"),
                        
                        tags$h3("Map Filtering Options",
                                style = "text-align: center;"),
                        
                        # adding gap
                        div(class = "gap"),
                        
                 ),
                 # END row 3 - column 2 - select states

                 column(1), # column 3 - right padding
                 
               ),
               # END row 2 - map text 
               
               # START row 3 - Map text 
               fluidRow(
                 
                 column(1), # column 1 - left padding
                 
                 # START row 3 - column 2 - select states
                 column(3, 
                        
                        # state picker

                        pickerInput(
                          inputId = "state_input", 
                          label = "Select states:", 
                          choices = sort(unique(map_data$state_names)), 
                          selected = sort(unique(map_data$state_names)),
                          options = pickerOptions(
                            actionsBox = TRUE, 
                            size = 10,
                            selectedTextFormat = "count > 3",
                            
                          ), 
                          multiple = TRUE
                        ), # end state picker
                      
                        
                 ),
                 # END row 3 - column 2 - select states
                 
                 # START row 3 - column 3 - slider
                 column(4, 
                        
                        # start solar cap. slider
                        sliderInput(inputId = "slr_input",
                                    label = "Filter by Solar Capacity (MW):",
                                    min = min(map_data$slr_cpc, 
                                              na.rm = TRUE), 
                                    max = round(max(map_data$slr_cpc,
                                              na.rm = TRUE))+1, 
                                    value = c(0,round(max(map_data$slr_cpc,
                                                          na.rm = TRUE)))
                        ) # end solar cap. slider
                 ),
                 # END row 3 - column 3 - slider
                 
                 # START row 3 - column 4 - techno-econ filter
                 column(3, 
                        
                        # start energy community switch
                         prettySwitch(
                           inputId = "en_comm_input",
                           label = "Energy Community", 
                           status = "warning",
                           fill = TRUE
                         ),# end energy community switch
                        
                        # start energy burden switch
                        prettySwitch(
                          inputId = "en_bur_input",
                          label = "Energy Burden", 
                          status = "warning",
                          fill = TRUE
                        ),# end energy burden switch
                        
                        
                        
                        
                 ),
                 # END row 3 - column 2 - select states
                 
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
                 column(1),
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



