library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Copy the line below to make a text input box
  textInput("text", label = h3("Text input"), value = ""),
  hr(),
  fluidRow(column(3, verbatimTextOutput("value")))
  
))