

# Fonction d'actualisation de selector de type d'indicateur
initTypeIndSelectFct <- function (input, output, session,
                                  data_currentInd, data_polesButtons,
                                  data_page, fromPrgm = "NONE")
{
  removeUI(selector = "#selectTypeIndicator option", multiple = TRUE);
  
  print(paste("Initialisation de type d'indicateur from program", fromPrgm));
  
  # Numéro de l'indicateur en cours
  numInd <- findIndicateurNum(isolate(data_currentInd$indicator));
  
  oldTypeInd <- isolate(data_currentInd$typeInd);
  typeInd <- isolate(data_currentInd$typeInd);
  
  # Page globale
  if (isolate(data_page$page) == "global") {
    
  }
  
  # Remplissage du select de type en page expert
  else if (isolate(data_page$page) == "expert") {
    # Détermination du type d'indicateur
    typeInd <- findIndicateurInfoByNum(numInd, "typeInd");
    
    # Remplissage du select de type d'indicateur
    for(el in listTypesIndicators) {
      insertUI(selector = "#selectTypeIndicator",
               ui = tags$option(value = el, el));
    }
  }
  else {
    print(paste("Erreur dans la page", isolate(data_page$page)));
  }
  
  # Mise à jour du type d'indicateur affiché
  # session$onFlushed(function() {
  if (oldTypeInd != typeInd) {
    session$sendCustomMessage(type = 'setTypeIndicatorName', message = typeInd);
  }
  else {
    session$sendCustomMessage(type = 'selectNotChanged', message = "typeInd");
  }
  # });
}


# Fonction d'actualisation de selector d'indicateur
modifyIndSelectFct <- function(input, output, session,
                               data_currentInd, data_polesButtons,
                               data_page, fromPrgm = "NONE")
{
  removeUI(selector = "#selectIndicator option", multiple = TRUE)
  
  print(paste("Initialisation d'indicateur from program", fromPrgm));
  
  # Numéro de l'indicateur en cours
  numInd <- findIndicateurNum(data_currentInd$indicator);
  oldInd <- data_currentInd$indicator;
  
  # Remplissage du seul sélect de la page globale
  if (data_page$page == "global") {
    
    # Cas particulier, indicateur seulement disponible en mode expert : reset
    if (findIndicateurInfoByNum(numInd, "isGlobal") == FALSE) {
      data_currentInd$indicator <- "données";
      data_currentInd$indicatorName <- "Nombre de données";
      data_currentInd$hasChanged <- TRUE;
      
    }
    # Rien à modifier : on conserve l'indicateur sélectionné en expert
    else {}
    
    # Cas particulier : indicateur "spéciaux" de taxonomie
    if (data_currentInd$declinaison == "taxo") {
      switch(data_currentInd$indicator,
             "données" = {
               data_currentInd$indicator <- "donnéesTaxo";
               data_currentInd$indicatorName <- "Nombre de données par taxonomie";
               data_currentInd$hasChanged <- TRUE;
             },
             "especes" = {
               data_currentInd$indicator <- "especesTaxo";
               data_currentInd$indicatorName <- "Nombre d'espèces par taxonomie";
               data_currentInd$hasChanged <- TRUE;
             },
             "connaissances" = {
               data_currentInd$indicator <- "connaissancesTaxo";
               data_currentInd$indicatorName <- "Indicateur de connaissances par taxonomie";
               data_currentInd$hasChanged <- TRUE;
             }
      );
    }
    
    # Remplissage du select d'indicateur global
    for (i in 1:nrow(tabIndicators)) {
      if (findIndicateurInfoByNum(i, "isGlobal")) {
        insertUI(selector = "#selectIndicator",
                 ui = tags$option(value = tabIndicators[i,2], tabIndicators[i,1]));
      }
    }
  }
  
  
  # Remplissage du select d'indicateur de la page experte
  else {
    # Remplissage du select d'indicateur (catégorie)
    for (i in 1:nrow(tabIndicators)) {
      if (findIndicateurInfoByNum(i, "typeInd") == data_currentInd$typeInd && findIndicateurInfoByNum(i, "isExpert") == TRUE) {
        insertUI(selector = "#selectIndicator",
                 ui = tags$option(value = tabIndicators[i,2], tabIndicators[i,1]));
      }
    }
    
    # Détermination de l'indicateur actuel
    if (findIndicateurInfoByNum(numInd, "isExpert") == FALSE) {
      print("Special indictor from global");
      switch(data_currentInd$indicator,
             "donnéesTaxo" = {
               data_currentInd$indicator <- "données";
               data_currentInd$indicatorName <- "Nombre de données";
               data_currentInd$hasChanged <- TRUE;
             },
             "especesTaxo" = {
               data_currentInd$indicator <- "especes";
               data_currentInd$indicatorName <- "Nombre d'espèces";
               data_currentInd$hasChanged <- TRUE;
             },
             "connaissancesTaxo" = {
               data_currentInd$indicator <- "connaissances";
               data_currentInd$indicatorName <- "Indicateur de connaissances";
               data_currentInd$hasChanged <- TRUE;
             }
      );
    }
    else if (findIndicateurInfoByNum(numInd, "typeInd") != data_currentInd$typeInd) {
      data_currentInd$indicator <- findIndictorForType(data_currentInd$typeInd);
      data_currentInd$hasChanged <- TRUE;
    }
    # On vient d'une page avec un indicateur valide : on ne fait rien
    else {}
  }
  
  
  # session$onFlushed(function() {
  if (isolate(data_currentInd$indicator) != oldInd) {
    session$sendCustomMessage(type = 'setIndicator', message = isolate(data_currentInd$indicator));
  }
  else  {
    session$sendCustomMessage(type = 'selectNotChanged', message = "indicator");
  }
  # });
}


# Fonction d'actualisation de selector de déclinaison
modifyDecliSelectFct <- function (input, output, session,
                                  data_currentInd, data_polesButtons,
                                  data_page, fromPrgm = "NONE")
{
  removeUI(selector = "#selectDeclinaison option", multiple = TRUE)
  
  print(paste("Initialisation de declinaison from program", fromPrgm));
  
  # Numéro de l'indicateur en cours
  numInd <- findIndicateurNum(data_currentInd$indicator);
  
  oldDecli <- data_currentInd$declinaison;
  
  # Page globale
  if (data_page$page == "global") {
    # Si la déclinaison n'est pas accessible en mode globale, on reset à
    # général par défaut.
    if (data_currentInd$declinaison != "general" &&
        data_currentInd$declinaison != "poles" &&
        data_currentInd$declinaison != "taxo") {
      data_currentInd$declinaison <- "general";
      data_currentInd$hasChanged <- TRUE;
    }
    
    # S'exécute dans tous les cas si on est dans la page globale
    if (data_currentInd$indicator == "donnéesTaxo" ||
        data_currentInd$indicator == "especesTaxo" ||
        data_currentInd$indicator == "connaissancesTaxo")
    {
      if (data_currentInd$declinaison != "taxo") { data_currentInd$hasChanged <- TRUE; }
      data_currentInd$declinaison <- "taxo";
    }
    else if (data_polesButtons$flore && data_polesButtons$invertebre && data_polesButtons$vertebre) {
      if (data_currentInd$declinaison != "general") { data_currentInd$hasChanged <- TRUE; }
      data_currentInd$declinaison <- "general";
    }
    else {
      if (data_currentInd$declinaison != "poles") { data_currentInd$hasChanged <- TRUE; }
      data_currentInd$declinaison <- "poles";
    }
    
    # Vérification que la déclinaison est légale
    listDecli <- c(TRUE);
    listDecli <- append(listDecli, findIndicateurInfoByNum(numInd, "isPoles"));
    listDecli <- append(listDecli, findIndicateurInfoByNum(numInd, "isTaxo"));
    listDecli <- append(listDecli, findIndicateurInfoByNum(numInd, "isFournisseur"));
    listDecli <- append(listDecli, findIndicateurInfoByNum(numInd, "isProducteur"));
    if (!listDecli[[findDecliNum(data_currentInd$declinaison)]]) {
      data_currentInd$declinaison <- "general";
      data_currentInd$hasChanged <- TRUE;
    }
  }
  
  # Remplissage du select de déclianison en page expert
  else if (data_page$page == "expert") {
    # Remplissage du selector de déclinaison
    listDecli <- c(TRUE);
    polesInd <- findIndicateurInfoByNum(numInd, "isPoles");
    listDecli <- append(listDecli, polesInd);
    taxoInd <- findIndicateurInfoByNum(numInd, "isTaxo");
    listDecli <- append(listDecli, taxoInd);
    listDecli <- append(listDecli, findIndicateurInfoByNum(numInd, "isFournisseur"));
    listDecli <- append(listDecli, findIndicateurInfoByNum(numInd, "isProducteur"));
    
    for(i in 1:nrow(declinaisonIndicator)) {
      if (listDecli[[i]]) {
        insertUI(selector = "#selectDeclinaison",
                 ui = tags$option(value = declinaisonIndicator[i,2], declinaisonIndicator[i,1]));
      }
    }
    
    # Acutalisation de la déclinaison en cours
    poles <- encodeFeux(data_polesButtons);
    if (poles != "all" &&
        data_currentInd$declinaison != "poles" &&
        data_currentInd$declinaison != "taxo") {
      data_currentInd$declinaison <- "poles";
      data_currentInd$hasChanged <- TRUE;
    }
    nDecli <- findDecliNum(data_currentInd$declinaison);
    # Déclinaison précédente indisponible pour cet indicateur
    if (!listDecli[[nDecli]]) {
      data_currentInd$declinaison <- "general";
      data_currentInd$hasChanged <- TRUE;
    }
    # On ne change pas de déclinaison
    else {
    }
  }
  else {
    print(paste("Erreur dans la page", data_page$page));
  }
  
  # Mise à jour du type d'indicateur affiché
  # session$onFlushed(function() {
  if (isolate(data_currentInd$declinaison) != oldDecli) {
    session$sendCustomMessage(type = 'setDeclinaison', message = isolate(data_currentInd$declinaison));
  }
  else  {
    session$sendCustomMessage(type = 'selectNotChanged', message = "declinaison");
  }
  # });
}


# Fonction d'actualisation de selector de groupe
modifyGroupeSelectFct <- function (input, output, session,
                                   data_currentInd, data_polesButtons,
                                   data_page, fromPrgm = "NONE")
{
  removeUI(selector = "#selectGroupe option", multiple = TRUE)
  
  print(paste("Initialisation du groupe from program", fromPrgm));
  
  # Numéro de l'indicateur en cours
  numInd <- findIndicateurNum(data_currentInd$indicator);
  numDecli <- findDecliNum(data_currentInd$declinaison);
  
  oldGroupe <- data_currentInd$groupe;
  
  # Page globale
  if (data_page$page == "global") {
    if(data_currentInd$declinaison == "taxo") {
      data_currentInd$groupe <- "Toutes";
    }
    else {
      data_currentInd$groupe <- "RIEN";
    }
  }
  
  # Remplissage du select de type en page expert
  else if (data_page$page == "expert") {# Remplissage du selector de type groupe
    removeUI(selector = "#pTitleSelGroupe");
    removeUI(selector = "#selectGroupe");
    
    if (data_currentInd$declinaison == "taxo") {
      # Le selector de groupe doit être affiché
      insertUI(selector = "#selectDeclinaison", where = "afterEnd", ui = selectGroupe)
      insertUI(selector = "#selectGroupe", where = "beforeBegin", ui = titleSelectGroupe)
      
      for (i in 1:nrow(tabGroupe)) {
        if (isGroupeDispo(i, data_polesButtons)) {
          insertUI(selector = "#selectGroupe",
                   ui = tags$option(value = tabGroupe[i,1], tabGroupe[i,1]));
        }
      }
      
      if (!isGroupeDispo(findGroupeNum(data_currentInd$groupe), data_polesButtons)) {
        # Choix du groupe : cas de base "Toutes"
        data_currentInd$groupe <- "Toutes";
        data_currentInd$hasChanged <- TRUE;
      }
      # Cas valide : on ne change pas le groupe actuel
      else {}
    }
    else {
      if (data_currentInd$groupe != "RIEN") { data_currentInd$hasChanged <- TRUE; }
      data_currentInd$groupe <- "RIEN";
    }
  }
  else {
    print(paste("Erreur dans la page", data_page$page));
  }
  
  # Mise à jour du type d'indicateur affiché
  poles <- encodeFeux(data_polesButtons);
  session$onFlushed(function() {
    session$sendCustomMessage(type = 'actualizePolesButtons', message = poles);
  
    if (isolate(data_currentInd$groupe) != oldGroupe) {
      session$sendCustomMessage(type = 'setGroupe', message = isolate(data_currentInd$groupe));
    }
    else  {
      session$sendCustomMessage(type = 'selectNotChanged', message = "groupe");
    }
  });
}
























