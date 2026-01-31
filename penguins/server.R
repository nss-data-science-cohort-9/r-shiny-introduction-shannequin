#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#


# Define server logic required to draw a histogram
function(input, output, session) {
    
    # Histogram based on island
    output$distPlot <- renderPlot({

        if(input$island != "All"){
            # Plot for specified island
            selected_data <- penguins |> 
                filter(island == input$island)
            
            title <- glue("Distribution of {input$hist_variable} for {input$island} Island")
        } else{
            # Plot for all islands
            selected_data <- penguins
            
            title <- glue("Distribution of {input$hist_variable} for All Islands")
        }
        
        selected_data |> 
            ggplot(aes(x = .data[[input$hist_variable]])) +
            geom_histogram(bins = input$bins) +
            labs(title = title)
    })
 
    # Bar plot based on species and island
    output$barPlot <- renderPlot({
        
        if(input$island != "All"){
            # Plot for specified island
            selected_data <- penguins |> 
                filter(island == input$island)
            
            title = glue("Distribution of Species for {input$island} Island")
            
        } else{
            # Plot for all islands
            selected_data <- penguins
            
            title = glue("Distribution of Species for All Islands")
        }
        
        selected_data |> 
            ggplot(aes(x = species)) +
            geom_bar() +
            labs(title = title)
    })

    # Table based on selected input    
    output$selectedTable <- renderDataTable({

        if(input$island != "All"){
            selected_data <- penguins |> 
                filter(island == input$island)
        } else{
            selected_data <- penguins
        }
        
        selected_data
    })
}
