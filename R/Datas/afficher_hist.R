
fcouleur_unique <- function(pole) {
  colors1 <- '#8031A7'#violet
  colors2 <- '#EA7200'#orange
  colors3 <- '#6AB023'#vert
  colors4 <- '#0099D0'#bleu
  if (pole =="general"){return(colors1)}
  if (pole =="Vertébrés"){return(colors4)}
  if (pole =="Invertébrés"){return(colors2)}
  if (pole =="Flore et Fongus"){return(colors3)}
}

fdecode_poles <- function(pole) {
  nbPoles <- 1;
  pole1 <- pole;
  pole2 <- pole;
  switch(pole,
    "Flore Invertébrés" = {
      pole1 <- "Flore et Fongus";
      pole2 <- "Invertébrés";
      nbPoles <- 2;
    },
    "Flore Vertébrés" = {
      pole1 <- "Flore et Fongus";
      pole2 <- "Vertébrés";
      nbPoles <- 2;
    },
    "Invertébrés Vertébrés" = {
      pole1 <- "Invertébrés";
      pole2 <- "Vertébrés";
      nbPoles <- 2;
    },
    "general" = {
      nbPoles <- 3;
    }
  )
  return(list(nbPoles, pole1, pole2))
}

afficher_hist<-function(groupe,pole,taxo,type)
{
  isPlot <- TRUE;
  
  if ((groupe == "general")||(groupe=="pole")){
    base = "orb_indicateurs.mv_sraddet_ind_pole"
  }
  else if (groupe == "taxo"){
    base = "orb_indicateurs.mv_sraddet_ind_taxo"
  }
  # Cas par défaut : aucun histogramme à tracer
  else {
    isPlot <- FALSE;
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
  }
  
  if (isPlot) {
    listPoles <- fdecode_poles(pole);

    if (groupe == "general") {
      
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

    if (groupe == "pole") {
      
      count <- dbGetQuery(con_gn, "select DISTINCT annee from orb_indicateurs.mv_sraddet_ind_pole ORDER BY annee ASC")[,1]

      hist <- dbGetQuery(con_gn, paste(commande," WHERE declinaison = '",listPoles[[2]],"' ORDER BY annee ASC",sep = ""))[,1]

      if (listPoles[[1]] == 1) {
        dataHist <- data.frame(count,hist)   
        plot <- plot_ly(dataHist, x = ~count, y = ~hist, type = 'bar', name = paste(listPoles[[2]]),marker = list(color = fcouleur_unique(listPoles[[2]])))
        print(paste(commande," WHERE declinaison = '",pole,"' ORDER BY annee ASC",sep = ""))
      } else {
        hist2 <- dbGetQuery(con_gn, paste(commande," WHERE declinaison = '",listPoles[[3]],"' ORDER BY annee ASC",sep = ""))[,1]
        dataHist <- data.frame(count,hist, hist2) 
        plot <- plot_ly(dataHist, x = ~count, y = ~hist, type = 'bar', name = paste(listPoles[[2]]),marker = list(color = fcouleur_unique(listPoles[[2]]))) %>%
          add_trace(y = ~hist2, name = paste(listPoles[[3]]),marker = list(color = fcouleur_unique(listPoles[[3]]))) %>%
          layout(yaxis = list(title = 'Count'), barmode = 'stack') 
      }
    }
    
    if (groupe == "taxo") {
      
      count <- dbGetQuery(con_gn, "select DISTINCT annee from orb_indicateurs.mv_sraddet_ind_taxo ORDER BY annee ASC")[,1]
      hist <- dbGetQuery(con_gn, paste(commande," WHERE declinaison = '",taxo,"' ORDER BY annee ASC",sep = ""))[,1]
      dataHist <- data.frame(count,hist)   
      
      plot <- plot_ly(dataHist, x = ~count, y = ~hist, type = 'bar', name = paste(pole),marker = list(color = fcouleur_unique(pole)))
      print(paste(commande," WHERE declinaison = '",pole,"' ORDER BY annee ASC",sep = ""))
    }
  }
  
  return(list(isPlot,plot))
}
# ##Test
# a="general"
# b="Invertébrés"
# c="Oiseaux"
# 
# d="especes"
# 
# 
# gr <- afficher_hist(a,b,c,d)
# 
# ui <- fluidPage(
#   plotlyOutput('plot')
# )
# 
# 
# server <- function(input, output) {
#   output$plot <- renderPlotly({afficher_hist(a,b,c,d)})
# }
# 
# shinyApp(ui=ui,server=server)
# 
# h <-  dbGetQuery(con_gn, "SELECT * FROM orb_indicateurs.mv_sraddet_ind_pole ")
# 
