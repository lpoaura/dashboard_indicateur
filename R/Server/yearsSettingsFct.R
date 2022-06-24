# Ce script crée une fonction qui sera utilisée dans le server pour observer les
# changements sur la scroll bar des années et sur la check box pour savoir si on
# regarde l'ensemble des années

yearsSettingsFct <- function(input, output, session, data_year, data_currentInd, data_polesButtons, data_page) {
  
  # Changement dans la scroll bar
  observeEvent(input$yearScrollBar, {
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
      # Remarque : pas besoin de passer par les sélecteurs car on sait qu'il
      # faut recalculer les données et qu'ils ne seront pas modifiés.
    }
  })
  
  # Changement sur la check box
  observeEvent(input$checkAllYears, {
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
      # Remarque : pas besoin de passer par les sélecteurs car on sait qu'il
      # faut recalculer les données et qu'ils ne seront pas modifiés.
    }
  })
  
  # Permet d'initialiser les données sur la checkbox et la scrollbar
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
  
  # Permet d'actualiser correctement l'état du loading de l'année
  observeEvent(input$endLoadingYear, {
    if (input$endLoadingYear == TRUE) {
      data_year$loading <- FALSE;
    }
  })
}

# Cette fonction permet d'initialiser les données dans re-calculer les données
setYearsFct <- function(input, output, session, data_year) {
  data_year$loading <- TRUE;
  currentYear <- data_year$year;
  
  session$onFlushed(function() {
    session$sendCustomMessage('setYear', currentYear);
  });
}