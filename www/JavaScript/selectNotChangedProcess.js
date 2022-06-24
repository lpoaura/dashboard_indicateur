/* Ce script permet de mettre à jour la valeur d'un select dans une reactiveValues
et de continuer les actions dans la mise à jour des selectors même si le selector
actuel n'a pas été modifié */

$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'selectNotChanged', function (currValueType) {
        Shiny.setInputValue('selectNotChanged', currValueType);
        console.log("New current value not changed : " + currValueType);
    });
  });
});


