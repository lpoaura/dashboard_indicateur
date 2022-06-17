# Ce script sera utilisé dans le server pour détecter lorsqu'un changement est
# fait sur le select des indicateurs et les autres dans la page experte.


selectIndicatorsFct <- function(input, output, session, data_currentInd, data_polesButtons, data_year, data_page) {
  
  # Changement sur le select du type d'indicateur (seulement expert)
  observeEvent(input$selectTypeIndicator, {
    session$sendCustomMessage(type = 'selectTypeIndicator', message = '');
  });
  
  observeEvent(input$currentTypeIndName, {
    print(paste("New type indicator : ", input$currentTypeIndName, sep=""));
    currentInd <- findIndictorForType(input$currentTypeIndName);
    currentIndName <- findIndicateurInfo(currentInd, "indName");
    print(currentInd)
    data_currentInd$indicator <- currentInd;
    data_currentInd$indicatorName <- currentIndName;
    
    # Changement de la liste des indicateurs
    poles <- convertPolesForRequest(encodeFeux(data_polesButtons));
    initSelectorsFct(input, output, session, isolate(data_page$page), isolate(data_page$page), currentInd, currentIndName, poles);
    
    # Changement des graphiques et de la carte
    session$onFlushed(function() {
      session$sendCustomMessage(type = 'changeIndicator', message = isolate(data_currentInd$indicator));
      session$sendCustomMessage(type = 'updateIndicatorName', message = isolate(data_currentInd$indicatorName));
    });
  });
  
  
  
  # Changement sur le select d'indicateur
  observeEvent(input$selectIndicator, {
    session$sendCustomMessage(type = 'selectIndicator', message = '');
  });
  
  observeEvent(input$currentInd, {
    data_currentInd$indicator <- input$currentInd;
    print(paste("New indicator : ", data_currentInd$indicator, sep=""));
    
    # Changement des graphiques et de la carte
    poles <- convertPolesForRequest(encodeFeux(data_polesButtons));
    groupe <- "general";
    if (poles != "general") groupe <- "pole";
    datasForServerFct(input = input, output = output, session = session,
                      type = data_currentInd$indicator,
                      groupe = groupe, pole = poles, taxo = "Oiseaux",
                      année = data_year$year);
  });
  
  observeEvent(input$currentIndName, {
    data_currentInd$indicatorName <- input$currentIndName;
    print(paste("New indicator : ", input$currentIndName, sep=""));
    session$sendCustomMessage(type = 'updateIndicatorName', message = data_currentInd$indicatorName);
  });
  
  
  
  # Changement sur le select de la déclinaison (seulement expert)
  observeEvent(input$selectDeclinaison, {
    session$sendCustomMessage(type = 'selectDeclinaison', message = '');
  });
  
  observeEvent(input$currentDeclinaison, {
    print(paste("New declinaison : ", input$currentDeclinaison, sep=""));
  });
  
  
  
  # Changement sur le select du (seulement expert)
  observeEvent(input$selectGroupe, {
    session$sendCustomMessage(type = 'selectGroupe', message = '');
  });
  
  observeEvent(input$currentGroupe, {
    print(paste("New groupe : ", input$currentDeclinaison, sep=""));
  });
}
