# Ce fichier gère la dynamique du panneau de la fonctionnalité rajout dans le mode Admin

addPanelAdminFct <- function(input, output, session) {
  
  # Si modification entre information ou indicateur
  observeEvent(input$infoCheckInput, {
    
    removeUI(selector = "#subIndInput");
    
    if(input$infoCheckInput == "info"){
      radBtn<-radioButtons(inputId = "subIndInput",
                   label = NULL,
                   choices = radButtInfo);
    }
    else{
      radBtn<-radioButtons(inputId = "subIndInput",
                           label = NULL,
                           choices = radButtInd);
    }
    
    insertUI(selector="#identityInd", ui =radBtn);
    
  });
  
  # Si modification entre Type, Catégorie et Sous-indicateur
  observeEvent(input$subIndInput, {
    
    if(input$subIndInput == "type"){
      removeUI(selector = "#categorieInfo")
      removeUI(selector = "#subIndInfo")
      removeUI(selector = "#descriptionArea")
      
      insertUI(selector = "#identityInd", where ="afterEnd", ui = divDescription)
    }
    
    if(input$subIndInput == "categorie"){
      removeUI(selector = "#categorieInfo")
      removeUI(selector = "#subIndInfo")
      removeUI(selector = "#descriptionArea")
      
      insertUI(selector = "#identityInd", where = "afterEnd", ui = divCategorieInfo)
      insertUI(selector = "#categorieInfo", where ="afterEnd", ui = divDescription)
      
      # Remplissage des selectors de type d'information/indicateur
      removeUI(selector = "#selectTypeIndGeneral option", multiple = TRUE);
      if(input$infoCheckInput == "info"){
        for (i in 1:nrow(typeInfoTab)) {
          insertUI(selector = "#selectTypeIndGeneral",
                   ui = tags$option(value = typeInfoTab[i,2], typeInfoTab[i,1]));
        }
      }
      else{
        for (i in 1:nrow(typeIndTab)) {
          insertUI(selector = "#selectTypeIndGeneral",
                   ui = tags$option(value = typeIndTab[i,2], typeIndTab[i,1]));
        }
      }
    }
    
    if(input$subIndInput == "sousind")
    {
      removeUI(selector = "#categorieInfo")
      removeUI(selector = "#subIndInfo")
      removeUI(selector = "#descriptionArea")
      
      insertUI(selector = "#identityInd", where = "afterEnd", ui = divCategorieInfo)
      insertUI(selector = "#categorieInfo", where = "afterEnd", ui = divSubIndInfo)
    }
    
  });
  
}