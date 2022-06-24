# Ce fichier crée une fonction qui sera appelée dans le server pour gérer les
# boutons de choix de pôles dans le bandeau de gauche de global et expert

# Un ensemble de fonctions permettant le process des feux se trouve à la fin.

buttonsPolesLeftBandeauFct <- function(input, output, session, data_polesFeux, data_polesButtons) {
  # Bouton "Feu flore"
  observeEvent(input$feuFlore, {
    print("Feu flore pressed");
    
    play <- adaptPolesFeux("flore", data_polesButtons)
    
    if (play) {
      # Actualisation des feux en fonction du nouveau clic
      data_polesFeuxOrdered <- reactiveValues(
        actualData = data_polesFeux$flore,
        otherData1 = data_polesFeux$invertebre,
        otherData2 = data_polesFeux$vertebre
      );
      data_polesButtonsOrdered <- reactiveValues(
        actualData = data_polesButtons$flore,
        otherData1 = data_polesButtons$invertebre,
        otherData2 = data_polesButtons$vertebre
      );
      actualName <- "rond_vert";
      otherName1 <- "rond_orange";
      otherName2 <- "rond_bleu";
      actualButton <- 'Flore';
      otherButton1 <- 'Invertebre';
      otherButton2 <- 'Vertebre';
      
      # Fonction pour actualiser les feux
      processPolesFeux(actualName, otherName1, otherName2,
                       actualButton, otherButton1, otherButton2,
                       data_polesFeuxOrdered, data_polesButtonsOrdered)
      
      data_polesFeux$flore <- data_polesFeuxOrdered$actualData
      data_polesFeux$invertebre <- data_polesFeuxOrdered$otherData1
      data_polesFeux$vertebre <- data_polesFeuxOrdered$otherData2
      
      # Permet l'actualisation de la couleur des nombres
      stringForJS <- encodeFeux(data_polesFeux);
      session$sendCustomMessage(type = 'actualizeFeux', message = stringForJS)
    }
  })
  
  # Bouton "Feu invertebre"
  observeEvent(input$feuInvertebre, {
    print("Feu invertebre pressed");
    
    play <- adaptPolesFeux("invertebre", data_polesButtons)
    
    if (play) {
      # Actualisation des feux en fonction du nouveau clic
      data_polesFeuxOrdered <- reactiveValues(
        actualData = data_polesFeux$invertebre,
        otherData1 = data_polesFeux$flore,
        otherData2 = data_polesFeux$vertebre
      );
      data_polesButtonsOrdered <- reactiveValues(
        actualData = data_polesButtons$invertebre,
        otherData1 = data_polesButtons$flore,
        otherData2 = data_polesButtons$vertebre
      );
      actualName <- "rond_orange";
      otherName1 <- "rond_vert";
      otherName2 <- "rond_bleu";
      actualButton <- 'Invertebre';
      otherButton1 <- 'Flore';
      otherButton2 <- 'Vertebre';
      
      # Fonction pour actualiser les feux
      processPolesFeux(actualName, otherName1, otherName2,
                       actualButton, otherButton1, otherButton2,
                       data_polesFeuxOrdered, data_polesButtonsOrdered)
      
      
      data_polesFeux$invertebre <- data_polesFeuxOrdered$actualData
      data_polesFeux$flore <- data_polesFeuxOrdered$otherData1
      data_polesFeux$vertebre <- data_polesFeuxOrdered$otherData2
      
      # Permet l'actualisation de la couleur des nombres
      stringForJS <- encodeFeux(data_polesFeux);
      session$sendCustomMessage(type = 'actualizeFeux', message = stringForJS)
    }
  })
  
  # Bouton "Feu vertebre"
  observeEvent(input$feuVertebre, {
    print("Feu vertebre pressed");
    
    play <- adaptPolesFeux("vertebre", data_polesButtons)
    
    if (play) {
      # Actualisation des feux en fonction du nouveau clic
      data_polesFeuxOrdered <- reactiveValues(
        actualData = data_polesFeux$vertebre,
        otherData1 = data_polesFeux$flore,
        otherData2 = data_polesFeux$invertebre
      );
      data_polesButtonsOrdered <- reactiveValues(
        actualData = data_polesButtons$vertebre,
        otherData1 = data_polesButtons$flore,
        otherData2 = data_polesButtons$invertebre
      );
      actualName <- "rond_bleu";
      otherName1 <- "rond_vert";
      otherName2 <- "rond_orange";
      actualButton <- 'Vertebre';
      otherButton1 <- 'Flore';
      otherButton2 <- 'Invertebre';
      
      # Fonction pour actualiser les feux
      processPolesFeux(actualName, otherName1, otherName2,
                       actualButton, otherButton1, otherButton2,
                       data_polesFeuxOrdered, data_polesButtonsOrdered)
      
      data_polesFeux$vertebre <- data_polesFeuxOrdered$actualData
      data_polesFeux$flore <- data_polesFeuxOrdered$otherData1
      data_polesFeux$invertebre <- data_polesFeuxOrdered$otherData2
      
      # Permet l'actualisation de la couleur des nombres
      stringForJS <- encodeFeux(data_polesFeux);
      session$sendCustomMessage(type = 'actualizeFeux', message = stringForJS)
    }
  })
  
  # Permet d'actualiser les nombres affichés
  observeEvent(input$feuxActualized, {
    if (input$feuxActualized != "noChange") {
      dispNumbersForServerFct(input, output, session,
                              data_polesFeux$flore, data_polesFeux$invertebre, data_polesFeux$vertebre);
    }
  });
}

# Les fonctions suivantes permettent d'actualiser les feux après un click

# --------------- Les trois feux étaient actifs ---------------#
allActivePolesFeux <- function(actualName, otherName1, otherName2,
                                  actualButton, otherButton1, otherButton2,
                                  data_polesFeuxOrdered) 
{
  removeUI(selector = paste('#feu', actualButton, '>img', sep=""))
  insertUI(selector = paste('#feu', actualButton, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", actualName, ".png", sep=""),
                    width=15,
                    height=15))
  
  removeUI(selector = paste('#feu', otherButton1, '>img', sep=""))
  insertUI(selector = paste('#feu', otherButton1, sep=""),
           ui = img(src = "Resources/pictogrammes/rond_gris.png",
                    width=15,
                    height=15))
  data_polesFeuxOrdered$otherData1 = FALSE;
  
  removeUI(selector = paste('#feu', otherButton2, '>img', sep=""))
  insertUI(selector = paste('#feu', otherButton2, sep=""),
           ui = img(src = "Resources/pictogrammes/rond_gris.png",
                    width=15,
                    height=15))
  data_polesFeuxOrdered$otherData2 = FALSE;
}

# --------------- Les deux autres feux étaient actifs, mais pas lui ---------------#
othersActivePolesFeux <- function(actualName, otherName1, otherName2,
                                     actualButton, otherButton1, otherButton2,
                                     data_polesFeuxOrdered)
{
  removeUI(selector = paste('#feu', actualButton, '>img', sep=""))
  insertUI(selector = paste('#feu', actualButton, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", actualName, ".png", sep=""),
                    width=15,
                    height=15))
  data_polesFeuxOrdered$actualData = TRUE;
  
  removeUI(selector = paste('#feu', otherButton1, '>img', sep=""))
  insertUI(selector = paste('#feu', otherButton1, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", otherName1, ".png", sep=""),
                    width=15,
                    height=15))
  
  removeUI(selector = paste('#feu', otherButton2, '>img', sep=""))
  insertUI(selector = paste('#feu', otherButton2, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", otherName2, ".png", sep=""),
                    width=15,
                    height=15))
}

# --------------- Ce feu n'était pas le seul actif ---------------#
meNotOnlyActivePolesFeux <- function(actualName, otherName1, otherName2,
                                        actualButton, otherButton1, otherButton2,
                                        data_polesFeuxOrdered)
{
  removeUI(selector = paste('#feu', actualButton, '>img', sep=""))
  insertUI(selector = paste('#feu', actualButton, sep=""),
           ui = img(src = "Resources/pictogrammes/rond_gris.png",
                    width=15,
                    height=15))
  data_polesFeuxOrdered$actualData = FALSE;
}

# --------------- Ce feux était le seul actif ---------------#
meOnlyActivePolesFeux <- function(actualName, otherName1, otherName2,
                                  actualButton, otherButton1, otherButton2,
                                  data_polesFeuxOrdered, data_polesButtonsOrdered)
{
  # Les deux autres boutons sont disponibles
  if (data_polesButtonsOrdered$otherData1 && data_polesButtonsOrdered$otherData2) {
    removeUI(selector = paste('#feu', actualButton, '>img', sep=""))
    insertUI(selector = paste('#feu', actualButton, sep=""),
             ui = img(src = paste("Resources/pictogrammes/", actualName, ".png", sep=""),
                      width=15,
                      height=15))
    
    removeUI(selector = paste('#feu', otherButton1, '>img', sep=""))
    insertUI(selector = paste('#feu', otherButton1, sep=""),
             ui = img(src = paste("Resources/pictogrammes/", otherName1, ".png", sep=""),
                      width=15,
                      height=15))
    data_polesFeuxOrdered$otherData1 = TRUE;
    
    removeUI(selector = paste('#feu', otherButton2, '>img', sep=""))
    insertUI(selector = paste('#feu', otherButton2, sep=""),
             ui = img(src = paste("Resources/pictogrammes/" ,otherName2, ".png", sep=""),
                      width=15,
                      height=15))
    data_polesFeuxOrdered$otherData2 = TRUE;
  }
  # Au moins un autre bouton est disponible
  else if (data_polesButtonsOrdered$otherData1 || data_polesButtonsOrdered$otherData2) {
    if (data_polesButtonsOrdered$otherData1) {
      removeUI(selector = paste('#feu', otherButton1, '>img', sep=""))
      insertUI(selector = paste('#feu', otherButton1, sep=""),
               ui = img(src = paste("Resources/pictogrammes/", otherName1, ".png", sep=""),
                        width=15,
                        height=15))
      data_polesFeuxOrdered$otherData1 = TRUE;
    }
    else {
      removeUI(selector = paste('#feu', otherButton2, '>img', sep=""))
      insertUI(selector = paste('#feu', otherButton2, sep=""),
               ui = img(src = paste("Resources/pictogrammes/", otherName2, ".png", sep=""),
                        width=15,
                        height=15))
      data_polesFeuxOrdered$otherData2 = TRUE;
    }
  }
  # Aucun autre bouton n'est disponible : on ne fait rien
  else {
    
  }
}

# --------------- Un autre feux était actif ---------------#
otherActivePolesFeux <- function(actualName, otherName1, otherName2,
                                 actualButton, otherButton1, otherButton2,
                                 data_polesFeuxOrdered)
{
  removeUI(selector = paste('#feu', actualButton, '>img', sep=""))
  insertUI(selector = paste('#feu', actualButton, sep=""),
           ui = img(src = paste("Resources/pictogrammes/", actualName, ".png", sep=""),
                    width=15,
                    height=15))
  data_polesFeuxOrdered$actualData = TRUE;
}

# --------------- Permet de process le clic sur un feux ---------------#
processPolesFeux <- function(actualName, otherName1, otherName2,
                             actualButton, otherButton1, otherButton2,
                             data_polesFeuxOrdered, data_polesButtonsOrdered)
{
  if(data_polesFeuxOrdered$actualData && data_polesFeuxOrdered$otherData1 && data_polesFeuxOrdered$otherData2) {
    allActivePolesFeux(actualName, otherName1, otherName2,
                          actualButton, otherButton1, otherButton2,
                          data_polesFeuxOrdered);
  }
  else {
    # Les deux autres boutons étaient actifs, mais pas lui
    if(data_polesFeuxOrdered$otherData1 && data_polesFeuxOrdered$otherData2) {
      othersActivePolesFeux(actualName, otherName1, otherName2,
                               actualButton, otherButton1, otherButton2,
                               data_polesFeuxOrdered)
    }
    else {
      # Ce bouton était actif
      if (data_polesFeuxOrdered$actualData) {
        # Ce bouton n'était pas le seul actif
        if (data_polesFeuxOrdered$otherData1 || data_polesFeuxOrdered$otherData2) {
          meNotOnlyActivePolesFeux(actualName, otherName1, otherName2,
                                      actualButton, otherButton1, otherButton2,
                                      data_polesFeuxOrdered)
        }
        # Ce bouton était le seul actif
        else {
          meOnlyActivePolesFeux(actualName, otherName1, otherName2,
                                actualButton, otherButton1, otherButton2,
                                data_polesFeuxOrdered, data_polesButtonsOrdered)
        }
      }
      # Ce bouton n'était pas actif
      else {
        # Aucun bouton n'était actif, cas théoriquement impossible
        if (!data_polesFeuxOrdered$otherData1 && !data_polesFeuxOrdered$otherData2) {
          print("/!\ NO ACTIVE FEUX");
        }
        # Un autre bouton était actif
        else  {
          otherActivePolesFeux(actualName, otherName1, otherName2,
                                  actualButton, otherButton1, otherButton2,
                                  data_polesFeuxOrdered)
        }
      }
    }
  }
}

# --------------- Permet de s'adapter au boutons de pôles ---------------#
adaptPolesFeux <- function(name, data_polesButtons)
{
  play = TRUE;
  
  if (!data_polesButtons$flore && name == "flore") {
    play = FALSE;
  }
  if (!data_polesButtons$invertebre && name == "invertebre") {
    play = FALSE;
  }
  if (!data_polesButtons$vertebre && name == "vertebre") {
    play = FALSE;
  }
  return(play);
}

# --------------- Permet d'encoder pour envoyer à JS ---------------#
encodeFeux <- function(data_polesFeux) {
  res <- "";
  if (!data_polesFeux$flore) {
    if (!data_polesFeux$invertebre) {
      if (!data_polesFeux$vertebre) {
        res <- "rien"; # Cas impossible
      } else {
        res <- "vertebre";
      }
    } else {
      if (!data_polesFeux$vertebre) {
        res <- "invertebre";
      } else {
        res <- "iv";
      }
    }
  } else {
    if (!data_polesFeux$invertebre) {
      if (!data_polesFeux$vertebre) {
        res <- "flore";
      } else {
        res <- "fv";
      }
    } else {
      if (!data_polesFeux$vertebre) {
        res <- "fi";
      } else {
        res <- "all";
      }
    }
  }
  return(res);
}

encodeFeuxIsolated <- function(boolFlore, boolInvertebre, boolVertebre) {
  res <- "";
  if (!boolFlore) {
    if (!boolInvertebre) {
      if (!boolVertebre) {
        res <- "rien"; # Cas impossible
      } else {
        res <- "vertebre";
      }
    } else {
      if (!boolVertebre) {
        res <- "invertebre";
      } else {
        res <- "iv";
      }
    }
  } else {
    if (!boolInvertebre) {
      if (!boolVertebre) {
        res <- "flore";
      } else {
        res <- "fv";
      }
    } else {
      if (!boolVertebre) {
        res <- "fi";
      } else {
        res <- "all";
      }
    }
  }
  return(res);
}
