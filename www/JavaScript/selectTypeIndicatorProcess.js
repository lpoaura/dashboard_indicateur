/* Ce script permet de mettre à jour la valeur affichée de le type d'indicateur actuel */

$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'showTypeIndicator', function (typeInd) {
        document.getElementById('selectTypeIndicator').value = typeInd;
        console.log("New type indicator shown " + typeInd);
    });
  });
});


