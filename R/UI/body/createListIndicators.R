# Ce script permet de créer la liste des indicateurs, types d'indicateurs ainsi
# ainsi que les liens avec les pôles, taxonomies, années.

# Toutes les colonnes à renseigner lors de la mise en place d'une nouvelle
# catégorie d'indicateur
listColumns <- c("indName", "ind", "isGlobal",
                 "typeInd",
                 "isPole", "isTaxo", "isFournisseur", "isProducteur",
                 "isAnnees")

# Liste associée aux types d'indicateurs
listTypesIndicators <- c("Indicateur de connaissance",
                         "Indicateur de connaissance2"
                         # ---!!! DERNIERE LIGNE de listTypesIndicators !!!--- #
);

# Liste associée aux pôles
listDeclinaisonIndName <- c("Général",
                            "Pôles",
                            "Taxonomie",
                            "Par fournisseur",
                            "Par producteur");
listDeclinaisonInd <- c("general",
                        "poles",
                        "taxo",
                        "fournisseur",
                        "producteur");
declinaisonIndicator <- data.frame(name = listDeclinaisonIndName, value = listDeclinaisonInd)
print(declinaisonIndicator)

# Liste associée aux groupes
listTaxonomies <- c("test1",
                    "test2",
                    "test3",
                    "test5");

# Listes associées aux indicateur (catégories)
listIndicators <- c("Nombre de données",
                    "Nombre d'espèces",
                    "Indicateur de connaissances"
                    # ---!!! DERNIERE LIGNE indName !!!--- #
);

valIndicators <- c("données",
                   "especes",
                   "connaissances"
                   # ---!!! DERNIERE LIGNE indicator !!!--- #
);

isGlobalIndicator <- c(TRUE,
                       TRUE,
                       TRUE
                       # ---!!! DERNIERE LIGNE isGlobal !!!--- #
);

isPolesIndicator <- c(TRUE,
                      TRUE,
                      TRUE
                      # ---!!! DERNIERE LIGNE isPoles !!!--- #
);

isTaxoIndicator <- c(TRUE,
                     FALSE,
                     TRUE
                     # ---!!! DERNIERE LIGNE isTaxo !!!--- #
);

isFournIndicator <- c(TRUE,
                      FALSE,
                      TRUE
                      # ---!!! DERNIERE LIGNE isFournisseur !!!--- #
);

isProdIndicator <- c(TRUE,
                     TRUE,
                     TRUE
                     # ---!!! DERNIERE LIGNE isProducteur !!!--- #
);

isAnneesIndicator <- c(TRUE,
                       TRUE,
                       TRUE
                       # ---!!! DERNIERE LIGNE isAnnees !!!--- #
);

typeIndicator <- c("Indicateur de connaissance",
                   "Indicateur de connaissance2",
                   "Indicateur de connaissance"
                   # ---!!! DERNIERE LIGNE typeIndicator !!!--- #
);

# Regroupement de toures les informations
tabIndicators <- data.frame(indName = listIndicators,
                            ind = valIndicators,
                            isGlobal = isGlobalIndicator,
                            typeInd = typeIndicator,
                            isPoles = isPolesIndicator,
                            isTaxo = isTaxoIndicator,
                            isFournisseur = isFournIndicator,
                            isProducteur = isProdIndicator,
                            isAnnees = isAnneesIndicator)
print(tabIndicators)



# Initialisation des selectors selon la page globale ou la page experte
initSelectorsFct <- function (input, output, session, page, currentInd, currentIndName, poles) {
  removeUI(selector = "#selectTypeIndicator option", multiple = TRUE)
  removeUI(selector = "#selectIndicator option", multiple = TRUE)
  removeUI(selector = "#selectDeclinaison option", multiple = TRUE)
  removeUI(selector = "#selectGroupe option", multiple = TRUE)
  
  print(paste("Changement de selectors for page", page));
  # Remplissage du seul sélect de la page globale
  if (page == "global" || page == "init") {
    for (i in 1:nrow(tabIndicators)) {
      if (findIndicateurInfoByNum(i, "isGlobal")) {
        insertUI(selector = "#selectIndicator",
                 ui = tags$option(value = tabIndicators[i,2], tabIndicators[i,1]));
      }
    }
  }
  
  # Remplissage des 4 sélects de la page experte
  else {
    numInd <- findIndicateurNum(currentInd);
    
    # Remplissage du selector de type d'indicateur
    typeInd <- findIndicateurInfoByNum(numInd, "typeInd");
    for(el in listTypesIndicators) {
      insertUI(selector = "#selectTypeIndicator",
               ui = tags$option(value = el, el));
    }
    
    # Remplissage du selector d'indicateur (catégorie)
    for (i in 1:nrow(tabIndicators)) {
      if (findIndicateurInfoByNum(i, "typeInd") == typeInd) {
        insertUI(selector = "#selectIndicator",
                 ui = tags$option(value = tabIndicators[i,2], tabIndicators[i,1]));
      }
    }
    
    # Remplissage du selector de type déclinaison
    listDecl <- c(TRUE);
    listDecl <- append(listDecl, findIndicateurInfoByNum(numInd, "isPole"));
    taxoInd <- findIndicateurInfoByNum(numInd, "isTaxo");
    listDecl <- append(listDecl, taxoInd);
    listDecl <- append(listDecl, findIndicateurInfoByNum(numInd, "isFournisseur"));
    listDecl <- append(listDecl, findIndicateurInfoByNum(numInd, "isProducteur"));
    for(i in 1:nrow(declinaisonIndicator)) {
      if (listDecl[[i]]) {
        insertUI(selector = "#selectDeclinaison",
                 ui = tags$option(value = declinaisonIndicator[i,2], declinaisonIndicator[i,1]));
      }
    }
    
    # Remplissage du selector de type groupe
    if (taxoInd) {
      for (i in 1:length(listTaxonomies)) {
        insertUI(selector = "#selectGroupe",
                 ui = tags$option(value = listTaxonomies[[i]], listTaxonomies[[i]]));
      }
    } 
    else {
      removeUI(selector = "#pTitleSelGroupe");
      removeUI(selector = "#selectGroupe");
    }
    
    # Remplissage du selector de type de représentation cartographique ?
  }
  
  session$onFlushed(function() {
    session$sendCustomMessage(type = 'setIndicator', message = currentInd);
    session$sendCustomMessage(type = 'actualizePolesButtons', message = poles);
    session$sendCustomMessage(type = 'updateIndicatorName', message = currentIndName);
    if (page == "expert") {
      session$sendCustomMessage(type = 'setTypeIndicatorName', message = typeInd);
    }
  });
}



# Permet de trouver le numéro d'un indicateur
findIndicateurNum <- function(currentInd) {
  
  for (i in 1:nrow(tabIndicators)) {
    if (tabIndicators[i,2] == currentInd) {
      return (i);
    }
  }
  print(paste("ERREUR sur l'indicateur d'une information recherchée (findIndicateurNum) :", currentInd));
  return (-1)
}


# Permet de trouver une information sur un indicateur par son numéro
findIndicateurInfoByNum <- function(numInd, information) {
  nInfo <- 0;
  for (i in 1:length(listColumns)) {
    if (listColumns[[i]] == information) {
      nInfo <- i
    }
  }
  if (nInfo == 0) {
    print(paste("ERREUR sur l'information d'une information recherchée (findIndicateurInfoByNum) :", information));
    return ("RIEN")
  } 
  else {
    return (tabIndicators[numInd,nInfo]);
  }
}


# Permet de trouver une information sur un indicateur
findIndicateurInfo <- function(currentInd, information) {
  numInd <- findIndicateurNum(currentInd)
  if (numInd != -1) {
    return(findIndicateurInfoByNum(numInd, information));
  } else {
    return("NULL");
  }
}


# Permet de trouver le 1er indicateur d'un type
findIndictorForType <- function(typeInd) {
  for (i in 1:nrow(tabIndicators)) {
    if (tabIndicators[i,4] == typeInd) {
      return (tabIndicators[i,2]);
    }
  }
  print(paste("ERREUR sur le type d'indicateur d'un indicateur recherchée (findIndictorForType) :", typeInd));
  return ("NULL")
}


