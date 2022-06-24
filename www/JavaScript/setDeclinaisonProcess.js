/* Ce script permet de mettre à jour la valeur de la déclinaison actuelle dans 
une reactiveValues */

$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'setDeclinaison', function (declinaison) {
        Shiny.setInputValue('selectDeclinaison', declinaison);
        console.log("New declinaison set " + declinaison);
    });
  });
});


