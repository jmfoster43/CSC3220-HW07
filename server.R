# server.R

source("helpers.R") 
#counties = readRDS("C:\\Users\\Leland\\Google Drive\\Spring 2017\\CSC 3220 - Fundamentals of Data Science\\In Class Labs\\Week 11 - Lab16\\Shiny Notes\\census-app\\data\\counties.rds")
counties <- readRDS("data/counties.rds") 
library(maps)
library(mapproj)

#(
#  function(input, output) {
#    output$map <- renderPlot({
#      percent_map(counties$white, "darkgreen", "% White")
#    })
#  }
#)


shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      args <- switch(input$var,
      "Percent White"    = list(counties$white,    "darkgreen", "% White"),
      "Percent Black"    = list(counties$black,    "black",     "% Black"),
      "Percent Hispanic" = list(counties$hispanic, "darkblue",  "% Hispanic"),
      "Percent Asian"    = list(counties$asian,    "darkred",   "% Asian"))
      
      args$min <- input$range[1]
      args$max <- input$range[2]
      
      do.call(percent_map, args)
    })
  }
)
