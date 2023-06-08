### ------------------
# Script for Main Map
### ------------------
# 
# # loading in the map icon
# map_icon <- makeIcon(iconUrl = "mapApp/www/images/map_icon.png")
# 
# # pop-up content
# popup_content <- paste("<b>Location:</b> ",
#                        map_data$t_county,
#                        ", ",
#                        map_data$t_state, 
#                        "<br>",
#                        "<b>Project Name:</b> ",
#                        map_data$p_name, 
#                        "<br>",
#                        "<img src='images/plots/WID_1_plot.png' width='200'>")
# 
# # mapping the data with leaflet
# test_map <- leaflet() |> 
#   addProviderTiles(providers$NASAGIBS.ViirsEarthAtNight2012) |> #NASAGIBS.ModisTerraBands367CR
#   addMarkers(map_data, 
#              lng = map_data$xlong, 
#              lat = map_data$ylat,
#              #icon = map_icon,
#              popup = popup_content)

