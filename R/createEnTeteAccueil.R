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
                     windowTitle = "TITRE WINDOW"
)

divLogoTitre <- div(id = "logoTitre",
                    divLogo1,
                    header)
rm(divLogo1, header)


# Boutons de navigation
ulNavigation <- tags$ul(id = "navigation",
                        tabPanel(title = "Panel1", value = "panel1",
                                 actionButton(inputId = "accueilBouton",
                                              label = "ACCUEIL")),
                        actionButton(inputId = "globalBouton",
                                     label = "GLOBAL"),
                        actionButton(inputId = "expertBouton",
                                     label = "EXPERT"),
                        actionButton(inputId = "adminBouton",
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

