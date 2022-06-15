# Création du bandeau de gauche en mode Global et Expert

# Feu du pôle flore
actionButtonFlore <- actionButton(inputId = "feuFlore",
                                  img(src = "Resources/pictogrammes/rond_violet.png",
                                      with = 15,
                                      height = 15))

# Feu du pôle invertébré
actionButtonInvertebre <- actionButton(inputId = "feuInvertebre",
                                      img(src = "Resources/pictogrammes/rond_violet.png",
                                      with = 15,
                                      height = 15))

# Feu du pôle vertébré
actionButtonVertebre <- actionButton(inputId = "feuVertebre",
                                      img(src = "Resources/pictogrammes/rond_violet.png",
                                      with = 15,
                                      height = 15))

# Ul des feux colorés
ulFeux <- tags$ul(id = "listeFeux",
                  actionButtonFlore,
                  actionButtonInvertebre,
                  actionButtonVertebre)

# Div du nombre de données
divNbData <- div(id = "nombreData",
                 tags$p(id = "affichageNbData",
                        "11 926 831"))

# Div du nombre d'espèces
divNbSpecies <- div(id = "nombreSpecies",
                 tags$p(id = "affichageNbSpecies",
                        "19 901"))

# Zone des chiffres globaux
divChiff <- div(id = "chiffreGlobaux",
                ulFeux,
                tags$p("Nombre de données :"),
                divNbData,
                tags$p("Nombre d'espèces :"),
                divNbSpecies)

# Menu déroulant des indicateurs
selectIndicator <- tags$select(id = "selectIndicator",
                               "onfocus"='this.size=2;',
                               "onblur"='this.size=1;' ,
                               "onchange"='this.size=1; this.blur();')

# Récapitulatif de l'indicateur sélectionné
divDataSumUp <- div(id = "dataSumUp",
                    tags$p(id = "indicatorName",
                           "Indicateur sélectionné"),
                    actionButton(inputId = "aideButton",
                                 label = NULL,
                                 icon = icon(name = "question-circle")))

# Zone des data viz
divDataViz <- div(id = "dataViz",
                  divDataSumUp,
                  divHist,
                  divPie)

# Zone des indicateurs et data viz
divData <- div(id = "data",
               selectIndicator,
               divDataViz)

# Pop-Up du data viz survolé
divPopUpDataViz <- div(id = "popUpDataViz")


# Bandeau déplié 
divBandeauUtil <- div(id = "bandeauUtil",
                      divChiff,
                      divData)

# Bandeau déplié
divBandeauUncollapsed <- div(id = "bandeauUncollapsed",
                             actionButton(inputId = "collapaseBandeauButton",
                                          icon("caret-left")))

# Bandeau replié
divBandeauCollapsed <- div(id = "bandeauCollapsed",
                           actionButton(inputId = "uncollapaseBandeauButton",
                                        icon("caret-right")))

divBandeau <- div(id = "bandeau",
                  divBandeauUtil,
                  divBandeauUncollapsed)
rm(divBandeauUtil, divBandeauUncollapsed)


# Bandeau de gauche
divBandeauTotal <- div(id = "bandeauTotal",
                       divBandeau)

# Zone de la carte
divBandeauRightCarte <- div(id = "bandeauRightCarte")

divBandeauCarte <- div(id = "bandeauCarte",
                       divBandeauTotal,
                       divBandeauRightCarte)
rm(divBandeauTotal, divBandeauRightCarte)