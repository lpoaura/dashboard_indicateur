/* Ce script js permet de modifier l'apparence des onglets du mode Accueil en
surlignant l'onglet sélectionné par rapport aux autres */

$(document).ready(function () {
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'actualizeOldTabAccueil', function (tabAccueilOld) {
        console.log("Actualize Tab Accueil");
        
        /* Variable couleurs */
        var color_bleuLPO_light= "#81BADE";
        
        /* Assignation du style non surligné pour le précédent onglet */
        document.getElementById(tabAccueilOld).style.background = color_bleuLPO_light;
        document.getElementById(tabAccueilOld).style.color = "#333";
        document.getElementById(tabAccueilOld).style.outline = "none";
        document.getElementById(tabAccueilOld).style.shadowbox = "none";
        
      });
  });
});