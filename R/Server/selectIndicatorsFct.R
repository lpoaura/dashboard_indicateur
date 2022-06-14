# Ce script sera utilisé dans le server pour détecter lorsqu'un changement est
# fait sur le select des indicateurs et les autres dans la page experte.


selectIndicatorsFct <- function(input, output, session, data_currentInd, data_polesButtons, annee = 0) {
  
  observeEvent(input$selectIndicator, {
    session$sendCustomMessage(type = 'selectIndicator', message = '');
  });
  
  observeEvent(input$currentInd, {
    data_currentInd$indicator <- input$currentInd;
    print(paste("New indicator : ", data_currentInd$indicator, sep=""));
    
    
    poles <- convertPolesForRequest(encodeFeux(data_polesButtons));
    datasForServerFct(input = input, output = output, session = session,
                      type = data_currentInd$indicator,
                      groupe = "general", pole = poles, taxo = "Oiseaux",
                      année = 0);
  });
  
  observeEvent(input$currentIndName, {
    data_currentInd$indicatorName <- input$currentIndName;
    print(paste("New indicator : ", input$currentIndName, sep=""));
    session$sendCustomMessage(type = 'updateIndicatorName', message = data_currentInd$indicatorName);
  });
}

# --------------- Permet d'encoder pour envoyer à JS ---------------#
convertPolesForRequest <- function(poleStr) {
  res <- "";
  switch(poleStr,
         "all" = res <- "general",
         "fi" = res <- "Flore Invertébrés",
         "fv" = res <- "Flore Vertébrés",
         "iv" = res <- "Invertébrés Vertébrés",
         "flore" = res <- "Flore et Fongus",
         "invertebre" = res <- "Invertébrés",
         "vertebre" = res <- "Vertébrés",
         "rien" = res <- "rien"
  );
    
  return(res);
}
