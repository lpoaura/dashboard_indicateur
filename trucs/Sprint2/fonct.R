
afficher_pie<-function(groupe,sous_groupe)
{
  qualite_labels = c('Faible', 'Moyenne', 'Bonne','Elevee')
  
  if ((groupe == "general")OR(groupe="pole")){
    base = "orb_indicateurs.ind_connaissance_pole"
  }
  
  if ((groupe == "taxo"){
    base = "orb_indicateurs.ind_connaissance_taxo"
  }
  
  
  
  commande = paste("SELECT count(*) FROM", base, "WHERE ind_tot_group =")
  
  
  com_faible <- paste(commande,"'Faible'")
  com_moyenne <- paste(commande,"'Moyenne'")
  com_bonne <- paste(commande,"'Bonne'")
  com_elevee <- paste(commande,"'Ã‰levÃ©s'")
  
  if ((groupe == "general")OR(groupe="pole")){
    
    com_faible <- paste(com_faible, "AND declinaison ='",sous_groupe,"'")
    com_moyenne <- paste(com_moyenne "AND declinaison ='",sous_groupe,"'")
    com_bonne <- paste(com_bonne "AND declinaison ='",sous_groupe,"'")
    com_elevee <- paste(com_elevee "AND declinaison ='",sous_groupe,"'")
    
                       
  qualite = c(faible,moyenne,bonne,elevee)
  df = data.frame(qualite_labels,qualite)
  
  plot <- plot_ly(data = df, labels = ~qualite_labels, values = ~qualite, type = "pie", hole=0.6,
                textinfo = "percent", 
                marker = list(colors = colors1),
                insidetextorientation = "horizontal")  %>% layout(title = 'Proportion de mailles par niveau de connaissances')
return(plot)
}



##Test
a="general"

d <- afficher_pie(a)

ui <- fluidPage(
    plotlyOutput('plot')
  )


server <- function(input, output) {
  output$plot <- renderPlotly({afficher_pie(a)})
}

shinyApp(ui=ui,server=server)

h <- dbGetQuery(con_gn, "SELECT distinct declinaison FROM orb_indicateurs.ind_connaissance_taxo")
                                          
                                          