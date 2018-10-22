# Overview ----------------------------------------------------------------

# This file defines the overall user interface (using the shinydashboard
# package) and loads each of the module UI components.


# Page --------------------------------------------------------------------

dashboardPage(
  title = "Template with Modules",
  skin = "yellow",
  header = dashboardHeader(title = "Template with Modules"),
  
  # Sidebar -----------------------------------------------------------------
  
  sidebar = dashboardSidebar(collapsed = F,
                             sidebarMenu(
                               id = "tabs",
                               m1_tab_item,
                               m2_tab_item,
                               m3_tab_item
                             )),
  
  # Body --------------------------------------------------------------------
  
  body = dashboardBody(
    tabItems(
      m1_ui(id = "m1"),
      m2_ui(id = "m2"),
      m3_ui(id = "m3")
    ))
)