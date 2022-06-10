/* Ce script js permet de récupérer l'id de l'onglet du mode Accueil sélectionné
par l'utilisateur via un click*/

$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
    const onClick = (event) => {
      /* Si on clique sur un bouton qui n'est pas un bouton autre que ceux du mode Accueil ou si on clique sur la div que contient un bouton d'un indicateur général multiple*/
      if ((event.target.nodeName === 'BUTTON' && event.target.className!=="btn btn-default action-button shiny-bound-input") || event.target.className === 'labelMultipleInd') {
        /*On affiche la valeur dans la console du browser*/
        console.log(event.target.id);
        /*On modifie un input R qui va être écouté par un ObserverEvent*/
        Shiny.setInputValue('tabAccueilNew', event.target.id,{priority: "event"});
      }
    }
    window.addEventListener('click', onClick);
    });
  });
