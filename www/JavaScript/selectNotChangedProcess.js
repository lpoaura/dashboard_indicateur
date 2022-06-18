$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'selectNotChanged', function (message) {
        currValueType = message[0];
        Shiny.setInputValue('selectNotChanged', currValueType);
        console.log("New current value not changed : " + currValueType);
        if (currValueType == "declinaison") {
          currValue = message[1];
          //console.log("!!!!!!!!! DEC " + document.getElementById('selectDeclinaison').value)
          //document.getElementById('selectDeclinaison').value = currValue;
          //console.log("!!!!!!!!! DEC " + document.getElementById('selectDeclinaison').value)
        }
    });
  });
});


