/* Ce script permet de mettre à jour la valeur d'indicateur actuel dans une
reactiveValues */

$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'setIndicator', function (indicator) {
        Shiny.setInputValue('selectIndicator', indicator);
        console.log("New indicator set " + indicator);
    });
  });
});


