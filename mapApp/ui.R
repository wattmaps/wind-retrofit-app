# user interface ----
ui <- fluidPage(
  
  # adding css sytle file ----
  header = tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "sass_styles.css")),
  
  # Add title above navbar using fluidRow and column
  fluidRow(
    column(
      width = 12,
      h2("Wind Co-location Retrofitting", 
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
    
    # (Page 3) findings tabPanel
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
             
    ), # END (Page 3) findings tabPanel
    
    ### --------------------
    ### Page 3 Findings ---
    ### --------------------
    
    # (Page 2) tabular data tabPanel
    tabPanel(title =  "Findings",
             
             # START fluid page - data
             fluidPage( 
               # START row 1 - graphs
               fluidRow(
                 
                 # START row 1 - column 1 graph1
                 column(6,
                        
                        # START tabsetPanel graph 1 ----
                        tabsetPanel(
                          
                          # start graph 1 tabPanel ----
                          tabPanel(title = "Graph 1",
                                   
                                   "findings data viz here"  
                                   
                          ), # end tabsetPanel graph 1
                          
                          # start tabsetPanel graph 2 ----
                          tabPanel(title = "Graph 2",
                                   
                                   "findings data viz 2 here"  
                                   
                          ) # end tabsetPanel graph 2
                          
                        ) # END tabsetPanel
                        
                 ), # END (Page 2) data viz tabPanel
                 
                 column(6, 
                        
                        # START tabsetPanel graph 1 ----
                        tabsetPanel(
                          
                          # start graph 1 tabPanel ----
                          tabPanel(title = "Graph 1",
                                   
                                   "findings viz 1 here"  
                                   
                          ), # end tabsetPanel graph 1
                          
                          # start tabsetPanel graph 2 ----
                          tabPanel(title = "Graph 2",
                                   
                                   "findings viz 2 here"  
                                   
                          ) # end tabsetPanel graph 2
                          
                        ) # END tabsetPanel
                        
                 ),
                 # END row 1 - column 2 - graph2
                 
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
                 column(1,
                        
                 ),
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
                        
                        #REPLACE
                        leafletOutput(outputId = "test_map")
                 ),
                 # END row 2 - column 2 - map text
                 
                 column(1), # column 3 - right padding
                 
               ),
               # END row 2 - map text 
               
               # START row 3 - Map text 
               fluidRow(
                 
                 column(1), # column 1 - left padding
                 
                 # START row 3 - column 2 - map text
                 column(10, 
                        
                        # state picker
                        
                        paste("FILTERING OPTIONS"),
                        
                        shinyWidgets::pickerInput(inputId = "t_state_input",
                                                  label = "Select state:",
                                                  choices = unique(map_dat_test$t_state), 
                                                  options = shinyWidgets::pickerOptions(actionsBox = TRUE), 
                                                  # creates "Select All / Deselect All" buttons
                                                  selected = c("CA", "IA", "MA"),
                                                  multiple = TRUE
                        ) # end state picker
                 ),
                 # END row 3 - column 2 - map text
                 
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
                 
                 # START row 1 - column 2 - map text
                 column(10, 
                        
                        #INSET TABLE
                        "Table"
                 ),
                 # END row 1  - column 2 - map text
                 
                 # START row 1 - column 3 padding
                 column(1,
                        
                 ),
                 # ENDS row 1 - column 1 - padding
                 
                 
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



