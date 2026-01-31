#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#


# Define UI for application
fluidPage(
    
    # Application title
    titlePanel("Penguins Data"),
    
    # Sidebar for inputs
    sidebarLayout(
        sidebarPanel(
            # Slider for bins
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            
            # Dropdown for variable/column
            selectInput("hist_variable",
                        "Select Variable to Display:",
                        choices = c("bill_length_mm",
                                    "bill_depth_mm",
                                    "flipper_length_mm",
                                    "body_mass_g")),
            # Dropdown for islands
            selectInput("island",
                        "Select an island:",
                        choices = c("All",
                                    islands))
        ),
        
        # Display plots
        mainPanel(
            fluidRow(
                column(width = 8,
                       plotOutput("distPlot")), # Penguins by island
                column(width = 4,
                       plotOutput("barPlot")) # Penguins by species by island
            ),
            fluidRow(
                dataTableOutput("selectedTable")
            )
        )
    )
)
