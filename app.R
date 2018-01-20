library(shiny)

shinyApp(
  ui= 
    shinyUI(
      fluidPage(
        theme=shinythemes::shinytheme('cosmo'),
        fluidRow(
          br(),
          column(width=11, offset=1, algin="left",
                 actionButton("my_button", "Start Fake 30 Second Job"),
                 uiOutput("my_output"),
                 br(),
                 HTML('<img src="snake_screen.jpg" height=125>')
                 )#column
          ),#fRow
        conditionalPanel(condition="$('html').hasClass('shiny-busy')",
                         fluidRow(
                           column(width=12,align="center",
                                  HTML(paste0(readLines("www/snake_game.html"),collapse="\n"))
                                  )#column
                           )#fRow
                         )#condPanel
        )#fPage
      ),#shinyUI
  server = 
    shinyServer(function(input, output) {
      output$my_output <- renderUI({
        if(input$my_button != 0) Sys.sleep(30)
        HTML(paste0("<h3>Fake job completed <code>", input$my_button,"</code> times!</h3>"))
        })#my_output
      })#shinyServer
)#shinyApp

