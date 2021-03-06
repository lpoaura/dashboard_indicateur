# Création du bandeau de gauche du mode Admin

# Panneau de log in
divPanelLogIn <- div(id="panelLogIn",
                     passwordInput(inputId = "pwdInput",
                                   label = "Mot de passe :"),
                     actionButton(inputId = "submitPwd",
                                  label = "SE CONNECTER"))

# Alerte de mauvais pwd
badPwdAlerte <- tags$p(id="badPwdAlerte", "Le mot de passe saisi n'est pas correct.")

# Onglets des fonctionnalités du mode Admin
# Bouton de rajout d'indicateurs
addButton <- actionButton(inputId = "addButton",
                          class = "tabAdmin",
                          label = "RAJOUT")
# Bouton de suppression d'indicateurs
suppressButton <- actionButton(inputId = "suppressButton",
                               class = "tabAdmin",
                               label = "SUPPRESSION")
# Bouton de modification d'indicateurs
modifyButton <- actionButton(inputId = "modifyButton",
                             class = "tabAdmin",
                             label = "MODIFICATION")

# Navigation des fonctionnalités
divNavOption <- div(id = "navOption",
                    addButton,
                    suppressButton,
                    modifyButton)

# Zone de l'identité du nouveau indicateur : nom + sous ou indicateur général
divIdInd <- div(id = "identityInd",
                textInput(inputId = "nameInput",
                          label = "Nom de l'indicateur"),
                checkboxInput(inputId = "subIndInput",
                              label = "Sous indicateur ?"))

# Sélecteurs des critères nécessaires à un sous indicateur
selectTypeIndGeneral <- tags$select(id = "selectTypeIndGeneral",
                                    "onfocus"='this.size=2;',
                                    "onblur"='this.size=1;' ,
                                    "onchange"='this.size=1; this.blur();',
                                    
                                    tags$option(value = "A", "Indicateur A"),
                                    tags$option(value = "B", "Indicateur B"),
                                    tags$option(value = "C", "Indicateur C"))

selectIndDeclinaison <- tags$select(id = "selectDeclinaison",
                                    "onfocus"='this.size=2;',
                                    "onblur"='this.size=1;' ,
                                    "onchange"='this.size=1; this.blur();',
                                    
                                    tags$option(value = "A", "Déclinaison A"),
                                    tags$option(value = "B", "Déclinaison B"),
                                    tags$option(value = "C", "Déclinaison C"))

selectRepresentation <- tags$select(id = "selectRepresentation",
                                 "onfocus"='this.size=2;',
                                 "onblur"='this.size=1;' ,
                                 "onchange"='this.size=1; this.blur();',
                                 
                                 tags$option(value = "A", "Représentation A"),
                                 tags$option(value = "B", "Représentation B"),
                                 tags$option(value = "C", "Représentation C"))

selectProfil <- tags$select(id = "selectProfil",
                                    "onfocus"='this.size=2;',
                                    "onblur"='this.size=2;' ,
                                    "onchange"='this.size=2; this.blur();',
                                    
                                    tags$option(value = "Global", "Global"),
                                    tags$option(value = "Expert", "Expert"))

# Zone des critères d'une catégorie
divCategorieInfo <- div(id="categorieInfo",
                        tags$p("Type de l'indicateur :"),
                        selectTypeIndGeneral)

# Zone des critères d'un sous indicateur
divSubIndInfo <- div(id = "subIndInfo",
                     tags$p("Déclinaison :"),
                     selectIndDeclinaison,
                     tags$p("Type de représentation :"),
                     selectRepresentation,
                     tags$p("Profil qui a accès à cet indicateur :"),
                     selectProfil,
                     textInput(inputId = "dataBaseInput",
                               label = "Jeu de données où se trouve l'indicateur :"))

radButtInfo<-c("Type ?"="type","Catégorie ?"="categorie");
radButtInd<-c("Type ?"="type","Catégorie ?"="categorie","Sous-indicateur ?"="sousind");

divSettingsAdd <- div(id = "identityInd",
                      textInput(inputId = "nameInput",
                                label = "Nom de l'indicateur :"),
                      radioButtons(inputId = "infoCheckInput",
                                   label = NULL,
                                   choices = c("Information"="info","Indicateur"="ind")),
                      radioButtons(inputId = "subIndInput",
                                   label = NULL,
                                   choices = radButtInfo));

divDescription<-div(id = "descriptionArea",
                    tags$p("Description de l'indicateur :"),
                    textAreaInput(inputId = "descriptionInput",
                                  label = NULL,
                                  rows = 10))

# Panneau de rajout d'indicateur
divPanelAdd <- div(id = "panelAdd",
                   class = "panelAdmin",
                       h1("RAJOUT"),
                       divSettingsAdd,
                       divCategorieInfo,
                       divSubIndInfo,
                       divDescription,
                       submitButton(text = "RAJOUT"))

# Sélecteur d'un indicateur existant
selectExistingInd <- tags$select(id = "selectExistingInd",
                                    "onfocus"='this.size=2;',
                                    "onblur"='this.size=1;' ,
                                    "onchange"='this.size=1; this.blur();',
                                    
                                    tags$option(value = "A", "Indicateur A"),
                                    tags$option(value = "B", "Indicateur B"),
                                    tags$option(value = "C", "Indicateur C"))

# Panneau récapitulatif d'un indicateur existant choisi
divExistingIndSumUp <- div(id = "existingIndSumUp",
                           tags$ul(id = "listSumUpInd",
                                   tags$li(id = "sumUpNameInd",
                                           "NOM"),
                                   tags$li(id = "sumUpTypeInd",
                                           "TYPE"),
                                   tags$li(id = "sumUpDeclinaisonInd",
                                           "DECLINAISON"),
                                   tags$li(id = "sumUpRepresentationInd",
                                           "REPRESENTATION"),
                                   tags$li(id = "sumUpProfilInd",
                                           "PROFIL"),
                                   tags$li(id = "sumUpDataBaseInd",
                                           "JEU DE DONNEES")))

# Panneau de suppression d'indicateur
divPanelSuppress <- div(id = "panelSuppress",
                   class = "panelAdmin",
                   h1("SUPPRESSION"),
                   selectExistingInd,
                   divExistingIndSumUp,
                   submitButton(text = "SUPPRESSION"))

# Panneau de modification d'indicateur
divPanelModify <- div(id = "panelModify",
                      class = "panelAdmin",
                      h1("MODIFICATION"),
                      selectExistingInd,
                      textAreaInput(inputId = "descriptionInput",
                                    label = "Description de l'indicateur :",
                                    rows = 10),
                      submitButton(text = "MODIFICATION"))

# Bandeau total du mode Admin
divBandeauAdmin <- div(id="bandeauAdmin",
                       divPanelLogIn)