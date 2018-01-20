shinyServer(function(input, output) {
  output$my_output <- renderUI({
    #sleep for 30 if button pressed (skip sleep if no presses)
    if(input$my_button != 0) Sys.sleep(30)
    #output button click count
    HTML(paste0("<h3>Fake job completed <code>", input$my_button,"</code> times!</h3>"))
  })#my_output
})#shinyServer