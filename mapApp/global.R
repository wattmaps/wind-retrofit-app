# load libraries ----
library(shiny)
library(markdown)
library(sass)


# converting sass file to css 
sass(
  input = sass_file("www/styles.scss"),
  output = "www/sass_styles.css"
     )
