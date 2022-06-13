#Ce fichier crée toutes les interfaces UI nécessaires au bon fonctionnement de l'application web.

print("Creating UI...")

# Div du corps de l'architecture
divCorps <- div(id = "corps",
                 divBandeauCarte)

# Carte en background
divCarteBack <- div(id = "carteBack",
                    divCarte);

# Page entière globale
divTotal <- div(id = "total",
                divCarteBack,
                divEnTete,
                divCorps)


# UI qui sera donné initialement à l'utilisateur
ui <- fluidPage(
  includeScript('www/JavaScript/adminModeProcess.js'),
  includeScript('www/JavaScript/feuxProcess.js'),
  includeScript('www/JavaScript/polesButtonsProcess.js'),
  includeScript('www/JavaScript/setIndicatorProcess.js'),
  includeScript('www/JavaScript/selectIndicatorProcess.js'),
  
  includeCSS("www/CSS/enTeteCSS.css"),
  includeCSS("www/CSS/settingsCSS.css"),
  includeCSS("www/CSS/leftBandeauGlobalExpertCSS.css"),
  includeCSS("www/CSS/generalCSS.css"),
  includeCSS('www/CSS/leftBandeauAccueilCSS.css'),
  includeCSS('www/CSS/leftBandeauAdminCSS.css'),
  
  divTotal
  
)
