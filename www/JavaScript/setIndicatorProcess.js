$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'setIndicator', function (indicator) {
        let selected = document.querySelector("#selectIndicator");
        selected.value = indicator;
        console.log("New indicator " + indicator);
    });
  });
});


