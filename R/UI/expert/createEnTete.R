# Création de l'en-tête


# Logo de la LPO
divLogo <- div(id = "logoLPO",
               img(src = "Resources/logos/logo_lpo.png",
                   width = 150,
                   height = 150))


# Logo du laboratoire
divLogo1 <- div(id = "logo1",
                img(src = "Resources/logos/Logo-observatoire.png",
                    width = 70,
                    height = 70))

# Titre du Dashboard
header <- titlePanel(title = "TITRE DU DASHBOARD",
                     windowTitle = "Page Expert"
)

divLogoTitre <- div(id = "logoTitre",
                    divLogo1,
                    header)
rm(divLogo1, header)


ulNavigation <- tags$ul(id = "navigation",
                        actionButton(inputId = "accueilButton",
                                     label = "ACCUEIL"),
                        actionButton(inputId = "globalButton",
                                     label = "GLOBAL"),
                        actionButton(inputId = "passiveButton",
                                     label = "EXPERT"),
                        actionButton(inputId = "adminButton",
                                     label = "ADMIN"))

divLogoHeader <- div(id = "logoHeader",
                     divLogoTitre,
                     ulNavigation)
rm(divLogoTitre, ulNavigation)

# Setting du pole de la flore
actionButtonFlower <- actionButton(inputId = "actionButtonFlower",
                                   img(src = "Resources/pictogrammes/fleur.png",
                                       width=50,
                                       height=50))

# Setting du pole des invertébrés
actionButtonBee <- actionButton(inputId = "actionButtonBee",
                                img(src = "Resources/pictogrammes/abeille.png",
                                    width=50,
                                    height=50))

# Setting du pole des vertébrés
actionButtonPaw <- actionButton(inputId = "actionButtonPaw",
                                img(src = "Resources/pictogrammes/patte.png",
                                    width=50,
                                    height=50))

# Setting des poles
ulPolesSettings <- tags$ul(id = "polesSettings",
                           actionButtonFlower,
                           actionButtonBee,
                           actionButtonPaw)

# Setting de l'année
divYearSettings <- div(id = "yearSettings",
                       tags$p(id = "yearLabel",
                              "Année :"),
                       sliderInput(inputId = "yearScrollBar",
                                   label = NULL,
                                   min = 2006,
                                   max = 2021,
                                   value = 2006,
                                   round = FALSE,
                                   step = 1,
                                   sep = "",
                                   ticks = FALSE,
                                   width = "80%"))

# Ojets de settings
divObjSettings <- div(id = "objSettings",
                      divYearSettings,
                      ulPolesSettings)

rm(divYearSettings,
   ulPolesSettings);

# Bandeau de settings replié
divSettingsCollapsed <- div(id = "settingsCollapsed",
                            actionLink(inputId = "collapasedSettingsButton",
                                       img(src = "Resources/fleches/fleche_bas.png",
                                           width = 10,
                                           height = 10)))

# Bandeau de settings
divSettings <- div(id = "settings",
                   divObjSettings,
                   divSettingsCollapsed)

# Bandeau vide
divBlankHeader <- div(id = "blankHeader")


# Partie droite du bandeau
divHeadBand <- div(id = "headBand",
                   divLogoHeader,
                   divSettings,
                   divBlankHeader)
rm(divLogoHeader, divSettings, divBlankHeader)


# En tête générale
divEnTeteExpert <- div(id = "enTete",
                       divLogo,
                       divHeadBand)


