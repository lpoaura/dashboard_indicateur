/* Ce script js permet de récupérer modifier le nom de l'indicateur
sélectionné en fonction de l'indicateur sélectionné */

$(document).ready(function () {

  console.log("JQuery is ok");
   $(function () {
    Shiny.addCustomMessageHandler(
      'updateIndicatorName', function (name) {
        document.getElementById('indicatorName').textContent = name;
      });
   }); 
  });