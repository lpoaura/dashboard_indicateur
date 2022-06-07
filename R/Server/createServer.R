#Ce fichier crée le serveur nécessaire au bon fonctionnement de l'application web.

server <- function(input, output, session) {
  # reactiveValues permettant de se rappeler de la page précédente.
  data_page <- reactiveValues(
    page = "global"
  );
  
  # -------------------- BOUTONS DE NAVIGATION -------------------- #
  # Bouton "Accueil"
  observeEvent(input$accueilButton, {
    print("accueil pressed from");
    print(data_page$page);
    
    # Changement des boutons de navigation
    removeUI(selector = "#passiveButton")
    removeUI(selector = "#divAccueilButton>.btn")
    insertUI(selector = "#divAccueilButton",
               ui = passiveAccueilButton)
    
    if(data_page$page == "global") {
      insertUI(selector = "#divGlobalButton",
               ui = globalButton)
    }
    
    if(data_page$page == "expert") {
      insertUI(selector = "#divExpertButton",
               ui = expertButton)
    }
    
    if(data_page$page == "admin") {
      insertUI(selector = "#divAdminButton",
               ui = adminButton)
    }
    
    # Changement de la page à faire
    if(data_page$page == "global" || data_page$page == "expert") {
      removeUI(selector = "#settings")
      removeUI(selector = "#settingsCollapsed")
    }
    
    removeUI(selector = "#bandeauCarte")
    insertUI(selector = "#corps",
             ui = divBandeauAccueil)
    
    data_page$page <- "accueil";
  })
  
  # Bouton "Global"
  observeEvent(input$globalButton, {
    print("global pressed");
    
    # Changement des boutons de navigation
    removeUI(selector = "#passiveButton")
    removeUI(selector = "#divGlobalButton>.btn")
    insertUI(selector = "#divGlobalButton",
             ui = passiveGlobalButton)
    
    if(data_page$page == "accueil") {
      insertUI(selector = "#divAccueilButton",
               ui = accueilButton)
    }
    
    if(data_page$page == "expert") {
      insertUI(selector = "#divExpertButton",
               ui = expertButton)
    }
    
    if(data_page$page == "admin") {
      insertUI(selector = "#divAdminButton",
               ui = adminButton)
    }
    
    # Changement de la page à faire
    if(data_page$page != "expert") {
      insertUI(selector = '#settingsTotal',
               ui = divSettings)
    }
    
    if(data_page$page == "accueil") {
      removeUI(selector = '#bandeauAccueil')
      insertUI(selector = '#corps',
               ui = divBandeauCarte)
    }
    
    data_page$page <- "global";
  })
  
  # Bouton "Expert"
  observeEvent(input$expertButton, {
    print("expert pressed");
    
    # Changement des boutons de navigation
    removeUI(selector = "#passiveButton")
    removeUI(selector = "#divExpertButton>.btn")
    insertUI(selector = "#divExpertButton",
             ui = passiveExpertButton)
    
    if(data_page$page == "accueil") {
      insertUI(selector = "#divAccueilButton",
               ui = accueilButton)
    }
    
    if(data_page$page == "global") {
      insertUI(selector = "#divGlobalButton",
               ui = globalButton)
    }
    
    if(data_page$page == "admin") {
      insertUI(selector = "#divAdminButton",
               ui = adminButton)
    }
    
    # Changement de la page à faire
    if(data_page$page != "global") {
      insertUI(selector = '#settingsTotal',
               ui = divSettings)
    }

    if(data_page$page == "accueil") {
      removeUI(selector = '#bandeauAccueil')
      insertUI(selector = '#corps',
               ui = divBandeauCarte)
    }
    
    data_page$page <- "expert";
  })
  
  # Bouton "Admin"
  observeEvent(input$adminButton, {
    print("admin pressed");
    
    # Changement des boutons de navigation
    removeUI(selector = "#passiveButton")
    removeUI(selector = "#divAdminButton>.btn")
    insertUI(selector = "#divAdminButton",
             ui = passiveAdminButton)
    
    if(data_page$page == "accueil") {
      insertUI(selector = "#divAccueilButton",
               ui = accueilButton)
    }
    
    if(data_page$page == "global") {
      insertUI(selector = "#divGlobalButton",
               ui = globalButton)
    }
    
    if(data_page$page == "expert") {
      insertUI(selector = "#divExpertButton",
               ui = expertButton)
    }
    
    # Changement de la page à faire
    if(data_page$page == "global" || data_page$page == "expert") {
      removeUI(selector = "#settings")
      removeUI(selector = "#settingsCollapsed")
    }
    
    if(data_page$page == "accueil") {
      removeUI(selector = '#bandeauAccueil')
      insertUI(selector = '#corps',
               ui = divBandeauCarte)
    }
    
    data_page$page <- "admin";
  })
  
  # -------------------- BOUTONS DE COLLAPSE/UNCOLLAPSE -------------------- #
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
  
  # -------------------- BOUTONS DE CHOIX DE CATEGORIE -------------------- #
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
  
  # -------------------- BOUTONS DE CATEGORIE DANS LE BANDEAU -------------------- #
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