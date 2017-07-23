library(shiny)


shinyServer(function(input, output) {
  
weights <- reactive({as.numeric(input$weight)})
heights <- reactive({as.numeric(input$height)})
  
bmi <-  reactive({
    703 * weights() / (heights()^2)
    })

output$bminumber <- renderText({format(bmi(),digits= 3)})
output$bmistatus <- renderText(
        if( bmi() < 18.5 ){
          "underweight"
        } else if( bmi() < 24.9) {
          "normal weight"
        } else if( bmi() < 29.9) {
          "over weight"
        } else "obese"
      )

x <- as.numeric(0)
underh <- function(x) {(703 * x / 18.5) ^ 0.5}
normh <- function(x) {(703 * x / 24.9) ^ 0.5}
overh <- function(x) {(703 * x / 29.9) ^ 0.5}

output$plot1 <- renderPlot({
  curve(underh, from= 100, to= 400, 
        xlab= "weight (lbs)", ylab= "height (in)", main= "BMI by body type", col= "yellow")
  curve(normh, col= "orange", add= TRUE)
  curve(overh, col= "red", add= TRUE)
  points(weights(), heights(), pch= 19, col= "blue")
  legend("topleft", c("underweight", "normal weight", "overweight", "your weight"), 
         col= c("yellow", "orange", "red", "blue"),
         lty= c(1,1,1,1))
  })  

})
