# app.R

pkgs <-  c("RPostgreSQL", "DBI","dplyr","tidyverse","lubridate","stringr", "ggplot2","RColorBrewer", "plotly","sf")

# on test si les librairies sont installees sur l'environnement, si c'est pas le cas on les installes
if (length(setdiff(pkgs, rownames(installed.packages()))) > 0) {
  # installation des packages
  install.packages(setdiff(pkgs, rownames(installed.packages())))
}
# chargement des librairies (necessite qu'elles soient installees)
lapply(pkgs, library, character.only = TRUE)
rm(pkgs)


library(shiny)
library(shinydashboard)



getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/createEnTete.R") %>%
  source() 

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/createLeftBandeau.R") %>%
  source() 


# Carte en background
divCarteBack <- div(id = "carteBack",
                   "TEST CARTE")

# Page entière
divTotal <- div(id = "total",
               divCarteBack,
               divEnTete,
               divBandeauCarte)

# Page entière
divTotalAccueil <- div(id = "total",
                       divCarteBack,
                       divEnTeteAccueil,
                       divBandeauCarte)

ui <- fluidPage(
  
  includeCSS("www/enTeteCSS.css"),
  includeCSS("www/leftBandeauCSS.css"),
  includeCSS("www/generalCSS.css"),
  
  # numericInput(inputId = "compteur", label =  "compteur", value = 2),
  
  # if (input$compteur == 1) {
  #   divTotalAccueil
  # } else if (input$compteur == 2) {
  #   divTotal
  # }
  divTotal
  
)


server <- function(input, output, session) {
  
  # counter <- reactiveValues(countervalue = 2)
  # 
  # observeEvent(input$accueilBouton, {
  #   counter$countervalue <- 1
  #   updateNumericInput(session = session, inputId = "compteur", label = "compteur", value = 1)
  # })
  # 
  # observeEvent(input$globalBouton, {
  #   counter$countervalue <- 2
  #   updateNumericInput(session = session, inputId = "compteur", label = "compteur", value = 2)
  # })
}


shinyApp(ui = ui, server = server)

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







