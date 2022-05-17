# Création de l'en-tête


# Logo de la LPO
divLogo <- div(id = "logoLPO",
               img(src = "logo_lpo.png",
                   width = 150,
                   height = 150))


# Logo du laboratoire
divLogo1 <- div(id = "logo1",
                img(src = "Logo-observatoire.png",
                    width = 70,
                    height = 70))

# Autres logos
# divSousLogos <- div(id = "autresLogos",
#                     img(src = "logo_region.png",
#                         width = 40,
#                         height = 40),
#                     img(src = "logo_ofb.png",
#                         width = 40,
#                         height = 40),
#                     img(src = "logo_Flavia.png",
#                         width = 40,
#                         height = 40),
#                     img(src = "logo_cbn.png",
#                         width = 40,
#                         height = 40))

# divTitreSousLogos <- div(id = "titreSousLogos",
#                          header,
#                          divSousLogos)

# Titre du Dashboard
header <- titlePanel(title = "TITRE DU DASHBOARD",
                     windowTitle = "Page globale"
)

divLogoTitre <- div(id = "logoTitre",
                    divLogo1,
                    header)
rm(divLogo1, header)


# Boutons de navigation
# ulNavigation <- tabsetPanel(id = "navigation",
#                             tabPanel(title = "PanelAccueil", value = "panelAccueil",
#                                      numericInput(inputId = "compteur", label =  "compteur", value = 1)),
#                             tabPanel(title = "PanelGlobal", value = "panelGlobal",
#                                      numericInput(inputId = "compteur", label =  "compteur", value = 2)),
#                             tabPanel(title = "PanelExpert", value = "panelExpert",
#                                      numericInput(inputId = "compteur", label =  "compteur", value = 3)),
#                             tabPanel(title = "PanelAdmin", value = "panelAdmin",
#                                      numericInput(inputId = "compteur", label =  "compteur", value = 4)))


ulNavigation <- tags$ul(id = "navigation",
                        actionButton(inputId = "accueilButton",
                                     label = "ACCUEIL"),
                        actionButton(inputId = "passiveButton",
                                     label = "GLOBAL"),
                        actionButton(inputId = "expertButton",
                                     label = "EXPERT"),
                        actionButton(inputId = "adminButton",
                                     label = "ADMIN"))

divLogoHeader <- div(id = "logoHeader",
                     divLogoTitre,
                     ulNavigation)
rm(divLogoTitre, ulNavigation)


# Bandeau de settings
divSettings <- div(id = "settings",
                   "SETTINGS")

# Bandeau vide
divBlankHeader <- div(id = "blankHeader")


# Partie droite du bandeau
divHeadBand <- div(id = "headBand",
                   divLogoHeader,
                   divSettings,
                   divBlankHeader)
rm(divLogoHeader, divSettings, divBlankHeader)


# En tête générale
divEnTeteGlobal <- div(id = "enTete",
                 divLogo,
                 divHeadBand)

