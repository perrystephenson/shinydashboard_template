# Overview ----------------------------------------------------------------

# This file defines the first page of the Demo app, and does the following:
# - Allows the user to fiddle with an inputSlider
# - Plots a histogram based on the inputSlider

# This module returns two reactive objects in a list:
# - The input object, which gives access to the UI input widget values
# - The "faithful" dataset

# This module does not access any data from other modules

# UI - Tab Bar ------------------------------------------------------------

m1_tab_item <-
  menuItem(
    text = "Module 1",
    tabName = "page_1",
    icon = icon("database")
  )


# UI - Main Panel ---------------------------------------------------------

m1_ui <- function(id) {
  
  ns <- NS(id)
  
  # UI - Main Panel - Box Definitions -------------------------------------
  
  # For large apps, it can help to pull these boxes out separately from the 
  # tabItem function to help make the app easier to read and maintain.
  
  # Box 1 -----------------------------------------------------------------
  box_1 <- box(
    width = 6,
    title = "This is my first box",
    status = "primary",
    solidHeader = TRUE,
    strong("Welcome to my template"),
    br(), br(),
    "Let's do the standard geyser demo",
    br(),
    sliderInput(inputId = ns("bins"),
                label = "Number of bins:",
                min = 1,
                max = 50,
                value = 30))
  # Box 2 -----------------------------------------------------------------
  box_2 <- box(width = 6,
               title = "This is my second box",
               status = "warning",
               solidHeader = TRUE,
               plotOutput(ns("dist_plot")))
  
  # UI - Main Panel - Layout ----------------------------------------------
  
  # This layout becomes a lot cleaner now that the boxes are defined above.
  
  tabItem(
    tabName = "page_1",
    fluidRow(
      width = 12,
      box_1,
      box_2
    )
  )
}

# Server Module -----------------------------------------------------------

m1_server <- function(input, output, session) {
  
  faithful_data <- reactive(
    faithful
  )
  
  output$dist_plot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful_data()[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
  
  return(list(input = input,
              faithful = faithful_data))
  
}
