# Overview ----------------------------------------------------------------

# This file defines the overall user interface. No computation is done here,
# it should basically be a giant nested function call which declares how you
# want the user interface to look.


# Page --------------------------------------------------------------------

dashboardPage(
  title = "Shinydashboard Demo",
  skin = "blue",
  header = dashboardHeader(title = "Shinydashboard Demo"),
  
  # Sidebar -----------------------------------------------------------------
  
  #' Note: to find new icons for your apps, go to 
  #' https://fontawesome.com/icons?d=gallery

  sidebar = dashboardSidebar(collapsed = F,
                             sidebarMenu(
                               id = "tabs",
                               # Tab bar definition for page 1
                               menuItem(
                                 text = "Page 1",
                                 tabName = "page_1",
                                 icon = icon("database")),
                               # Tab bar definition for page 2
                               menuItem(
                                 text = "Page 2",
                                 tabName = "page_2",
                                 icon = icon("ambulance")),
                               # Tab bar definition for page 3
                               menuItem(
                                 text = "Page 3",
                                 tabName = "page_3",
                                 icon = icon("anchor"),
                                 badgeLabel = "NEW", 
                                 badgeColor = "green")
                             )),
  
  # Body --------------------------------------------------------------------
  
  body = dashboardBody(
    tabItems(
      
      # UI Definition for Page 1
      tabItem(
        tabName = "page_1",
        fluidRow(
          width = 12,
          box(
            width = 6,
            title = "This is my first box",
            status = "primary",
            solidHeader = TRUE,
            strong("Welcome to my template"),
            br(), br(),
            "Let's do the standard geyser demo",
            br(),
            sliderInput(inputId = "bins",
                        label = "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)),
          box(width = 6,
              title = "This is my second box",
              status = "warning",
              solidHeader = TRUE,
              plotOutput("dist_plot")))),
      
      # UI Definition for Page 2
      tabItem(
        tabName = "page_2",
        "You can put anything you like here"
      ),
      
      # UI Definition for Page 3
      tabItem(
        tabName = "page_3",
        "You can put anything you like here"
      )
    ))
)