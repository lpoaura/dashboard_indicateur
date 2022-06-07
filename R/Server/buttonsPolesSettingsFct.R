# Ce fichier crée une fonction qui sera appelée dans le server pour gérer les
# boutons de choix de pôles dans le bandeau de settings

buttonsPolesSettingsFct <- function(input, output, session) {
  observeEvent(input$actionButtonFlower, {
    print("Flower button pressed");
    var<-as.numeric(input$actionButtonFlower)%%2+as.numeric(input$actionButtonBee)%%2+as.numeric(input$actionButtonPaw)%%2;
    if(var==3||var==0)
    {
      removeUI(selector = '#actionButtonFlower>img')
      insertUI(selector = '#actionButtonFlower',
               ui = img(src = "Resources/pictogrammes/fleur_violet.png",
                        width=50,
                        height=50))
      
      removeUI(selector = '#actionButtonBee>img')
      insertUI(selector = '#actionButtonBee',
               ui = img(src = "Resources/pictogrammes/abeille_violet.png",
                        width=50,
                        height=50))
      
      removeUI(selector = '#actionButtonPaw>img')
      insertUI(selector = '#actionButtonPaw',
               ui = img(src = "Resources/pictogrammes/patte_violet.png",
                        width=50,
                        height=50))
    }
    else{
      if(as.numeric(input$actionButtonFlower)%%2==1)
      {
        removeUI(selector = '#actionButtonFlower>img')
        insertUI(selector = '#actionButtonFlower',
                 ui = img(src = "Resources/pictogrammes/fleur.png",
                          width=50,
                          height=50))
      }
      else{
        removeUI(selector = '#actionButtonFlower>img')
        insertUI(selector = '#actionButtonFlower',
                 ui = img(src = "Resources/pictogrammes/fleur_gris.png",
                          width=50,
                          height=50))
      }
      
      if(as.numeric(input$actionButtonBee)%%2==1)
      {
        removeUI(selector = '#actionButtonBee>img')
        insertUI(selector = '#actionButtonBee',
                 ui = img(src = "Resources/pictogrammes/abeille.png",
                          width=50,
                          height=50))
      }
      else{
        removeUI(selector = '#actionButtonBee>img')
        insertUI(selector = '#actionButtonBee',
                 ui = img(src = "Resources/pictogrammes/abeille_gris.png",
                          width=50,
                          height=50))
      }
      
      if(as.numeric(input$actionButtonPaw)%%2==1)
      {
        removeUI(selector = '#actionButtonPaw>img')
        insertUI(selector = '#actionButtonPaw',
                 ui = img(src = "Resources/pictogrammes/patte.png",
                          width=50,
                          height=50))
      }
      else{
        removeUI(selector = '#actionButtonPaw>img')
        insertUI(selector = '#actionButtonPaw',
                 ui = img(src = "Resources/pictogrammes/patte_gris.png",
                          width=50,
                          height=50))
      }
      
    }
    print(as.numeric(input$actionButtonFlower));
  })
  
  observeEvent(input$actionButtonBee, {
    print("Bee button pressed");
    var<-as.numeric(input$actionButtonFlower)%%2+as.numeric(input$actionButtonBee)%%2+as.numeric(input$actionButtonPaw)%%2;
    if(var==3||var==0)
    {
      removeUI(selector = '#actionButtonFlower>img')
      insertUI(selector = '#actionButtonFlower',
               ui = img(src = "Resources/pictogrammes/fleur_violet.png",
                        width=50,
                        height=50))
      
      removeUI(selector = '#actionButtonBee>img')
      insertUI(selector = '#actionButtonBee',
               ui = img(src = "Resources/pictogrammes/abeille_violet.png",
                        width=50,
                        height=50))
      
      removeUI(selector = '#actionButtonPaw>img')
      insertUI(selector = '#actionButtonPaw',
               ui = img(src = "Resources/pictogrammes/patte_violet.png",
                        width=50,
                        height=50))
    }
    else{
      if(as.numeric(input$actionButtonFlower)%%2==1)
      {
        removeUI(selector = '#actionButtonFlower>img')
        insertUI(selector = '#actionButtonFlower',
                 ui = img(src = "Resources/pictogrammes/fleur.png",
                          width=50,
                          height=50))
      }
      else{
        removeUI(selector = '#actionButtonFlower>img')
        insertUI(selector = '#actionButtonFlower',
                 ui = img(src = "Resources/pictogrammes/fleur_gris.png",
                          width=50,
                          height=50))
      }
      
      if(as.numeric(input$actionButtonBee)%%2==1)
      {
        removeUI(selector = '#actionButtonBee>img')
        insertUI(selector = '#actionButtonBee',
                 ui = img(src = "Resources/pictogrammes/abeille.png",
                          width=50,
                          height=50))
      }
      else{
        removeUI(selector = '#actionButtonBee>img')
        insertUI(selector = '#actionButtonBee',
                 ui = img(src = "Resources/pictogrammes/abeille_gris.png",
                          width=50,
                          height=50))
      }
      
      if(as.numeric(input$actionButtonPaw)%%2==1)
      {
        removeUI(selector = '#actionButtonPaw>img')
        insertUI(selector = '#actionButtonPaw',
                 ui = img(src = "Resources/pictogrammes/patte.png",
                          width=50,
                          height=50))
      }
      else{
        removeUI(selector = '#actionButtonPaw>img')
        insertUI(selector = '#actionButtonPaw',
                 ui = img(src = "Resources/pictogrammes/patte_gris.png",
                          width=50,
                          height=50))
      }
    }
    print(as.numeric(input$actionButtonBee));
  })
  
  observeEvent(input$actionButtonPaw, {
    print("Bee button pressed");
    var<-as.numeric(input$actionButtonFlower)%%2+as.numeric(input$actionButtonBee)%%2+as.numeric(input$actionButtonPaw)%%2;
    if(var==3||var==0)
    {
      removeUI(selector = '#actionButtonFlower>img')
      insertUI(selector = '#actionButtonFlower',
               ui = img(src = "Resources/pictogrammes/fleur_violet.png",
                        width=50,
                        height=50))
      
      removeUI(selector = '#actionButtonBee>img')
      insertUI(selector = '#actionButtonBee',
               ui = img(src = "Resources/pictogrammes/abeille_violet.png",
                        width=50,
                        height=50))
      
      removeUI(selector = '#actionButtonPaw>img')
      insertUI(selector = '#actionButtonPaw',
               ui = img(src = "Resources/pictogrammes/patte_violet.png",
                        width=50,
                        height=50))
    }
    else{
      if(as.numeric(input$actionButtonFlower)%%2==1)
      {
        removeUI(selector = '#actionButtonFlower>img')
        insertUI(selector = '#actionButtonFlower',
                 ui = img(src = "Resources/pictogrammes/fleur.png",
                          width=50,
                          height=50))
      }
      else{
        removeUI(selector = '#actionButtonFlower>img')
        insertUI(selector = '#actionButtonFlower',
                 ui = img(src = "Resources/pictogrammes/fleur_gris.png",
                          width=50,
                          height=50))
      }
      
      if(as.numeric(input$actionButtonBee)%%2==1)
      {
        removeUI(selector = '#actionButtonBee>img')
        insertUI(selector = '#actionButtonBee',
                 ui = img(src = "Resources/pictogrammes/abeille.png",
                          width=50,
                          height=50))
      }
      else{
        removeUI(selector = '#actionButtonBee>img')
        insertUI(selector = '#actionButtonBee',
                 ui = img(src = "Resources/pictogrammes/abeille_gris.png",
                          width=50,
                          height=50))
      }
      
      if(as.numeric(input$actionButtonPaw)%%2==1)
      {
        removeUI(selector = '#actionButtonPaw>img')
        insertUI(selector = '#actionButtonPaw',
                 ui = img(src = "Resources/pictogrammes/patte.png",
                          width=50,
                          height=50))
      }
      else{
        removeUI(selector = '#actionButtonPaw>img')
        insertUI(selector = '#actionButtonPaw',
                 ui = img(src = "Resources/pictogrammes/patte_gris.png",
                          width=50,
                          height=50))
      }
    }
    print(as.numeric(input$actionButtonPaw));
  })
}