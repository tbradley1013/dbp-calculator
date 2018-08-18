#===============================================================================
# This is the server script for the DBP calculator app
#
# Tyler Bradley
# 2018-08-18
#===============================================================================

shinyServer(
  function(input, output, session){
    session$onSessionEnded(stopApp)
    
    
  }
)