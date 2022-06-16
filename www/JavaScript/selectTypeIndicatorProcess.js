$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'selectTypeIndicator', function (message) {
        let indic = document.querySelector('#selectTypeIndicator');
        console.log("New type indicator " + indic.options[indic.selectedIndex].text);
        Shiny.setInputValue('currentTypeIndName',indic.options[indic.selectedIndex].text);
    });
  });
});


