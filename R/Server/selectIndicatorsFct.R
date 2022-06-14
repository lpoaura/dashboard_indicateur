# Ce script sera utilisé dans le server pour détecter lorsqu'un changement est
# fait sur le select des indicateurs et les autres dans la page experte.


selectIndicatorsFct <- function(input, output, session, data_currentInd, data_polesButtons, annee = 0) {
  
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
                      année = 0);
  });
  
  observeEvent(input$currentIndName, {
    data_currentInd$indicatorName <- input$currentIndName;
    print(paste("New indicator : ", input$currentIndName, sep=""));
    session$sendCustomMessage(type = 'updateIndicatorName', message = data_currentInd$indicatorName);
  });
}
