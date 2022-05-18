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
                     windowTitle = "Page admin"
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
                        actionButton(inputId = "expertButton",
                                     label = "EXPERT"),
                        actionButton(inputId = "passiveButton",
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
divEnTeteAdmin <- div(id = "enTete",
                 divLogo,
                 divHeadBand)

