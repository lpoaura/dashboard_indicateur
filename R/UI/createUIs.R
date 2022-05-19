#Ce fichier crée toutes les interfaces UI nécessaires au bon fonctionnement de l'application web.

# uiAccueil <- fluidPage(
#   
#   includeCSS("www/CSS/enTeteCSS.css"),
#   includeCSS("www/CSS/leftBandeauCSS.css"),
#   includeCSS("www/CSS/generalCSS.css"),
#   
#   divTotalAccueil
# )
# 
# divTotalGlobal <- div(id = "total",
#                       divCarteBack,
#                       divEnTete,
#                       divBandeauCarte)
# uiGlobal <- fluidPage(
#   
#   includeCSS("www/CSS/enTeteCSS.css"),
#   includeCSS("www/CSS/leftBandeauCSS.css"),
#   includeCSS("www/CSS/generalCSS.css"),
#   
#   divTotalGlobal
# )
# 
# uiExpert <- fluidPage(
#   
#   includeCSS("www/CSS/enTeteCSS.css"),
#   includeCSS("www/CSS/leftBandeauCSS.css"),
#   includeCSS("www/CSS/generalCSS.css"),
#   
#   divTotalExpert
# )
# 
# uiAdmin <- fluidPage(
#   
#   includeCSS("www/CSS/enTeteCSS.css"),
#   includeCSS("www/CSS/leftBandeauCSS.css"),
#   includeCSS("www/CSS/generalCSS.css"),
#   
#   divTotalAdmin
# )

# Page entière globale
divTotal <- div(id = "total",
                divCarteBack,
                divEnTete,
                divBandeauCarte)

ui <- fluidPage(
  
  includeCSS("www/CSS/enTeteCSS.css"),
  includeCSS("www/CSS/settingsCSS.css"),
  includeCSS("www/CSS/leftBandeauCSS.css"),
  includeCSS("www/CSS/generalCSS.css"),
  
  divTotal
)