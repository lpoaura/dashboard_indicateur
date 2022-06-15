# Ce fichier crée une fonction qui sera appelée dans le server pour gérer les
# boutons de navigation entre les pages

buttonCollapseFct <- function(input, output, session, data_currentInd, data_polesButtons, data_polesFeux, data_year) {
  
  # Collapse button du bandeau de settings
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
    
    # Permet d'initialiser les pôles et l'année.
    setYearsFct(input, output, session, data_year);
    setPolesFct(session, data_polesButtons);
  })
  
  # Collapse button du bandeau de gauche
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
    
    # Permet d'initialiser les indicateurs et les pôles.
    setFeuxFct(session, data_polesButtons, data_polesFeux);
    initSelectorsFct(input, output, session, isolate(data_currentInd$indicator),isolate(data_currentInd$indicatorName));
  })
}






