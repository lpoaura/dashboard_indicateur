# Ce script permet de créer la liste des indicateurs, types d'indicateurs ainsi
# ainsi que les liens avec les pôles, taxonomies, années.

# Toutes les colonnes à renseigner lors de la mise en place d'une nouvelle
# catégorie d'indicateur
listColumns <- c("indName", "ind", "isGlobal", "isExpert",
                 "typeInd",
                 "isPole", "isTaxo", "isFournisseur", "isProducteur",
                 "isAnnees")

# Liste associée aux types d'indicateurs
listTypesIndicators <- c("Indicateur de connaissance"
                         , "Indicateurs d’état de la biodiversité"
                         , "Indicateurs de pressions anthropiques"
                         # ---!!! DERNIERE LIGNE TYPE INDICATEUR !!!--- #
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
# print(declinaisonIndicator)


# Liste associée aux groupes
listTaxonomies <- c("test1",
                    "test2",
                    "test3",
                    "test5");


# Liste associée aux indicateurs
tabIndicators <- data.frame(indName = "Nombre de données",
                            ind = "données",
                            isGlobal = TRUE,
                            isExpert = TRUE,
                            typeInd = "Indicateur de connaissance",
                            isPoles = TRUE,
                            isTaxo = TRUE,
                            isFournisseur = TRUE,
                            isProducteur = TRUE,
                            isAnnees = TRUE)
# indName, ind, isGlobal, typeInd, isPoles, isTaxo, isFournisseur, isProducteur, isAnnees
newRow <- list("Nombre d'espèces", "especes", TRUE, TRUE, "Indicateur de connaissance", TRUE, TRUE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);
newRow <- list("Indicateur de connaissances", "connaissances", TRUE, TRUE, "Indicateur de connaissance", TRUE, TRUE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);

newRow <- list("Nombre de données par taxonomie", "donneesTaxo", TRUE, FALSE, "Indicateur de connaissance", TRUE, TRUE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);
newRow <- list("Nombre d'espèces par taxonomie", "especesTaxo", TRUE, FALSE, "Indicateur de connaissance", TRUE, TRUE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);
newRow <- list("Indicateur de connaissances par taxonomie", "connaissancesTaxo", TRUE, FALSE, "Indicateur de connaissance", TRUE, TRUE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);

newRow <- list("Indicateur de réservoirs de biodiversité ", "revervoirBiodiv", TRUE, TRUE, "Indicateur de connaissance", FALSE, FALSE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);


newRow <- list("État des populations d’oiseaux communs", "oiseauxCommuns", TRUE, TRUE, "Indicateurs d’état de la biodiversité", FALSE, FALSE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);
newRow <- list("Populations de chiroptères", "chiropteres", TRUE, TRUE, "Indicateurs d’état de la biodiversité", FALSE, FALSE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);
newRow <- list("Répartition de la différence des statuts de liste rouge LRR et LRN", "listeRouge", TRUE, TRUE, "Indicateurs d’état de la biodiversité", FALSE, FALSE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);
newRow <- list("Proportion des listes d'espèces menacées parmi les listes régionales", "menacees", TRUE, TRUE, "Indicateurs d’état de la biodiversité", TRUE, TRUE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);


newRow <- list("Pollution lumineuse", "polutLum", TRUE, TRUE, "Indicateurs de pressions anthropiques", FALSE, FALSE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);
newRow <- list("Changement d'occupation du sol", "occupSol", TRUE, TRUE, "Indicateurs de pressions anthropiques", FALSE, FALSE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);
newRow <- list("Pression phytosanitaire", "phytosan", TRUE, TRUE, "Indicateurs de pressions anthropiques", FALSE, FALSE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);
# ---!!! DERNIERE LIGNE INDICATEUR !!!--- #
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
    removeUI(selector = "#pTitleSelGroupe");
    removeUI(selector = "#selectGroupe");
    if (taxoInd) {
      insertUI(selector = "#selectDeclinaison", where = "afterEnd", ui = selectGroupe)
      insertUI(selector = "#selectGroupe", where = "beforeBegin", ui = titleSelectGroupe)
      for (i in 1:length(listTaxonomies)) {
        insertUI(selector = "#selectGroupe",
                 ui = tags$option(value = listTaxonomies[[i]], listTaxonomies[[i]]));
      }
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
  nTypeInd <- 0;
  for (i in 1:length(listColumns)) {
    if (listColumns[[i]] == "typeInd") {
      nTypeInd <- i
    }
  }
  
  for (i in 1:nrow(tabIndicators)) {
    if (tabIndicators[i,nTypeInd] == typeInd) {
      return (tabIndicators[i,2]);
    }
  }
  print(paste("ERREUR sur le type d'indicateur d'un indicateur recherchée (findIndictorForType) :", typeInd));
  return ("NULL")
}


