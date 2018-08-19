#===============================================================================
# This is the ui script for DBP calculator application
#
# Tyler Bradley
# 2018-08-18
#===============================================================================

shinyUI(
  tagList(
    useShinyjs(),
    useShinyalert(),
    navbarPage(
      title = "DBP Calculator",
      theme = shinytheme("cerulean"),
      tabPanel(
        # shinythemes::themeSelector(),
        title = "Input Data",
        fluidRow(
          column(
            4
          ),
          column(
            4,
            wellPanel(
              HTML("<center>"),
              selectInput(
                inputId = "input_parameter",
                label = "Select Parameter",
                choices = list(
                  "Total THMs" = "thms",
                  "5 Haloacetic acids" = "haa5"
                ),
                selected = "thms"
              ),
              HTML("</center>")
            )
          ),
          column(4)
          
        ),
        fluidRow(
          column(
            3, 
            wellPanel(
              HTML("<center>"),
              h3(headers[[1]]),
              HTML("</center>"),
              numericInput(
                inputId = "num_samples_1",
                label = "Number of samples this quarter",
                value = 1, 
                min = 1, 
                step = 1
              ),
              uiOutput("render_sample_input_1")
            )
          ),
          column(
            3,
            wellPanel(
              HTML("<center>"),
              h3(headers[[2]]),
              HTML("</center>"),
              numericInput(
                inputId = "num_samples_2",
                label = "Number of samples this quarter",
                value = 1, 
                min = 1, 
                step = 1
              ),
              uiOutput("render_sample_input_2")
            )
          ),
          column(
            3, 
            wellPanel(
              HTML("<center>"),
              h3(headers[[3]]),
              HTML("</center>"),
              numericInput(
                inputId = "num_samples_3",
                label = "Number of samples this quarter",
                value = 1, 
                min = 1, 
                step = 1
              ),
              uiOutput("render_sample_input_3")
            )
          ),
          column(
            3,
            wellPanel(
              HTML("<center>"),
              h3(headers[[4]]),
              HTML("</center>"),
              numericInput(
                inputId = "num_samples_4",
                label = "Number of samples this quarter",
                value = 1,
                min = 1, 
                step = 1
              ),
              uiOutput("render_sample_input_4")
            )
          )
        ),
        div(
          fluidRow(
            uiOutput("render_oel_ui")
          ),
          fluidRow(
            uiOutput("render_lraa_ui")
          ),
          style = "margin-bottom:50px;"
        )
        
      )
    )
  )
)