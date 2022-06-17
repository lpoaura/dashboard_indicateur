$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'selectGroupe', function (message) {
        let indic = document.querySelector('#selectGroupe');
        console.log("New groupe " + indic.options[indic.selectedIndex].text);
        Shiny.setInputValue('currentGroupe',indic.options[indic.selectedIndex].text);
    });
  });
});


