#Ce fichier crée le serveur nécessaire au bon fonctionnement de l'application web.


server <- function(input, output, session) {
  
  observeEvent(input$accueilButton, {
    print("accueil pressed");
    
    # Changement des boutons de navigation
    removeUI(selector = "#divAccueilButton>.btn")
    insertUI(selector = "#divAccueilButton",
             ui = passiveAccueilButton)
    
    removeUI(selector = "#divGlobalButton>.btn")
    insertUI(selector = "#divGlobalButton",
             ui = globalButton)
    
    removeUI(selector = "#divExpertButton>.btn")
    insertUI(selector = "#divExpertButton",
             ui = expertButton)
    
    removeUI(selector = "#divAdminButton>.btn")
    insertUI(selector = "#divAdminButton",
             ui = adminButton)
    
    
    # Changement de la page à faire
    removeUI(selector = "#settings")
    removeUI(selector = "#settingsCollapsed")
    
    removeUI(selector = "#bandeauCarte")
    insertUI(selector = "#total",
             ui = divBandeauCarte)
  })
  
  observeEvent(input$globalButton, {
    print("global pressed");
    
    # Changement des boutons de navigation
    removeUI(selector = "#divAccueilButton>.btn")
    insertUI(selector = "#divAccueilButton",
             ui = accueilButton)
    
    removeUI(selector = "#divGlobalButton>.btn")
    insertUI(selector = "#divGlobalButton",
             ui = passiveGlobalButton)
    
    removeUI(selector = "#divExpertButton>.btn")
    insertUI(selector = "#divExpertButton",
             ui = expertButton)
    
    removeUI(selector = "#divAdminButton>.btn")
    insertUI(selector = "#divAdminButton",
             ui = adminButton)
    
    
    # Changement de la page à faire
    if(as.numeric(input$expertButton) == 0) {
      # removeUI(selector = "#settings")
      # removeUI(selector = "#settingsCollapsed")
      insertUI(selector = '#settingsTotal',
               ui = divSettings)
    }
    
    removeUI(selector = '#bandeauCarte')
    insertUI(selector = '#total',
             ui = divBandeauCarte)
  })
  
  observeEvent(input$expertButton, {
    print("expert pressed");
    
    # Changement des boutons de navigation
    removeUI(selector = "#divAccueilButton>.btn")
    insertUI(selector = "#divAccueilButton",
             ui = accueilButton)
    
    removeUI(selector = "#divGlobalButton>.btn")
    insertUI(selector = "#divGlobalButton",
             ui = globalButton)
    
    removeUI(selector = "#divExpertButton>.btn")
    insertUI(selector = "#divExpertButton",
             ui = passiveExpertButton)
    
    removeUI(selector = "#divAdminButton>.btn")
    insertUI(selector = "#divAdminButton",
             ui = adminButton)
    
    
    # Changement de la page à faire
    if(as.numeric(input$globalButton) == 0) {
      # removeUI(selector = "#settings")
      # removeUI(selector = "#settingsCollapsed")
      
      insertUI(selector = '#settingsTotal',
               ui = divSettings)
    }
    
    removeUI(selector = '#bandeauCarte')
    insertUI(selector = '#total',
             ui = divBandeauCarte)
  })
  
  observeEvent(input$adminButton, {
    print("admin pressed");
    
    # Changement des boutons de navigation
    removeUI(selector = "#divAccueilButton>.btn")
    insertUI(selector = "#divAccueilButton",
             ui = accueilButton)
    
    removeUI(selector = "#divGlobalButton>.btn")
    insertUI(selector = "#divGlobalButton",
             ui = globalButton)
    
    removeUI(selector = "#divExpertButton>.btn")
    insertUI(selector = "#divExpertButton",
             ui = expertButton)
    
    removeUI(selector = "#divAdminButton>.btn")
    insertUI(selector = "#divAdminButton",
             ui = passiveAdminButton)
    
    
    # Changement de la page à faire
    removeUI(selector = "#settings")
    removeUI(selector = "#settingsCollapsed")
    
    removeUI(selector = '#bandeauCarte')
    insertUI(selector = '#total',
             ui = divBandeauCarte)
  })
  
  observeEvent(input$collapaseSettingsButton, {
    print("collapseButton settings pressed");
    removeUI(selector = '#settings')
    insertUI(selector = '#settingsTotal',
             ui = divSettingsCollapsed)
  })
  
  observeEvent(input$uncollapaseSettingsButton, {
    print("uncollapseButton settings pressed");
    removeUI(selector = '#settingsCollapsed')
    insertUI(selector = '#settingsTotal',
             ui = divSettings)
  })
  
  observeEvent(input$collapaseBandeauButton, {
    print("collapseButton bandeau pressed");
    removeUI(selector = '#bandeau')
    insertUI(selector = '#bandeauTotal',
             ui = divBandeauCollapsed)
  })
  
  observeEvent(input$uncollapaseBandeauButton, {
    print("uncollapseButton bandeau pressed");
    removeUI(selector = '#bandeauCollapsed')
    insertUI(selector = '#bandeauTotal',
             ui = divBandeau)
  })
  
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