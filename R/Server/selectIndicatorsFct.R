# Ce script sera utilisé dans le server pour détecter lorsqu'un changement est
# fait sur le select des indicateurs et les autres dans la page experte.


selectIndicatorsFct <- function(input, output, session, data_currentInd, data_polesButtons, data_year, data_page) {
  
  # Changement sur le select du type d'indicateur (seulement expert)
  observeEvent(input$selectTypeIndicator, {
    data_currentInd$typeInd <- input$selectTypeIndicator;
    print(paste("New type indicator selected :", data_currentInd$typeInd));
    
    if (data_page$page == "expert") {
      session$sendCustomMessage(type = 'showTypeIndicator', message = data_currentInd$typeInd);
    }
    
    # Reset du select d'indicateur
    modifyIndSelectFct(input, output, session,
                       data_currentInd, data_polesButtons,
                       data_page, fromPrgm = "ObserveSelectTypeInd");
  });
  
  
  
  
  # Changement sur le select d'indicateur
  observeEvent(input$selectIndicator, {
    data_currentInd$indicator <- input$selectIndicator
    print(paste("New indicator selected :", data_currentInd$indicator));
    
    data_currentInd$indicatorName <- findIndicateurInfo(data_currentInd$indicator, "indName");
    session$sendCustomMessage(type = 'updateIndicatorName', message = data_currentInd$indicatorName);
    
    session$sendCustomMessage(type = 'showIndicator', message = data_currentInd$indicator);
    
    # Reset du select de déclinaison
    modifyDecliSelectFct(input, output, session,
                       data_currentInd, data_polesButtons,
                       data_page, fromPrgm = "ObserveSelectInd");
  });
  
  # observeEvent(input$selectIndicator, {
  #   print(paste("New indicator selected : ", input$selectIndicator, sep=""));
  #   session$sendCustomMessage(type = 'selectIndicator', message = '');
  # });
  # 
  # observeEvent(input$currentInd, {
  #   data_currentInd$indicator <- input$currentInd;
  #   print(paste("New current indicator : ", data_currentInd$indicator, sep=""));
  #   
  #   # Changement des graphiques et de la carte
  #   poles <- convertPolesForRequest(encodeFeux(data_polesButtons));
  #   groupe <- "general";
  #   if (poles != "general") groupe <- "pole";
  #   datasForServerFct(input = input, output = output, session = session,
  #                     type = data_currentInd$indicator,
  #                     groupe = groupe, pole = poles, taxo = "Oiseaux",
  #                     année = data_year$year);
  #   
  #   # Changement de la liste des indicateurs
  #   initSelectorsFct(input, output, session,
  #                    isolate(data_page$page), isolate(data_page$page),
  #                    isolate(data_currentInd$indicator), isolate(data_currentInd$indicatorName),
  #                    poles,
  #                    "currentInd");
  # });
  # 
  # observeEvent(input$currentIndName, {
  #   data_currentInd$indicatorName <- input$currentIndName;
  #   print(paste("New current indicator name : ", input$currentIndName, sep=""));
  #   session$sendCustomMessage(type = 'updateIndicatorName', message = data_currentInd$indicatorName);
  # });
  
  
  
  # Changement sur le select de la déclinaison (seulement expert)
  observeEvent(input$selectDeclinaison, {
    data_currentInd$declinaison <- input$selectDeclinaison;
    print(paste("New declinaison selected :", data_currentInd$declinaison));
    
    if (data_page$page == "expert") {
      session$sendCustomMessage(type = 'showDeclinaison', message = data_currentInd$declinaison);
    }
    
    # Si l'utilisateur ne choisi pas "poles" ou "taxo" les poles doivent se
    # réinitialiser
    if (data_currentInd$declinaison != "poles" &&
        data_currentInd$declinaison != "taxo" &&
        (!data_polesButtons$flore ||
         !data_polesButtons$invertebre ||
         !data_polesButtons$vertebre)) {
      data_polesButtons$flore <- TRUE;
      data_polesButtons$invertebre <- TRUE;
      data_polesButtons$vertebre <- TRUE;
      setPolesFct(session, data_polesButtons);
    }
    
    # Reset du select de groupe
    modifyGroupeSelectFct(input, output, session,
                          data_currentInd, data_polesButtons,
                          data_page, fromPrgm = "ObserveSelectInd");
  });
  
  # observeEvent(input$currentDeclinaison, {
  #   print(paste("New current declinaison : ", input$currentDeclinaison, sep=""));
  #   if (input$currentDeclinaison == "general") {
  #     data_polesButtons$flore <- TRUE;
  #     data_polesButtons$invertebre <- TRUE;
  #     data_polesButtons$vertebre <- TRUE;
  #     
  #     setPolesFct(session,data_polesButtons);
  #   }
  #   
  #   # Changement des graphiques et de la carte
  #   poles <- convertPolesForRequest(encodeFeux(data_polesButtons));
  #   groupe <- "general";
  #   if (poles != "general") groupe <- "pole";
  #   # datasForServerFct(input = input, output = output, session = session,
  #   #                   type = data_currentInd$indicator,
  #   #                   groupe = groupe, pole = poles, taxo = "Oiseaux",
  #   #                   année = data_year$year);
  #   
  #   # Changement de la liste des indicateurs
  #   initSelectorsFct(input, output, session,
  #                    isolate(data_page$page), isolate(data_page$page),
  #                    isolate(data_currentInd$indicator), isolate(data_currentInd$indicatorName),
  #                    poles,
  #                    "currentDeclinaison");
  # });
  
  
  
  # Changement sur le select du (seulement expert)
  observeEvent(input$selectGroupe, {
    data_currentInd$groupe <- input$selectGroupe;
    print(paste("New groupe selected :", data_currentInd$groupe));
    
    if (data_page$page == "expert" && data_currentInd$groupe != "RIEN") {
      session$sendCustomMessage(type = 'showGroupe', message = data_currentInd$groupe);
    }
    
    # Affichage des nouvelles données
    poles <- convertPolesForRequest(encodeFeux(data_polesButtons));
    decli <- data_currentInd$declinaison;
    groupe <- data_currentInd$groupe;
    if (poles != "general" && groupe == "general") groupe <- "pole";
    datasForServerFct(input = input, output = output, session = session,
                      type = data_currentInd$indicator,
                      groupe = decli, pole = poles, taxo = groupe,
                      année = data_year$year);
  });
  
  # observeEvent(input$currentGroupe, {
  #   print(paste("New groupe : ", input$currentDeclinaison, sep=""));
  # });
  
  
  
  # Lancement du changement d'indicateur si le typeIndd n'a pas changé
  observeEvent(input$selectNotChanged, {
    if (input$selectNotChanged != "noChange") {
      print(paste("New seclect not changed :", input$selectNotChanged));
      
      session$sendCustomMessage(type = 'selectNotChanged', message = "noChange");
      
      if (input$selectNotChanged == "typeInd") {
        print(paste("Current type indicator :", data_currentInd$typeInd));
        
        if (data_page$page == "expert") {
          session$sendCustomMessage(type = 'showTypeIndicator', message = data_currentInd$typeInd);
        }
        
        # Reset du select d'indicateur
        modifyIndSelectFct(input, output, session,
                           data_currentInd, data_polesButtons,
                           data_page, fromPrgm = "ObserveSelectTypeInd Not Changed");
      }
      else if (input$selectNotChanged == "indicator") {
        print(paste("Current indicator :", data_currentInd$indicator));
        
        session$sendCustomMessage(type = 'showIndicator', message = data_currentInd$indicator);
        
        # Reset de la déclinaison
        modifyDecliSelectFct(input, output, session,
                           data_currentInd, data_polesButtons,
                           data_page, fromPrgm = "ObserveSelectInd Not Changed");
      }
      else if (input$selectNotChanged == "declinaison") {
        print(paste("Current declinaison :", data_currentInd$declinaison));
        
        if (data_page$page == "expert") {
          session$sendCustomMessage(type = 'showDeclinaison', message = data_currentInd$declinaison);
        }
        
        # Reset du groupe
        modifyGroupeSelectFct(input, output, session,
                              data_currentInd, data_polesButtons,
                              data_page, fromPrgm = "ObserveSelectDeclinaison Not Changed");
      }
      else if (input$selectNotChanged == "groupe") {
        print(paste("Current groupe :", data_currentInd$groupe));
        
        if (data_page$page == "expert" && data_currentInd$groupe != "RIEN") {
          session$sendCustomMessage(type = 'showGroupe', message = data_currentInd$groupe);
        }
        
        # Affichage des nouvelles données
        poles <- convertPolesForRequest(encodeFeux(data_polesButtons));
        decli <- data_currentInd$declinaison;
        groupe <- data_currentInd$groupe;
        if (poles != "general" && groupe == "general") groupe <- "pole";
        datasForServerFct(input = input, output = output, session = session,
                          type = data_currentInd$indicator,
                          groupe = decli, pole = poles, taxo = groupe,
                          année = data_year$year);
      }
    }
  });
}
