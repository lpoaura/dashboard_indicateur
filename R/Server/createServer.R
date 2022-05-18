#Ce fichier crée le serveur nécessaire au bon fonctionnement de l'application web.

server <- function(input, output, session) {
  
  observeEvent(input$accueilButton, {
    print("accueil pressed");
    removeUI(
      selector = '#total'
    )
    insertUI(
      selector = '.container-fluid',
      ui = uiAccueil)
  })
  
  observeEvent(input$globalButton, {
    print("global pressed");
    removeUI(
      selector = '#total'
    )
    insertUI(
      selector = '.container-fluid',
      ui = uiGlobal)
  })
  
  observeEvent(input$expertButton, {
    print("expert pressed");
    removeUI(
      selector = '#total'
    )
    insertUI(
      selector = '.container-fluid',
      ui = uiExpert)
  })
  
  observeEvent(input$adminButton, {
    print("admin pressed");
    removeUI(
      selector = '#total'
    )
    insertUI(
      selector = '.container-fluid',
      ui = uiAdmin)
    
  })
}