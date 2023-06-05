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
  
  # establishing a dotted blue divider
  tags$style(HTML("
  .divider-main {
    border-top: 3px dotted #E76F51; 
    margin: 20px 0;
  }
")),
  
  # establishing the slider theme
  chooseSliderSkin(
    skin =  "Flat",
    color = "#F4A261"
  ),
  
  # Enable shinyjs
  useShinyjs(),
  
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
                 
               ),
               # END row 1
               
               # START row 2
               fluidRow(
                 
                 column(1),
                 
                 # row 2 divider
                 column(2), 
                 

                 # row 2 divider
                 column(9,
                        
                        # adding gap
                        div(class = "gap"),
                        
                        # adding divider line
                        tags$hr(class = "divider"),
                        
                        # adding gap
                        div(class = "gap"))
               
               ),
               # END row 2

               
               # START row 3
               fluidRow(
                 
                 column(1), # left padding
                 
                 # row w column 2
                 column(10,
                        
                        tags$h4("Contributors:"),
                        
                        # adding gap
                        div(class = "gap"),
                        
                        tags$body(HTML("<b>Dr. Grace C. Wu</b> is an Assistant Professor in the Environmental Studies Program at UC Santa Barbara. Before joining UCSB, Grace was a Smith Conservation Fellow at The Nature Conservancy and the National Center for Ecological Analysis and Synthesis. She was also a UC President’s Postdoctoral Fellow at the John Muir Institute of the Environment at UC Davis. She was trained in systems thinking and interdisciplinary approaches in the Energy and Resources Group at UC Berkeley. Grace is interested in the dynamics and drivers of land use change, climate change mitigation, and advancing our ability to plan for sustainable, multi-use landscapes that protect biodiversity and advance climate goals. She uses spatial science approaches to identify and understand the co-benefits and trade-offs between climate solutions and habitat conservation. Her current main research areas are (1) sustainable spatial planning of low carbon energy systems; and (2) designing policy, management, and technology pathways to sustainable land systems.")),
                        
                        # adding gap
                        div(class = "gap"),
                        
                        
                        tags$body(HTML("<b>Michelle Lam, Colleen McCamy and Alessandra Vidal Meza </b> contributed to this project through their capstone project for the <a href='https://bren.ucsb.edu/masters-programs/master-environmental-data-science'>Master of Environmental Data Science</a> at the Bren School of Environmental Science & Management, UC Santa Barbara during the 2022-2023 school year. Capstone projects offer students the opportunity to collaboratively design, execute, and present a professional environmental data science product working with both internal and external stakeholders.")), 
                        
                        # adding gap
                        div(class = "gap"),
                        # adding gap
                        div(class = "gap")
                        
                        ),

                 
                 column(1) # right padding
                 
               ),
               # END row 3
               
               
               # START row 2
               fluidRow(
                 
                 # row 2 divider
                 column(3),
                 
                 column(9,
                        
                        # adding gap
                        div(class = "gap"),
                        
                        # adding divider line
                        tags$hr(class = "divider"),
                        
                        # adding gap
                        div(class = "gap")
                        
                        )
                 
               ),
               # END row 2
               
               
               # START row 4
               fluidRow(
                 
                 # row 4 divider
                 column(1),
                 
                 column(10,
                        
                        # adding gap
                        div(class = "gap"),
                        
                        # acknowledgements
                        tags$h4("Acknowledgements:"),
                        
                        # adding divider line
                        tags$body("A special thank you to advisors and committee members: Dr. Naomi Tague, and Dr. Ruth Oliver, as well as Dr. Ranjit Deshmukh, Jamie Montgomery, Sam Csik,  Kat Le, and Brad Hill. This study builds on findings from the Power of Place study by The Nature Conservancy. A special thank you to Power of Place collaborators:  Joe Fargione, Nels Johnson, Christel Hiltibran, Chris Hise, and Liz Kalies, as well as consultants Ryan Jones from Evolved Energy Research and Emily Leslie form Montara Mountain Energy."),
                        
                        # adding gap
                        div(class = "gap")
                        
                 )
                 
               ),
               # END row 4
               
               
               fluidRow(
                 
                 # row 4 divider
                 column(1),
                 
                 column(10, 
                        # Define the GitHub button using custom HTML code
                        # adding gap
                        div(class = "gap"),
                        
                        div(
                          style = "text-align: right;",
                          a(
                            href = "https://github.com/wattmaps",
                            target = "_blank",
                            actionButton(
                              inputId = "button",
                              label = span(
                                class = "fa fa-github"
                              )
                            )
                          )
                        ),
                        
                        # adding gap
                        #actionButton("button", "Github"),
                        
                        
 
                        # adding gap
                        div(class = "gap"),
                        ),
                 
                 column(1)
                 
               )
               
               
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
                        
                        # title
                        tags$h3("Findings & Results",
                                style = "text-align: center;"),
                        
                        # adding gap
                        div(class = "gap"),
                        
                        tags$body("This study reports four important findings of retrofitting existing wind projects with solar PV in the contiguous U.S.: (1) additional potential solar energy, (2) combined annual revenue and additional profit, (3) the optimal ratio of solar PV to wind, and (4) multi-criteria techno-economic analysis. This study reports findings for the subsample of 1,288 existing wind projects viable to be retrofitted with solar PV and defines viability as existing wind projects that have an estimated solar capacity greater than zero."),
                        
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
  tabPanel(title = "Total Solar Capacity",
           
           # adding gap
           div(class = "gap"),
           
           # Add the divider line
           tags$hr(class = "divider"),
           
           fluidRow(
             # START row 2 - wind solar complementary 
             column(12,
                    
                    # adding gap
                    div(class = "gap"),
                    
                    tags$h3("Total Solar Capacity",
                            style = "text-align: center;"),
                    
                    tags$body("This study finds an estimated 115 GW of potential solar energy across all viable existing wind projects. This addition of potential solar energy represents the opportunity to nearly double capacity at existing wind projects while avoiding the development of new transmission infrastructure. Retrofitting existing wind projects with solar PV is also estimated to deliver over 11 billion USD in additional profit from solar energy production and 30 billion USD in annual combined revenue with wind energy production."),
                    

                    
                    # adding gap
                    div(class = "gap"))
             
           ),
           # END row 2 - wind solar complementary
           
           # start row in capacity tabPanel
           fluidRow(
             
             # column within tabPanel
             column(4, 
                    

                    # total capacity graphic
                    tags$img(src = "images/total_solar_cpc.jpg", 
                             alt = "115 GW potential solar",
                             style = "max-width: 100%; overflow: hidden;"),
                    
             ),
             
             # column 2 - by state plot
             column(8, 
                    
                    # plot title and centering
                    tags$h4("Total Solar Capacity By State", 
                            style = "text-align: center;"),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # plot avg ratio per state
                    leafletOutput(outputId = "state_cap", 
                                  height = "350px")
                    
                    
             ),
             
           ),
           
           fluidRow(
             
             column(1),
             
             column(10, 
                    
                    # adding gap
                    div(class = "gap"),
                    
                    
             ),
             
             column(1)
             
           )
           
           
  ), # end tabsetPanel graph 1
  
  # start tabsetPanel graph 2 ----
  tabPanel(title = "Solar to Wind Ratios",
           
           # adding divider line
           tags$hr(class = "divider"),
           
           fluidRow(
             

             column(12, 
                    
                    # adding gap
                    div(class = "gap"),
                    
                    tags$h3("Solar to Wind Ratios",
                            style = "text-align: center;"),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    tags$body("This study identifies an average optimal ratio of solar PV to wind of 1.01 for all viable existing wind projects, ceteris paribus. The optimal ratio suggests that, on average, for every 1.00 unit of wind, 1.01 units of solar may be added to the project to maximize profit, ceteris paribus. While the distribution of optimal ratios ranges from zero to 1.50, most existing wind projects have a ratio of solar PV to wind greater than 0.70. We thus can point to co-location of solar PV and wind at viable existing wind projects may be a ‘low-hanging fruit’ pathway towards reaching clean electricity goals in the U.S."),
                    
                    # adding gap
                    div(class = "gap")
                    
                    
                    ),
             
             
           ),
           
           fluidRow(
             
             # start column 1 ratio
             column(5, 
                    
                    
                    # average ratio graphic
                    tags$img(src = "images/avg_ratio_graphic.jpg", 
                             alt = "1.01 solar to 1 wind",
                             style = "max-width: 100%; overflow: hidden;"),
                    
                    tags$h5("Average solar to wind ratio for viable sites"),
                    
                    tags$h6("*Caclulated for sites with a solar capacity greater than 0 GW")
                    
             ), # end column 1 ratio
             
             # start column 2 ratio
             column(7, 
                    
                    # plot title and centering
                    tags$h4("Distribution of Ratios", 
                            style = "text-align: center;"),
                    
                    # calling the distribution
                    plotOutput("ratio_distribution"),
                    
                    
                    
             ) # column 2 ratio
             
           ), # end of fluid Row
           
           fluidRow(
             

             column(12, 
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # plot title and centering
                    tags$h4("Average Ratio By State", 
                            style = "text-align: center;"),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # plot avg ratio per state
                    leafletOutput(outputId = "state_ratio", 
                                  height = "350px")
                    )
             
           )
           
  ), # end tabsetPanel graph 2
  
  # start tabsetPanel 3 ----
  tabPanel(title = "Solar & Wind Complementarity",
           
           # adding divider line
           tags$hr(class = "divider"),
           
           # start fluidRow 1
           fluidRow(
             
             # start timeseries column
             column(12,
                    
                    tags$h4("Wind and Solar Complementarity Capacity Factors Example",
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
  tabPanel(title = "Economic Development",
           
           # adding divider line
           tags$hr(class = "divider"),
           
           # start fluidRow 1
           fluidRow(
             
             # start IRA column
             column(12,
                    
                    tags$h3("Potential Federal IRA Tax Incentive Eligibility for Adding Solar PV", 
                            style = "text-align: center;"),
                    
                    # adding gap
                    div(class = "gap"),
                    
                   tags$body("This study finds that around 12 percent of viable existing wind projects are sited within counties with IRA energy communities and account for over 13,900 MW of potential solar capacity. This suggests that around 12 percent of viable existing wind projects may receive a 10 percent increase in federal tax benefits. 
                             
                             However, viable existing wind projects in energy communities also operate, on average, at near 76 percent capacity to apply for them from the Rural Capacity Index. The Rural Capacity Index from Headwaters Economics identifies communities with limited capacity needed to apply for federal programs on a scale of 0 (low capacity) to 100 (high capacity); data as of 2022."),
                   
                   # adding gap
                   div(class = "gap"),
                    
                    
             ) # end IRA column
             
             
           ), # end of fluid Row 1
           
           # start fluidRow 2
           fluidRow(
             
             column(1), # left padding
             
             # start slider column
             column(5,
                    
                    tags$h4("Solar Capacity for Sites that Fall in\n Counties with Eligible Census Tracts by State",
                             style = "text-align: center;"),
                    
                    plotOutput("energy_comm_solar_cap")
                    
             ), # end slider column
             
             # start text column
             column(5, 
                    
                    tags$h4("Rural Capacity Index Distribution by Region", 
                            style = "text-align: center;"),
                    
                    plotOutput("rci_plot")
                    
                    
             ), # end text column
             
             column(1) # right padding
             
             
           ), # end of fluid Row 2
           
           fluidRow(
             
             # adding gap
             div(class = "gap"),
             
             # adding gap
             div(class = "gap"),
             
             # adding divider line
             tags$hr(class = "divider-main"),
             
             # adding gap
             div(class = "gap"),
             
             # adding gap
             div(class = "gap"),
             
             tags$h3("Equitable Investment for Retrofitting Existing Wind Projects", 
                            style = "text-align: center;"),
             
             # adding gap
             div(class = "gap"),
             
             tags$body("The study evaluated equitable investment in renewable energy deployment using DOE census tract-level data on disadvantaged indices and DAC status. The DOE uses fossil dependence, energy burden, environmental and climate hazard, and sociodemographic data at the census tract-level to assess for DAC status. Spatial aggregation of the data products was conducted to contextualize the energy injustice landscape of existing wind projects. Less than 3 percent of viable existing wind projects are within counties with census tracts of DAC status. This percentage of existing wind projects is low likely due to systemic biases and rural-urban and racial disparities that influenced the siting of existing wind projects (Ross et al., 2022).")
             
           ) # start of fluid Row 3
           
  ), # end tabsetPanel 4
  
  # start tabsetPanel 5 ----
  tabPanel(title = "Environmental Impact",
           
           # adding divider line
           tags$hr(class = "divider"),
           
           # start fluidRow 1
           fluidRow(
             
             
             
             # start env. results column
             column(12,
                    
                    tags$h3("Environmental Impact Scores for Solar PV Deployment",
                            style = "text-align: center;"),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    tags$body("This study couples these nonlinear optimization model findings with a multi-criteria techno-economic analysis for environmental impact*. Overall, there is an average environmental impact score of 7.80 across all viable existing wind projects and a weighted average environmental impact score of 6.61 by potential solar capacity. These estimates suggest that retrofitting viable existing wind projects with solar PV has minimal direct environmental impact and may make use of environmental and physical sunk costs already incurred by projects, like fencing, auxiliary, roads infrastructure, and transmission infrastructure."),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    tags$body("The plot below outlines the distribution of environmental impact scores by region."),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    plotOutput("env_score_ridge"),
                    
                    tags$h6("*This study used environmental impact scores from the Power of Place study by The Nature Conservancy to evaluate the environmental sensitivity of solar PV deployment within existing wind projects. The scores are high-level estimates of spatially-specific environmental positives and negatives, where larger raster values indicate higher negative impacts, lower raster values indicate lower negative impacts. The environmental impact index consists of data falling into the following categories:  wetland, managed areas, threatened and endangered species habitat, intact habitat, and local bird and bat habitats.")
                    
             ) # end env. results column
             
             
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
                    
                    tags$h5("Filter by Project Attribute:"),
                    
                    # start energy community switch
                    prettySwitch(
                      inputId = "en_comm_input",
                      label = "Potential IRA Incentive Eligible", 
                      status = "warning",
                      fill = TRUE
                    ),# end energy community switch

                    
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
                    tags$body("Available data includes: energy attributes containing the optimization results of energy capacity, solar ratios and monetary estimates; techno-economic attributes with information whether the projects fall within different techno-economic criteria and envrionmental impact scores; transmission attributes showcasing information about nearby transmission infastructure; location attributions containing latitude and longitude; all data combined and metadata."),
                    
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
                                            "techno-economic attributes",
                                            "transmission attributes",
                                            "location attributes",
                                            "all data",
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



