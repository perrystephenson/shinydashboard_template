# Overview ----------------------------------------------------------------

# This file defines the third page of the Demo app, and does the following:
# - Displays data that we've imported from module 1 again, to show you can
#   grab it from anywhere
# - Displays the status of the checkbox from module 2

# This module returns an empty list.

# This module accesses the following object from module 1 via m1_data:
# - The faithful dataset (m1_data$faithful())

# This module accesses the following object from module 2 via m2_data:
# - The checkbox value (m2_data$input$checkbox)

# UI - Tab Bar ------------------------------------------------------------

m3_tab_item <-
  menuItem(
    text = "Module 3",
    tabName = "page_3",
    icon = icon("anchor"),
    badgeLabel = "WIP", 
    badgeColor = "red"
  )


# UI - Main Panel ---------------------------------------------------------

m3_ui <- function(id) {
  
  ns <- NS(id)
  
  # UI - Main Panel - Box Definitions -------------------------------------
  
  box_1 <- box(
    width = 12,
    title = "This is the only box here",
    status = "danger",
    solidHeader = TRUE,
    column(width = 9,
           DTOutput(ns('display_faithful'))),
    column(width = 3,
           "The value of the check box in Module 2 is: ",
           verbatimTextOutput(ns('check_status'))))
  
  # UI - Main Panel - Layout ----------------------------------------------
  
  tabItem(
    tabName = "page_3",
    fluidRow(
      width = 12,
      box_1
    )
  )
}

# Server Module -----------------------------------------------------------

m3_server <- function(input, output, session, m1_data, m2_data) {
  
  output$display_faithful <- renderDT({
    m1_data$faithful()
  })
  
  output$check_status <- renderText({
    m2_data$input$checkbox
  })
  
  return(list())
  
}
