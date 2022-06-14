buttonHelpFct <- function(input, output, session, data_page, data_tabAccueil, data_currentInd){
  
  observeEvent(input$aideButton,{
    # Changement forcé en page accueil
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
    

    session$onFlushed(function() {
      # Récupération de l'id de l'indicateur pour lequel on demande une aide
      session$sendCustomMessage(type = 'getIdIndicatorAccueil', message = isolate(data_currentInd$indicatorName));
    })
  });
  
}