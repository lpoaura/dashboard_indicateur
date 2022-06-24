/* Ce script permet de mettre à jour la valeur du type d'indicateur actuel dans 
une reactiveValues */

$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'setTypeIndicatorName', function (typeInd) {
        Shiny.setInputValue('selectTypeIndicator', typeInd);
        console.log("New current type indicator name set :" + typeInd);
    });
  });
});


