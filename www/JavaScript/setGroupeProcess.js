/* Ce script permet de mettre à jour la valeur du groupe actuelle dans une 
reactiveValues */

$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'setGroupe', function (groupe) {
        Shiny.setInputValue('selectGroupe', groupe);
        console.log("New groupe set " + groupe);
    });
  });
});


