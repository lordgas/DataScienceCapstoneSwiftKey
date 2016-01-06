library(shiny)

source("Prediction.R")

# Define server logic to predict next word
shinyServer(function(input, output) {
  
  # You can access the value of the widget with input$text, e.g.
  output$value <- renderPrint({ predictNext(input$text) })
  
})