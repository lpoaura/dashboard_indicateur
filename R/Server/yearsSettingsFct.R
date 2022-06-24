# Ce script crée une fonction qui sera utilisée dans le server pour observer les
# changements sur la scroll bar des années et sur la check box pour savoir si on
# regarde l'ensemble des années

yearsSettingsFct <- function(input, output, session, data_year, data_currentInd, data_polesButtons, data_page) {
  observeEvent(input$yearScrollBar, {
    print(data_year$loading)
    if (!input$checkAllYears && !data_year$loading) {
      data_year$year <- input$yearScrollBar;
      
      # Changement des graphiques et de la carte
      poles <- convertPolesForRequest(encodeFeux(data_polesButtons));
      decli <- data_currentInd$declinaison;
      groupe <- data_currentInd$groupe;
      if (poles != "general" && decli == "general") { decli <- "pole"; }
      datasForServerFct(input = input, output = output, session = session,
                        type = data_currentInd$indicator,
                        groupe = decli, pole = poles, taxo = groupe,
                        année = data_year$year);
    }
  })
  
  observeEvent(input$checkAllYears, {
    print(data_year$loading)
    if (!data_year$loading) {
        
      if (input$checkAllYears) {
        data_year$year <- 0;
      } else {
        data_year$year <- input$yearScrollBar;
      }
      
      # Changement des graphiques et de la carte
      poles <- convertPolesForRequest(encodeFeux(data_polesButtons));
      decli <- data_currentInd$declinaison;
      groupe <- data_currentInd$groupe;
      if (poles != "general" && decli == "general") { decli <- "pole"; }
      datasForServerFct(input = input, output = output, session = session,
                        type = data_currentInd$indicator,
                        groupe = decli, pole = poles, taxo = groupe,
                        année = data_year$year);
    }
  })
  
  observeEvent(input$setYear, {
    if (input$setYear != -1) {
      print(paste("Initialize year to", input$setYear));
      
      if (input$setYear == 0) {
        updateCheckboxInput(session, "checkAllYears", value = TRUE);
      }
      else {
        updateCheckboxInput(session, "checkAllYears", value = FALSE);
        updateSliderInput(session, "yearScrollBar", value = input$setYear);
      }
      
      if (input$setYear != data_year$year || (data_page$fromPage == "accueil")) {
        session$onFlushed(function() {
          session$sendCustomMessage('endLoadingYear', FALSE);
          session$sendCustomMessage('setYear', -1);
          session$sendCustomMessage('endLoadingYear', TRUE);
        });
      }
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
    print("year set")
    session$sendCustomMessage('setYear', currentYear);
  });
}