# Overview ----------------------------------------------------------------

# This file defines the second page of the Demo app, and does the following:
# - Displays data that we've imported from module 1, to demonstrate how to
#   pass reactive datasets between modules
# - Allows the user to check a checkbox so that we can pass it to module 3

# This module returns one reactive object in a list:
# - The input object, which gives access to the UI input widget values

# This module accesses the following objects from module 1 via m1_data:
# - The faithful dataset (m1_data$faithful())
# - The inputSlider value (m1_data$input$bins)

# UI - Tab Bar ------------------------------------------------------------

m2_tab_item <-
  menuItem(
    text = "Module 2",
    tabName = "page_2",
    icon = icon("ambulance")
  )


# UI - Main Panel ---------------------------------------------------------

m2_ui <- function(id) {
  
  ns <- NS(id)
  
  # UI - Main Panel - Box Definitions -------------------------------------
  
  box_1 <- box(
    width = 12,
    title = "This is the only box here",
    status = "warning",
    solidHeader = TRUE,
    column(width = 9,
           DTOutput(ns('display_faithful'))),
    column(width = 3,
           "The input slider from module 1 is set to: ",
           verbatimTextOutput(ns('slider_output')),
           br(),
           checkboxInput(inputId = ns('checkbox'),
                         label = "This is a checkbox:")))
  
  # UI - Main Panel - Layout ----------------------------------------------
  
  tabItem(
    tabName = "page_2",
    fluidRow(
      width = 12,
      box_1
    )
  )
}

# Server Module -----------------------------------------------------------

m2_server <- function(input, output, session, m1_data) {
  
  output$display_faithful <- renderDT({
    # You can execute any R code you like here to create this data table.
    # For this demo I'll just grab it from module 1 to show it can be done.
    m1_data$faithful()
  })
  
  output$slider_output <- renderText({
    m1_data$input$bins
  })
  
  return(list(input = input))
  
}
