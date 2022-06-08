# Ce fichier crée une fonction qui sera appelée dans le server pour gérer les
# boutons de navigation entre les pages

buttonsNavTabFct <- function(input, output, session, data_page) {
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
      removeUI(selector = "#bandeauCarte")
      removeUI(selector = "#carteBack")
    }
    if (data_page$page == "admin") {
      removeUI(selector = "#bandeauAdmin")
    }
    
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
      
      
      insertUI(selector = "#total",
               ui = divCarteBack)
    }
    
    if (data_page$page == "admin") {
      removeUI(selector = "#bandeauAdmin")
      insertUI(selector = '#corps',
               ui = divBandeauCarte)
      
      
      insertUI(selector = "#total",
               ui = divCarteBack)
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
      
      
      insertUI(selector = "#total",
               ui = divCarteBack)
    }
    
    if (data_page$page == "admin") {
      removeUI(selector = "#bandeauAdmin")
      insertUI(selector = '#corps',
               ui = divBandeauCarte)
      
      
      insertUI(selector = "#total",
               ui = divCarteBack)
    }
    
    data_page$page <- "expert";
  })
  
  # Bouton "Admin"
  observeEvent(input$adminButton, {
    print("admin pressed from");
    print(data_page$page);
    
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
      
      removeUI(selector = "#carteBack")
      removeUI(selector = "#bandeauCarte")
    }
    
    if(data_page$page == "accueil") {
      print("HERE")
      removeUI(selector = '#bandeauAccueil')
    }
    
    insertUI(selector = '#corps',
             ui = divBandeauAdmin)
    
    data_page$page <- "admin";
  })
}