# Ce fichier gère la fonctionnalité rajout dans la page Admin

# !!!!!! ATTENTION : ce fichier peut modifier le code d'autres fichiers de l'application !!!!!! #

addAdminFct <- function(input, output, session, data_nbInd) {
  
 observeEvent(input$addAdminFctBtn,{
   if(input$infoCheckInput == "info"){
      if(input$subIndInput == "type"){
        print("HEREEE 2");
        balise <- list("#---!!! Position de buttonInd : add_button_tab_accueil !!!---#",
                       "#---!!! Position de NavBar : add_newInfo_OrInd !!!---#",
                       "#---!!! Position de Info_ind : add_description !!!---#",
                       "#---!!! Position de id_tab_accueil : add_id_list !!!---#",
                       "#---!!! Position de div_tab_accueil : add_div_info_list !!!---#",
                       "# ---!!! DERNIERE LIGNE TYPE INFORMATION !!!--- #");
        
        for(i in 1:length(balise)){
          autoCode <- autoMessage("info","type",data_nbInd$nbGeneral+1,NULL,input$nameInput,NULL,input$descriptionInput,balise[[i]]);
          if(i<4){
            script <- paste(getwd(),"/R/UI/body/createLeftBandeauAccueil.R",sep="");
          }
          else if(i<6){
            script <-  paste(getwd(),"/R/Server/buttonsAccueilTabFct.R",sep="");
          }
          else{
            script <-  paste(getwd(),"/R/UI/body/createListIndicators.R",sep="");
          }
          modifyScript(script, balise[[i]], autoCode);
        }
        
        data_nbInd$nbGeneral=getNbTypeIndInfo();
        data_nbInd$nbSub=getAllNbCateg();
        print(data_nbInd$nbGeneral);
        print(data_nbInd$nbSub);
      }
     else if(input$subIndInput == "categorie"){
       print("categorie");
       id <- input$selectTypeIndGeneral
       nbTypeCurrent<-substr(id, 4, 4);
       nbTypeCurrent <- as.numeric(nbTypeCurrent);
       
       print(nbTypeCurrent);
       print(data_nbInd$nbGeneral);
       print(data_nbInd$nbSub);
       print(data_nbInd$nbSub[[nbTypeCurrent]]);
       
         # Il faut modifier la classe du type d'indicateur car il s'agit de sa toute première catégorie
         if(data_nbInd$nbSub[[nbTypeCurrent]]==0){
           print("newcat in empty multiple ind");
           # Transformation du singleInd concerné en MultipleInd
           customBalise <- paste('buttonInd',nbTypeCurrent,sep="");
           customBalise <- paste(customBalise,'<-actionButton(inputId="ind',sep="");
           customBalise <- paste(customBalise,nbTypeCurrent,sep="");
           customBalise <- paste(customBalise,'",class="singleInd",label="',sep="");
           customBalise <- paste(customBalise,findTypeInfoForId(id),sep="");
           customBalise <- paste(customBalise,'")',sep="");
           
           
           customMessage <- paste('buttonInd',nbTypeCurrent,sep="");
           customMessage <- paste(customMessage,'<-actionButton(inputId="ind',sep="");
           customMessage <- paste(customMessage,nbTypeCurrent,sep="");
           customMessage <- paste(customMessage,'",class="multipleInd",div(class="labelMultipleInd",id="ind',sep="");
           customMessage <- paste(customMessage,nbTypeCurrent,sep="");
           customMessage <- paste(customMessage,'",tags$p("',sep="");
           customMessage <- paste(customMessage,findTypeInfoForId(id),sep="");
           customMessage <- paste(customMessage,'"),icon(name = "caret-right")))');
           
           script <- paste(getwd(),"/R/UI/body/createLeftBandeauAccueil.R",sep="");
           modifyScript(script, customBalise, customMessage);
           
           print("transformedinMulitpleInd");
           # Une fois transformé, on crée les DOM nécessaires à un mutlipleInd et son subInd
           balise <- list("#---!!! Position de buttonInd : add_button_tab_accueil !!!---#",
                          "#---!!! Position de subNavContent : add_categorie !!!---#",
                          "#---!!! Position de subNav : add_categorie !!!---#",
                          "#---!!! Position de NavBar : add_newInfo_OrInd !!!---#",
                          "#---!!! Position de Info_ind : add_description !!!---#",
                          "#---!!! Position de id_tab_accueil : add_id_list !!!---#",
                          "#---!!! Position de div_tab_accueil : add_div_info_list !!!---#");
           
           for(i in 1:length(balise)){
             autoCode <- autoMessage("info","categorie",nbTypeCurrent, data_nbInd$nbSub[[nbTypeCurrent]]+1,input$nameInput,NULL,input$descriptionInput,balise[[i]]);
             if(i<6){
               script <- paste(getwd(),"/R/UI/body/createLeftBandeauAccueil.R",sep="");
             }
             else{
               script <-  paste(getwd(),"/R/Server/buttonsAccueilTabFct.R",sep="");
             }
             modifyScript(script, balise[[i]], autoCode);
           }
           print("done");
           data_nbInd$nbSub[[nbTypeCurrent]]<-data_nbInd$nbSub[[nbTypeCurrent]]+1;
         }
         # Le type indicdateur a déjà au moins une catégorie
         else{
          
           customBalise <- paste("#---!!! Position de subNavContent : add_preexisting_ind",nbTypeCurrent,sep="");
           customBalise <- paste(customBalise,"_categorie !!!---#",sep="");
           balise <- list("#---!!! Position de buttonInd : add_button_tab_accueil !!!---#",
                          customBalise,
                          "#---!!! Position de Info_ind : add_description !!!---#",
                          "#---!!! Position de id_tab_accueil : add_id_list !!!---#",
                          "#---!!! Position de div_tab_accueil : add_div_info_list !!!---#");
           
           for(i in 1:length(balise)){
             autoCode <- autoMessage("info","categorie",nbTypeCurrent, data_nbInd$nbSub[[nbTypeCurrent]]+1,input$nameInput,NULL,input$descriptionInput,balise[[i]]);
             if(i<4){
               script <- paste(getwd(),"/R/UI/body/createLeftBandeauAccueil.R",sep="");
             }
             else{
               script <-  paste(getwd(),"/R/Server/buttonsAccueilTabFct.R",sep="");
             }
             modifyScript(script, balise[[i]], autoCode);
           }
           
           data_nbInd$nbSub[[nbTypeCurrent]]<-data_nbInd$nbSub[[nbTypeCurrent]]+1;
           
         }
     }
   }
 });
  
}

autoMessage<-function(infoCheck, subInd, nbType, nbSub, nameInd, criteria, description, balise){
  if(infoCheck == "info"){
    if(subInd == "type"){
      #Création du code automatique lié à la balise
      switch(balise,
             "#---!!! Position de buttonInd : add_button_tab_accueil !!!---#"={
               
               autoCode <- paste('buttonInd',nbType,sep="");
               autoCode<- paste(autoCode,'<-actionButton(inputId="ind',sep="");
               autoCode <- paste(autoCode,nbType,sep="");
               autoCode<- paste(autoCode,'",class="singleInd",label="',sep="");
               autoCode<-paste(autoCode, nameInd,sep="");
               autoCode<- paste(autoCode, '")',sep="");
               
               message <- paste(autoCode,"",sep="\n");
               message <- paste(message,"",sept="\n");
               message <- paste(message,"#---!!! Position de buttonInd : add_button_tab_accueil !!!---#",sep="");
               
             },
             "#---!!! Position de NavBar : add_newInfo_OrInd !!!---#"={
               
               autoCode <- paste(', buttonInd',nbType,sep="");
               
               message <- paste(autoCode, "", sep="\n");
               message <- paste(message, "#---!!! Position de NavBar : add_newInfo_OrInd !!!---#",sep="");
               
             },
             "#---!!! Position de Info_ind : add_description !!!---#"={
               
               autoCode <- paste('divInfo_ind',nbType,sep="");
               autoCode <- paste(autoCode,'<- div(id="info_ind',sep="");
               autoCode <- paste(autoCode,nbType,sep="");
               autoCode <- paste(autoCode,'",class="info",h1(class="indName","',sep="");
               autoCode <- paste(autoCode, nameInd);
               autoCode <- paste(autoCode,'"),tags$p(class="indExplanation","',sep="");
               autoCode <- paste(autoCode, description,sep="");
               autoCode <- paste(autoCode,'"))',sep="");
               
               message <- paste(autoCode,"",sep="\n");
               message <- paste(message,"",sept="\n");
               message <- paste(message,"#---!!! Position de Info_ind : add_description !!!---#",sep="");
               
             },
             "#---!!! Position de id_tab_accueil : add_id_list !!!---#"={
               
               autoCode <- paste(',"ind',nbType,sep="");
               autoCode <- paste(autoCode,'"',sep="");
               
               message<- paste(autoCode,"#---!!! Position de id_tab_accueil : add_id_list !!!---#",sep="");
               
             },
             "#---!!! Position de div_tab_accueil : add_div_info_list !!!---#"={
               
               autoCode <- paste(',divInfo_ind',nbType,sep="");
               
               message<- paste(autoCode,"#---!!! Position de div_tab_accueil : add_div_info_list !!!---#",sep="");
               
             },
             "# ---!!! DERNIERE LIGNE TYPE INFORMATION !!!--- #"={
               
               autoCode <- paste('newRow <- list("',nameInd,sep="");
               autoCode <- paste(autoCode,'", "ind',sep="");
               autoCode <- paste(autoCode, nbType,sep="");
               autoCode <- paste(autoCode,'");',sep="");
               autoCode <- paste(autoCode,"",sep="\n");
               autoCode <- paste(autoCode,'typeInfoTab <- rbind(typeInfoTab,newRow);',sep="");
               
               message <- paste(autoCode,"",sep="\n");
               message <- paste(message,"# ---!!! DERNIERE LIGNE TYPE INFORMATION !!!--- #",sep="");
               
             })
      return(message);
    }
    else if(subInd == "categorie"){
      customBalise <- paste("#---!!! Position de subNavContent : add_preexisting_ind",nbType);
      customBalise <- paste(customBalise,"_categorie !!!---#",sep="");
      switch(balise,
             "#---!!! Position de buttonInd : add_button_tab_accueil !!!---#"={
               
               autoCode <- paste('buttonInd',nbType,sep="");
               autoCode<- paste(autoCode,nbSub,sep="");
               autoCode<- paste(autoCode,'<-actionButton(inputId="ind',sep="");
               autoCode <- paste(autoCode,nbType,sep="");
               autoCode<- paste(autoCode,'",class="subInd",label="',sep="");
               autoCode<-paste(autoCode, nameInd,sep="");
               autoCode<- paste(autoCode, '")',sep="");
               
               message <- paste(autoCode,"",sep="\n");
               message <- paste(message,"",sept="\n");
               message <- paste(message,"#---!!! Position de buttonInd : add_button_tab_accueil !!!---#",sep="");
               
             },
             customBalise={
               
               autoCode <- paste(', buttonInd',nbType,sep="");
               autoCode <- paste(autoCode,nbSub,sep="");
               
               message <- paste(autoCode,"",sep="\n");
               message <- paste(message,customBalise,sep="");
               
             },
             "#---!!! Position de subNavContent : add_categorie !!!---#"={
              
               autoCode <- paste('divSubNavContent',nbType,sep="");
               autoCode <- paste(autoCode, '<-div(class="subNavContent", id="subNavContentInd',sep="");
               autoCode <- paste(autoCode,nbType,sep="");
               autoCode <- paste(autoCode,'", buttonInd',sep="");
               autoCode <- paste(autoCode,nbType,sep="");
               autoCode <- paste(autoCode,nbSub,sep="");
               autoCode <- paste(autoCode,")",sep="");
               
               message <- paste(autoCode,"",sep="\n");
               message <- paste(message,customBalise,sep="");
               message <- paste(message,"",sep="\n");
               message <- paste(message,"",sep="\n");
               message <- paste(message,"#---!!! Position de subNavContent : add_categorie !!!---#",sep="");
               
             },
             "#---!!! Position de subNav : add_categorie !!!---#"={
               
               autoCode <- paste('divSubNav',nbType,sep="");
               autoCode <- paste(autoCode,'<-div(class="subNav",id="subNavInd',sep="");
               autoCode <- paste(autoCode,nbType,sep="");
               autoCode <- paste(autoCode,'",buttonInd',sep="");
               autoCode <- paste(autoCode,nbType,sep="");
               autoCode <- paste(autoCode,',divSubNavContent',sep="");
               autoCode <- paste(autoCode,nbType,sep="");
               autoCode <- paste(autoCode,')',sep="");
               
               message <- paste(autoCode,"",sep="\n");
               message <- paste(message,"",sep="\n");
               message <- paste(message,"#---!!! Position de subNav : add_categorie !!!---#",sep="");
               
             },
             "#---!!! Position de NavBar : add_newInfo_OrInd !!!---#"={
               
               autoCode <- paste(', divSubNav',nbType,sep="");
               
               message <- paste(autoCode, "", sep="\n");
               message <- paste(message, "#---!!! Position de NavBar : add_newInfo_OrInd !!!---#",sep="");
               
             },
             "#---!!! Position de Info_ind : add_description !!!---#"={
               
               autoCode <- paste('divInfo_ind',nbType,sep="");
               autoCode <- paste(autoCode,nbSub,sep="");
               autoCode <- paste(autoCode,'<- div(id="info_ind',sep="");
               autoCode <- paste(autoCode,nbType,sep="");
               autoCode <- paste(autoCode,nbSub,sep="");
               autoCode <- paste(autoCode,'",class="info",h1(class="indName","',sep="");
               autoCode <- paste(autoCode, nameInd);
               autoCode <- paste(autoCode,'"),tags$p(class="indExplanation","',sep="");
               autoCode <- paste(autoCode, description,sep="");
               autoCode <- paste(autoCode,'"))',sep="");
               
               print(autoCode);
               
               message <- paste(autoCode,"",sep="\n");
               message <- paste(message,"",sept="\n");
               message <- paste(message,"#---!!! Position de Info_ind : add_description !!!---#",sep="");
               
             },
             "#---!!! Position de id_tab_accueil : add_id_list !!!---#"={
               
               autoCode <- paste(',"ind',nbType,sep="");
               autoCode <- paste(autoCode,nbSub,sep="");
               autoCode <- paste(autoCode,'"',sep="");
               
               message<- paste(autoCode,"#---!!! Position de id_tab_accueil : add_id_list !!!---#",sep="");
               
             },
             "#---!!! Position de div_tab_accueil : add_div_info_list !!!---#"={
               
               autoCode <- paste(',divInfo_ind',nbType,sep="");
               autoCode <- paste(autoCode,nbSub,sep="");
               
               message<- paste(autoCode,"#---!!! Position de div_tab_accueil : add_div_info_list !!!---#",sep="");
               
             })
    }
  }
}

modifyScript<-function(script, balise, message){
  readLines(script,warn=FALSE) %>% 
    stringr::str_replace(balise,message) %>%
    writeLines(script);
}