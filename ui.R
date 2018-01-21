# devtools::install_github("AdamSpannbauer/snakeLoadR")

library(shiny)
library(snakeLoadR)

shinyUI(
  fluidPage(
    theme=shinythemes::shinytheme('cosmo'),
    fluidRow(
      br(),
      column(width=10, offset=1, algin="left",
             #button to start fake job (job is sleeping in this app)
             actionButton("my_button", "Start Fake 30 Second Job"),
             #output text showing fake job run count
             uiOutput("my_output"),
             br(),
             #start screen of oldschool snake game
             HTML('<p align="center"><img src="snake_screen.jpg"></p>')
      )#column
    ),#fRow
    #snake game to appear while 'my_output' is recalculating
    snakeLoadR::snake_loader(outputId = "my_output", 
                             header = "Play Snake while you wait!", 
                             controls = TRUE)
  )#fPage
)#shinyUI
