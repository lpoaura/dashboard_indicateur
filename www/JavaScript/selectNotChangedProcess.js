$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'selectNotChanged', function (currValueType) {
        Shiny.setInputValue('selectNotChanged', currValueType);
        console.log("New current value not changed : " + currValueType);
    });
  });
});


