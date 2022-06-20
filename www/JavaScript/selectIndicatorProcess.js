/* Ce script permet de mettre à jour la valeur affichée de l'indicateur actuel */

$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'showIndicator', function (indicator) {
        document.getElementById('selectIndicator').value = indicator;
        console.log("New indicator shown " + indicator);
    });
  });
});


