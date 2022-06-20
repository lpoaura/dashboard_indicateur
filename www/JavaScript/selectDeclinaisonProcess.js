/* Ce script permet de mettre à jour la valeur affichée de la déclinaison actuelle */

$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'showDeclinaison', function (declinaison) {
        document.getElementById('selectDeclinaison').value = declinaison;
        console.log("New declinaison shown " + declinaison);
    });
  });
});


