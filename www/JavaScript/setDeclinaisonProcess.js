$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'setDeclinaisonName', function (nDecli) {
        let selected = document.querySelector("#selectDeclinaison");
        selected.selectedIndex = nDecli - 1;
        console.log("New declinaison " + selected.value);
        Shiny.setInputValue('selectDeclinaison',selected.options[selected.selectedIndex].text);
    });
  });
});


