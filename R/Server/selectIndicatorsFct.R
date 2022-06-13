# Ce script sera utilisé dans le server pour détecter lorsqu'un changement est
# fait sur le select des indicateurs et les autres dans la page experte.


selectIndicatorsFct <- function(input, output, session, data_currentInd) {
  
  observeEvent(input$selectIndicator, {
    session$sendCustomMessage(type = 'selectIndicator', message = '');
  });
  
  observeEvent(input$currentInd, {
    data_currentInd$indicator <- input$currentInd;
    print(paste("New indicator : ", data_currentInd$indicator, sep=""));
  });
  
  observeEvent(input$currentIndName, {
    data_currentInd$indicatorName <- input$currentIndName;
    print(paste("New indicator : ", input$currentIndName, sep=""));
    session$sendCustomMessage(type = 'updateIndicatorName', message = data_currentInd$indicatorName);
  });
}


