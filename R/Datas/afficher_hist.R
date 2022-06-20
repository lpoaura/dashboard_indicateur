# Fonctions permettant de récupérer le bon histogramme
print("Create function to get a histogram...")

fcouleur_unique <- function(pole){
  colors1 <- '#8031A7'#violet
  colors2 <- '#EA7200'#orange
  colors3 <- '#6AB023'#vert
  colors4 <- '#0099D0'#bleu
  if (pole =="general"){return(colors1)}
  if (pole =="Vertébrés"){return(colors4)}
  if (pole =="Invertébrés"){return(colors2)}
  if (pole =="Flore et Fongus"){return(colors3)}
}

afficher_hist<-function(groupe,pole,taxo,type)
{
  isPlot <- TRUE;
  plot <- NULL;
  
  if ((groupe == "general")||(groupe=="pole")){
    base = "orb_indicateurs.mv_sraddet_ind_pole"
  }
  else if (groupe == "taxo"){
    base = "orb_indicateurs.mv_sraddet_ind_taxo"
  }
  # Cas par défaut : aucun histogramme à tracer
  else {
    isPlot <- FALSE;
    return(list(isPlot,plot))
  }
  
  if (type == "données"){
    commande = paste("SELECT nb_data_tot FROM", base)
  }
  else if (type == "especes"){
    commande = paste("SELECT nb_espece_dis FROM", base)
  }
  # Cas par défaut : aucun histogramme à tracer
  else {
    isPlot <- FALSE;
    return(list(isPlot,plot))
  }
  
  
  listPoles <- fdecode_poles(pole);
  
  if (groupe == "general"){
    
    count <- dbGetQuery(con_gn, "select DISTINCT annee from orb_indicateurs.mv_sraddet_ind_pole ORDER BY annee ASC")[,1]
    
    histFlore <- dbGetQuery(con_gn, paste(commande,"WHERE declinaison = 'Flore et Fongus' ORDER BY annee ASC"))[,1]
    histVertebres <- dbGetQuery(con_gn, paste(commande,"WHERE declinaison = 'Vertébrés' ORDER BY annee ASC"))[,1]
    histInvertebres <- dbGetQuery(con_gn,paste(commande,"WHERE declinaison = 'Invertébrés' ORDER BY annee ASC"))[,1]
    dataHist <- data.frame(count,histFlore,histVertebres, histInvertebres)
    
    plot <- plot_ly(dataHist, x = ~count, y = ~histFlore, type = 'bar', name = 'Flore et Fongus',marker = list(color = '#399E69')) %>%
      add_trace(y = ~histVertebres, name = 'Vertebres',marker = list(color = '#0099D0')) %>%
      add_trace(y = ~histInvertebres, name = 'Invertebres',marker = list(color = '#EA7200')) %>%
      layout(yaxis = list(title = 'Count'), barmode = 'stack')
    
  }
  
  else if (groupe == "pole") {
    count <- dbGetQuery(con_gn, "select DISTINCT annee from orb_indicateurs.mv_sraddet_ind_pole ORDER BY annee ASC")[,1]
    
    hist <- dbGetQuery(con_gn, paste(commande," WHERE declinaison = '",listPoles[[2]],"' ORDER BY annee ASC",sep = ""))[,1]
    
    if (listPoles[[1]] == 1) {
      dataHist <- data.frame(count,hist)   
      plot <- plot_ly(dataHist, x = ~count, y = ~hist, type = 'bar', name = paste(listPoles[[2]]),marker = list(color = fcouleur_unique(listPoles[[2]])))
    } else {
      hist2 <- dbGetQuery(con_gn, paste(commande," WHERE declinaison = '",listPoles[[3]],"' ORDER BY annee ASC",sep = ""))[,1]
      dataHist <- data.frame(count,hist, hist2) 
      plot <- plot_ly(dataHist, x = ~count, y = ~hist, type = 'bar', name = paste(listPoles[[2]]),marker = list(color = fcouleur_unique(listPoles[[2]]))) %>%
        add_trace(y = ~hist2, name = paste(listPoles[[3]]),marker = list(color = fcouleur_unique(listPoles[[3]]))) %>%
        layout(yaxis = list(title = 'Count'), barmode = 'stack') 
    }
    print(paste(commande," WHERE declinaison = '",pole,"' ORDER BY annee ASC",sep = ""))
  }
  else if (groupe == "taxo"){
    
    if (taxo != "all") {
      count <- dbGetQuery(con_gn, "select DISTINCT annee from orb_indicateurs.mv_sraddet_ind_taxo ORDER BY annee ASC")[,1]
      hist <- dbGetQuery(con_gn, paste(commande," WHERE declinaison = '",taxo,"' ORDER BY annee ASC",sep = ""))[,1]
      dataHist <- data.frame(count,hist)   
      
      plot <- plot_ly(dataHist, x = ~count, y = ~hist, type = 'bar', name = paste(pole),marker = list(color = fcouleur_unique(pole)))
      print(paste(commande," WHERE declinaison = '",pole,"' ORDER BY annee ASC",sep = ""))
    }
    else {
      isPlot <- FALSE;
      return(list(isPlot,plot))
    }
  }
  else {
    return(list(isPlot,plot))
    print(paste("ERREUR SUR LE GROUPE :", groupe));
  }
  
  return(list(isPlot,plot))
}
