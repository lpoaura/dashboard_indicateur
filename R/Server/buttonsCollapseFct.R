# Ce fichier crée une fonction qui sera appelée dans le server pour gérer les
# boutons de navigation entre les pages

buttonCollapseFct <- function(input, output, session, data_currentInd) {
  
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
    
    # Permet d'initialiser les indicateurs.
    initSelectorsFct(input, output, session, isolate(data_currentInd$indicator),isolate(data_currentInd$indicatorName));
  })
}






