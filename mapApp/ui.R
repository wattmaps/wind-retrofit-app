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
    ### Page 2 Findings ---
    ### --------------------
    
    # (Page 2) tabular data tabPanel
    tabPanel(title =  "Findings",
             
             # START fluid page - data
             fluidPage( 
               
               # START row 1 - graphs
               fluidRow(
                 
                 column(1), # row 1 - right padding
                 
                 # START row 1 - column 1 graph1
                 column(10,
                        
                        tags$h3("Results",
                                style = "text-align: center;"),
                        
                        # adding gap
                        div(class = "gap"),
                        
                        tags$body("Click on the different tabs below to explore the summary statistics and findings from the project."),
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
  tabPanel(title = "Total Capacity",
           
           # adding gap
           div(class = "gap"),
           
           # Add the divider line
           tags$hr(class = "divider"),
           
           fluidRow(
             # START row 2 - wind solar complementary 
             column(12,
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # Add the divider line
                    #tags$hr(class = "divider-main"),
                    
                    # adding gap
                    div(class = "gap"),
                    
             )
             
           ),
           # END row 2 - wind solar complementary
           
           # start row in capacity tabPanel
           fluidRow(
             
             # column within tabPanel
             column(5, 
                    
                    # title
                    tags$h4("Total Solar Potential for Retrofitting Exisiting Wind", 
                            style = "text-align: center;"),
                    
                    
                    
                    # total capacity graphic
                    tags$img(src = "images/total_solar_cpc.jpg", 
                             alt = "116 GW potential solar",
                             style = "max-width: 100%; overflow: hidden;"),
                    
             ),
             
             # column 2 - by state plot
             column(5, 
                    
                    # plot title
                    tags$h4("Potential Solar Capacity for Top States", 
                            style = "text-align: center;"),
                    
                    # calling the capacity by state plot
                    plotOutput("cpc_state")
                    
             ),
             
           ),
           
           
  ), # end tabsetPanel graph 1
  
  # start tabsetPanel graph 2 ----
  tabPanel(title = "Solar to Wind Ratios",
           
           # adding divider line
           tags$hr(class = "divider"),
           
           fluidRow(
             
             # start column 1 ratio
             column(5, 
                    
                    tags$h4("Average Solar to Wind Ratio for Viable Sites", 
                            style = "text-align: center;"),
                    
                    # average ratio graphic
                    tags$img(src = "images/avg_ratio_graphic.jpg", 
                             alt = "1.01 solar to 1 wind",
                             style = "max-width: 100%; overflow: hidden;"),
                    
                    tags$h6("*Caclulated for sites with a solar capacity greater than 0 GW", 
                            style = "text-align: right;")
                    
             ), # end column 1 ratio
             
             # start column 2 ratio
             column(5, 
                    
                    # plot title and centering
                    tags$h4("Distribution of Ratios", 
                            style = "text-align: center;"),
                    
                    # calling the distribution
                    plotOutput("ratio_distribution")
                    
             ) # column 2 ratio
             
           ) # end of fluid Row
           
  ), # end tabsetPanel graph 2
  
  # start tabsetPanel 3 ----
  tabPanel(title = "Solar & Wind Complementarity",
           
           # adding divider line
           tags$hr(class = "divider"),
           
           # start fluidRow 1
           fluidRow(
             
             # start timeseries column
             column(12,
                    
                    tags$h4("Wind and Solar Complementary Capacity Factors",
                            style = "text-align: center;"),
                    # adding gap
                    div(class = "gap"),
                    # calling the distribution
                    plotOutput("cp_time_series")
                    
             ) # end timeseries column
             
             
           ), # end of fluid Row 1
           
           # start fluidRow 2
           fluidRow(
             
             column(1), # left padding
             
             # start slider column
             column(5,
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # day slider input
                    sliderInput(inputId = "hour_input",
                                label = "Select a Day of the Year:",
                                min = min(pid_1316_gen$day_year, na.rm = TRUE), 
                                max = round(max(pid_1316_gen$day_year, 
                                                na.rm = TRUE)-1), 
                                value = 68),
                    
                    
             ), # end slider column
             
             # start text column
             column(5, 
                    # adding gap
                    div(class = "gap"),
                    
                    tags$body("This graph showcases wind and solar capacity factors for 2012 for Neosho Ridge wind project in Neosho County, Kansas. The ratio for solar to wind is 1.17 with an estimated annual solar capacity of 357 MW and wind capacity of 305 MW.")
                    
             ), # end text column
             
             column(1) # right padding
             
             
           ) # end of fluid Row 1
           
  ), # end tabsetPanel 3
  
  # start tabsetPanel 4 ----
  tabPanel(title = "Energy Justice",
           
           # adding divider line
           tags$hr(class = "divider"),
           
           # start fluidRow 1
           fluidRow(
             
             # start timeseries column
             column(12,
             ) # end timeseries column
             
             
           ), # end of fluid Row 1
           
           # start fluidRow 2
           fluidRow(
             
             column(1), # left padding
             
             # start slider column
             column(5
             ), # end slider column
             
             # start text column
             column(5, 
                    
                    
             ), # end text column
             
             column(1) # right padding
             
             
           ) # end of fluid Row 1
           
  ), # end tabsetPanel 4
  
  # start tabsetPanel 5 ----
  tabPanel(title = "IRA Incentives",
           
           # adding divider line
           tags$hr(class = "divider"),
           
           # start fluidRow 1
           fluidRow(
             
             # start timeseries column
             column(12,
             ) # end timeseries column
             
             
           ), # end of fluid Row 1
           
           # start fluidRow 2
           fluidRow(
             
             column(1), # left padding
             
             # start slider column
             column(5
             ), # end slider column
             
             # start text column
             column(5, 
                    
                    
             ), # end text column
             
             column(1) # right padding
             
             
           ) # end of fluid Row 1
           
  ), # end tabsetPanel 5
  
  # start tabsetPanel 6 ----
  tabPanel(title = "Environmental Scores",
           
           # adding divider line
           tags$hr(class = "divider"),
           
           # start fluidRow 1
           fluidRow(
             
             # start timeseries column
             column(12,
             ) # end timeseries column
             
             
           ), # end of fluid Row 1
           
           # start fluidRow 2
           fluidRow(
             
             column(1), # left padding
             
             # start slider column
             column(5
             ), # end slider column
             
             # start text column
             column(5, 
                   
                    
             ), # end text column
             
             column(1) # right padding
             
             
           ) # end of fluid Row 1
           
  ) # end tabsetPanel 6
  
) # END tabsetPanel

                 ), # END (Page 2) data viz tabPanel

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

# START row 2 - divider
fluidRow(
  column(12,
         
         # adding gap
         div(class = "gap"),
         
         # Add the divider line
         tags$hr(class = "divider-main"),
         
         # adding gap
         div(class = "gap"),
         
  )
  
),
# END row 2 - divider



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
                    tags$h3("Map of Existing Wind Projects for Potential Solar PV Retrofit", 
                            style = "text-align: center;"),
                    
                    tags$body("Click on the icons to see project details and potential capacity and filter by state, solar capacity and more with the options below the map. "),
                    
                    # adding gap
                    div(class = "gap"),
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
                    
                    tags$h4("Map Filtering Options",
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
           
           # start row 1 - header and text 
           fluidRow(
             column(1), #left padding
             
             column(10, 
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # page title
                    tags$h3("Download & Explore the Data",
                            style = "text-align: center;"
                            ),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # page description
                    tags$body("Available data includes: energy attributes containing the optimization results of energy capacity, solar ratios and monetary estimates, spatial attributes housing information whether the projects fall within different techno-economic criteria and envrionmental impact scores, transmission attributes showcasing information about nearby transmission infastructure, location attributions containing latitude and longitude, and metadata."),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    ),
             
             column(1) #right padding
             
           ),# end row 1 - header and text 
           
           # START row 2 - Map text 
           fluidRow(
             
             # START row 2 - column 1 padding
             column(1),
             # ENDS row 2 - column 1 - padding
             
             # START row 2 - column 2 - download button
             column(2, 
                    selectInput("dataset", "Choose a dataset:",
                                choices = c("energy attributes", 
                                            "spatial attributes",
                                            "transmission attributes",
                                            "location attributes",
                                            "metadata")),
                    
                    # Button
                    downloadButton("downloadData", "Download"),
                    
                    # adding gap
                    div(class = "gap")
                    
                    
             ),
             # END row 2  - column 2 - download button
             
             
             # START row 2 - column 3 - data table
             column(8, 
                    
                    # download data tables
                    dataTableOutput("table")
             ),
             # END row 2  - column 3 - data table
             
             
             # START row 2 - column 4 padding
             column(1),
             # ENDS row 2 - column 4 - padding
             
             
           )
           # END row 2 - map text 
           
         ),
         # END fluid page
         
         
), # END (Page 5) tabular data 




### --------------------
### Page 2 About App ---
### --------------------

# (Page 2) how to tabPanel
tabPanel(title = "Methods & Sources",
         # START fluid page - about
         fluidPage( 
           
           # START row 1 - how to
           fluidRow(
             
             column(1), # row 1 - left padding
             
             # START row 1 - column 2 data
             column(10, 
                    
                    # methods text
                    includeMarkdown("text/methods.md"),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # Add the divider line
                    tags$hr(class = "divider"),
                    
             ),
             # END row 1 - column 2
             
             column(1) # row 1 - right padding
             
           ),
           # END row 1 - how to
           
           # START row 2 - data & terms
           fluidRow(
             
             column(1), # row 1 - left padding
             
             # START row 1 - column 2
             column(10, 
                    
                    # data explanation text
                    includeMarkdown("text/data_explanation.md"),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # download data tables
                    dataTableOutput("data_description"),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # Add the divider line
                    tags$hr(class = "divider"),
                    
                    ),
             # END row 1 - column 3
             
             column(1), # row 1 - left padding
             
           ),
           # END row 2 - data & terms
           
           # START row 3 - methods & assumptions
           fluidRow(
             
             column(1), # right padding
             
             # start column assumptions
             column(10, 
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # assumptions text
                    includeMarkdown("text/assumptions.md")
                    
                    ),
             # end column assumptions
             
             column(1) # right padding
             
           )
           # end row 3 - methods & assumptions
           
         ) # END fluid page - about
         
), # END (Page 2) how to tabPanel

### --------------------
### END Navbar Page ----
### --------------------  


  ) # End of Navbar

) # END of UI



