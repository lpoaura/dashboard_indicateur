# Ce fichier crée une fonction qui sera appelée dans le server pour gérer les
# boutons de navigation entre les pages

buttonsNavTabFct <- function(input, output, session, data_page, data_currentInd, data_polesButtons, data_polesFeux, data_year, data_tabAccueil) {
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
      output$mymap <- renderLeaflet({mapBase});
      removeUI(selector = "#carteBack")
    }
    if (data_page$page == "admin") {
      removeUI(selector = "#bandeauAdmin")
    }
    
    insertUI(selector = "#corps",
             ui = divBandeauAccueil)
    data_tabAccueil$tab <- "ind1";
    session$onFlushed(function() {
      session$sendCustomMessage(type = "actualizeNewTabAccueil", message = isolate(data_tabAccueil$tab));
    });
    
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
      output$mymap <- renderLeaflet({mapPlot});
      
      # Permet d'initialiser les pôles et l'année.
      setYearsFct(input, output, session, data_year);
      setPolesFeuxFct(session, data_polesButtons, data_polesFeux);
    }
    else {
      removeUI(selector = "#selectTypeIndicator")
      removeUI(selector = "#selectDeclinaison")
      removeUI(selector = "#selectGroupe")
      removeUI(selector = ".titleSel", multiple = TRUE)
    }
    
    # Actualisation de la page représentant des données
    data_page$fromPage <- data_page$page;
    data_page$page <- "global";
    
    # Initialise les selectors
    initTypeIndSelectFct(input = input, output = output, session = session,
                         data_currentInd = data_currentInd, data_polesButtons = data_polesButtons,
                         data_page = data_page, fromPrgm = "buttonGlobal")
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
      output$mymap <- renderLeaflet({mapPlot});
      
      # Permet d'initialiser les indicateurs, les pôles, l'année et les graphiques.
      setYearsFct(input, output, session, data_year);
      setPolesFeuxFct(session, data_polesButtons, data_polesFeux);
    }
    # Insertion de tous les indicateurs dans le bandeau de la page globale.
    else {
      insertUI(selector = "#selectArea", where = "afterBegin", ui = selectTypeIndicator)
      insertUI(selector = "#selectTypeIndicator", where = "beforeBegin", ui = titleSelectTypeIndicator)
      insertUI(selector = "#selectIndicator", where = "afterEnd", ui = selectDeclinaison)
      insertUI(selector = "#selectDeclinaison", where = "beforeBegin", ui = titleSelectDeclinaison)
      insertUI(selector = "#selectDeclinaison", where = "afterEnd", ui = selectGroupe)
      insertUI(selector = "#selectGroupe", where = "beforeBegin", ui = titleSelectGroupe)
    }
    
    # Actualisation de la page représentant des données
    data_page$fromPage <- data_page$page;
    data_page$page <- "expert";
    
    # Initialise les selectors
    initTypeIndSelectFct(input = input, output = output, session = session,
                         data_currentInd = data_currentInd, data_polesButtons = data_polesButtons,
                         data_page = data_page, fromPrgm = "buttonExpert")
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
      output$mymap <- renderLeaflet({mapBase});
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