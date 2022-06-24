/* Ce script js permet de modifier l'apparence des onglets du mode Accueil en
surlignant l'onglet sélectionné par rapport aux autres */

$(document).ready(function () {
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'actualizeNewTabAccueil', function (tabAccueil) {
        console.log("Actualize Tab Accueil");
        
        /* Variable couleurs */
        var color_bleuLPO= "#0276BD";
        
        /* Assignation du style surligné pour l'onglet sélectionné */
        document.getElementById(tabAccueil).style.background = color_bleuLPO;
        document.getElementById(tabAccueil).style.color = "#FFF";
        document.getElementById(tabAccueil).style.outline = "none";
        document.getElementById(tabAccueil).style.shadowbox = "none";
        
      });
  });
});