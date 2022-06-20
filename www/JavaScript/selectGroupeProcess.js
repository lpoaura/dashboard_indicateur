/* Ce script permet de mettre à jour la valeur affichée du groupe actuel */

$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'showGroupe', function (groupe) {
        document.getElementById('selectGroupe').value = groupe;
        console.log("New groupe shown " + groupe);
    });
  });
});


