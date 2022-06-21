
afficher_fournisseur_producteur<-function(groupe,type)
{
  nbPlot <- 2;
  plot1 <- NULL;
  plot2 <- NULL;
  
  if (groupe=="fournisseur"){
    base = "orb_indicateurs.mv_sraddet_ind_meta_fournisseur"
  }
  
  else if (groupe == "producteur"){
    base = "orb_indicateurs.mv_sraddet_ind_meta_producteur"
  }
  # Cas par défaut : aucun graphique à tracer
  else {
    nbPlot <- 0;
    return(list(nbPlot,plot1,plot2));
  } 
  
  if (type == "données"){
    commande1 = paste("SELECT nom_organisme, nb_data FROM", base)
    commande2 = paste("SELECT nom_organisme, nb FROM", base)
  }
  # Cas par défaut : aucun graphique à tracer
  else {
    isPlot <- 0;
    return(list(nbPlot,plot1,plot2));
  } 
  
  
  tab <- dbGetQuery(con_gn, commande1)
  x<-tab[,1]
  y<-tab[,2]
  data <- data.frame(x,y)
  plot1 <- plot_ly(data, x = ~x, y = ~y, type = 'bar', name = paste(groupe),marker = list(color = '#8031A7')) %>%
    config(displayModeBar = F)
  
  tab <- dbGetQuery(con_gn, commande2)
  x<-tab[,1]
  y<-tab[,2]
  data <- data.frame(x,y)
  plot2 <- plot_ly(data, x = ~x, y = ~y, type = 'bar', name = paste(groupe),marker = list(color = '#8031A7')) %>%
    config(displayModeBar = F)
  
  
  print(commande1)
  
  return(list(nbPlot,plot1,plot2));
}

# ##Test
# a="fournisseur"
# b="nombre de données"
# 
# 
# ui <- fluidPage(
#   plotlyOutput('plot')
# )
# 
# 
# server <- function(input, output) {
#   output$plot <- renderPlotly({afficher_fournisseur_producteur(a,b)})
# }
# 
# shinyApp(ui=ui,server=server)
