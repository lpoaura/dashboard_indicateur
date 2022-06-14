# Ce fichier gère la dynamique du panneau de la fonctionnalité rajout dans le mode Admin

buttonLogInAdminFct <- function(input, output, session, mdpAdmin) {
  
  # Si modification entre information ou indicateur
  observeEvent(input$submitPwd, {
    
    if(input$pwdInput == mdpAdmin){
       removeUI(selector = "#panelLogIn")
      
      insertUI(selector = "#bandeauAdmin", ui = divNavOption)
      insertUI(selector = "#bandeauAdmin", ui = divPanelAdd)
    }
    else{
      insertUI(selector = "#panelLogIn", ui = badPwdAlerte)
    }
    
  });
  
}