library(shiny)

shinyUI(fluidPage(
  
  titlePanel("BMI Calculator"),
  sidebarLayout(
    sidebarPanel(
      textInput("height", "Enter height (inches)", "68"),
      textInput("weight", "Enter weight (lbs)", "150")
    ),
    
    mainPanel(
      h3("Your BMI is:"),
      textOutput("bminumber"),
      h3("You are "),
      textOutput("bmistatus"),
      plotOutput("plot1"),
      h5("For additional details about Body Mass Index, please see the below link:"),
      h6("https://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/bmicalc.htm")
    )
  )
))
