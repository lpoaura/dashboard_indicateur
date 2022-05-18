# app.R

library(shiny)

shinyApp(ui = uiGlobal, server = server)

# rm(list = ls())


# numericInput(inputId = "n", 
#              "Sample size", value = 25),
# plotOutput(outputId = "hist"),
# checkboxInput(inputId = "b",
#               label = tags$img(src = "patte.png",
#                                width = "30",
#                                height = "30")),
# checkboxInput(inputId = "b",
#               label = tags$a(href="https://trello.com/b/0u889JNF/ping",
#                              img(src = "patte.png",
#                                  width = "30",
#                                  height = "30"))),
# actionButton("button",
#              tags$a(href="https://trello.com/b/0u889JNF/ping",
#                     img(src = "patte.png",
#                         width = "30",
#                         height = "30"))),
# tags$button(id = "actionButt",
#             class = "btn action-button",
#             tags$img(src = "patte.png"),
#             height = "50px",
#             width = "50px"),
# actionButton(inputId = "test",
#              label = img(src = "patte.png",
#                          width = "30",
#                          height = "30")),
# actionButton(inputId = "testClassic",
#              label = NULL,
#              style = "width: 50px; height: 50px;
#              backgroung-image: url('/www/patte.png');
#              background-size: cover;
#              background-position: center;"),
# actionLink(inputId = "test",
#            label = tags$a(href="https://trello.com/b/0u889JNF/ping",
#                           img(src = "patte.png",
#                               width = "30",
#                               height = "30")))

# output$hist <- renderPlot({
#   hist(rnorm(input$n + 100*as.numeric(input$b)))
# })







