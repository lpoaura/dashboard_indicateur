# Ce script crée une fonction qui sera utilisée dans le server pour observer les
# changements sur la scroll bar des années et sur la check box pour savoir si on
# regarde l'ensemble des années

yearsSettingsFct <- function(input, output, session, data_year, data_currentInd, data_polesButtons) {
  observeEvent(input$yearScrollBar, {
    if (!input$checkAllYears && !data_year$loading) {
      data_year$year <- input$yearScrollBar;
      
      # Changement des graphiques et de la carte
      poles <- convertPolesForRequest(encodeFeux(data_polesButtons));
      groupe <- "general";
      
      if (poles != "general") groupe <- "pole";
      datasForServerFct(input = input, output = output, session = session,
                        type = data_currentInd$indicator,
                        groupe = groupe, pole = poles, taxo = "Oiseaux",
                        année = data_year$year);
    }
  })
  
  observeEvent(input$checkAllYears, {
    if (!data_year$loading) {
        
      if (input$checkAllYears) {
        data_year$year <- 0;
      } else {
        data_year$year <- input$yearScrollBar;
      }
      
      # Changement des graphiques et de la carte
      poles <- convertPolesForRequest(encodeFeux(data_polesButtons));
      groupe <- "general";
      if (poles != "general") groupe <- "pole";
      datasForServerFct(input = input, output = output, session = session,
                        type = data_currentInd$indicator,
                        groupe = groupe, pole = poles, taxo = "Oiseaux",
                        année = data_year$year);
    }
  })
  
  observeEvent(input$setYear, {
    if (input$setYear != -1) {
      print(paste("Initialize year to", input$setYear));
      
      updateCheckboxInput(session, "checkAllYears", value = FALSE);
      updateSliderInput(session, "yearScrollBar", value = input$setYear);
      
      session$onFlushed(function() {
        session$sendCustomMessage('endLoadingYear', FALSE);
        session$sendCustomMessage('setYear', -1);
        session$sendCustomMessage('endLoadingYear', TRUE);
      });
    }
  })
  
  observeEvent(input$endLoadingYear, {
    if (input$endLoadingYear == TRUE) {
      data_year$loading <- FALSE;
    }
  })
}

setYearsFct <- function(input, output, session, data_year) {
  data_year$loading <- TRUE;
  currentYear <- data_year$year;
  
  session$onFlushed(function() {
    print("SESSION FLUSHED 1")
    session$sendCustomMessage('setYear', currentYear);
  });
}