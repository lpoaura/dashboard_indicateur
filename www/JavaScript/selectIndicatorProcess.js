$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'selectIndicator', function (message) {
        let indic = document.querySelector('#selectIndicator');
        console.log("New indicator " + indic.value);
        console.log("New indicator " + indic.options[indic.selectedIndex].text);
        Shiny.setInputValue('currentInd', indic.value);
        Shiny.setInputValue('currentIndName',indic.options[indic.selectedIndex].text);
    });
  });
});


