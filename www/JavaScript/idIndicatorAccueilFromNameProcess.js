/* Ce script js permet de récupérer l'id de l'onglet du mode Accueil sélectionné
par l'utilisateur via un clic*/

$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
     Shiny.addCustomMessageHandler(
      'getIdIndicatorAccueil', function (indicatorName) {
        let singleColl = document.getElementsByClassName('singleInd');
        let multipleColl = document.getElementsByClassName('labelMultipleInd');
        let subColl = document.getElementsByClassName('subInd');
        
        for (let i=0;i<singleColl.length;i++)
        {
          if(singleColl[i].textContent === indicatorName){
            Shiny.setInputValue('tabAccueilNew',singleColl[i].id);
          }
        }
        
        for (let i=0;i<multipleColl.length;i++)
        {
          if(document.querySelector('#'+multipleColl[i].id+' p').textContent === indicatorName){
            Shiny.setInputValue('tabAccueilNew',multipleColl[i].id);
          }
        }
       
        for (let i=0;i<subColl.length;i++)
        {
          if(subColl[i].textContent === indicatorName){
            Shiny.setInputValue('tabAccueilNew',subColl[i].id);
          }
        }
       
    });
  });
});