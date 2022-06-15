
afficher_fournisseur_producteur<-function(groupe,type)
{
  if (groupe=="fournisseur"){
    base = "orb_indicateurs.mv_sraddet_ind_meta_fournisseur"
  }
  
  if (groupe == "producteur"){
    base = "orb_indicateurs.mv_sraddet_ind_meta_producteur"
  }
  
  if (type == "nombre de données"){
    commande = paste("SELECT nom_organisme, nb_data FROM", base)
  }
  
  if (type == "nombre de jeu de données"){
    commande = paste("SELECT nom_organisme, nb FROM", base)
  }
  
  tab <- dbGetQuery(con_gn, commande)
  x<-tab[,1]
  y<-tab[,2]
  data <- data.frame(x,y)
  plot <- plot_ly(data, x = ~x, y = ~y, type = 'bar', name = paste(groupe),marker = list(color = '#8031A7')) %>%
  config(displayModeBar = F)
  print(commande)
  
  return(plot)
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
