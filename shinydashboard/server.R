# Overview ----------------------------------------------------------------

# This file defines all of the server-side behaviour. This normally includes
# computation, data operations, graphics, etc.


# Shiny Server ------------------------------------------------------------

function(input, output, session) {
  
  output$dist_plot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
  
}