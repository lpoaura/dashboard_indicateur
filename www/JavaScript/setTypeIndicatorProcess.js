$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'setTypeIndicatorName', function (typeInd) {
        let selected = document.querySelector("#selectTypeIndicator");
        selected.value = typeInd;
        console.log("New type indicator " + typeInd);
    });
  });
});


