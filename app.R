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
  paste0("/R/accueil/createEnTete.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/accueil/createLeftBandeau.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/global/createEnTete.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/global/createLeftBandeau.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/expert/createEnTete.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/expert/createLeftBandeau.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/admin/createEnTete.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/admin/createLeftBandeau.R") %>%
  source()


# Carte en background
divCarteBack <- div(id = "carteBack",
                   "TEST CARTE")

# Page entière d'accueil
divTotalAccueil <- div(id = "total",
                       divCarteBack,
                       divEnTeteAccueil,
                       divBandeauCarte)

# Page entière globale
divTotalGlobal <- div(id = "total",
                      divCarteBack,
                      divEnTeteGlobal,
                      divBandeauCarte)

# Page entière globale
divTotalExpert <- div(id = "total",
                      divCarteBack,
                      divEnTeteExpert,
                      divBandeauCarte)

# Page entière globale
divTotalAdmin <- div(id = "total",
                      divCarteBack,
                      divEnTeteAdmin,
                      divBandeauCarte)


uiAccueil <- fluidPage(
  
  includeCSS("www/enTeteCSS.css"),
  includeCSS("www/leftBandeauCSS.css"),
  includeCSS("www/generalCSS.css"),
  
  divTotalAccueil
)

uiGlobal <- fluidPage(
  
  includeCSS("www/enTeteCSS.css"),
  includeCSS("www/leftBandeauCSS.css"),
  includeCSS("www/generalCSS.css"),
  
  divTotalGlobal
)

uiExpert <- fluidPage(
  
  includeCSS("www/enTeteCSS.css"),
  includeCSS("www/leftBandeauCSS.css"),
  includeCSS("www/generalCSS.css"),
  
  divTotalExpert
)

uiAdmin <- fluidPage(
  
  includeCSS("www/enTeteCSS.css"),
  includeCSS("www/leftBandeauCSS.css"),
  includeCSS("www/generalCSS.css"),
  
  divTotalAdmin
)


ui <- uiGlobal

server <- function(input, output, session) {
  
  observeEvent(input$accueilButton, {
    print("accueil pressed");
    removeUI(
      selector = '#total'
    )
    insertUI(
      selector = '.container-fluid',
      ui = uiAccueil)
  })
  
  observeEvent(input$globalButton, {
    print("global pressed");
    removeUI(
      selector = '#total'
    )
    insertUI(
      selector = '.container-fluid',
      ui = uiGlobal)
  })
  
  observeEvent(input$expertButton, {
    print("expert pressed");
    removeUI(
      selector = '#total'
    )
    insertUI(
      selector = '.container-fluid',
      ui = uiExpert)
  })
  
  observeEvent(input$adminButton, {
    print("admin pressed");
    removeUI(
      selector = '#total'
    )
    insertUI(
      selector = '.container-fluid',
      ui = uiAdmin)
    
  })
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







