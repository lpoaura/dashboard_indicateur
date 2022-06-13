$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'setIndicators', function (listIndicators) {
        for (let i = 0; i < listIndicators.length; i++) {
          let option = new Option(listIndicators[i],i);
          document.getElementById("selectIndicator").add(option, undefined);
        }
    });
  });
});

