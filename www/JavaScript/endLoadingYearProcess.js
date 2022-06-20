/* Ce script permet d'arrêter l'état "loading" des années */

$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'endLoadingYear', function (end) {
        Shiny.setInputValue('endLoadingYear', end);
    });
  });
});


