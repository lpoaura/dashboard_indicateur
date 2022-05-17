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

# Titre du Dashboard
header <- titlePanel(title = "TITRE DU DASHBOARD",
                     windowTitle = "Page d'accueil"
)

divLogoTitre <- div(id = "logoTitre",
                    divLogo1,
                    header)
rm(divLogo1, header)


# Boutons de navigation
ulNavigation <- tags$ul(id = "navigation",
                        actionButton(inputId = "passiveButton",
                                     label = "ACCUEIL"),
                        actionButton(inputId = "globalButton",
                                     label = "GLOBAL"),
                        actionButton(inputId = "expertButton",
                                     label = "EXPERT"),
                        actionButton(inputId = "adminButton",
                                     label = "ADMIN"))

divLogoHeader <- div(id = "logoHeader",
                     divLogoTitre,
                     ulNavigation)
rm(divLogoTitre, ulNavigation)


# Bandeau vide
divBlankHeader <- div(id = "blankHeader")


# Partie droite du bandeau
divHeadBand <- div(id = "headBand",
                   divLogoHeader,
                   divBlankHeader)
rm(divLogoHeader, divBlankHeader)


# En tête générale
divEnTeteAccueil <- div(id = "enTete",
                        divLogo,
                        divHeadBand)

