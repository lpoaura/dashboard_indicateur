$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'setYear', function (currentYear) {
        if (currentYear != 0) {
          console.log("Initialisation de l'année à " + currentYear);
          Shiny.setInputValue('setYear', currentYear);
        }
    });
  });
});


