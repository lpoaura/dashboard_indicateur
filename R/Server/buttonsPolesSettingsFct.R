# Ce fichier crée une fonction qui sera appelée dans le server pour gérer les
# boutons de choix de pôles dans le bandeau de settings

buttonsPolesSettingsFct <- function(input, output, session, data_polesButtons, data_polesFeux, data_currentInd, data_year, data_page) {
  
  #--------------- Bouton Fleur ---------------#
  observeEvent(input$actionButtonFlower, {
    print("Flower button pressed");
    
    # Il faut que les poles soient disponibles pour l'indicateur actuel
    if (findIndicateurInfo(data_currentInd$indicator, "isPoles")) {
      data_polesButtonsOrdered <- reactiveValues(
        actualData = data_polesButtons$flore,
        otherData1 = data_polesButtons$invertebre,
        otherData2 = data_polesButtons$vertebre
      );
      actualName <- "fleur";
      otherName1 <- "abeille";
      otherName2 <- "patte";
      actualButton <- 'Flower';
      otherButton1 <- 'Bee';
      otherButton2 <- 'Paw';
      
      processPolesButtons(actualName, otherName1, otherName2,
                          actualButton, otherButton1, otherButton2,
                          data_polesButtonsOrdered)
      
      data_polesButtons$flore <- data_polesButtonsOrdered$actualData
      data_polesButtons$invertebre <- data_polesButtonsOrdered$otherData1
      data_polesButtons$vertebre <- data_polesButtonsOrdered$otherData2
      
      actializeFeux(session, data_polesButtons, data_polesFeux);
      
      
      # Changement des selectors et des graphiques
      data_currentInd$hasChanged <- TRUE;
      modifyDecliSelectFct(input, output, session,
                           data_currentInd, data_polesButtons,
                           data_page, fromPrgm = "buttonFlore")
    }
  })
  
  #--------------- Bouton Abeille ---------------#
  observeEvent(input$actionButtonBee, {
    print("Bee button pressed");
    
    # Il faut que les poles soient disponibles pour l'indicateur actuel
    if (findIndicateurInfo(data_currentInd$indicator, "isPoles")) {
      data_polesButtonsOrdered <- reactiveValues(
        actualData = data_polesButtons$invertebre,
        otherData1 = data_polesButtons$flore,
        otherData2 = data_polesButtons$vertebre
      );
      actualName <- "abeille";
      otherName1 <- "fleur";
      otherName2 <- "patte";
      actualButton <- 'Bee';
      otherButton1 <- 'Flower';
      otherButton2 <- 'Paw';
      
      processPolesButtons(actualName, otherName1, otherName2,
                          actualButton, otherButton1, otherButton2,
                          data_polesButtonsOrdered)
      
      
      data_polesButtons$invertebre <- data_polesButtonsOrdered$actualData
      data_polesButtons$flore <- data_polesButtonsOrdered$otherData1
      data_polesButtons$vertebre <- data_polesButtonsOrdered$otherData2
      
      actializeFeux(session, data_polesButtons, data_polesFeux);
      
      stringForJS <- encodeFeux(data_polesButtons);
      session$sendCustomMessage(type = 'actualizePolesButtons', message = stringForJS);
      
      
      # Changement des selectors et des graphiques
      data_currentInd$hasChanged <- TRUE;
      modifyDecliSelectFct(input, output, session,
                           data_currentInd, data_polesButtons,
                           data_page, fromPrgm = "buttonInvertebre")
    }
  })
  
  #--------------- Bouton Patte ---------------#
  observeEvent(input$actionButtonPaw, {
    print("Bee button pressed");
    
    # Il faut que les poles soient disponibles pour l'indicateur actuel
    if (findIndicateurInfo(data_currentInd$indicator, "isPoles")) {
      data_polesButtonsOrdered <- reactiveValues(
        actualData = data_polesButtons$vertebre,
        otherData1 = data_polesButtons$flore,
        otherData2 = data_polesButtons$invertebre
      );
      actualName <- "patte";
      otherName1 <- "fleur";
      otherName2 <- "abeille";
      actualButton <- 'Paw';
      otherButton1 <- 'Flower';
      otherButton2 <- 'Bee';
      
      processPolesButtons(actualName, otherName1, otherName2,
                          actualButton, otherButton1, otherButton2,
                          data_polesButtonsOrdered)
      
      data_polesButtons$vertebre <- data_polesButtonsOrdered$actualData
      data_polesButtons$flore <- data_polesButtonsOrdered$otherData1
      data_polesButtons$invertebre <- data_polesButtonsOrdered$otherData2
      
      actializeFeux(session, data_polesButtons, data_polesFeux);
      
      stringForJS <- encodeFeux(data_polesButtons);
      session$sendCustomMessage(type = 'actualizePolesButtons', message = stringForJS);
      
      
      # Changement des selectors et des graphiques
      data_currentInd$hasChanged <- TRUE;
      modifyDecliSelectFct(input, output, session,
                           data_currentInd, data_polesButtons,
                           data_page, fromPrgm = "buttonVertebre")
    }
  })
}


# --------------- Les trois boutons étaient actifs ---------------#
allActivePolesButtons <- function(actualName, otherName1, otherName2,
                                  actualButton, otherButton1, otherButton2,
                                  data_polesButtonsOrdered) 
{
  removeUI(selector = paste('#actionButton', actualButton, '>img', sep=""))
  insertUI(selector = paste('#actionButton', actualButton, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", actualName, ".png", sep=""),
                    width=50,
                    height=50))
  
  removeUI(selector = paste('#actionButton', otherButton1, '>img', sep=""))
  insertUI(selector = paste('#actionButton', otherButton1, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", otherName1, "_gris.png", sep=""),
                    width=50,
                    height=50))
  data_polesButtonsOrdered$otherData1 = FALSE;
  
  removeUI(selector = paste('#actionButton', otherButton2, '>img', sep=""))
  insertUI(selector = paste('#actionButton', otherButton2, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", otherName2, "_gris.png", sep=""),
                    width=50,
                    height=50))
  data_polesButtonsOrdered$otherData2 = FALSE;
}

# --------------- Les deux autres boutons étaient actifs, mais pas lui ---------------#
othersActivePolesButtons <- function(actualName, otherName1, otherName2,
                                     actualButton, otherButton1, otherButton2,
                                     data_polesButtonsOrdered)
{
  removeUI(selector = paste('#actionButton', actualButton, '>img', sep=""))
  insertUI(selector = paste('#actionButton', actualButton, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", actualName, ".png", sep=""),
                    width=50,
                    height=50))
  data_polesButtonsOrdered$actualData = TRUE;
  
  removeUI(selector = paste('#actionButton', otherButton1, '>img', sep=""))
  insertUI(selector = paste('#actionButton', otherButton1, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", otherName1, ".png", sep=""),
                    width=50,
                    height=50))
  
  removeUI(selector = paste('#actionButton', otherButton2, '>img', sep=""))
  insertUI(selector = paste('#actionButton', otherButton2, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", otherName2, ".png", sep=""),
                    width=50,
                    height=50))
}

# --------------- Ce bouton n'était pas le seul actif ---------------#
meNotOnlyActivePolesButtons <- function(actualName, otherName1, otherName2,
                                        actualButton, otherButton1, otherButton2,
                                        data_polesButtonsOrdered)
{
  removeUI(selector = paste('#actionButton', actualButton, '>img', sep=""))
  insertUI(selector = paste('#actionButton', actualButton, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", actualName, "_gris.png", sep=""),
                    width=50,
                    height=50))
  data_polesButtonsOrdered$actualData = FALSE;
}

# --------------- Ce bouton était le seul actif ---------------#
meOnlyActivePolesButtons <- function(actualName, otherName1, otherName2,
                                     actualButton, otherButton1, otherButton2,
                                     data_polesButtonsOrdered)
{
  removeUI(selector = paste('#actionButton', actualButton, '>img', sep=""))
  insertUI(selector = paste('#actionButton', actualButton, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", actualName, ".png", sep=""),
                    width=50,
                    height=50))
  
  removeUI(selector = paste('#actionButton', otherButton1, '>img', sep=""))
  insertUI(selector = paste('#actionButton', otherButton1, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", otherName1, ".png", sep=""),
                    width=50,
                    height=50))
  data_polesButtonsOrdered$otherData1 = TRUE;
  
  removeUI(selector = paste('#actionButton', otherButton2, '>img', sep=""))
  insertUI(selector = paste('#actionButton', otherButton2, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", otherName2, ".png", sep=""),
                    width=50,
                    height=50))
  data_polesButtonsOrdered$otherData2 = TRUE;
}

# --------------- Un autre bouton était actif ---------------#
otherActivePolesButtons <- function(actualName, otherName1, otherName2,
                                    actualButton, otherButton1, otherButton2,
                                    data_polesButtonsOrdered)
{
  removeUI(selector = paste('#actionButton', actualButton, '>img', sep=""))
  insertUI(selector = paste('#actionButton', actualButton, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", actualName, ".png", sep=""),
                    width=50,
                    height=50))
  data_polesButtonsOrdered$actualData = TRUE;
  
  # Modification : un seul pôle actif
  if (data_polesButtonsOrdered$otherData1) {
    removeUI(selector = paste('#actionButton', otherButton1, '>img', sep=""))
    insertUI(selector = paste('#actionButton', otherButton1, sep=""),
             ui = img(src = paste("Resources/pictogrammes/", otherName1, "_gris.png", sep=""),
                      width=50,
                      height=50))
    data_polesButtonsOrdered$otherData1 = FALSE;
  }
  else {
    removeUI(selector = paste('#actionButton', otherButton2, '>img', sep=""))
    insertUI(selector = paste('#actionButton', otherButton2, sep=""),
             ui = img(src = paste("Resources/pictogrammes/", otherName2, "_gris.png", sep=""),
                      width=50,
                      height=50))
    data_polesButtonsOrdered$otherData2 = FALSE;
  }
}

# --------------- Permet de process le clic sur un bouton ---------------#
processPolesButtons <- function(actualName, otherName1, otherName2,
                                actualButton, otherButton1, otherButton2,
                                data_polesButtonsOrdered)
{
  if(data_polesButtonsOrdered$actualData && data_polesButtonsOrdered$otherData1 && data_polesButtonsOrdered$otherData2) {
    allActivePolesButtons(actualName, otherName1, otherName2,
                          actualButton, otherButton1, otherButton2,
                          data_polesButtonsOrdered);
  }
  else {
    # Les deux autres boutons étaient actifs, mais pas lui
    if(data_polesButtonsOrdered$otherData1 && data_polesButtonsOrdered$otherData2) {
      othersActivePolesButtons(actualName, otherName1, otherName2,
                               actualButton, otherButton1, otherButton2,
                               data_polesButtonsOrdered)
    }
    else {
      # Ce bouton était actif
      if (data_polesButtonsOrdered$actualData) {
        # Ce bouton n'était pas le seul actif
        if (data_polesButtonsOrdered$otherData1 || data_polesButtonsOrdered$otherData2) {
          meNotOnlyActivePolesButtons(actualName, otherName1, otherName2,
                                      actualButton, otherButton1, otherButton2,
                                      data_polesButtonsOrdered)
        }
        # Ce bouton était le seul actif
        else {
          meOnlyActivePolesButtons(actualName, otherName1, otherName2,
                                   actualButton, otherButton1, otherButton2,
                                   data_polesButtonsOrdered)
        }
      }
      # Ce bouton n'était pas actif
      else {
        # Aucun bouton n'était actif, cas théoriquement impossible
        if (!data_polesButtonsOrdered$otherData1 && !data_polesButtonsOrdered$otherData2) {
          print("/!\ NO ACTIVE BUTTONS");
        }
        # Un autre bouton était actif
        else  {
          otherActivePolesButtons(actualName, otherName1, otherName2,
                                  actualButton, otherButton1, otherButton2,
                                  data_polesButtonsOrdered)
        }
      }
    }
  }
}

# --------------- Permet d'actualiser les feux ---------------#
actializeFeux <- function(session, data_polesButtons, data_polesFeux)
{
  if (!data_polesButtons$flore && data_polesFeux$flore) {
    data_polesFeux$flore <- FALSE;
    removeUI(selector = '#feuFlore>img')
    insertUI(selector = '#feuFlore',
             ui = img(src = "Resources/pictogrammes/rond_gris.png",
                      width=15,
                      height=15))
  }
  else if (!data_polesButtons$invertebre && !data_polesButtons$vertebre) {
    data_polesFeux$flore <- TRUE;
    removeUI(selector = '#feuFlore>img')
    insertUI(selector = '#feuFlore',
             ui = img(src = "Resources/pictogrammes/rond_vert.png",
                      width=15,
                      height=15))
  }
  
  if (!data_polesButtons$invertebre && data_polesFeux$invertebre) {
    data_polesFeux$invertebre <- FALSE;
    removeUI(selector = '#feuInvertebre>img')
    insertUI(selector = '#feuInvertebre',
             ui = img(src = "Resources/pictogrammes/rond_gris.png",
                      width=15,
                      height=15))
  }
  else if (!data_polesButtons$flore && !data_polesButtons$vertebre) {
    data_polesFeux$invertebre <- TRUE;
    removeUI(selector = '#feuInvertebre>img')
    insertUI(selector = '#feuInvertebre',
             ui = img(src = "Resources/pictogrammes/rond_orange.png",
                      width=15,
                      height=15))
  }
  
  if (!data_polesButtons$vertebre && data_polesFeux$vertebre) {
    data_polesFeux$vertebre <- FALSE;
    removeUI(selector = '#feuVertebre>img')
    insertUI(selector = '#feuVertebre',
             ui = img(src = "Resources/pictogrammes/rond_gris.png",
                      width=15,
                      height=15))
  }
  else if (!data_polesButtons$invertebre && !data_polesButtons$flore) {
    data_polesFeux$vertebre <- TRUE;
    removeUI(selector = '#feuVertebre>img')
    insertUI(selector = '#feuVertebre',
             ui = img(src = "Resources/pictogrammes/rond_bleu.png",
                      width=15,
                      height=15))
  }
  
  
  stringForJS <- encodeFeux(data_polesFeux);
  session$sendCustomMessage(type = 'actualizeFeux', message = stringForJS)
}

# --------------- Permet d'encoder pour faire une requête SQL ---------------#
convertPolesForRequest <- function(poleStr) {
  res <- "";
  switch(poleStr,
         "all" = res <- "general",
         "fi" = res <- "Flore Invertébrés",
         "fv" = res <- "Flore Vertébrés",
         "iv" = res <- "Invertébrés Vertébrés",
         "flore" = res <- "Flore et Fongus",
         "invertebre" = res <- "Invertébrés",
         "vertebre" = res <- "Vertébrés",
         "rien" = res <- "rien"
  );
  
  return(res);
}

# --------------- Permet de réinitialiser les couleurs de tous les feux et boutons --------------- #
# Initialisation des boutons de pôles
setPolesFct <- function(session, data_polesButtons) {
  # Les 3 pôles sont allumés
  if (data_polesButtons$flore && data_polesButtons$invertebre && data_polesButtons$vertebre) {
    removeUI(selector = '#actionButtonFlower>img')
    insertUI(selector = '#actionButtonFlower',
             ui = img(src = "Resources/pictogrammes/fleur.png",
                      width=50,
                      height=50))
    removeUI(selector = '#actionButtonBee>img')
    insertUI(selector = '#actionButtonBee',
             ui = img(src = "Resources/pictogrammes/abeille.png",
                      width=50,
                      height=50))
    removeUI(selector = '#actionButtonPaw>img')
    insertUI(selector = '#actionButtonPaw',
             ui = img(src = "Resources/pictogrammes/patte.png",
                      width=50,
                      height=50))
  } 
  # Au moins 1 des 3 pôle n'es pas allumé
  else {
    if (data_polesButtons$flore) {
      removeUI(selector = '#actionButtonFlower>img')
      insertUI(selector = '#actionButtonFlower',
               ui = img(src = "Resources/pictogrammes/fleur.png",
                        width=50,
                        height=50))
    } else {
      removeUI(selector = '#actionButtonFlower>img')
      insertUI(selector = '#actionButtonFlower',
               ui = img(src = "Resources/pictogrammes/fleur_gris.png",
                        width=50,
                        height=50))
    }
    
    if (data_polesButtons$invertebre) {
      removeUI(selector = '#actionButtonBee>img')
      insertUI(selector = '#actionButtonBee',
               ui = img(src = "Resources/pictogrammes/abeille.png",
                        width=50,
                        height=50))
    } else {
      removeUI(selector = '#actionButtonBee>img')
      insertUI(selector = '#actionButtonBee',
               ui = img(src = "Resources/pictogrammes/abeille_gris.png",
                        width=50,
                        height=50))
    }
    
    if (data_polesButtons$vertebre) {
      removeUI(selector = '#actionButtonPaw>img')
      insertUI(selector = '#actionButtonPaw',
               ui = img(src = "Resources/pictogrammes/patte.png",
                        width=50,
                        height=50))
    } else {
      removeUI(selector = '#actionButtonPaw>img')
      insertUI(selector = '#actionButtonPaw',
               ui = img(src = "Resources/pictogrammes/patte_gris.png",
                        width=50,
                        height=50))
    }
  }
}

# Initialisation des feux de pôles
setFeuxFct <- function(session, data_polesButtons, data_polesFeux) {
  # Les 3 pôles sont allumés
  if (data_polesFeux$flore && data_polesFeux$invertebre && data_polesFeux$vertebre) {
    removeUI(selector = '#feuFlore>img')
    insertUI(selector = '#feuFlore',
             ui = img(src = "Resources/pictogrammes/rond_vert.png",
                      width=15,
                      height=15))
    removeUI(selector = '#feuInvertebre>img')
    insertUI(selector = '#feuInvertebre',
             ui = img(src = "Resources/pictogrammes/rond_orange.png",
                      width=15,
                      height=15))
    removeUI(selector = '#feuVertebre>img')
    insertUI(selector = '#feuVertebre',
             ui = img(src = "Resources/pictogrammes/rond_bleu.png",
                      width=15,
                      height=15))
  } 
  # Au moins 1 des 3 pôle n'es pas allumé
  else {
    if (data_polesFeux$flore) {
      removeUI(selector = '#feuFlore>img')
      insertUI(selector = '#feuFlore',
               ui = img(src = "Resources/pictogrammes/rond_vert.png",
                        width=15,
                        height=15))
    } else {
      removeUI(selector = '#feuFlore>img')
      insertUI(selector = '#feuFlore',
               ui = img(src = "Resources/pictogrammes/rond_gris.png",
                        width=15,
                        height=15))
    }
    
    if (data_polesFeux$invertebre) {
      removeUI(selector = '#feuInvertebre>img')
      insertUI(selector = '#feuInvertebre',
               ui = img(src = "Resources/pictogrammes/rond_orange.png",
                        width=15,
                        height=15))
    } else {
      removeUI(selector = '#feuInvertebre>img')
      insertUI(selector = '#feuInvertebre',
               ui = img(src = "Resources/pictogrammes/rond_gris.png",
                        width=15,
                        height=15))
    }
    
    if (data_polesFeux$vertebre) {
      removeUI(selector = '#feuVertebre>img')
      insertUI(selector = '#feuVertebre',
               ui = img(src = "Resources/pictogrammes/rond_bleu.png",
                        width=15,
                        height=15))
    } else {
      removeUI(selector = '#feuVertebre>img')
      insertUI(selector = '#feuVertebre',
               ui = img(src = "Resources/pictogrammes/rond_gris.png",
                        width=15,
                        height=15))
    }
  }
  polesButtonsStr <- encodeFeux(data_polesButtons);
  feuxStr <- encodeFeux(data_polesFeux);
  session$onFlushed(function() {
    session$sendCustomMessage(type = 'actualizePolesButtons', message = polesButtonsStr);
    session$sendCustomMessage(type = 'actualizeFeux', message = feuxStr);
  });
}

# Initialisation des pôles et des feux
setPolesFeuxFct <- function(session, data_polesButtons, data_polesFeux) {
  setPolesFct(session, data_polesButtons);
  setFeuxFct(session, data_polesButtons, data_polesFeux)
}
  