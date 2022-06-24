# Ce script permet de créer la liste des indicateurs, types d'indicateurs ainsi
# ainsi que les liens avec les pôles, taxonomies, années.

# Toutes les colonnes à renseigner lors de la mise en place d'une nouvelle
# catégorie d'indicateur
listColumns <- c("indName", "ind", "isGlobal", "isExpert",
                 "typeInd",
                 "isPoles", "isTaxo", "isFournisseur", "isProducteur",
                 "isAnnees")

# Liste associée aux types d'indicateurs
listTypesIndicators <- c("Indicateur de connaissance"
                         , "Indicateurs d’état de la biodiversité"
                         # , "Indicateurs de pressions anthropiques"
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
tabGroupe <- data.frame(groupe = "RIEN",
                            isFlore = FALSE,
                            isInvertebre = FALSE,
                            isVertebre = FALSE);
newRow <- list("Toutes", TRUE, TRUE, TRUE);
tabGroupe <- rbind(tabGroupe,newRow);
# a<-dbGetQuery(con_gn, "SELECT distinct declinaison FROM orb_indicateurs.mv_sraddet_ind_taxo")
newRow <- list("Ptéridophytes", TRUE, FALSE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Oiseaux", FALSE, FALSE, TRUE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Bivalves", FALSE, TRUE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Gastéropodes", FALSE, TRUE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Gymnospermes", TRUE, FALSE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Autres", TRUE, TRUE, TRUE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Crustacés", FALSE, TRUE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Reptiles", FALSE, FALSE, TRUE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Insectes", FALSE, TRUE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Poissons", FALSE, FALSE, TRUE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Mousses", TRUE, FALSE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Mammifères", FALSE, FALSE, TRUE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Angiospermes", TRUE, FALSE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Arachnides", FALSE, TRUE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Diatomées", FALSE, TRUE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Myriapodes", FALSE, TRUE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Hépatiques et Anthocérotes", TRUE, FALSE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Amphibiens", FALSE, TRUE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
newRow <- list("Lichens", TRUE, FALSE, FALSE);
tabGroupe <- rbind(tabGroupe,newRow);
# ---!!! DERNIERE LIGNE GROUPE !!!--- #

getIsPoleGroupe <- function(taxo, pole) {
  nPole1 <- 0;
  nPole2 <- 0;
  if (pole == "Flore et Fongus") {
    nPole1 <- 2;
    nPole2 <- 2;
  }
  else if (pole == "Invertébrés") {
    nPole1 <- 3;
    nPole2 <- 3;
  }
  else if (pole == "Vertébrés") {
    nPole1 <- 4;
    nPole2 <- 4;
  }
  else if (pole == "Flore Invertébrés") {
    nPole1 <- 2;
    nPole2 <- 3;
  }
  else if (pole == "Flore Vertébrés") {
    nPole1 <- 2;
    nPole2 <- 4;
  }
  else if (pole == "Invertébrés Vertébrés") {
    nPole1 <- 3;
    nPole2 <- 4;
  }
  else { return(TRUE); }
  
  for (i in 1:nrow(tabGroupe)) {
    if ((tabGroupe[i,nPole1] || tabGroupe[i,nPole2]) && tabGroupe[i,1] == taxo) {
      return(TRUE);
    }
  }
  return(FALSE);
}

findPoleForTaxo <- function(taxo) {
  for (i in 1:nrow(tabGroupe)) {
    if (tabGroupe[i,1] == taxo) {
      if (tabGroupe[i,2] && tabGroupe[i,3] && tabGroupe[i,4]) {
        return("general");
      }
      else if (tabGroupe[i,2]) {
        return("Flore et Fongus");
      }
      else if (tabGroupe[i,3]) {
        return("Invertébrés");
      }
      else if (tabGroupe[i,4]) {
        return("Vertébrés");
      }
      else {
        return("none");
      }
    }
  }
  return("none");
}

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

newRow <- list("Nombre de données par taxonomie", "donnéesTaxo", TRUE, FALSE, "Indicateur de connaissance", TRUE, TRUE, TRUE, TRUE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);
newRow <- list("Nombre d'espèces par taxonomie", "especesTaxo", TRUE, FALSE, "Indicateur de connaissance", TRUE, TRUE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);
newRow <- list("Indicateur de connaissances par taxonomie", "connaissancesTaxo", TRUE, FALSE, "Indicateur de connaissance", TRUE, TRUE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);

# newRow <- list("Indicateur de réservoirs de biodiversité ", "revervoirBiodiv", TRUE, TRUE, "Indicateur de connaissance", FALSE, FALSE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);


# newRow <- list("État des populations d’oiseaux communs", "oiseauxCommuns", TRUE, TRUE, "Indicateurs d’état de la biodiversité", FALSE, FALSE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# newRow <- list("Populations de chiroptères", "chiropteres", TRUE, TRUE, "Indicateurs d’état de la biodiversité", FALSE, FALSE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
newRow <- list("Répartition des statuts de liste rouge", "listeRouge", TRUE, TRUE, "Indicateurs d’état de la biodiversité", FALSE, FALSE, FALSE, FALSE, TRUE);
tabIndicators <- rbind(tabIndicators,newRow);
# newRow <- list("Proportion des listes d'espèces menacées parmi les listes régionales", "menacees", TRUE, TRUE, "Indicateurs d’état de la biodiversité", TRUE, TRUE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);


# newRow <- list("Pollution lumineuse", "polutLum", TRUE, TRUE, "Indicateurs de pressions anthropiques", FALSE, FALSE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# newRow <- list("Changement d'occupation du sol", "occupSol", TRUE, TRUE, "Indicateurs de pressions anthropiques", FALSE, FALSE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# newRow <- list("Pression phytosanitaire", "phytosan", TRUE, TRUE, "Indicateurs de pressions anthropiques", FALSE, FALSE, FALSE, FALSE, TRUE);
# tabIndicators <- rbind(tabIndicators,newRow);
# ---!!! DERNIERE LIGNE INDICATEUR !!!--- #
print(tabIndicators)


# --------------- FONCTIONS AUXILIAIRES --------------- #

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


