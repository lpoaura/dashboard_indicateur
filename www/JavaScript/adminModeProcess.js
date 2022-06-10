/* Ce script js permet de modifier l'apparence des onglets du mode Admin en
surlignant l'onglet sélectionné par rapport aux autres */

$(document).ready(function () {
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'actualizeTabAdmin', function (tabAdmin) {
        console.log("Actualize Tab Admin");
        
        /* Variable couleurs */
        var color_bleuLPO= "#0276BD";
        var color_bleuLPO_light= "#81BADE";
        
        switch (tabAdmin) {
          /* Si le nouvel onglet cliqué est Rajout, on le met en surlignance */
          case 'RAJOUT':
            console.log("Raaaajooout");
           document.getElementById('addButton').style.background = color_bleuLPO;
           document.getElementById('addButton').style.color = "#FFF";
           
           document.getElementById('suppressButton').style.background = color_bleuLPO_light;
           document.getElementById('suppressButton').style.color = "#333";
           
           document.getElementById('modifyButton').style.background = color_bleuLPO_light;
           document.getElementById('modifyButton').style.color = "#333";
           
            break;
            
            /* Si le nouvel onglet cliqué est Suppression, on le met en surlignance */
          case 'SUPPRESSION':
            
           document.getElementById('addButton').style.background = color_bleuLPO_light;
           document.getElementById('addButton').style.color = "#333";
           
           document.getElementById('suppressButton').style.background = color_bleuLPO;
           document.getElementById('suppressButton').style.color = "#FFF";
           
           document.getElementById('modifyButton').style.background = color_bleuLPO_light;
           document.getElementById('modifyButton').style.color = "#333";
           
            break;
            
            /* Si le nouvel onglet cliqué est Modification, on le met en surlignance */
          case 'MODIFICATION':
            
           document.getElementById('addButton').style.background = color_bleuLPO_light;
           document.getElementById('addButton').style.color = "#333";
           
           document.getElementById('suppressButton').style.background = color_bleuLPO_light;
           document.getElementById('suppressButton').style.color = "#333";
           
           document.getElementById('modifyButton').style.background = color_bleuLPO;
           document.getElementById('modifyButton').style.color = "#FFF";
           
            break;
            
            /* Par défaut, l'onglet rajout est mis en surlignance */
          default:
          
           document.getElementById('addButton').style.background = color_bleuLPO;
           document.getElementById('addButton').style.color = "#FFF";
           
           document.getElementById('suppressButton').style.background = color_bleuLPO_light;
           document.getElementById('suppressButton').style.color = "#333";
           
           document.getElementById('modifyButton').style.background = color_bleuLPO_light;
           document.getElementById('modifyButton').style.color = "#333";
           
            break;
        }
        
        
        /* Assurance que le style d'actionButton de Shiny par défaut ne reprenne pas le dessus
        sur l'apparence personnalisée souhaité */
        
        document.getElementById('addButton').style.outline = "none";
        document.getElementById('addButton').style.shadowbox = "none";
        
        document.getElementById('suppressButton').style.outline = "none";
        document.getElementById('suppressButton').style.shadowbox = "none";
        
        document.getElementById('modifyButton').style.outline = "none";
        document.getElementById('modifyButton').style.shadowbox = "none";
        
        
      });
  });
});