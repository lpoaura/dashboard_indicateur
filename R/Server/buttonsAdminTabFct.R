# Ce fichier crée une fonction qui sera appelée dans le server pour gérer les
# onglets du mode Admin

buttonsAdminTabFct <- function(input, output, session, data_tabAdmin) {
  # Bouton "RAJOUT"
  observeEvent(input$addButton, {
    print("RAJOUT pressed from");
    print(data_tabAdmin$tab);
    
    # Changement des boutons de navigation
    session$sendCustomMessage(type = 'actualizeTabAdmin', message = "RAJOUT")
    
    # Changement de la page à faire
    if(data_tabAdmin$tab == "SUPPRESSION") {
      removeUI(selector = "#panelSuppress")
    }
    if(data_tabAdmin$tab == "MODIFICATION") {
      removeUI(selector = "#panelModify")
    }
    
    insertUI(selector = "#bandeauAdmin",
             ui = divPanelAdd)
    
    data_tabAdmin$tab <- "RAJOUT";
  });
  
  # Bouton "SUPPRESSION"
  observeEvent(input$suppressButton, {
    print("SUPPRESSION pressed from");
    print(data_tabAdmin$tab);
    
    # Changement des boutons de navigation
    session$sendCustomMessage(type = 'actualizeTabAdmin', message = "SUPPRESSION")
    
    # Changement de la page à faire
    if(data_tabAdmin$tab == "RAJOUT") {
      removeUI(selector = "#panelAdd")
    }
    if(data_tabAdmin$tab == "MODIFICATION") {
      removeUI(selector = "#panelModify")
    }
    
    insertUI(selector = "#bandeauAdmin",
             ui = divPanelSuppress)
    
    data_tabAdmin$tab <- "SUPPRESSION";
  });
  
  # Bouton "MODIFICATION"
  observeEvent(input$modifyButton, {
    print("MODIFICATION pressed from");
    print(data_tabAdmin$tab);
    
    # Changement des boutons de navigation
    session$sendCustomMessage(type = 'actualizeTabAdmin', message = "MODIFICATION")
    
    # Changement de la page à faire
    if(data_tabAdmin$tab == "RAJOUT") {
      removeUI(selector = "#panelAdd")
    }
    if(data_tabAdmin$tab == "SUPPRESSION") {
      removeUI(selector = "#panelSuppress")
    }
    
    insertUI(selector = "#bandeauAdmin",
             ui = divPanelModify)
    
    data_tabAdmin$tab <- "MODIFICATION";
  });
}