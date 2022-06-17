$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'setGroupeName', function (nGroupe) {
        let selected = document.querySelector("#selectGroupe");
        selected.selectedIndex = nGroupe - 1;
        console.log("New groupe " + selected.value);
    });
  });
});


