# Ce fichier crée une fonction qui sera appelée dans le server pour gérer les
# boutons de navigation entre les pages

buttonCollapseFct <- function(input, output, session, data_page, data_currentInd, data_polesButtons, data_polesFeux, data_year) {
  
  # Collapse button du bandeau de settings
  observeEvent(input$collapaseSettingsButton, {
    print("collapseButton settings pressed");
    removeUI(selector = '#settings')
    insertUI(selector = '#settingsTotal',
             ui = divSettingsCollapsed)
    data_page$fromPage <- data_page$page;
  })
  
  observeEvent(input$uncollapaseSettingsButton, {
    print("uncollapseButton settings pressed");
    removeUI(selector = '#settingsCollapsed')
    insertUI(selector = '#settingsTotal',
             ui = divSettings)
    
    # Permet d'initialiser les pôles et l'année.
    setYearsFct(input, output, session, data_year);
    setPolesFct(session, data_polesButtons);
  })
  
  # Collapse button du bandeau de gauche
    observeEvent(input$collapaseBandeauButton, {
      print("collapseButton bandeau pressed");
      removeUI(selector = '#bandeau')
      insertUI(selector = '#bandeauCarte',
               ui = divBandeauCollapsed)
      data_page$fromPage <- data_page$page;
  })
  
  observeEvent(input$uncollapaseBandeauButton, {
    print("uncollapseButton bandeau pressed");
    removeUI(selector = '#bandeauCollapsed');
    
    # On insère le bon bandeau sur la gauche en fonction de la page
    if (data_page$page == "global") {
      insertUI(selector = '#bandeauCarte',
               ui = divBandeau)
    }
    else {
      insertUI(selector = '#bandeauCarte',
               ui = divBandeauExpert)
    }
    
    # Permet d'initialiser les indicateurs, les pôles et les graphiques.
    setFeuxFct(session, data_polesButtons, data_polesFeux);
    session$onFlushed(function() {
      initTypeIndSelectFct(input = input, output = output, session = session,
                           data_currentInd = data_currentInd, data_polesButtons = data_polesButtons,
                           data_page = data_page, fromPrgm = "collapse button")
    });
  })
}






