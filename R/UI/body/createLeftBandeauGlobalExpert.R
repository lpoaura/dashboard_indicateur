# Création du bandeau de gauche en mode Global et Expert

# Feu du pôle flore
actionButtonFlore <- actionButton(inputId = "feuFlore",
                                  img(src = "Resources/pictogrammes/rond_vert.png",
                                      width = 15,
                                      height = 15))

# Feu du pôle invertébré
actionButtonInvertebre <- actionButton(inputId = "feuInvertebre",
                                      img(src = "Resources/pictogrammes/rond_orange.png",
                                      width = 15,
                                      height = 15))

# Feu du pôle vertébré
actionButtonVertebre <- actionButton(inputId = "feuVertebre",
                                      img(src = "Resources/pictogrammes/rond_bleu.png",
                                      width = 15,
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
                tags$p("Nombre d'espèces (au maximum sur une année) :"),
                divNbSpecies)

# Menu déroulant des indicateurs
selectIndicator <- tags$select(id = "selectIndicator",
                               "onfocus"='this.size=5;',
                               "onblur"='this.size=1;' ,
                               "onchange"='this.size=1; this.blur();')

# Menu déroulant du type d'indicateurs
titleSelectTypeIndicator <- tags$p(class = "titleSel","Type d'indicateurs :")
selectTypeIndicator <- tags$select(id = "selectTypeIndicator",
                                   "onfocus"='this.size=5;',
                                   "onblur"='this.size=1;' ,
                                   "onchange"='this.size=1; this.blur();')

# Menu déroulant de la déclinaison
titleSelectDeclinaison <- tags$p(class = "titleSel","Déclinaison :")
selectDeclinaison <- tags$select(id = "selectDeclinaison",
                                 "onfocus"='this.size=5;',
                                 "onblur"='this.size=1;' ,
                                 "onchange"='this.size=1; this.blur();')

# Menu déroulant du groupe
titleSelectGroupe <- tags$p(id = "pTitleSelGroupe", class = "titleSel","Groupe :")
selectGroupe <- tags$select(id = "selectGroupe",
                            "onfocus"='this.size=5;',
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
                  divPie,
                  divBar,
                  divFournProd)

# Zone des sélecteurs 
divSelectArea <- div(id="selectArea",
                     tags$p("Indicateur :"),
                     selectIndicator)

# Zone des sélecteurs côté expert
divSelectAreaExpert <- div(id="selectArea",
                           titleSelectTypeIndicator,
                           selectTypeIndicator,
                           tags$p("Indicateur :"),
                           selectIndicator,
                           titleSelectDeclinaison,
                           selectDeclinaison,
                           titleSelectGroupe,
                           selectGroupe)

# Zone des indicateurs et data viz
divData <- div(id = "data",
               divSelectArea,
               divDataViz)

# Zone des indicateurs et data viz côté expert
divDataExpert <- div(id = "data",
                     divSelectAreaExpert,
                     divDataViz)

# Pop-Up du data viz survolé
divPopUpDataViz <- div(id = "popUpDataViz")


# Bandeau déplié 
divBandeauUtil <- div(id = "bandeauUtil",
                      divChiff,
                      divData)

# Bandeau déplié côté expert
divBandeauUtilExpert <- div(id = "bandeauUtil",
                            divChiff,
                            divDataExpert)

# Bandeau déplié : bouton de collapse
divBandeauUncollapsed <- div(id = "bandeauUncollapsed",
                             actionButton(inputId = "collapaseBandeauButton",
                                          icon("caret-left")))

# Bandeau replié
divBandeauCollapsed <- div(id = "bandeauCollapsed",
                           actionButton(inputId = "uncollapaseBandeauButton",
                                        icon("caret-right")))

# Regroupement de tout
divBandeau <- div(id = "bandeau",
                  divBandeauUtil,
                  divBandeauUncollapsed)
divBandeauExpert <- div(id = "bandeau",
                        divBandeauUtilExpert,
                        divBandeauUncollapsed)
rm(divBandeauUtil, divBandeauUtilExpert, divBandeauUncollapsed)


# Regroupement avec la div vide de droite
divBandeauCarte <- div(id = "bandeauCarte",
                       divBandeau)
divBandeauCarteExpert <- div(id = "bandeauCarte",
                             divBandeauExpert)

