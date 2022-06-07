# Ce fichier crée une fonction qui sera appelée dans le server pour gérer les
# boutons de choix de pôles dans le bandeau de gauche de global et expert

buttonsPolesLeftBandeauFct <- function(input, output, session) {
  observeEvent(input$feuFlore, {
    print("Feu flore pressed");
    var<-as.numeric(input$feuFlore)%%2+as.numeric(input$feuInvertebre)%%2+as.numeric(input$feuVertebre)%%2;
    if(var==3||var==0)
    {
      removeUI(selector = '#feuFlore>img')
      insertUI(selector = '#feuFlore',
               ui = img(src = "Resources/pictogrammes/rond_violet.png",
                        width=15,
                        height=15))
      
      removeUI(selector = '#feuInvertebre>img')
      insertUI(selector = '#feuInvertebre',
               ui = img(src = "Resources/pictogrammes/rond_violet.png",
                        width=15,
                        height=15))
      
      removeUI(selector = '#feuVertebre>img')
      insertUI(selector = '#feuVertebre',
               ui = img(src = "Resources/pictogrammes/rond_violet.png",
                        width=15,
                        height=15))
    }
    else{
      if(as.numeric(input$feuFlore)%%2==1)
      {
        removeUI(selector = '#feuFlore>img')
        insertUI(selector = '#feuFlore',
                 ui = img(src = "Resources/pictogrammes/rond_vert.png",
                          width=15,
                          height=15))
      }
      else{
        removeUI(selector = '#feuFlore>img')
        insertUI(selector = '#feuFlore',
                 ui = img(src = "Resources/pictogrammes/rond_gris.png",
                          width=15,
                          height=15))
      }
      
      if(as.numeric(input$feuInvertebre)%%2==1)
      {
        removeUI(selector = '#feuInvertebre>img')
        insertUI(selector = '#feuInvertebre',
                 ui = img(src = "Resources/pictogrammes/rond_orange.png",
                          width=15,
                          height=15))
      }
      else{
        removeUI(selector = '#feuInvertebre>img')
        insertUI(selector = '#feuInvertebre',
                 ui = img(src = "Resources/pictogrammes/rond_gris.png",
                          width=15,
                          height=15))
      }
      
      if(as.numeric(input$feuVertebre)%%2==1)
      {
        removeUI(selector = '#feuVertebre>img')
        insertUI(selector = '#feuVertebre',
                 ui = img(src = "Resources/pictogrammes/rond_bleu.png",
                          width=15,
                          height=15))
      }
      else{
        removeUI(selector = '#feuVertebre>img')
        insertUI(selector = '#feuVertebre',
                 ui = img(src = "Resources/pictogrammes/rond_gris.png",
                          width=15,
                          height=15))
      }
      
    }
    print(as.numeric(input$feuFlore));
  })
  
  observeEvent(input$feuInvertebre, {
    print("Feu invertebre pressed");
    var<-as.numeric(input$feuFlore)%%2+as.numeric(input$feuInvertebre)%%2+as.numeric(input$feuVertebre)%%2;
    if(var==3||var==0)
    {
      removeUI(selector = '#feuFlore>img')
      insertUI(selector = '#feuFlore',
               ui = img(src = "Resources/pictogrammes/rond_violet.png",
                        width=15,
                        height=15))
      
      removeUI(selector = '#feuInvertebre>img')
      insertUI(selector = '#feuInvertebre',
               ui = img(src = "Resources/pictogrammes/rond_violet.png",
                        width=15,
                        height=15))
      
      removeUI(selector = '#feuVertebre>img')
      insertUI(selector = '#feuVertebre',
               ui = img(src = "Resources/pictogrammes/rond_violet.png",
                        width=15,
                        height=15))
    }
    else{
      if(as.numeric(input$feuFlore)%%2==1)
      {
        removeUI(selector = '#feuFlore>img')
        insertUI(selector = '#feuFlore',
                 ui = img(src = "Resources/pictogrammes/rond_vert.png",
                          width=15,
                          height=15))
      }
      else{
        removeUI(selector = '#feuFlore>img')
        insertUI(selector = '#feuFlore',
                 ui = img(src = "Resources/pictogrammes/rond_gris.png",
                          width=15,
                          height=15))
      }
      
      if(as.numeric(input$feuInvertebre)%%2==1)
      {
        removeUI(selector = '#feuInvertebre>img')
        insertUI(selector = '#feuInvertebre',
                 ui = img(src = "Resources/pictogrammes/rond_orange.png",
                          width=15,
                          height=15))
      }
      else{
        removeUI(selector = '#feuInvertebre>img')
        insertUI(selector = '#feuInvertebre',
                 ui = img(src = "Resources/pictogrammes/rond_gris.png",
                          width=15,
                          height=15))
      }
      
      if(as.numeric(input$feuVertebre)%%2==1)
      {
        removeUI(selector = '#feuVertebre>img')
        insertUI(selector = '#feuVertebre',
                 ui = img(src = "Resources/pictogrammes/rond_bleu.png",
                          width=15,
                          height=15))
      }
      else{
        removeUI(selector = '#feuVertebre>img')
        insertUI(selector = '#feuVertebre',
                 ui = img(src = "Resources/pictogrammes/rond_gris.png",
                          width=15,
                          height=15))
      }
      
    }
    print(as.numeric(input$feuInvertebre));
  })
  
  observeEvent(input$feuVertebre, {
    print("Feu vertebre pressed");
    var<-as.numeric(input$feuFlore)%%2+as.numeric(input$feuInvertebre)%%2+as.numeric(input$feuVertebre)%%2;
    if(var==3||var==0)
    {
      removeUI(selector = '#feuFlore>img')
      insertUI(selector = '#feuFlore',
               ui = img(src = "Resources/pictogrammes/rond_violet.png",
                        width=15,
                        height=15))
      
      removeUI(selector = '#feuInvertebre>img')
      insertUI(selector = '#feuInvertebre',
               ui = img(src = "Resources/pictogrammes/rond_violet.png",
                        width=15,
                        height=15))
      
      removeUI(selector = '#feuVertebre>img')
      insertUI(selector = '#feuVertebre',
               ui = img(src = "Resources/pictogrammes/rond_violet.png",
                        width=15,
                        height=15))
    }
    else{
      if(as.numeric(input$feuFlore)%%2==1)
      {
        removeUI(selector = '#feuFlore>img')
        insertUI(selector = '#feuFlore',
                 ui = img(src = "Resources/pictogrammes/rond_vert.png",
                          width=15,
                          height=15))
      }
      else{
        removeUI(selector = '#feuFlore>img')
        insertUI(selector = '#feuFlore',
                 ui = img(src = "Resources/pictogrammes/rond_gris.png",
                          width=15,
                          height=15))
      }
      
      if(as.numeric(input$feuInvertebre)%%2==1)
      {
        removeUI(selector = '#feuInvertebre>img')
        insertUI(selector = '#feuInvertebre',
                 ui = img(src = "Resources/pictogrammes/rond_orange.png",
                          width=15,
                          height=15))
      }
      else{
        removeUI(selector = '#feuInvertebre>img')
        insertUI(selector = '#feuInvertebre',
                 ui = img(src = "Resources/pictogrammes/rond_gris.png",
                          width=15,
                          height=15))
      }
      
      if(as.numeric(input$feuVertebre)%%2==1)
      {
        removeUI(selector = '#feuVertebre>img')
        insertUI(selector = '#feuVertebre',
                 ui = img(src = "Resources/pictogrammes/rond_bleu.png",
                          width=15,
                          height=15))
      }
      else{
        removeUI(selector = '#feuVertebre>img')
        insertUI(selector = '#feuVertebre',
                 ui = img(src = "Resources/pictogrammes/rond_gris.png",
                          width=15,
                          height=15))
      }
      
    }
    print(as.numeric(input$feuVertebre));
  })
}