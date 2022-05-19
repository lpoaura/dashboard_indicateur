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
  
  
}