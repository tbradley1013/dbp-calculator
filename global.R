#===============================================================================
# This is the global script for the DBP calculator application
#
# Tyler Bradley
# 2018-08-18
#===============================================================================

suppressWarnings({
  suppressPackageStartupMessages({
    library(shiny)
    library(shinyjs)
    library(shinyalert)
    library(tidyverse)
    library(shinythemes)
    library(lubridate)
    library(tibbletime)
  })
})

start_period <- floor_date(Sys.Date() %m-% period(12, "months"), "quarter")
end_period <- floor_date(Sys.Date(), "quarter")

headers <- tibbletime::create_series(start_period ~ end_period, "quarter") %>% 
  mutate(
    quarter = quarter(date),
    year = year(date),
    header = paste0("Q", quarter, " ", year),
    header = factor(header, levels = header) %>% fct_rev()
  ) %>% 
  arrange(header) %>% 
  head(4) %>% 
  pull(header) %>% 
  as.character()
