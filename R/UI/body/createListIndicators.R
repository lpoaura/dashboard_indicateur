# Ce script permet de créer la liste des indicateurs, types d'indicateurs ainsi
# ainsi que les liens avec les pôles, taxonomies, années.


# Liste associée aux types d'informations
listColTypeInfo = c("name", "id");
typeInfoTab <- data.frame(name = "Renseignements", id = "ind1");
newRow <- list("Mode de représentation", "ind2");
typeInfoTab <- rbind(typeInfoTab,newRow);
# ---!!! DERNIERE LIGNE TYPE INFORMATION !!!--- #

# Liste associée aux categories d'information
listColTypeInfo = c("name", "id", "typeInfo");
categInfoTab <- data.frame(name = "Qui sommes-nous ?", id = "ind11", typeInfoId = "ind1");
newRow <- list("Nos collaborateurs", "ind12", "ind1");
categInfoTab <- rbind(categInfoTab,newRow);
newRow <- list("Contexte des indicateurs", "ind13", "ind1");
categInfoTab <- rbind(categInfoTab,newRow);
newRow <- list("Histogramme", "ind21", "ind2");
categInfoTab <- rbind(categInfoTab,newRow);
newRow <- list("Camembert", "ind22", "ind2");
categInfoTab <- rbind(categInfoTab,newRow);
newRow <- list("Diagramme en bar", "ind23", "ind2");
categInfoTab <- rbind(categInfoTab,newRow);
newRow <- list("Cartographie", "ind24", "ind2");
categInfoTab <- rbind(categInfoTab,newRow);
# ---!!! DERNIERE LIGNE CATEGORIE INFORMATION !!!--- #

# Fonction associées : findIdForTypeInfo, findTypeInfoForId, getNbCategInfoForType
# et getAllNbCategInfo
findIdForTypeInfo <- function(typeInfo) {
  for (i in 1:nrow(typeInfoTab)) {
    if (typeInfoTab[i,1] == typeInfo) {
      return (typeInfoTab[i,2]);
    }
  }
  print(paste("ERREUR sur le type de l'id recherché (findIdForTypeInfo) :", typeInfo));
  return ("RIEN")
}

findTypeInfoForId <- function(id) {
  for (i in 1:nrow(typeInfoTab)) {
    if (typeInfoTab[i,2] == id) {
      return (typeInfoTab[i,1]);
    }
  }
  print(paste("ERREUR sur l'id du type recherché (findTypeInfoForId) :", id));
  return ("RIEN")
}

getNbCategForType <- function(idType) {
  nbCateg <- 0;
  for (i in 1:nrow(categInfoTab)) {
    if (categInfoTab[i,3] == idType) {
      nbCateg <- nbCateg + 1;
    }
  }
  if (nbCateg != 0) {
    print("CATEG IN INFO")
    return(nbCateg);
  }
  else {
    for (i in 1:nrow(tabIndicators)) {
      isGlobal <- findIndicateurInfoByNum(i, "isGlobal");
      typeName <- findIndicateurInfoByNum(i, "typeInd");
      iType <- findTypeIndNum(typeName);
      if (typeIndTab[iType,2] == idType && isGlobal) {
        nbCateg <- nbCateg + 1;
      }
    }
    if (nbCateg != 0) {
      print("CATEG IN IND")
      return(nbCateg);
    }
    else {
      print(paste("ERREUR possible sur l'id de type dans la recherche du nombre de catégories (getNbCategForType) :", idType));
      return(nbCateg);
    }
  }
}

getAllNbCateg <- function() {
  listNbCateg <- c();
  nbType <- getNbTypeIndInfo();
  for (i in 1:nbType) {
    listNbCateg <- c(listNbCateg, getNbCategForType(paste("ind",i,sep="")));
  }
  return (listNbCateg);
}

# Toutes les colonnes à renseigner lors de la mise en place d'une nouvelle
# catégorie d'indicateur
listColumns <- c("indName", "ind", "isGlobal", "isExpert",
                 "typeInd",
                 "isPoles", "isTaxo", "isFournisseur", "isProducteur",
                 "isAnnees")

# Liste associée aux types d'indicateurs
listColTypeInd = c("name", "id");
typeIndTab <- data.frame(name = "Indicateur de connaissance", id = "ind3");
newRow <- list("Indicateurs d’état de la biodiversité", "ind4");
typeIndTab <- rbind(typeIndTab,newRow);
newRow <- list("Indicateurs de pressions anthropiques", "ind5");
typeIndTab <- rbind(typeIndTab,newRow);
# ---!!! DERNIERE LIGNE TYPE INDICATEUR !!!--- #

# Fonction associées : findIdForTypeInfo et findTypeInfoForId
findIdForTypeInd <- function(typeInd) {
  for (i in 1:nrow(typeIndTab)) {
    if (typeIndTab[i,1] == typeInd) {
      return (typeIndTab[i,2]);
    }
  }
  print(paste("ERREUR sur le type de l'id recherché (findIdForTypeInd) :", typeInd));
  return ("RIEN")
}

findTypeIndForId <- function(id) {
  for (i in 1:nrow(typeIndTab)) {
    if (typeIndTab[i,2] == id) {
      return (typeIndTab[i,1]);
    }
  }
  print(paste("ERREUR sur l'id du type recherché (findTypeIndForId) :", id));
  return ("RIEN")
}

findTypeIndNum <- function(typeInd) {
  for (i in 1:nrow(typeIndTab)) {
    if (typeIndTab[i,1] == typeInd) {
      return (i);
    }
  }
  print(paste("ERREUR sur le type d'indicateur d'indice recherché (findTypeIndNum) :", groupe));
  return (-1)
}

getNbTypeIndInfo <- function() {
  return(nrow(typeIndTab) + nrow(typeInfoTab));
}

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
tabGroupe <- data.frame(groupe = "RIEN",
                            isFlore = FALSE,
                            isInvertebre = FALSE,
                            isVertebre = FALSE);
newRow <- list("all", TRUE, TRUE, TRUE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("test1", TRUE, FALSE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("test2", FALSE, FALSE, TRUE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("test3", FALSE, TRUE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("test4", TRUE, FALSE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("test5", FALSE, FALSE, TRUE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("test6", FALSE, FALSE, TRUE);
tabGroupe <- rbind(tabGroupe,newRow);


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

# newRow <- list("Nombre de données par taxonomie", "donnéesTaxo", TRUE, FALSE, "Indicateur de connaissance", TRUE, TRUE, TRUE, TRUE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# newRow <- list("Nombre d'espèces par taxonomie", "especesTaxo", TRUE, FALSE, "Indicateur de connaissance", TRUE, TRUE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# newRow <- list("Indicateur de connaissances par taxonomie", "connaissancesTaxo", TRUE, FALSE, "Indicateur de connaissance", TRUE, TRUE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# 
# newRow <- list("Indicateur de réservoirs de biodiversité ", "revervoirBiodiv", TRUE, TRUE, "Indicateur de connaissance", FALSE, FALSE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# 
# 
# newRow <- list("État des populations d’oiseaux communs", "oiseauxCommuns", TRUE, TRUE, "Indicateurs d’état de la biodiversité", FALSE, FALSE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# newRow <- list("Populations de chiroptères", "chiropteres", TRUE, TRUE, "Indicateurs d’état de la biodiversité", FALSE, FALSE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# newRow <- list("Répartition de la différence des statuts de liste rouge LRR et LRN", "listeRouge", TRUE, TRUE, "Indicateurs d’état de la biodiversité", FALSE, FALSE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# newRow <- list("Proportion des listes d'espèces menacées parmi les listes régionales", "menacees", TRUE, TRUE, "Indicateurs d’état de la biodiversité", TRUE, TRUE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# 
# 
# newRow <- list("Pollution lumineuse", "polutLum", TRUE, TRUE, "Indicateurs de pressions anthropiques", FALSE, FALSE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# newRow <- list("Changement d'occupation du sol", "occupSol", TRUE, TRUE, "Indicateurs de pressions anthropiques", FALSE, FALSE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# newRow <- list("Pression phytosanitaire", "phytosan", TRUE, TRUE, "Indicateurs de pressions anthropiques", FALSE, FALSE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# 
# newRow <- list("Test", "test", FALSE, TRUE, "Indicateurs de pressions anthropiques", FALSE, FALSE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# ---!!! DERNIERE LIGNE INDICATEUR !!!--- #
print(tabIndicators)

# # Initialisation des selectors selon la page globale ou la page experte
# initSelectorsFct <- function (input, output, session, page, fromPage, currentInd, currentIndName, poles, fromPrgm = "NONE") {
#   removeUI(selector = "#selectTypeIndicator option", multiple = TRUE)
#   removeUI(selector = "#selectIndicator option", multiple = TRUE)
#   removeUI(selector = "#selectDeclinaison option", multiple = TRUE)
#   removeUI(selector = "#selectGroupe option", multiple = TRUE)
#   
#   print(paste("Changement de selectors for page", page));
#   print(paste("Changement de selectors from page", fromPage));
#   print(paste("Changement de selectors for indic", currentInd));
#   print(paste("Changement de selectors for poles", poles));
#   print(paste("Changement de selectors for declinaison", isolate(input$selectDeclinaison)));
#   print(paste("Changement de selectors from program", fromPrgm));
#   numInd <- findIndicateurNum(currentInd);
#   # Remplissage du seul sélect de la page globale
#   if (page == "global" || page == "init") {
#     
#     if (fromPage == "expert") {
#       if (findIndicateurInfoByNum(numInd, "isGlobal") == FALSE) {
#         currentInd <- "données";
#         currentIndName <- "Nombre de données";
#       }
#       if (input$selectDeclinaison == "taxo") {
#         switch(currentInd,
#                "données" = {
#                  currentInd <- "donnéesTaxo";
#                  currentIndName <- "Nombre de données par taxonomie";
#                },
#                "especes" = {
#                  currentInd <- "especesTaxo";
#                  currentIndName <- "Nombre d'espèces par taxonomie";
#                },
#                "connaissances" = {
#                  currentInd <- "connaissancesTaxo";
#                  currentIndName <- "Indicateur de connaissances par taxonomie";
#                }
#         );
#       }
#     }
#     
#     for (i in 1:nrow(tabIndicators)) {
#       if (findIndicateurInfoByNum(i, "isGlobal")) {
#         insertUI(selector = "#selectIndicator",
#                  ui = tags$option(value = tabIndicators[i,2], tabIndicators[i,1]));
#       }
#     }
#   }
#   
#   # Remplissage des 4 sélects de la page experte
#   else {
#     # Remplissage du selector de type d'indicateur
#     typeInd <- findIndicateurInfoByNum(numInd, "typeInd");
#     for(el in listTypesIndicators) {
#       insertUI(selector = "#selectTypeIndicator",
#                ui = tags$option(value = el, el));
#     }
#     
#     # Remplissage du selector d'indicateur (catégorie)
#     for (i in 1:nrow(tabIndicators)) {
#       if (findIndicateurInfoByNum(i, "typeInd") == typeInd && findIndicateurInfoByNum(i, "isExpert") == TRUE) {
#         insertUI(selector = "#selectIndicator",
#                  ui = tags$option(value = tabIndicators[i,2], tabIndicators[i,1]));
#       }
#     }
#     
#     # Remplissage du selector de type déclinaison
#     listDecli <- c(TRUE);
#     polesInd <- findIndicateurInfoByNum(numInd, "isPoles");
#     listDecli <- append(listDecli, polesInd);
#     taxoInd <- findIndicateurInfoByNum(numInd, "isTaxo");
#     listDecli <- append(listDecli, taxoInd);
#     listDecli <- append(listDecli, findIndicateurInfoByNum(numInd, "isFournisseur"));
#     listDecli <- append(listDecli, findIndicateurInfoByNum(numInd, "isProducteur"));
#     print(listDecli)
#     
#     for(i in 1:nrow(declinaisonIndicator)) {
#       if (listDecli[[i]]) {
#         insertUI(selector = "#selectDeclinaison",
#                  ui = tags$option(value = declinaisonIndicator[i,2], declinaisonIndicator[i,1]));
#       }
#     }
#     
#     # Déclinaison en cours
#     nDecli <- 1;
#     if (fromPage == "global" && findIndicateurInfoByNum(numInd, "isExpert") == FALSE) {
#       print("SPECIAL INDICATOR FROM GLOBAL");
#       switch(currentInd,
#              "donnéesTaxo" = {
#                currentInd <- "données";
#                currentIndName <- "Nombre de données";
#                nDecli <- findDecliNum("taxo");
#              },
#              "especesTaxo" = {
#                currentInd <- "especes";
#                currentIndName <- "Nombre d'espèces";
#                nDecli <- findDecliNum("taxo");
#              },
#              "connaissancesTaxo" = {
#                currentInd <- "connaissances";
#                currentIndName <- "Indicateur de connaissances";
#                nDecli <- findDecliNum("taxo");
#              }
#       );
#     }
#     else if (fromPage != "expert") {
#       if (poles != "all" && poles != "general") {
#         nDecli <- findDecliNum("poles")
#       }
#       else {
#         nDecli <- findDecliNum("general")
#       }
#     }
#     # On était sur la page expert et la sélection était initialisée (doit
#     # toujours être le cas en utilisation normale, on vérifie quand même)
#     else if (!is.null(input$selectDeclinaison)) {
#       if (poles != "all" && poles != "general" && input$selectDeclinaison == "general") {
#         if (polesInd) {
#           print("HERE")
#           nDecli <- findDecliNum("poles");
#         }
#         else { # Devrait être un cas exceptionnel...
#           nDecli <- findDecliNum("general");
#           poles <- "all";
#         }
#       }
#       else if (poles == "all" && input$selectDeclinaison == "poles") {
#         nDecli <- findDecliNum("general");
#         poles <- "all";
#       }
#       # On ne change pas de déclinaison
#       else {
#         nDecli <- findDecliNum(input$selectDeclinaison);
#       }
#     }
#     
#     
#     # Remplissage du selector de type groupe
#     removeUI(selector = "#pTitleSelGroupe");
#     removeUI(selector = "#selectGroupe");
#     if (taxoInd) {
#       insertUI(selector = "#selectDeclinaison", where = "afterEnd", ui = selectGroupe)
#       insertUI(selector = "#selectGroupe", where = "beforeBegin", ui = titleSelectGroupe)
#       for (i in 1:length(listTaxonomies)) {
#         insertUI(selector = "#selectGroupe",
#                  ui = tags$option(value = listTaxonomies[[i]], listTaxonomies[[i]]));
#       }
#     }
#     
#     # Remplissage du selector de type de représentation cartographique ?
#   }
#   
#   session$onFlushed(function() {
#     session$sendCustomMessage(type = 'setIndicator', message = currentInd);
#     session$sendCustomMessage(type = 'actualizePolesButtons', message = poles);
#     # session$sendCustomMessage(type = 'updateIndicatorName', message = currentIndName);
#     if (page == "expert") {
#       session$sendCustomMessage(type = 'setTypeIndicatorName', message = typeInd);
#       session$sendCustomMessage(type = 'setDeclinaisonName', message = nDecli);
#       if (taxoInd) {
#         session$sendCustomMessage(type = 'setGroupeName', message = typeInd);
#       }
#     }
#   });
# }



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

# Permet de trouver le numéro d'une déclinaison
findDecliNum <- function(decli) {
  for (i in 1:nrow(declinaisonIndicator)) {
    if (declinaisonIndicator[i,1] == decli || declinaisonIndicator[i,2] == decli) {
      return (i);
    }
  }
  print(paste("ERREUR sur la déclinaison d'indice recherché (findDecliNum) :", decli));
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


# Permet de savoir si un groupe est disponible
isGroupeDispo <- function(nGroupe, data_polesButtons) {
  if ((tabGroupe[nGroupe,2] && data_polesButtons$flore) ||
      (tabGroupe[nGroupe,3] && data_polesButtons$invertebre) ||
      (tabGroupe[nGroupe,4] && data_polesButtons$vertebre))
  {
    return(TRUE);
  }
  else {
    return(FALSE);
  }
}


# Permet de connaitre le numéro d'un groupe
findGroupeNum <- function(groupe) {
  for (i in 1:nrow(tabGroupe)) {
    if (tabGroupe[i,1] == groupe) {
      return (i);
    }
  }
  print(paste("ERREUR sur le groupe d'indice recherché (findGroupeNum) :", groupe));
  return (-1)
}


