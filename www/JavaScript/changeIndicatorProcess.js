$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'changeIndicator', function (indicator) {
        Shiny.setInputValue('currentInd',indicator);
        console.log("New indicator " + indicator);
    });
  });
});


