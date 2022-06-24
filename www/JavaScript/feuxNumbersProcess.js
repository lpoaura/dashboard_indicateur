/* Ce script permet de mettre à jour les nombres correspondants aux feux actifs */

$(document).ready(function () {

  console.log("JQuery is ok");

  $(function () {
    
    function lisibilite_nombre(nbr) {
  		var nombre = ''+nbr;
  		var retour = '';
  		var count=0;
  		for(var i=nombre.length-1 ; i>=0 ; i--)
  		{
  			if(count!=0 && count % 3 == 0)
  				retour = nombre[i]+' '+retour ;
  			else
  				retour = nombre[i]+retour ;
  			count++;
  		}
  		return retour;
    }
  
    Shiny.addCustomMessageHandler(
      'actualizeFeuxNumbers', function (numbers) {
        document.getElementById('affichageNbData').textContent = lisibilite_nombre(numbers[0]);
        
        document.getElementById('affichageNbSpecies').textContent = lisibilite_nombre(numbers[1]);
        
        Shiny.setInputValue("feuxActualized", "noChange");
    });
  });
});

