# Création de l'en-tête

print("Creating Head...")

## Logo en haut à gauche

# Logo du laboratoire
divLogo <- div(id = "logo",
               img(src = "Resources/logos/Logo-observatoire.png",
                   width = 200,
                   height = 200))



## Bandeau d'en-tête (titre et navigation)

# Titre du Dashboard
titre <- titlePanel(title = "Indicateurs de la biodiversité AURA",
                     windowTitle = "Biodiversité - AURA"
)

# div qui contiennent les boutons de navigation
divAccueilButton <- div(id = "divAccueilButton",
                        passiveAccueilButton)
divGlobalButton <- div(id = "divGlobalButton",
                       globalButton)
divExpertButton <- div(id = "divExpertButton",
                       expertButton)
# divAdminButton <- div(id = "divAdminButton",
#                       adminButton)

# Ensemble des boutons de navigation
ulNavigation <- tags$ul(id = "navigation",
                        divAccueilButton,
                        divGlobalButton,
                        divExpertButton)#,
                        # divAdminButton)


# div du titre et de la navigation
divTitleNav <- div(id = "logoTitleNav",
                   titre,
                   ulNavigation)


## div qui contient le bandeau de settings total

# div settings
divSettingsTotal <- div(id = "settingsTotal")
                        # divSettings)


## Bandeau vide

# Bandeau vide
divBlankHeader <- div(id = "blankHeader")



## Regroupement de la partie droite du bandeau
divHeadBand <- div(id = "headBand",
                   divTitleNav,
                   divSettingsTotal,
                   divBlankHeader)


## Création de l'en-tête général
# En tête générale
divEnTete <- div(id = "enTete",
                 divLogo,
                 divHeadBand)

