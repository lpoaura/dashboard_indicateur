#Ce fichier crée toutes les interfaces UI nécessaires au bon fonctionnement de l'application web.

print("Creating UI...")

# Div du corps de l'architecture
divCorps <- div(id = "corps",
                 divBandeauCarte)

# Carte en background
divCarteBack <- div(id = "carteBack",
                    divCarte);
# test <- div(id = "machin",
#             divCarte00);

# Page entière globale
divTotal <- div(id = "total",
                divCarteBack,
                divEnTete,
                divCorps)

# ui <- fluidPage(
# )
# divCarte0 <- div(id="carte",
#                  leafletOutput("mymap"))

ui <- fluidPage(
  
  includeCSS("www/CSS/enTeteCSS.css"),
  includeCSS("www/CSS/settingsCSS.css"),
  includeCSS("www/CSS/leftBandeauCSS.css"),
  includeCSS("www/CSS/generalCSS.css"),
  
  divTotal
)
