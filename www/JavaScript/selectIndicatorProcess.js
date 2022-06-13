$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'selectIndicator', function (message) {
        let indic = document.querySelector('#selectIndicator');
        console.log("New indicator " + indic.value);
        Shiny.setInputValue('currentInd', indic.value);
    });
  });
});


