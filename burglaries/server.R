#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {
    
    output$distPlot <- renderPlot({
        
        if(input$incident_occurred_month != "All"){
            census_burglaries |> 
                filter(month(incident_occurred, label = TRUE, abbr = FALSE) == input$incident_occurred_month) |> 
                distinct(incident_number, .keep_all = TRUE) |> 
                ggplot(aes(y = incident_occurred)) +
                geom_histogram(bins = input$bins)
        } else{
            census_burglaries |> 
                distinct(incident_number, .keep_all = TRUE) |> 
                ggplot(aes(y = incident_occurred)) +
                geom_histogram(bins = input$bins)
        }
    })
    
    output$barPlot <- renderPlot({
        
        census_burglaries |> 
            distinct(incident_number, .keep_all = TRUE) |> 
            ggplot(aes(y = TRACTCE)) +
            geom_bar()
    })
    
    output$selectedTable <- renderDataTable({
        
        census_burglaries
    })
}
