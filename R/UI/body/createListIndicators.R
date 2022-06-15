listIndicators <- list("Nombre de données",
                       "Nombre d'espèces",
                       "Indicateur de connaissances")

valIndicators <- list("données",
                       "especes",
                       "connaissances")

listValIndicators <- list();

i <- 1;
for (el in listIndicators) {
  listValIndicators[[2*i-1]] <- el;
  listValIndicators[[2*i]] <- valIndicators[[i]];
  i <- i+1;
}

initSelectorsFct <- function (input, output, session, currentInd, currentIndName) {
  for (i in 1:length(listIndicators)) {
    insertUI(selector = "#selectIndicator",
             ui = tags$option(value = valIndicators[[i]], listIndicators[[i]]));
  }
  
  session$onFlushed(function() {
    session$sendCustomMessage(type = 'setIndicator', message = currentInd);
    session$sendCustomMessage(type = 'updateIndicatorName', message = currentIndName);
  });
}


