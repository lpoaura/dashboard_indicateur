/* Ce script js permet de récupérer l'id du data viz survolé*/

$(document).ready(function () {

  console.log("JQuery is ok");
  
  $(function () {
      const onHover = (event) => {
      
      /* On regarde si le DOM pointé par la souris ne possède pas un parent proche
      dont l'id correspond à l'id du DOM qui englobe l'entièreté du dataViz. Si c'est le cas,
      la variable prend ce DOM, sinon il retourne une valeur null */
      let r1 = event.target.closest("#histogramme");
      let r2 = event.target.closest("#PieChart");
      
      if (r1!==null) {
        /*On modifie un input R qui va être écouté par un ObserverEvent*/
        Shiny.setInputValue('idDataViz', "histogramme",{priority: "event"});
      }
      
      else if (r2!==null) {
        /*On modifie un input R qui va être écouté par un ObserverEvent*/
        Shiny.setInputValue('idDataViz', "PieChart",{priority: "event"});
      }
      
      else {
        /* On regarde si finalement notre souris ne pointe pas un enfant ou la
        pop up elle-même. On envoie le "reset" qui va supprimer la pop up uniquement
        si ce n'est pas le cas */
        let r = event.target.closest("#popUpDataViz");
        if (r==null) {
          Shiny.setInputValue('idDataViz', "reset");
        }
      }
    }
    window.addEventListener('mouseover', onHover);
    });
  });