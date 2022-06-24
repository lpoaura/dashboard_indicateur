# Fonctions permettant de récupérer le bon pieChart
print("Create function to get a pie chart...")

afficher_pie<-function(groupe,pole,taxo,année,type)
{
  nbPlot <- 1;
  plot1 <- NULL;
  plot2 <- NULL;
  subTitle1 <- "";
  subTitle2 <- "";
  title1 <- "";
  title2 <- "";
  listPoles <- fdecode_poles(pole);
  
  qualite_labels = c('Faible', 'Moyenne', 'Bonne','Elevee')
  
  if (type == "connaissances") {
    subTitle <- "État de la connaissance en fonction de la géographie";
  }
  else if (type == "listeRouge") {
    qualite_labels = c('Faible', 'Moyenne', 'Bonne','Elevee')
    
    if (groupe == "general"){
      base = "orb_indicateurs.mv_sraddet_ind_lrr_general"
      commande = paste("SELECT code_statut, count FROM ",base," ORDER BY count ASC",sep = "")
      subTitle <- "pour l'ensemble des pôles";
    }
    
    else if (groupe=="pole"){
      if (pole != "general") {
        base = "orb_indicateurs.mv_sraddet_ind_lrr_pole"
        commande = paste("SELECT code_statut, count FROM ",base," WHERE declinaison ='",pole,"'"," ORDER BY count ASC",sep = "")
        subTitle <- paste("pour le pôle", tolower(pole));
      }
      else {
        base = "orb_indicateurs.mv_sraddet_ind_lrr_general"
        commande = paste("SELECT code_statut, count FROM ",base," ORDER BY count ASC",sep = "")
        subTitle <- "pour l'ensemble des pôles";
      }
    }
    
    else if (groupe == "taxo"){
      base = "orb_indicateurs.mv_sraddet_ind_lrr_taxo"
      commande = paste("SELECT code_statut, count FROM ",base," WHERE declinaison ='",taxo,"'"," ORDER BY count ASC",sep = "")
      subTitle <- paste("pour le groupe des", tolower(taxo));
    }
    # Cas par défaut : aucun pieChart à tracer
    else {
      nbPlot <- 0;
      return(list(nbPlot,plot1,plot2,title1,title2));
    }
    
    title1 <- paste("Proportion d'èspèces sur liste rouge", subTitle);
    
    tab <- dbGetQuery(con_gn, commande)
    for (i in 1:length(tab[,1])){
      if (is.na(tab[i,1])){
        tab<-tab[-i,]
      }
      
    }
    code_statut <- tab%>% pull(code_statut)
    count = tab%>% pull(count)
    print(code_statut)
    print(count)
    
    df = data.frame(code_statut,count)
    
    plot1 <- plot_ly(data = df, labels = ~code_statut, values = ~count, type = "pie",
                     textinfo = "percent",marker = list(line = list(color = '#FFFFFF', width = 1)),
                     insidetextorientation = "horizontal", sort = FALSE)  %>% #layout(title = "Proportion d'èspèces sur liste rouge") %>%
      config(displayModeBar = F)
    return(list(nbPlot,plot1,plot2,title1,title2));
  }
  # Cas par défaut : aucun pieChart à tracer
  else {
    nbPlot <- 0;
    return(list(nbPlot,plot1,plot2,title1,title2));
  } 
  
  if ((groupe == "general")||(groupe=="pole")){
    base = "orb_indicateurs.ind_connaissance_pole"
  }
  else if (groupe == "taxo"){
    if (taxo != "Toutes") {
      pole <- findPoleForTaxo(taxo);
      listPoles <- fdecode_poles(pole);
      base = "orb_indicateurs.ind_connaissance_taxo"
      subTitle <- paste(subTitle, " pour la taxonomie des", tolower(taxo));
    }
    # Cas par défaut : aucun pieChart à tracer
    else {
      nbPlot <- 0;
      return(list(nbPlot,plot1,plot2,title1,title2));
    }
  }
  # Cas par défaut : aucun pieChart à tracer
  else {
    nbPlot <- 0;
    return(list(nbPlot,plot1,plot2,title1,title2));
  }
  
  commande = paste("SELECT count(*) FROM", base, "WHERE ind_tot_group =")
  
  com_faible <- paste(commande,"'Faible'")
  com_moyenne <- paste(commande,"'Moyenne'")
  com_bonne <- paste(commande,"'Bonne'")
  com_elevee <- paste(commande,"'Ã‰levÃ©s'")
  
  if (groupe == "general") {
    subTitle1 <- paste(subTitle, "pour l'ensemble des pôles");
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
    if (listPoles[[1]] == 1) {
      subTitle1 <- paste(subTitle, "pour le pôle", tolower(listPoles[[2]]));
    }
    else if (listPoles[[1]] == 2) {
      nbPlot <- 2;
      subTitle1 <- paste(subTitle, "pour le pôle", tolower(listPoles[[2]]));
      subTitle2 <- paste(subTitle, "pour le pôle", tolower(listPoles[[3]]));
    }
    else if (listPoles[[1]] == 3) {
      subTitle1 <- paste(subTitle, "pour l'ensemble des pôles");
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
    return(list(nbPlot,plot1,plot2,title1,title2));
  }
  
  
  if (année != 0){
    annéeinf = 2001+(floor((année-2001)/5))*5
    annéesup= annéeinf+4
    créneau = paste(annéeinf,"-",annéesup)
    com_faible <- paste(com_faible, " AND annee_group ='",créneau,"'",sep = "")
    com_moyenne <- paste(com_moyenne, " AND annee_group ='",créneau,"'",sep = "")
    com_bonne <- paste(com_bonne, " AND annee_group ='",créneau,"'",sep = "")
    com_elevee <- paste(com_elevee, " AND annee_group ='",créneau,"'",sep = "")
    
    title1 <- paste(subTitle1, "sur la période", créneau);
    title2 <- paste(subTitle2, "sur la période", créneau);
    
    if (nbPlot == 2) {
      com_faible2 <- paste(com_faible2, " AND annee_group ='",créneau,"'",sep = "")
      com_moyenne2 <- paste(com_moyenne2, " AND annee_group ='",créneau,"'",sep = "")
      com_bonne2 <- paste(com_bonne2, " AND annee_group ='",créneau,"'",sep = "")
      com_elevee2 <- paste(com_elevee2, " AND annee_group ='",créneau,"'",sep = "")
    }
  }
  else {
    title1 <- paste(subTitle1, "sur l'ensemble des années");
    title2 <- paste(subTitle2, "sur l'ensemble des années");
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
                   insidetextorientation = "horizontal",sort = FALSE)%>%
    config(displayModeBar = F)
  
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
                     insidetextorientation = "horizontal",sort = FALSE)%>%
      config(displayModeBar = F)
    
    return(list(nbPlot,plot1,plot2,title1,title2))
  }
  
  return(list(nbPlot,plot1,plot2,title1,title2))
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
