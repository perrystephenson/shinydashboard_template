# Overview ----------------------------------------------------------------

# This file loads the server-side code of each of the modules, and manages the
# transfer of application data between modules.


# Shiny Server ------------------------------------------------------------

function(input, output, session) {
  
  m1_data <- callModule(m1_server, id = "m1")
  m2_data <- callModule(m2_server, id = "m2", 
                        m1_data = m1_data)
  m3_data <- callModule(m3_server, id = "m3", 
                        m1_data = m1_data,
                        m2_data = m2_data)
  
}