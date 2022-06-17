$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'selectDeclinaison', function (message) {
        let indic = document.querySelector('#selectDeclinaison');
        console.log("New declinaison " + indic.options[indic.selectedIndex].text);
        Shiny.setInputValue('currentDeclinaison',indic.options[indic.selectedIndex].text);
    });
  });
});


