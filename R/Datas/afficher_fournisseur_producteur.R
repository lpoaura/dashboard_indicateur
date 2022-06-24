
afficher_fournisseur_producteur<-function(groupe,type)
{
  nbPlot <- 2;
  plot1 <- NULL;
  plot2 <- NULL;
  titre1 <- "";
  titre2 <- "";
  subTitle1 <- "";
  subTitle2 <- "";
  
  if (groupe=="fournisseur"){
    base = "orb_indicateurs.mv_sraddet_ind_meta_fournisseur"
    subTitle <- "par fournisseur";
  }
  
  else if (groupe == "producteur"){
    base = "orb_indicateurs.mv_sraddet_ind_meta_producteur"
    subTitle <- "par producteur";
  }
  # Cas par défaut : aucun graphique à tracer
  else {
    nbPlot <- 0;
    return(list(nbPlot,plot1,plot2,titre1,titre2));
  } 
  
  if (type == "données"){
    commande1 = paste("SELECT nom_organisme, nb_data FROM", base)
    commande2 = paste("SELECT nom_organisme, nb FROM", base)
    titre1 <- paste("Nombre de données", subTitle);
    titre2 <- paste("Nombre de jeux de données", subTitle);
  }
  # Cas par défaut : aucun graphique à tracer
  else {
    isPlot <- 0;
    return(list(nbPlot,plot1,plot2,titre1,titre2));
  } 
  
  
  tab <- dbGetQuery(con_gn, commande1)
  if (length(tab[,1])> 10){
    x<-tab[,1][1:10]
    y<-tab[,2][1:10]
    somme_autres=0
    #On calcule la somme des autres restant (de 11 jusqu'à la fin du tableau)
    for (i in 11:length(tab[,2])){
      somme_autres = somme_autres+tab[,2][i]
    }
    #On rajoute une ligne "autre" avec la somme calculée
    x<-c(x,"autres")
    y<-c(y,somme_autres)
    print(x)
    print(y)
  }
  #Si le tableau n'a pas plus de 10 lignes on garde tout
  else {
    x<-tab[,1]
    y<-tab[,2]
  }
  data <- data.frame(y,x)
  plot1 <- plot_ly(data, x = ~y, y = ~x, type = 'bar', name = paste(groupe),marker = list(color = '#8031A7')) %>%
    config(displayModeBar = F)%>%
    layout(yaxis = list(title = x,categoryorder = "total ascending"),xaxis = list(title = "nombre de données"))#"total ascending" pour trier par ordre croissant #on met en titre d'axe x le type de données
  
  
  tab <- dbGetQuery(con_gn, commande2)
  if (length(tab[,1])> 10){
    x<-tab[,1][1:10]
    y<-tab[,2][1:10]
    somme_autres=0
    #On calcule la somme des autres restant (de 11 jusqu'à la fin du tableau)
    for (i in 11:length(tab[,2])){
      somme_autres = somme_autres+tab[,2][i]
    }
    #On rajoute une ligne "autre" avec la somme calculée
    x<-c(x,"autres")
    y<-c(y,somme_autres)
    print(x)
    print(y)
  }
  #Si le tableau n'a pas plus de 10 lignes on garde tout
  else {
    x<-tab[,1]
    y<-tab[,2]
  }
  data <- data.frame(y,x)
  plot2 <- plot_ly(data, x = ~y, y = ~x, type = 'bar', name = paste(groupe),marker = list(color = '#8031A7')) %>%
    config(displayModeBar = F)%>%
    layout(yaxis = list(title = x,categoryorder = "total ascending"),xaxis = list(title = "nombre de jeux de données"))#"total ascending" pour trier par ordre croissant #on met en titre d'axe x le type de données
 
  
  
  print(commande1)
  
  return(list(nbPlot,plot1,plot2,titre1,titre2));
}

 # ##Test
 # a="producteur"
 # b="données"
 # afficher_fournisseur_producteur(a,b)
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

 