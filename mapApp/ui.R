# user interface ----
ui <- navbarPage(
  
### --------------------
### START Navbar Page ----
### -------------------- 
    
    title = "Wind Retrofit App",
    
### --------------------
### Page 1 Home --------
### --------------------
    
    # (Page 1) home tabPanel
    tabPanel(title = "Home",
             
             "lots of text" 
             ## > REPLACE
             
    ), # END (Page 1) home tabPanel
    
### --------------------
### Page 2 About App ---
### --------------------
    
    # (Page 2) about tabPanel
    tabPanel(title = "How to Use the App",
             # START fluid page - about
             fluidPage( 
               # START row 1 - hoow to
               fluidRow(
                 
                 # START row 1 - column 1
                 column(4,
                        #REPLACE
                        "Test text"
                 ),
                 # ENDS row 1 - column 1
                 
                 # START row 1 - column 2
                 column(8, 
                        #REPLACE
                        "Test text"
                 )
                 # END row 1 - column 2
                 
               ),
               # END row 1
               
               # START row 2 - Terms & warnings
               fluidRow(
                 
                 # START row 2 - column 1
                 column(6, 
                        #REPLACE
                        "Test text"
                 ),
                 # END row 2 - column 1
                 
                 # START row 2 - column 2
                 column(6, 
                        #REPLACE
                        "Test text"
                 )
                 # START row 2 - column 2
                 
               )
               # START row 2 - Terms & warnings
               
             ) # END fluid page - about
             
          
             ## > REPLACE
             
    ), # END (Page 2) about tabPanel
    
### --------------------
### Page 3 Map ---------
### --------------------
    
    # (Page 3) data viz tabPanel
    tabPanel(title =  "Explore the Map",
             
             # START fluid page - map
             fluidPage( 
               # START row 1 - map
               fluidRow(
                 
                 # START row 1 - column 1 padding
                 column(2,
                 ),
                 # ENDS row 1 - column 1 - padding
                 
                 # START row 1 - column 2 - map
                 column(8, 
                        #REPLACE
                        "Test text"
                 ),
                 # END row 1 - column 2 - map
                 
                 # START row 1 - column 3 padding
                 column(2,
                 ),
                 # ENDS row 1 - column 1 - padding
                 
               ),
               # END row 1
               
               # START row 2 - Map text 
               fluidRow(
                 
                 # START row 2 - column 1 padding
                 column(1,
                 ),
                 # ENDS row 1 - column 1 - padding
                 
                 # START row 1 - column 2 - map text
                 column(10, 
                        #REPLACE
                        "Test text"
                 ),
                 # END row 1 - column 2 - map text
                 
                 # START row 1 - column 3 padding
                 column(1,
                 ),
                 # ENDS row 1 - column 1 - padding
                 
               )
               # END row 2 - map text 
               
             ) # END fluid page - maps
             
    ), # END (Page 2) data viz tabsetPanel
    
### --------------------
### Page 4 Data ---------
### --------------------
    
    # (Page 4) tabular data tabPanel
    tabPanel(title =  "Explore the Data",
             
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
               
               
             ) # END (Page 4) tabular data 
             
     
    
### --------------------
### END Navbar Page ----
### --------------------  
    
  ) # END navbarPage
  


