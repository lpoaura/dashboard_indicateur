#Ce fichier crée toutes les interfaces UI nécessaires au bon fonctionnement de l'application web.

print("Creating UI...")

# Div du corps de l'architecture
divCorps <- div(id = "corps",
                divBandeauAccueilInit);

# Carte en background
divCarteBack <- div(id = "carteBack",
                    divCarte);

# Page entière globale
divTotal <- div(id = "total",
                # divCarteBack,
                divEnTete,
                divCorps)


# UI qui sera donné initialement à l'utilisateur
ui <- fluidPage(
  includeScript('www/JavaScript/adminModeProcess.js'),
  
  includeScript('www/JavaScript/feuxProcess.js'),
  includeScript('www/JavaScript/feuxNumbersProcess.js'),
  includeScript('www/JavaScript/polesButtonsProcess.js'),
  
  includeScript('www/JavaScript/setYearProcess.js'),
  includeScript('www/JavaScript/endLoadingYearProcess.js'),
  
  includeScript('www/JavaScript/setTypeIndicatorProcess.js'),
  includeScript('www/JavaScript/setIndicatorProcess.js'),
  includeScript('www/JavaScript/setDeclinaisonProcess.js'),
  includeScript('www/JavaScript/setGroupeProcess.js'),
  
  includeScript('www/JavaScript/selectNotChangedProcess.js'),
  
  includeScript('www/JavaScript/selectTypeIndicatorProcess.js'),
  includeScript('www/JavaScript/selectIndicatorProcess.js'),
  includeScript('www/JavaScript/selectDeclinaisonProcess.js'),
  includeScript('www/JavaScript/selectGroupeProcess.js'),
  
  includeScript('www/JavaScript/accueilClickedTabProcess.js'),
  includeScript('www/JavaScript/accueilModeNewProcess.js'),
  includeScript('www/JavaScript/accueilModeOldProcess.js'),
  includeScript('www/JavaScript/indicatorNameUpdateProcess.js'),
  includeScript('www/JavaScript/idIndicatorAccueilFromNameProcess.js'),
  
  includeScript('www/JavaScript/idDataVizAccueilOnClickProcess.js'),
  
  includeCSS("www/CSS/enTeteCSS.css"),
  includeCSS("www/CSS/settingsCSS.css"),
  includeCSS("www/CSS/leftBandeauGlobalExpertCSS.css"),
  includeCSS("www/CSS/generalCSS.css"),
  includeCSS('www/CSS/leftBandeauAccueilCSS.css'),
  includeCSS('www/CSS/leftBandeauAdminCSS.css'),
  
  divTotal
  
)
