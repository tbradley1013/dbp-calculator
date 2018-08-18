#===============================================================================
# This is the server script for the DBP calculator app
#
# Tyler Bradley
# 2018-08-18
#===============================================================================

shinyServer(
  function(input, output, session){
    session$onSessionEnded(stopApp)
    
    # Input data tab
    #--------------------
    
    output$render_sample_input_1 <- renderUI({
      output <- map(1:input$num_samples_1, ~{
        tagList(
          numericInput(
            inputId = paste("sample_value_1_", .x),
            label = paste("Sample", .x, "value:"),
            value = NULL,
            min = 0
          ),
          br()
        )
      })
      
      tagList(output)
    })
    
    output$render_sample_input_2 <- renderUI({
      output <- map(1:input$num_samples_2, ~{
        tagList(
          numericInput(
            inputId = paste("sample_value_2_", .x),
            label = paste("Sample", .x, "value:"),
            value = NULL,
            min = 0
          ),
          br()
        )
      })
      
      tagList(output)
    })
    
    output$render_sample_input_3 <- renderUI({
      output <- map(1:input$num_samples_3, ~{
        tagList(
          numericInput(
            inputId = paste("sample_value_3_", .x),
            label = paste("Sample", .x, "value:"),
            value = NULL,
            min = 0
          ),
          br()
        )
      })
      
      tagList(output)
    })
    
    output$render_sample_input_4 <- renderUI({
      output <- map(1:input$num_samples_4, ~{
        tagList(
          numericInput(
            inputId = paste("sample_value_4_", .x),
            label = paste("Sample", .x, "value:"),
            value = NULL,
            min = 0
          ),
          br()
        )
      })
      
      tagList(output)
    })
  }
)