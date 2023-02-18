library(shiny)
library(datasets)
library(dplyr)

ui <- fluidPage(
  sliderInput(inputId='slider',
              label='No. of bins',
              min=1,
              max=50,
              value=5 ),
  plotOutput(outputId = 'distplot')
)

server <- function(input, output, session) {
  
  output$distplot <-  renderPlot({
    
    df<- iris
    bins <- seq(min(df$Sepal.Length), 
                  max(df$Sepal.Length), 
                  length.out = input$slider + 1)
    
    # draw the histogram with the specified number of bins
    hist(df$Sepal.Length, breaks =bins, 
         col ='aquamarine',
         border = 'black',
         xlab = 'Sepal Length',
         main = 'Histogram of Sepal Length')
  })
}

shinyApp(ui, server)

