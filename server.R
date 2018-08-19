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
            inputId = paste0("sample_value_1_", .x),
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
            inputId = paste0("sample_value_2_", .x),
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
            inputId = paste0("sample_value_3_", .x),
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
            inputId = paste0("sample_value_4_", .x),
            label = paste("Sample", .x, "value:"),
            value = NULL,
            min = 0
          ),
          br()
        )
      })
      
      tagList(output)
    })
    
    quarterly_values <- reactive({
      # walk(1:input$num_samples_1, ~{
      #   input_id <- paste0("sample_value_1_", .x)
      #   req(input[[input_id]])
      # })
      
      current_q <- map_dbl(1:input$num_samples_1, ~{
        input_id <- paste0("sample_value_1_", .x)
        return(input[[input_id]])
      }) %>% 
        mean(na.rm = TRUE)
      
      q_lag_1 <- map_dbl(1:input$num_samples_2, ~{
        input_id <- paste0("sample_value_2_", .x)
        return(input[[input_id]])
      }) %>% 
        mean(na.rm = TRUE)
      
      q_lag_2 <- map_dbl(1:input$num_samples_3, ~{
        input_id <- paste0("sample_value_3_", .x)
        return(input[[input_id]])
      }) %>% 
        mean(na.rm = TRUE)
      
      q_lag_3 <- map_dbl(1:input$num_samples_4, ~{
        input_id <- paste0("sample_value_4_", .x)
        return(input[[input_id]])
      }) %>% 
        mean(na.rm = TRUE)
      
      output <- list(
        current_q = current_q,
        q_lag_1 = q_lag_1,
        q_lag_2 = q_lag_2,
        q_lag_3 = q_lag_3
      )
      
      return(output)
    })
    
    
    input_oel <- reactive({
      # browser()
      req(
        quarterly_values()$current_q, 
        quarterly_values()$q_lag_1,
        quarterly_values()$q_lag_2
      )
      
      oel <- round(sum(quarterly_values()$current_q * 2, quarterly_values()$q_lag_1,
                 quarterly_values()$q_lag_2)/4, 2)
      
      return(oel)
     
    })
    
    input_lraa <- reactive({
      req(
        quarterly_values()$current_q, 
        quarterly_values()$q_lag_1,
        quarterly_values()$q_lag_2,
        quarterly_values()$q_lag_3
      )
      
      lraa <- mean(c(quarterly_values()$current_q, quarterly_values()$q_lag_1,
                   quarterly_values()$q_lag_2, quarterly_values()$q_lag_3)) %>% 
        round(2)
      
      return(lraa)
    })
    
    output$render_oel_ui <- renderUI({
      req(input_oel())
      
      style <- case_when(
        input$input_parameter == "thms" & input_oel() >= 80 ~ "color:red;",
        input$input_parameter == "thms" & input_oel() >= 60 ~ "color:orange;",
        input$input_parameter == "haa5" & input_oel() >= 60 ~ "color:red;",
        input$input_parameter == "haa5" & input_oel() >= 45 ~ "color:orange;"
      )
      
      section_title <- paste(
        "OEL for", 
        if_else(input$input_parameter == "thms", "Total THMs", "5 Haloacetic acids"),
        "for", headers[[1]]
      )
      
      tagList(
        HTML("<center>"),
        h3(section_title),
        # br(),
        h2(input_oel(), paste0(intToUtf8(181), "g/L"), style = style),
        HTML("</center>")
      )
      
      
    })
    
    output$render_lraa_ui <- renderUI({
      req(input_lraa())
      
      style <- case_when(
        input$input_parameter == "thms" & input_lraa() >= 80 ~ "color:red;",
        input$input_parameter == "thms" & input_lraa() >= 60 ~ "color:orange;",
        input$input_parameter == "haa5" & input_lraa() >= 60 ~ "color:red;",
        input$input_parameter == "haa5" & input_lraa() >= 45 ~ "color:orange;"
      )
      
      section_title <- paste(
        "LRAA for", 
        if_else(input$input_parameter == "thms", "Total THMs", "5 Haloacetic acids"),
        "for", headers[[1]]
      )
      
      tagList(
        HTML("<center>"),
        h3(section_title),
        # br(),
        h2(input_lraa(), paste0(intToUtf8(181), "g/L"), style = style),
        HTML("</center>")
      )
      
      
    })
  }
)