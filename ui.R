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
      theme = shinytheme("united"),
      tabPanel(
        title = "Input Data",
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
        )
      )
    )
  )
)