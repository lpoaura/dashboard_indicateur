$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'setTypeIndicatorName', function (typeInd) {
        Shiny.setInputValue('selectTypeIndicator', typeInd);
        console.log("New current type indicator name set :" + typeInd);
    });
  });
});


