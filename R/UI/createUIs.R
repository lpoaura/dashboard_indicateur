#Ce fichier crée toutes les interfaces UI nécessaires au bon fonctionnement de l'application web.

uiAccueil <- fluidPage(
  
  includeCSS("www/CSS/enTeteCSS.css"),
  includeCSS("www/CSS/leftBandeauCSS.css"),
  includeCSS("www/CSS/generalCSS.css"),
  
  divTotalAccueil
)

uiGlobal <- fluidPage(
  
  includeCSS("www/CSS/enTeteCSS.css"),
  includeCSS("www/CSS/leftBandeauCSS.css"),
  includeCSS("www/CSS/generalCSS.css"),
  
  divTotalGlobal
)

uiExpert <- fluidPage(
  
  includeCSS("www/CSS/enTeteCSS.css"),
  includeCSS("www/CSS/leftBandeauCSS.css"),
  includeCSS("www/CSS/generalCSS.css"),
  
  divTotalExpert
)

uiAdmin <- fluidPage(
  
  includeCSS("www/CSS/enTeteCSS.css"),
  includeCSS("www/CSS/leftBandeauCSS.css"),
  includeCSS("www/CSS/generalCSS.css"),
  
  divTotalAdmin
)