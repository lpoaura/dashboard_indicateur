## Bandeau de settings

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
                                   width = "70%"),
                       checkboxInput(inputId = "checkAllYears",
                                     label = "Toutes ?",
                                     value = TRUE,
                                     width = "15%"))

# Objets de settings (poles et années)
divObjSettings <- div(id = "objSettings",
                      divYearSettings,
                      ulPolesSettings)
rm(divYearSettings, ulPolesSettings);

# Bandeau de settings déplié
divSettingsUncollapsed <- div(id = "settingsUncollapsed",
                              actionButton(inputId = "collapaseSettingsButton",
                                           icon("caret-up")))

# Bandeau de settings déplié total
divSettings <- div(id = "settings",
                   divObjSettings,
                   divSettingsUncollapsed)
rm(divObjSettings, divSettingsUncollapsed)


# Bandeau de settings replié
divSettingsCollapsed <- div(id = "settingsCollapsed",
                            actionButton(inputId = "uncollapaseSettingsButton",
                                         icon("caret-down")))