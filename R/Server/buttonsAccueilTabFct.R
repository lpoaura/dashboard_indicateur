# Ce fichier crée une fonction qui sera appelée dans le server pour gérer les
# onglets du mode Accueil

# Listes nécessaires à la bonne indexation des panneaux infos
listIdTabAccueil <- list("ind1","ind11","ind12","ind13","ind2","ind21","ind22",
                         "ind23","ind3", "ind31")#,
                         #"ind4")
listDivTabAccueil <- list(divInfo_ind1,divInfo_ind11,divInfo_ind12,divInfo_ind13,
                          divInfo_ind2,divInfo_ind21,divInfo_ind22,divInfo_ind23,
                          divInfo_ind3,divInfo_ind31)#,
                          # divInfo_ind4)



buttonsAccueilTabFct <- function(input, output, session, data_tabAccueil) {
 
  # Bouton d'onglet du mode Accueil sélectionné par l'utilisateur
  observeEvent(input$tabAccueilNew, {
    
    print(input$tabAccueilNew)
    print("pressed from");
    print(data_tabAccueil$tab);
    
    # Changement des boutons de navigation
    session$sendCustomMessage(type = 'actualizeOldTabAccueil', message = data_tabAccueil$tab)
    session$sendCustomMessage(type = 'actualizeNewTabAccueil', message = input$tabAccueilNew)
    
    # Changement de la page à faire
    removedUI <- paste("#info_",data_tabAccueil$tab,sep="")
    removeUI(selector = removedUI)

    index<-findIndex(listIdTabAccueil,input$tabAccueilNew);
    if(index>-1)
    {
        insertUI(selector = "#bandeauAccueil",ui = listDivTabAccueil[[index]])
    }
    else{print("Index not found in : Accueil")}
    
    data_tabAccueil$tab <- input$tabAccueilNew;
  });
  
}

# Fonction permettant de trouver l'indice d'un élement dans une liste via son contenu
findIndex<-function(list,content){
  compt <- 1;
  index <- -1;
  for(element in list){
    if(element == content)
    {
      index<-compt;
    }
    compt<-compt+1;
  }
  return(index)
}