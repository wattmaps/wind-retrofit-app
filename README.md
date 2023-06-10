# Wind Retrofit App - Co-location Findings Shiny Dashboard

### Application Structure & Content

##### UI Page Descriptions
- (Page 1) Home Page: Includes abstract, contributors and acknowledgements
- (Page 2) Findings: Includes maps, graphics and descriptions for project findings includes Total Solar Capacity, Solar to Wind Ratios, Solar & Wind Complementarity, Economic Development, Environmental Impact
- (Page 3) Explore the Map: Includes co-location project maps with additional attributes
- (Page 4) Explore the Data: Select specific data sources and download data locally
- (Page 5) Methods & Assumptions: Outlines high level methods and data used along with optimization assumptions

#### Maps & Graphs in Application
- state_cap: leaflet map of total solar capacities per state (Page 2 - Total Capacity Finding Tab)
-	ratio_distribution: static graph of ratio distribution in a histogram (Page 2 - Solar to Wind Ratios)
-	state_ratio: leaflet map of ratios by state (Page 2 - Solar to Wind Ratios)
-	cp_time_series: interactive area plot showing solar and wind capacities for a single site (Page 2 - Solar & Wind Complementarity)
-	energy_comm_solar_cap: static bar graph showing top states based on solar capacity within IRA energy communities (Page 2 - Economic Development)
-	rci_plot: static ridge plot showing rural capacity index by US region (Page 2 - Economic Development)
-	env_score_ridge: static ridge plot of environmental sensitivity by US region (Page 2 - Environental Impact)
-	colocation_map: leaflet map of all sites and filtering options (Page 3)
-	table: reactive data table output from the server based on table input selected within the selector embedded within the Data table selector UI (Page 4)

#### Interactive Inputs
- hour_input: slider to select the day for "cp_time_series" (Page 2)
- state_input: input ID for selecting states to appear on "colocation-map" (Page 3)
- slr_input: input ID for selecting range pf solar capacities to appear on map (Page 3)
- en_comm_input: radio button to filter for sites in an IRA designated energy community on co-location map (Page 3)

Plots and interactive inputs are created within the server.R file and then called within the ui.R file to render on the map.

Data is loaded and updated within the global.ui file.


