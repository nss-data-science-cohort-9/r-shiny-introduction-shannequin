#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application
fluidPage(

    # Application title
    titlePanel("Burglaries 2023 Data"),

    # Sidebar for inputs
    sidebarLayout(
        sidebarPanel(
            # Slider for number of histogram bins
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            
            # Dropdown for month
            selectInput("incident_occurred_month",
                        "Select month of incident occurring:",
                        choices = c("All", levels(month_list)))
        ),

        # Display output
        mainPanel(
            plotOutput("distPlot"),
            plotOutput("barPlot"),
            dataTableOutput("selectedTable")
        )
    )
)
