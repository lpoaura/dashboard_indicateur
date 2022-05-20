## Bandeau de settings

# Setting du pole de la flore
actionButtonFlower <- actionButton(inputId = "actionButtonFlower",
                                   img(src = "Resources/pictogrammes/fleur_violet.png",
                                       width=50,
                                       height=50))

# Setting du pole des invertébrés
actionButtonBee <- actionButton(inputId = "actionButtonBee",
                                img(src = "Resources/pictogrammes/abeille_violet.png",
                                    width=50,
                                    height=50))

# Setting du pole des vertébrés
actionButtonPaw <- actionButton(inputId = "actionButtonPaw",
                                img(src = "Resources/pictogrammes/patte_violet.png",
                                    width=50,
                                    height=50))

# div qui contient les poles
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

# Objets de settings (poles et années)
divObjSettings <- div(id = "objSettings",
                      divYearSettings,
                      ulPolesSettings)
rm(divYearSettings, ulPolesSettings);

# Bandeau de settings déplié
divSettingsUncollapsed <- div(id = "settingsUncollapsed",
                              actionButton(inputId = "collapaseSettingsButton",
                                            img(src = "Resources/fleches/fleche_haut.png",
                                                width = 10,
                                                height = 10)))

# Bandeau de settings déplié total
divSettings <- div(id = "settings",
                   divObjSettings,
                   divSettingsUncollapsed)
rm(divObjSettings, divSettingsUncollapsed)


# Bandeau de settings replié
divSettingsCollapsed <- div(id = "settingsCollapsed",
                            actionButton(inputId = "uncollapaseSettingsButton",
                                         img(src = "Resources/fleches/fleche_bas.png",
                                             width = 10,
                                             height = 10)))