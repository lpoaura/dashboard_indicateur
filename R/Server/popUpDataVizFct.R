# Ce fichier crée une fonction qui sera appelée dans le server pour gérer l'affichage
# d'un pop up de visualisation lorsqu'un data viz sera survolé

popUpDataVizFct <- function(input, output, session) {
  
  observeEvent(input$idDataViz,{
    
    # Par défaut, on est en mode "reset" : il n'y a pas de pop up.
    removeUI(selector = "#popUpDataViz >div")
    removeUI(selector = "#popUpDataViz")
    
    # Si le pop up apparaît ou est toujours en train d'apparaître, on insére les bons
    # data viz correspondant au data viz survolé.
    
    # ATTENTION : l'insertion du data Viz doit se faire avec un output qui n'est déjà
    # plot autre part. Il faut donc doubler chaque plot pour en avoir un qui s'affiche
    # dans la barre de gauche et un qui s'affiche dans la pop up lorsque le premier est
    # survolé.
    if(input$idDataViz!="reset"){
      insertUI(selector = "#bandeau", ui = divPopUpDataViz)
      
      if(input$idDataViz=="histogramme"){
        insertUI(selector = "#popUpDataViz", ui = div(id = "graphCopy",
                                                      div(id = "buttonCloseDiv",
                                                          tags$p(id = "titrePopup",
                                                                 histoPlot[[3]]),
                                                          actionButton(inputId = "closePopupButton",
                                                                       icon("window-close"))),
                                                      plotlyOutput('histCopy')));
      }
      else if (input$idDataViz=="pie1"){
        insertUI(selector = "#popUpDataViz", ui = div(id = "graphCopy",
                                                      div(id = "buttonCloseDiv",
                                                          tags$p(id = "titrePopup",
                                                                 piePlot[[4]]),
                                                          actionButton(inputId = "closePopupButton",
                                                                       icon("window-close"))),
                                                      plotlyOutput('pie1Copy')));
      }
      else if (input$idDataViz=="pie2"){
        insertUI(selector = "#popUpDataViz", ui =div(id = "graphCopy",
                                                     div(id = "buttonCloseDiv",
                                                         tags$p(id = "titrePopup",
                                                                piePlot[[5]]),
                                                         actionButton(inputId = "closePopupButton",
                                                                      icon("window-close"))),
                                                     plotlyOutput('pie2Copy')));
      }
      else if (input$idDataViz=="bar"){
        insertUI(selector = "#popUpDataViz", ui = div(id = "graphCopy",
                                                      div(id = "buttonCloseDiv",
                                                          tags$p(id = "titrePopup",
                                                                 barPlot[[3]]),
                                                          actionButton(inputId = "closePopupButton",
                                                                       icon("window-close"))),
                                                      plotlyOutput('barCopy')));
      }
      else if (input$idDataViz=="graphFournProd1"){
        insertUI(selector = "#popUpDataViz", ui = div(id = "graphCopy",
                                                      div(id = "buttonCloseDiv",
                                                          tags$p(id = "titrePopup",
                                                                 dataFournProd[[4]]),
                                                          actionButton(inputId = "closePopupButton",
                                                                       icon("window-close"))),
                                                      plotlyOutput('graphFournProd1Copy')));
      }
      else if (input$idDataViz=="graphFournProd2"){
        insertUI(selector = "#popUpDataViz", ui = div(id = "graphCopy",
                                                      div(id = "buttonCloseDiv",
                                                          tags$p(id = "titrePopup",
                                                                 dataFournProd[[5]]),
                                                          actionButton(inputId = "closePopupButton",
                                                                       icon("window-close"))),
                                                      plotlyOutput('graphFournProd2Copy')));
      }
    }
  });
  
  observeEvent(input$closePopupButton, {
    removeUI(selector = "#popUpDataViz >div")
    removeUI(selector = "#popUpDataViz")
  });
}