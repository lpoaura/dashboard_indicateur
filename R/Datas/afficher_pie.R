# Fonctions permettant de récupérer le bon pieChart
print("Create function to get a pie chart...")

afficher_pie<-function(groupe,pole,taxo,année,type)
{
  nbPlot <- 1;
  plot1 <- NULL;
  plot2 <- NULL;
  listPoles <- fdecode_poles(pole);
  
  qualite_labels = c('Faible', 'Moyenne', 'Bonne','Elevee')
  
  if (type == "connaissances") {
    
  }
  # Cas par défaut : aucun pieChart à tracer
  else {
    nbPlot <- 0;
    return(list(nbPlot,plot1,plot2));
  } 
  
  if ((groupe == "general")||(groupe=="pole")){
    base = "orb_indicateurs.ind_connaissance_pole"
  }
  else if (groupe == "taxo"){
    if (taxo != "Toutes") {
      pole <- findPoleForTaxo(taxo);
      listPoles <- fdecode_poles(pole);
      base = "orb_indicateurs.ind_connaissance_taxo"
    }
    # Cas par défaut : aucun pieChart à tracer
    else {
      nbPlot <- 0;
      return(list(nbPlot,plot1,plot2));
    }
  }
  # Cas par défaut : aucun pieChart à tracer
  else {
    nbPlot <- 0;
    return(list(nbPlot,plot1,plot2));
  }
  
  commande = paste("SELECT count(*) FROM", base, "WHERE ind_tot_group =")
  
  com_faible <- paste(commande,"'Faible'")
  com_moyenne <- paste(commande,"'Moyenne'")
  com_bonne <- paste(commande,"'Bonne'")
  com_elevee <- paste(commande,"'Ã‰levÃ©s'")
  
  if (groupe == "general") {
    
  }
  else if (groupe == "taxo") {
    com_faible <- paste(com_faible, " AND declinaison ='",taxo,"'",sep = "")
    com_moyenne <- paste(com_moyenne, " AND declinaison ='",taxo,"'",sep = "")
    com_bonne <- paste(com_bonne, " AND declinaison ='",taxo,"'",sep = "")
    com_elevee <- paste(com_elevee, " AND declinaison ='",taxo,"'",sep = "")
  }
  else if (groupe == "pole") {
    # On ne peut pas afficher un pieChart avec plusieurs pôles, on en affiche
    # donc 2 si il y a deux pôles.
    if (listPoles[[1]] == 2) {
      nbPlot <- 2;
    }
    
    com_faible <- paste(com_faible, " AND declinaison ='",listPoles[[2]],"'",sep = "")
    com_moyenne <- paste(com_moyenne, " AND declinaison ='",listPoles[[2]],"'",sep = "")
    com_bonne <- paste(com_bonne, " AND declinaison ='",listPoles[[2]],"'",sep = "")
    com_elevee <- paste(com_elevee, " AND declinaison ='",listPoles[[2]],"'",sep = "")
    
    if (nbPlot == 2) {
      com_faible2 <- paste(commande,"'Faible'", " AND declinaison ='",listPoles[[3]],"'",sep = "")
      com_moyenne2 <- paste(commande,"'Moyenne'", " AND declinaison ='",listPoles[[3]],"'",sep = "")
      com_bonne2 <- paste(commande,"'Bonne'", " AND declinaison ='",listPoles[[3]],"'",sep = "")
      com_elevee2 <- paste(commande,"'Ã‰levÃ©s'", " AND declinaison ='",listPoles[[3]],"'",sep = "")
    }
  }
  # Cas par défaut : aucun pieChart à tracer
  else {
    nbPlot <- 0;
    return(list(nbPlot,plot1,plot2));
  }
  
  
  if (année != 0){
    annéeinf = 2001+(floor((année-2001)/5))*5
    annéesup= annéeinf+4
    créneau = paste(annéeinf,"-",annéesup)
    com_faible <- paste(com_faible, " AND annee_group ='",créneau,"'",sep = "")
    com_moyenne <- paste(com_moyenne, " AND annee_group ='",créneau,"'",sep = "")
    com_bonne <- paste(com_bonne, " AND annee_group ='",créneau,"'",sep = "")
    com_elevee <- paste(com_elevee, " AND annee_group ='",créneau,"'",sep = "")
    
    if (nbPlot == 2) {
      com_faible2 <- paste(com_faible2, " AND annee_group ='",créneau,"'",sep = "")
      com_moyenne2 <- paste(com_moyenne2, " AND annee_group ='",créneau,"'",sep = "")
      com_bonne2 <- paste(com_bonne2, " AND annee_group ='",créneau,"'",sep = "")
      com_elevee2 <- paste(com_elevee2, " AND annee_group ='",créneau,"'",sep = "")
    }
  }
  
  faible <- dbGetQuery(con_gn, com_faible)[,1,1]
  moyenne <- dbGetQuery(con_gn, com_moyenne)[,1,1]
  bonne <- dbGetQuery(con_gn, com_bonne)[,1,1]
  elevee <- dbGetQuery(con_gn, com_elevee)[,1,1]
  
  qualite = c(faible,moyenne,bonne,elevee)
  df = data.frame(qualite_labels,qualite)
  
  # Création de pieChart
  plot1 <- plot_ly(data = df, labels = ~qualite_labels, values = ~qualite, type = "pie", hole=0.6,
                   textinfo = "percent", 
                   marker = list(colors = fcouleur(listPoles[[2]])),
                   insidetextorientation = "horizontal")  %>% layout(title = listPoles[[2]])
  
  if (nbPlot == 2) {
    
    faible2 <- dbGetQuery(con_gn, com_faible2)[,1,1]
    moyenne2 <- dbGetQuery(con_gn, com_moyenne2)[,1,1]
    bonne2 <- dbGetQuery(con_gn, com_bonne2)[,1,1]
    elevee2 <- dbGetQuery(con_gn, com_elevee2)[,1,1]
    
    qualite2 = c(faible2,moyenne2,bonne2,elevee2)
    df2 = data.frame(qualite_labels,qualite2)
    plot2 <- plot_ly(data = df2, labels = ~qualite_labels, values = ~qualite2, type = "pie", hole=0.6,
                     textinfo = "percent", 
                     marker = list(colors = fcouleur(listPoles[[3]])),
                     insidetextorientation = "horizontal")  %>% layout(title = listPoles[[3]])
    
    return(list(nbPlot,plot1,plot2))
  }
  
  return(list(nbPlot,plot1,plot2))
}

# 
# ##Test
# a="pole"
# b="Flore et Fongus"
# c="Mammifères"
# d=0
# 
# gr <- afficher_pie(a,b,c,d)
# 
# ui <- fluidPage(
#     plotlyOutput('plot')
#   )
# 
# 
# server <- function(input, output) {
#   output$plot <- renderPlotly({afficher_pie(a,b,c,d)})
# }
# 
# shinyApp(ui=ui,server=server)
# 
# h <-  dbGetQuery(con_gn, "SELECT * FROM orb_indicateurs.ind_connaissance_general ")
