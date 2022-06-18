$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'showDeclinaison', function (declinaison) {
        document.getElementById('selectDeclinaison').value = declinaison;
        console.log("New declinaison shown " + declinaison);
    });
  });
});


