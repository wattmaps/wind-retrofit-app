# user interface ----
ui <- fluidPage(
  
  ### -------------
  # Webpage Set-Up
  # ---------------
  
  # webpage tab title
  tags$head(
    tags$script(
      HTML("
      $(document).ready(function() {
        document.title = 'Co-location Findings';
      });
    ")
    )
  ),
  
  ### -------------
  # Setting up HTML Tags
  # ---------------
  
  # adding css style file to the UI to render custom CSS
  header = tags$head(
    tags$link(rel = "stylesheet", 
              type = "text/css", 
              href = "sass_styles.css")),
  
  # custom gap HTML tag
  tags$style(HTML("
    .gap {
      margin-top: 24px;
    }
  ")),
  
  # custom divider HTML tag
  tags$style(HTML("
    .divider {
      border-top: 2px solid #b0bbbf; 
      margin: 20px 0;
    }
  ")),
  
  # custom dotted blue divider HTML tag
  tags$style(HTML("
  .divider-main {
    border-top: 3px dotted #E76F51; 
    margin: 20px 0;
  }
")),

# customizing the slider theme
chooseSliderSkin(
  skin =  "Flat",
  color = "#F4A261"
),

# enabling shiny java script integration
useShinyjs(),

######### ------------- ######
####### WEBPAGE CONTENT ######
######### ------------- ######

#  adding title above navigation bar at top of page
fluidRow(
  column(
    width = 12,
    h2("Co-Locating a Power Couple", 
       align = "center")
  )
), 


### --------------------
### Webpage Pages ----
### --------------------  

navbarPage(
  
  # adding css style file ----
  header = tags$head(
    tags$link(rel = "stylesheet", 
              type = "text/css", 
              href = "sass_styles.css"),
    tags$style(HTML(".navbar { height: 50px; }"))),
  
  title = NULL,
  
  ### --------------------
  ### Page 1 Home Page --------
  ### --------------------
  
  # (Page 1) home tabPanel
  tabPanel(title = "Home",
           
           # START fluid page - home
           fluidPage(
             
             # (Page 1) START row 1
             fluidRow(
               
               column(1), # left padding
               
               # row 1 column 2 - abstract text
               column(6,
                      
                      includeMarkdown("text/abstract.md")),
               
               # row 1 column 3 - wind solar image
               column(4,
                      
                      tags$img(src = "images/wind_solar_square.jpg", 
                               alt = "wind and solar",
                               style = "max-width: 80%; border-radius: 50%; overflow: hidden; padding-top: 16px;") 
                      
               ),
               
               
               column(1) # right padding
               
             ),
             # (Page 1) END row 1
             
             # (Page 1) START row 2 - divider line
             fluidRow(
               
               column(1), # left padding
               
               # additional left padding
               column(2), 
               
               
               # column 3 divider line
               column(9,
                      
                      # adding gap
                      div(class = "gap"),
                      
                      # divider line
                      tags$hr(class = "divider"),
                      
                      # adding gap
                      div(class = "gap"))
               
             ),
             # (Page 1) END row 2
             
             
             # (Page 1) START row 3 - contributors
             fluidRow(
               
               column(1), # left padding
               
               # row w column 2 - contributors
               column(10,
                      
                      # title 
                      tags$h4("Contributors:"),
                      
                      # adding gap
                      div(class = "gap"),
                      
                      # Grace Wu bio
                      tags$body(HTML("<b>Dr. Grace C. Wu</b> is an Assistant Professor in the Environmental Studies Program at UC Santa Barbara. Before joining UCSB, Grace was a Smith Conservation Fellow at The Nature Conservancy and the National Center for Ecological Analysis and Synthesis. She was also a UC President’s Postdoctoral Fellow at the John Muir Institute of the Environment at UC Davis. She was trained in systems thinking and interdisciplinary approaches in the Energy and Resources Group at UC Berkeley. Grace is interested in the dynamics and drivers of land use change, climate change mitigation, and advancing our ability to plan for sustainable, multi-use landscapes that protect biodiversity and advance climate goals. She uses spatial science approaches to identify and understand the co-benefits and trade-offs between climate solutions and habitat conservation. Her current main research areas are (1) sustainable spatial planning of low carbon energy systems; and (2) designing policy, management, and technology pathways to sustainable land systems.")),
                      
                      # adding gap
                      div(class = "gap"),
                      
                      # capstone project description
                      tags$body(HTML("<b>Michelle Lam, Colleen McCamy and Alessandra Vidal Meza </b> contributed to this project through their capstone project for the <a href='https://bren.ucsb.edu/masters-programs/master-environmental-data-science'>Master of Environmental Data Science</a> at the Bren School of Environmental Science & Management, UC Santa Barbara during the 2022-2023 school year. Capstone projects offer students the opportunity to collaboratively design, execute, and present a professional environmental data science product working with both internal and external stakeholders.")), 
                      
                      # adding gap
                      div(class = "gap"),
                      # adding another gap
                      div(class = "gap")
                      
               ),
               
               
               column(1) # right padding
               
             ),
             # (Page 1) END row 3
             
             
             # (Page 1) START row 2 
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
             # (Page 1) END row 2
             
             
             # (Page 1) START row 4
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
             # (Page 1) END row 4
             
             
             # (Page 1) START row 5
             fluidRow(
               
               # row 4 divider
               column(1),
               
               column(10, 
                      
                      # adding gap
                      div(class = "gap"),
                      
                      # github button
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
               
             ) # (Page 1) END row 5
             
             
           ), 
           # (Page 1) END fluid page
           
           
  ), # END (Page 1) home tabPanel
  
  ### --------------------
  ### Page 2: Findings ---
  ### --------------------
  
  # (Page 2) Findings
  tabPanel(title =  "Findings",
           
           # (Page 2) START fluid page - findings
           fluidPage( 
             
             # (Page 2) START row 1 - findings description
             fluidRow(
               
               column(1), # row 1 - right padding
               
               # column 1 - findings descriptions
               column(10,
                      
                      # title
                      tags$h3("Findings & Results",
                              style = "text-align: center;"),
                      
                      # adding gap
                      div(class = "gap"),
                      
                      # findings description paragraph
                      tags$body("This study reports four important findings of retrofitting existing wind projects with solar PV in the contiguous U.S.: (1) additional potential solar energy, (2) combined annual revenue and additional profit, (3) the optimal ratio of solar PV to wind, and (4) multi-criteria techno-economic analysis. This study reports findings for the subsample of 1,288 existing wind projects viable to be retrofitted with solar PV and defines viability as existing wind projects that have an estimated solar capacity greater than zero."),
                      
                      # adding gap
                      div(class = "gap"),
                      
                      # instructions text
                      tags$body("Click on the different tabs below to explore the summary statistics and findings from the project."),
                      
                      # HTML tag changing the tab color
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


# (Page 2) START finding tab1 total solar capacity ----
tabsetPanel(
  type = "pills",
  
  # start graph 1 tabPanel ----
  tabPanel(title = "Total Solar Capacity",
           
           # adding gap
           div(class = "gap"),
           
           # Add the divider line
           tags$hr(class = "divider"),
           
           fluidRow(
             # (Page 2) START row 2 - total solar capacity
             column(12,
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # tab title
                    tags$h3("Total Solar Capacity for  Retrofitting Existing Wind Projects",
                            style = "text-align: center;"),
                    
                    # total solar capacity finding description
                    tags$body("This study finds an estimated 115 GW of potential solar energy across all viable existing wind projects. This addition of potential solar energy represents the opportunity to nearly double capacity at existing wind projects while avoiding the development of new transmission infrastructure. Retrofitting existing wind projects with solar PV is also estimated to deliver over 11 billion USD in additional profit from solar energy production and 30 billion USD in annual combined revenue with wind energy production."),
                    
                    
                    
                    # adding gap
                    div(class = "gap"))
             
           ),
           # (Page 2) END row 2 - wind solar complementary
           
           # (Page 2) start row in capacity tabPanel
           fluidRow(
             
             # column within tabPanel - 115GW image
             column(4, 
                    
                    
                    # (Page 2) total capacity graphic
                    tags$img(src = "images/total_solar_cpc.jpg", 
                             alt = "115 GW potential solar",
                             style = "max-width: 100%; overflow: hidden;"),
                    
             ),
             
             # (Page 2) column 2 - by state plot
             column(8, 
                    
                    # plot title and centering
                    tags$h4("Total Solar Capacity By State", 
                            style = "text-align: center;"),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # map solar capacity per state
                    leafletOutput(outputId = "state_cap", 
                                  height = "350px")
                    
                    
             ),
             
           ),
           
           # (Page 2) row 2 gap
           fluidRow(
             
             column(1),
             
             column(10, 
                    
                    # adding gap
                    div(class = "gap"),
                    
                    
             ),
             
             column(1)
             
           )
           
           
  ), # (Page 2) END tabsetPanel - total solar capacity
  
  # (Page 2) START tabsetPanel ratios ----
  tabPanel(title = "Solar to Wind Ratios",
           
           # adding divider line
           tags$hr(class = "divider"),
           
           # (Page 2) START row 1 - title & description
           fluidRow(
             
             # (Page 2) column 1
             column(12, 
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # finding option title
                    tags$h3("Solar to Wind Ratios for Retrofitting Existing Wind Projects",
                            style = "text-align: center;"),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # description of solar to wind ratios
                    tags$body("This study identifies an average optimal ratio of solar PV to wind of 1.01 for all viable existing wind projects, ceteris paribus. The optimal ratio suggests that, on average, for every 1.00 unit of wind capacity, 1.01 units of solar capacity may be added to the project to maximize profit, ceteris paribus. While the distribution of optimal ratios ranges from zero to 1.50, most existing wind projects have a ratio of solar PV to wind greater than 0.70. We thus can point to co-location of solar PV and wind at viable existing wind projects may be a ‘low-hanging fruit’ pathway towards reaching clean electricity goals in the U.S."),
                    
                    # adding gap
                    div(class = "gap")
                    
             ),
             
           ),
           
           # (Page 2) start findings row
           fluidRow(
             
             # start column 1 ratio overview
             column(5, 
                    
                    
                    # average ratio findings graphic
                    tags$img(src = "images/avg_ratio_graphic.jpg", 
                             alt = "1.01 solar to 1 wind",
                             style = "max-width: 100%; overflow: hidden;"),
                    
                    # graphic description
                    tags$h5("Average solar to wind ratio for viable sites"),
                    
                    # additional graphic description
                    tags$h6("*Caclulated for sites with a solar capacity greater than 0 GW")
                    
             ), # END column 1 average ratio
             
             # START column 2 ratio - graph
             column(7, 
                    
                    # map title and centering
                    tags$h4("Distribution of ratios Across All Viable Wind Projects in the US", 
                            style = "text-align: center;"),
                    
                    # graph of ratio histogram
                    plotOutput("ratio_distribution"),
                    
             ) # END column 2 ratio by state map
             
           ), # end of fluid Row
           
           # (Page 2) row 3 - average ratio by state map
           fluidRow(
             
             # full width column - map of state ratios
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
           
  ), # end tabsetPanel ratios
  
  # start tabsetPanel 3 ---- solar & wind complementarity
  tabPanel(title = "Solar & Wind Complementarity",
           
           # adding divider line
           tags$hr(class = "divider"),
           
           # (Page 2) START row 1 - title & description
           fluidRow(
             
             # START title, description & plot
             column(12,
                    
                    tags$h4("Wind and Solar Complementarity Capacity Factors Example",
                            style = "text-align: center;"),
                    # adding gap
                    div(class = "gap"),
                    
                    # description of graph
                    tags$body("This graph showcases wind and solar capacity factors for 2012 for Neosho Ridge wind project in Neosho County, Kansas. The ratio for solar to wind is 1.17 with an estimated annual solar capacity of 357 MW and wind capacity of 305 MW. Change the day of the year with the slide option below."),
                    # adding gap
                    div(class = "gap"),
                    
                    # calling the distribution
                    plotOutput("cp_time_series")
                    
             ), # end timeseries column
             
             
             
           ), # (Page 2) END of fluid Row 1
           
           # (Page 2) START row 2 - slider plot inputs
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
             
             # column 4 for legend (static image)
             column(5, 
                    # adding gap
                    div(class = "gap"),
                    
                    # legend image
                    tags$img(src = "images/solar_wind_complementarity_legend.jpg", 
                             alt = "yellow solar, blue wind",
                             style = "max-width: 60%; overflow: hidden;"),
                    
             ), # end text column
             
             column(1) # right padding
             
             
           ), # (Page 2) END of fluid Row 2 - legend & slider
           
           # (Page 2) START fluid row 3 - adding gap
           fluidRow(
             
             # adding gap
             div(class = "gap"),
             
             
             
           ) # (Page 2) END fluid row 3 - gap
           
  ), # (Page 2) end tabsetPanel 3 - complementarity
  
  
  # (Page 2) start tabsetPanel 4 ---- economic development
  tabPanel(title = "Economic Development",
           
           # adding divider line
           tags$hr(class = "divider"),
           
           # (Page 2) START fluidRow 1 - federal incentives
           fluidRow(
             
             # START federal incentives column full width 
             column(12,
                    
                    # title for IRA section
                    tags$h3("Potential Federal IRA Tax Incentive Eligibility for Adding Solar PV", 
                            style = "text-align: center;"),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # IRA description 
                    tags$body("TThe Inflation Reduction Act defines energy communities as  brownfield sites, coal communities and areas with a specific combination of employment and local tax revenue related to the fossil fuel industry. This study finds that around 12 percent of viable existing wind projects are sited within counties with IRA energy communities. This suggests that around 12 percent of viable existing wind projects may receive a 10 percent increase in federal tax benefits. 
                             
                             However, viable existing wind projects in energy communities also operate, on average, at near 76 percent staffing and resource capacity (The Rural Capacity Index). The local governments of where these projects are sited may not have the staffing and resources to access these federal tax benefits."),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    
             ) # (Page 2) END federal incentives
             
             
           ), # (Page 2) END IRA row
           
           # (Page 2) START row 2 - graphs
           fluidRow(
             
             column(1), # left padding
             
             # START column 1 solar capacity IRA by census track
             column(5,
                    
                    tags$h4("Solar Capacity for Sites that Fall in\n Counties with Eligible Census Tracts by State",
                            style = "text-align: center;"),
                    
                    plotOutput("energy_comm_solar_cap")
                    
             ), # END column 1 solar capacity IRA by census track
             
             # START column 2 rural capacity ridge
             column(5, 
                    
                    tags$h4("Rural Capacity Index Distribution by Region", 
                            style = "text-align: center;"),
                    
                    plotOutput("rci_plot")
                    
                    
             ), # end text column
             
             column(1) # right padding
             
             
           ), # end of fluid Row 2
           
           # (Page 2) START row 2 - equitable investment
           fluidRow(
             
             # adding gap
             div(class = "gap"),
             
             # adding gap
             div(class = "gap"),
             
             # adding blue dotted divider line
             tags$hr(class = "divider-main"),
             
             # adding gap
             div(class = "gap"),
             
             # adding gap
             div(class = "gap"),
             
             # section title
             tags$h3("Equitable Investment for Retrofitting Existing Wind Projects", 
                     style = "text-align: center;"),
             
             # adding gap
             div(class = "gap"),
             
             # equitable investment description
             tags$body("TThe study evaluated equitable investment in renewable energy deployment since renewable energy deployment tends to be lower in communities that require economic development and employment opportunities the most. The DOE uses fossil dependence, energy burden, environmental and climate hazard, and sociodemographic data at the census tract-level to assess for Disadvantaged Community status. This study finds that less than 3 percent of viable existing wind projects are within counties with Disadvantaged Community status. This percentage of viable existing wind projects is low likely due to the rural-urban and racial disparities of past siting that hinders equitable investment in the case of retrofitting (Ross et al., 2022).")
             
           ) # end of economic development column
           
  ), # (Page 2) END economic development tabset
  
  # (Page 2) START - Environmental Impact tabset
  tabPanel(title = "Environmental Impact",
           
           # adding divider line
           tags$hr(class = "divider"),
           
           # (Page 2) START fluidRow 1 - title and description
           fluidRow(
             
             # START env. impact title, description & plot full width column
             column(12,
                    
                    # env. impact title
                    tags$h3("Environmental Impact Scores for Solar PV Deployment",
                            style = "text-align: center;"),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # environmental impact description
                    tags$body("This study couples these nonlinear optimization model findings with a multi-criteria techno-economic analysis for environmental impact*. Overall, there is an average environmental impact score of 7.80 across all viable existing wind projects and a weighted average environmental impact score of 6.61 by potential solar capacity. These estimates suggest that retrofitting viable existing wind projects with solar PV has minimal direct environmental impact and may make use of environmental and physical sunk costs already incurred by projects, like fencing, auxiliary, roads infrastructure, and transmission infrastructure."),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # plot description
                    tags$body("The plot below outlines the distribution of environmental impact scores by region."),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # environmental impact by region plot
                    plotOutput("env_score_ridge"),
                    
                    # environmnetal impact score description
                    tags$h6("*This study used environmental impact scores from the Power of Place study by The Nature Conservancy to evaluate the environmental sensitivity of solar PV deployment within existing wind projects. The scores are high-level estimates of spatially-specific environmental positives and negatives, where larger raster values indicate higher negative impacts, lower raster values indicate lower negative impacts. The environmental impact index consists of data falling into the following categories:  wetland, managed areas, threatened and endangered species habitat, intact habitat, and local bird and bat habitats.")
                    
             ) # END env. results column
             
             
           ), # (Page 2) END of fluid Row 1
           
           
  ), # (Page 2) END - environmental impact tabsetPanel
  
), # (Page 2) END tabsetPanels for all findings

# (Page 2) START row 2 - github button
fluidRow(
  
  # adding gap
  div(class = "gap"),
  
  # adding github button
  div(
    style = "text-align: right;",
    a(
      href = "https://github.com/wattmaps",
      target = "_blank",
      actionButton(
        inputId = "button",
        label = span(
          class = "fa fa-github")))),
  
)), # END (Page 2) total page

# (Page 2) Custom spacing
column(1) ), 

fluidRow(
  
  column(1,
  ),
  column(10, 
         
         # adding gap
         div(class = "gap"),
         # adding gap
         div(class = "gap"),
  ), column(1),),

# END row 2 - map text 

# START row 2 - divider
fluidRow(
  column(12,
         
         # adding gap
         div(class = "gap"),
         
         # adding gap
         div(class = "gap"),)),),), # END (Page 2) ALL


### --------------------
### Page 3 Map ---------
### --------------------

# (Page 3) START Nav panel - explore the map 
tabPanel(title =  "Explore the Map",
         
         # (Page 3) START fluid page - map
         fluidPage( 
           
           # (Page 3) START row 1 - map
           fluidRow(
             
             column(1), # column 1 - left padding
             
             # START row 1 - column 2 - map title and description
             column(10, 
                    
                    # map title
                    tags$h3("Map of Existing Wind Projects for Potential Solar PV Retrofit", 
                            style = "text-align: center;"),
                    
                    # map description
                    tags$body("Click on the icons to see project details and potential capacity and filter by state, solar capacity and more with the options below the map. The following map outlines the results of the  nonlinear optimization model solving for the optimal solar PV to wind technology ratio at each existing wind project that maximizes the annual profit subject to the estimated generation, annual costs, and transmission line capacity of each viable project. The pop-up information showcases the optimization result for each existing wind project."),
                
                    # adding gap
                    div(class = "gap"),
             ),
             # END row 1 - column 2 - map
             
             column(1), # column 3 - right padding
             
           ),
           # END row 1
           
           # (Page 3) START row 2 - Map 
           fluidRow(
             
             column(1), # column 1 - left padding
             
             # START column 2 - map
             column(10, 
                    
                    # adding the leaflet map of all sites
                    leafletOutput(outputId = "colocation_map", 
                                  height = "560px")
             ), # END column 2 map
             
             column(1), # column 3 - right padding
             
           ),
           # (Page 3) END row 2 - co-location map
           
           # (Page 3) START row 3 - map filtering title
           fluidRow(
             
             column(1), # column 1 - left padding
             
             # START row 3 - column 2 - select states
             column(10, 
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # filter map title
                    tags$h4("Map Filtering Options",
                            style = "text-align: center;"),
                    
                    # adding gap
                    div(class = "gap"),
                    
             ),#  end column 2 - filtering title
             
             column(1), # column 3 - right padding
             
           ),
           # (Page 3) END row 2 - filtering options title
           
           # (Page 3) START row 3 - filter options
           fluidRow(
             
             column(1), # column 1 - left padding
             
             # column 2 - select states dropdown
             column(3, 
                    
                    # state picker options
                    pickerInput(
                      inputId = "state_input", 
                      label = "Select states:", 
                      choices = sort(unique(map_data$state_names)), 
                      selected = sort(unique(map_data$state_names)),
                      options = pickerOptions(
                        actionsBox = TRUE, 
                        size = 10,
                        selectedTextFormat = "count > 3"),
                      multiple = TRUE), # end state picker
                    ),
             # END row 3 - column 2 - select states
             
             # START row 3 - column 3 - solar capacity slider
             column(4, 
                    
                    # start solar cap. slider
                    sliderInput(inputId = "slr_input",
                                label = "Filter by Solar Capacity (MW):",
                                min = 0, 
                                max = round(max(map_data$slr_cpc,
                                                na.rm = TRUE))+1, 
                                value = c(0,round(max(map_data$slr_cpc,
                                                      na.rm = TRUE)))
                    ) # end solar cap. slider
             ),
             # END row 3 - column 3 - slider
             
             # START row 3 - column 4 - techno-econ filter
             column(3, 
                    
                    tags$h5("Filter for Additional Economic Development:"),
                    
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
             
           ),
           # (Page 3) END row 3 - filtering options 
           
           # (Page 3) START row 4 github button 
           fluidRow(
             
             # adding gap
             div(class = "gap"),
             
             # github button
             div(
               style = "text-align: right;",
               a(
                 href = "https://github.com/wattmaps",
                 target = "_blank",
                 actionButton(
                   inputId = "button",
                   label = span(
                     class = "fa fa-github")))),
             
             # adding gap
             div(class = "gap"),
             
             # adding gap
             div(class = "gap")
             ) # (Page 3) END row 4 github button 
           
         ) # (Page 3) END fluid page - map
         
), # END (Page 3) explore the map

### --------------------
### Page 4 Data ---------
### --------------------

# (Page 4) tabular data tabPanel
tabPanel(title =  "Explore the Data",
         
         # (Page 4) START fluid page - explore the data
         fluidPage( 
           
           # (Page 4) start row 1 - title and description 
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
                    
                    # data description
                    tags$body("Available data includes: energy attributes containing the optimization results of energy capacity, solar ratios and monetary estimates; techno-economic attributes with information whether the projects fall within different techno-economic criteria and envrionmental impact scores; transmission attributes showcasing information about nearby transmission infastructure; location attributions containing latitude and longitude; all data combined and metadata."),
                    
                    # adding gap
                    div(class = "gap"),
                    
                    ),
             
             column(1) #right padding
             
           ),# (Page 4) end row 1 - title and description
           
           # (Page 4) START row 2 - Data picker and inputs
           fluidRow(
             
             # START row 2 - column 1 padding
             column(1),
             # ENDS row 2 - column 1 - padding
             
             # START row 2 - column 2 - select dataset & download button
             column(2, 
                    
                    # data selection input
                    selectInput("dataset", "Choose a dataset:",
                                choices = c("energy attributes", 
                                            "techno-economic attributes",
                                            "transmission attributes",
                                            "location attributes",
                                            "all data",
                                            "metadata")),
                    
                    # button to download data
                    downloadButton("downloadData", "Download"),
                    
                    # adding gap
                    div(class = "gap")
                    
                    
             ),
             # END row 2  - column 2 - download button
             
             
             # START row 2 - column 3 - data tables
             column(8, 
                    
                    # data table output
                    dataTableOutput("table")
             ),
             # END row 2  - column 3 - data table
             
             
             # START row 2 - column 4 padding
             column(1),
             # ENDS row 2 - column 4 - padding
             
             
           ),
           # (Page 4) END row 2 - data table and download
           
           # (Page 4) adding github button row
           fluidRow(
             
             # adding gap
             div(class = "gap"),
             
             # github button
             div(
               style = "text-align: right;",
               a(
                 href = "https://github.com/wattmaps",
                 target = "_blank",
                 actionButton(
                   inputId = "button",
                   label = span(
                     class = "fa fa-github")))),
             
             # adding gap
             div(class = "gap"), 
             
             # adding gap
             div(class = "gap")) # END gitbub button row
           
           ),
         # (Page 4) END fluid page - data tables
         
         
), # END (Page 4) explore the data



### --------------------
### Page 5 Methods & Assumptions
### --------------------

# (Page 5) START page 5 methods & assumptions
tabPanel(title = "Methods & Sources",
         
         # START fluid page - methds
         fluidPage( 
           
           # START row 1 - methods description
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
           # (Page 5) END row 1 - methods description
           
           # (Page 5) START row 2 - data table
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
                    
                    ), # END data table column
             
             column(1), # row 1 - left padding
             
           ),
           # (Page 5) END row 2 - data table
           
           # (Page 5) START row 3 - ssumptions
           fluidRow(
             
             column(1), # right padding
             
             # start column assumptions
             column(10, 
                    
                    # adding gap
                    div(class = "gap"),
                    
                    # assumptions text
                    includeMarkdown("text/assumptions.md"),
                    
                    # assumptions table image
                    tags$img(src = "images/optimization_assumptions.jpg", 
                             alt = "wind and solar",
                             style = "max-width: 90%;  overflow: hidden; padding-top: 16px;") 
                    
                    ),
             # end column assumptions
             
             column(1) # right padding
             
           ),
           # (Page 5) END row 3 - assumptions
           
           # (Page 5) START row - add github button 
           fluidRow(
             
             # adding gap
             div(class = "gap"),
             
             # adding github button
             div(
               style = "text-align: right;",
               a(
                 href = "https://github.com/wattmaps",
                 target = "_blank",
                 actionButton(
                   inputId = "button",
                   label = span(
                     class = "fa fa-github")))),
             
             # adding gap
             div(class = "gap")
             
           )
           
         ) # (Page 5) END fluid page - methods & assumptions
         
), # END (Page 5) how to tabPanel

### --------------------
### END Navbar Page ----
### --------------------  


  ) # End of Navbar

) # END of UI



