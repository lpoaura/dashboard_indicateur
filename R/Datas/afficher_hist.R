
# Fonctions permettant de récupérer le bon histogramme
print("Create function to get a histogram...")

#Ce script permet de créer 2 fonctions : une fonction couleur qui retourne une couleur en fonction du pôle et une fonction afficher_hist qui permet 
#de créer un histogramme représentant le nombre de données ou d'èspèces pour toutes les pôles (général), pour chaques pôles, ou pour chaques taxonomies.
#Cette fonction appelle la fonction couleur pour afficher l'histogramme avec la couleur correspondant au pôle.

#On créér ici la fonction couleur qui renvoie une unique couleur en fonction du pôle
fcouleur_unique <- function(pole){
  colors1 <- '#8031A7'#violet
  colors2 <- '#EA7200'#orange
  colors3 <- '#6AB023'#vert
  colors4 <- '#0099D0'#bleu
  if (pole =="general"){return(colors1)}
  else if (pole =="Vertébrés"){return(colors4)}
  else if (pole =="Invertébrés"){return(colors2)}
  else if (pole =="Flore et Fongus"){return(colors3)}
  else {print(paste("ERREUR SUR LE POLE :", pole)); return(colors1)}
}

#On créer ici la fonction avec 4 entrées :
#-Le groupe qui définie si on affiche tout, par pôle ou par taxonomie
#- le pole pour spécifier le pôle (utile pour définir la couleur). doit être "général" si on s'intéresse à touts les pôles ou "Vertébrés",Invertébrés",
#"Flore et Fongus" si on spécifie un pôle ou une taxonomie.
#-Une taxonomie si on choisit d'en spécifier une en spécifiant auparavnt le pôle auquel elle appartient pour spécifier la couleur
#-type permet de définir si on veut afficher le nombre d'espèces ou de données.
afficher_hist<-function(groupe,pole,taxo,type)
{
  isPlot <- TRUE;
  plot <- NULL;
  titre <- "";
  
  #On défini la base de donnée dans laquelle on cherche selon le groupe voulu
  if ((groupe == "general")||(groupe=="pole")){
    base = "orb_indicateurs.mv_sraddet_ind_pole"
  }
  else if (groupe == "taxo"){
    base = "orb_indicateurs.mv_sraddet_ind_taxo"
  }
  # Cas par défaut : aucun histogramme à tracer
  else {
    isPlot <- FALSE;
    return(list(isPlot,plot,titre))
  }
  
  #On modifie la requète SQL selon le type de données recherchées
  if (type == "données"){
    commande = paste("SELECT nb_data_tot FROM", base)
    subTitre <- "du nombre de données";
  }
  else if (type == "especes"){
    commande = paste("SELECT nb_espece_dis FROM", base)
    subTitre <- "du nombre d'espèces";
  }
  # Cas par défaut : aucun histogramme à tracer
  else {
    isPlot <- FALSE;
    return(list(isPlot,plot,titre))
  }
  
  
  listPoles <- fdecode_poles(pole);
  
  if (groupe == "general" || (groupe == "pole" && pole == "general")) {
    
    count <- dbGetQuery(con_gn, "select DISTINCT annee from orb_indicateurs.mv_sraddet_ind_pole ORDER BY annee ASC")[,1]
    
    histFlore <- dbGetQuery(con_gn, paste(commande,"WHERE declinaison = 'Flore et Fongus' ORDER BY annee ASC"))[,1]
    histVertebres <- dbGetQuery(con_gn, paste(commande,"WHERE declinaison = 'Vertébrés' ORDER BY annee ASC"))[,1]
    histInvertebres <- dbGetQuery(con_gn,paste(commande,"WHERE declinaison = 'Invertébrés' ORDER BY annee ASC"))[,1]
    dataHist <- data.frame(count,histFlore,histVertebres, histInvertebres)
    
    plot <- plot_ly(dataHist, x = ~count, y = ~histFlore, type = 'bar', name = 'Flore et Fongus',marker = list(color = '#399E69')) %>%
      add_trace(y = ~histVertebres, name = 'Vertebres',marker = list(color = '#0099D0')) %>%
      add_trace(y = ~histInvertebres, name = 'Invertebres',marker = list(color = '#EA7200')) %>%
      layout(barmode = 'stack',yaxis = list(title = substr(subTitre,4,nchar(subTitre))),xaxis = list(title = "années"))
    
    titre <- paste("Évolution", subTitre, "en fonction des années"); 
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
        layout(yaxis = list(title = 'Années'), x, barmode = 'stack') 
    }
    titre <- paste("Évolution", subTitre, "en fonction des années"); 
    
    # print(paste(commande," WHERE declinaison = '",pole,"' ORDER BY annee ASC",sep = ""))
  }
  else if (groupe == "taxo"){
    
    if (taxo != "Toutes") {
      count <- dbGetQuery(con_gn, "select DISTINCT annee from orb_indicateurs.mv_sraddet_ind_taxo ORDER BY annee ASC")[,1]
      hist <- dbGetQuery(con_gn, paste(commande," WHERE declinaison = '",taxo,"' ORDER BY annee ASC",sep = ""))[,1]
      
      if (length(count) == length(hist)) {
        dataHist <- data.frame(count,hist)
      }
      # Cas par défaut : aucun histogramme à tracer car pas assez de données
      else {
        isPlot <- FALSE;
        return(list(isPlot,plot,titre))
      } 
      
      plot <- plot_ly(dataHist, x = ~count, y = ~hist, type = 'bar', name = paste(pole),marker = list(color = fcouleur_unique(findPoleForTaxo(taxo))))
      titre <- paste("Évolution", subTitre, "en fonction des années"); 
      # print(paste(commande," WHERE declinaison = '",pole,"' ORDER BY annee ASC",sep = ""))
    }
    else {
      isPlot <- FALSE;
      return(list(isPlot,plot,titre))
    }
  }
  else {
    isPlot <- FALSE;
    return(list(isPlot,plot,titre))
    print(paste("ERREUR SUR LE GROUPE :", groupe));
  }
  
  return(list(isPlot,plot,titre))
}






