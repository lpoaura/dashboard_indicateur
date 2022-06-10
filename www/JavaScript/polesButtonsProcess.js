$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    Shiny.addCustomMessageHandler(
      'actualizePolesButtons', function (polesButtons) {
        switch (polesButtons) {
          case 'all':
            color1 = "165, 106, 194";
            color2 = "165, 106, 194";
            break;
          case 'flore':
            color1 = "106, 176, 35";
            color2 = "106, 176, 35";
            break;
          case 'invertebre':
            color1 = "234, 114, 0";
            color2 = "234, 114, 0";
            break;
          case 'vertebre':
            color1 = "0, 153, 208";
            color2 = "0, 153, 208";
            break;
          case 'fi':
            color1 = "106, 176, 35";
            color2 = "234, 114, 0";
            break;
          case 'fv':
            color1 = "106, 176, 35";
            color2 = "0, 153, 208";
            break;
          case 'iv':
            color1 = "234, 114, 0";
            color2 = "0, 153, 208";
            break;
          default:
            color1 = "165, 106, 194";
            color2 = "165, 106, 194";
        }
        document.getElementById('selectIndicator').style.background =
              "linear-gradient(90deg, rgba(" +
              color1 + ",1) 0%, rgba(" +
              color1 + ",1) 33%, rgba(" +
              color2 + ",1) 67%, rgba(" +
              color2 + ",1) 100%)";
    });
  });

});

