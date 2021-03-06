fcouleur_bar <- function(groupe){
  colors1 <- '#8031A7'#violet
  colors2 <- '#EA7200'#orange
  colors3 <- '#6AB023'#vert
  colors4 <- '#0099D0'#bleu
  if (groupe =="taxo"){return(colors1)}
  else if (groupe =="flore"){return(colors3)}
  else if (groupe =="invertebre"){return(colors2)}
  else if (groupe =="vertebre"){return(colors4)}
  else if (groupe =="pole" || groupe == "general"){return(c(colors3,colors2,colors4))}
}

afficher_bar<-function(groupe,pole,type,taxo,année)
{
  isPlot <- TRUE;
  plot <- NULL;
  titre <- "";
  
  if (groupe=="pole"){
    if (pole == "general") {
      base = "orb_indicateurs.mv_sraddet_ind_pole";
      subTitle <- "par pôles";
    }
    # Cas par défaut : aucun barChart à tracer
    else {
      isPlot <- FALSE;
      return(list(isPlot,plot,titre));
    }
  }
  else if (groupe == "taxo"){
    if (taxo == "Toutes") {
      base = "orb_indicateurs.mv_sraddet_ind_taxo";
      subTitle <- "par taxonomies";
    }
    # Cas par défaut : aucun barChart à tracer
    else {
      isPlot <- FALSE;
      return(list(isPlot,plot,titre));
    }
  }
  else if (groupe == "general"){
    base = "orb_indicateurs.mv_sraddet_ind_pole";
    subTitle <- "par pôles";
  }
  # Cas par défaut : aucun barChart à tracer
  else {
    isPlot <- FALSE;
    return(list(isPlot,plot,titre));
  }
  
  
  if (type == "données"){
    commande = paste("SELECT declinaison, sum(nb_data_tot) FROM", base)
    subTitle <- paste("Nombre de données", subTitle);
  }
  
  else if (type == "especes"){
    commande = paste("SELECT declinaison, sum(nb_espece_dis) FROM", base)
    subTitle <- paste("Nombre d'espèces", subTitle);
  }
  # Cas par défaut : aucun barChart à tracer
  else {
    isPlot <- FALSE;
    return(list(isPlot,plot,titre));
  }
  
  if (année != 0){
    date <- paste("WHERE annee ='",année,"'",sep = "")
    titre <- paste(subTitle, "en", année);
  }
  else {
    date <- ""
    titre <- paste(subTitle, "sur l'ensemble des années");
  }
  
  commande <- paste(commande,date,"group by declinaison order by declinaison asc")
  tab <- dbGetQuery(con_gn, commande)
  data <- data.frame(y = 0, x = "rien")
  if (groupe == "taxo") {
    for (i in 1:nrow(tab)) {
      if (getIsPoleGroupe(tab[i,1], pole)) {
        newRow <- list(tab[i,2], tab[i,1]);
        data <- rbind(data, newRow);
      }
    }
    data <- data[-1, ]
    y<-data[,1]
    x<-data[,2]
  }
  else {
    y<-tab[,2]
    x<-tab[,1]
    data <- data.frame(y, x)
  }
  
  # Choix de la couleur du graphique
  if (pole == "Flore et Fongus") {
    groupeCouleur <- "flore";
  }
  else if (pole == "Invertébrés") {
    groupeCouleur <- "invertebre";
  }
  else if (pole == "Vertébrés") {
    groupeCouleur <- "vertebre";
  }
  else {
    groupeCouleur <- groupe;
  }
  
  plot <- plot_ly(tab, x = ~y, y = ~x, type = 'bar', name = paste(groupe),marker = list(color = fcouleur_bar(groupeCouleur))) %>%
    config(displayModeBar = F)
  print(commande)
  
  return(list(isPlot,plot,titre));
}


# ##Test
# a="taxo"
# b="données"
# c=2021
# 
# 
# ui <- fluidPage(
#   plotlyOutput('plot')
# )
# 
# 
# server <- function(input, output) {
#   output$plot <- renderPlotly({afficher_bar(a,b,c)})
# }
# 
# shinyApp(ui=ui,server=server)
# 
# 
# x <- dbGetQuery(con_gn,"SELECT declinaison,sum(nb_data_tot) FROM orb_indicateurs.mv_sraddet_ind_pole WHERE annee ='2021' group by declinaison ")[,1]
# 
