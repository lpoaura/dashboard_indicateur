# Ce fichier crée une fonction qui sera appelée dans le server pour gérer les
# boutons de navigation entre les pages

buttonsNavTabFct <- function(input, output, session, data_page, data_currentInd, data_polesButtons, data_polesFeux, data_year) {
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
    if(data_page$page == "accueil") {
      removeUI(selector = '#bandeauAccueil')
    }
    
    if (data_page$page == "admin") {
      removeUI(selector = "#bandeauAdmin")
    }
    
    if(data_page$page != "expert") {
      insertUI(selector = '#settingsTotal',
               ui = divSettings)
      
      insertUI(selector = '#corps',
               ui = divBandeauCarte)
      
      insertUI(selector = "#total",
               ui = divCarteBack)
      
      # Permet d'initialiser les indicateurs, les pôles, l'année et les graphiques.
      setYearsFct(input, output, session, data_year);
      setPolesFeuxFct(session, data_polesButtons, data_polesFeux);
      dispDatasForServerFct(input, output, session);
    }
    else {
      removeUI(selector = "#selectTypeIndicator")
      removeUI(selector = "#selectDeclinaison")
      removeUI(selector = "#selectGroupe")
      removeUI(selector = ".titleSel", multiple = TRUE)
    }
    
    # Initialise les selectors
    initSelectorsFct(input, output, session,
                     "global", data_page$page,
                     isolate(data_currentInd$indicator),isolate(data_currentInd$indicatorName),
                     encodeFeuxIsolated(isolate(data_polesButtons$flore),
                                        isolate(data_polesButtons$invertebre),
                                        isolate(data_polesButtons$vertebre)));
    
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
    if(data_page$page == "accueil") {
      removeUI(selector = '#bandeauAccueil')
    }
    
    if (data_page$page == "admin") {
      removeUI(selector = "#bandeauAdmin")
    }
    
    if(data_page$page != "global") {
      insertUI(selector = '#settingsTotal',
               ui = divSettings)
      
      insertUI(selector = '#corps',
               ui = divBandeauCarteExpert)
      
      insertUI(selector = "#total",
               ui = divCarteBack)
      
      # Permet d'initialiser les indicateurs, les pôles, l'année et les graphiques.
      setYearsFct(input, output, session, data_year);
      setPolesFeuxFct(session, data_polesButtons, data_polesFeux);
      dispDatasForServerFct(input, output, session);
    }
    else {
      insertUI(selector = "#selectArea", where = "afterBegin", ui = selectTypeIndicator)
      insertUI(selector = "#selectTypeIndicator", where = "beforeBegin", ui = titleSelectTypeIndicator)
      insertUI(selector = "#selectIndicator", where = "afterEnd", ui = selectDeclinaison)
      insertUI(selector = "#selectDeclinaison", where = "beforeBegin", ui = titleSelectDeclinaison)
      insertUI(selector = "#selectDeclinaison", where = "afterEnd", ui = selectGroupe)
      insertUI(selector = "#selectGroupe", where = "beforeBegin", ui = titleSelectGroupe)
    }
    
    # Initialise les selectors
    initSelectorsFct(input, output, session,
                     "expert", data_page$page,
                     isolate(data_currentInd$indicator),isolate(data_currentInd$indicatorName),
                     encodeFeuxIsolated(isolate(data_polesButtons$flore),
                                        isolate(data_polesButtons$invertebre),
                                        isolate(data_polesButtons$vertebre)));
    
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
      removeUI(selector = '#bandeauAccueil')
    }
    
    insertUI(selector = '#corps',
             ui = divBandeauAdmin)
    
    data_page$page <- "admin";
  })
}