# Ce script crée une fonction qui permet de gérer les output liées au datas dans
# le server

print("Creating datas for server...");

mapPlot <- leaflet() %>%
  addTiles() %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(lng = 4.3871779,
          lat = 45.439695,
          zoom = 7.1)
piePlot <- list(0,NULL,NULL);
histoPlot <- list(FALSE,NULL);
barPlot <- list(FALSE,NULL);

# Affichage des données à partir des variables globales de graphique
dispDatasForServerFct <- function(input, output, session)
{
  print("Re showing datas...");
  
  # Actualisation du pie chart
  removeUI(selector = "#pie1");
  removeUI(selector = "#pie2");
  if (piePlot[[1]] >= 1) {
    insertUI(selector = "#pieChart",
             ui = plotlyOutput('pie1'));
    output$pie1 <- renderPlotly({piePlot[[2]]});
    output$pie1Copy <- renderPlotly({piePlot[[2]]});
  }
  if (piePlot[[1]] >= 2) {
    insertUI(selector = "#pieChart",
             ui = plotlyOutput('pie2'));
    output$pie2 <- renderPlotly({piePlot[[3]]});
    output$pie2Copy <- renderPlotly({piePlot[[3]]});
  }


  # Actualisation de l'histogramme
  removeUI(selector = "#hist");
  if (histoPlot[[1]]) {
    insertUI(selector = "#histogramme",
             ui = plotlyOutput('hist'));
    output$hist <- renderPlotly({histoPlot[[2]]});
    output$histCopy <- renderPlotly({histoPlot[[2]]});
  }
}

# Modification des variables globales des graphiques
datasForServerFct <- function(input, output, session,
                                 type = "données",
                                 groupe = "general", pole = "general", taxo = "Oiseaux",
                                 année = 0)
{
  print("New datas to show...");
  # print(type)
  # print(groupe)
  # print(pole)
  # print(taxo)
  groupe <- fdecodeGroupe(groupe);
  
  print("Création d'une map...");
  mapPlot <<- afficher_carte(groupe,pole,taxo,année,type);
  output$mymap <- renderLeaflet({mapPlot});
  
  print("Création d'une pieChart...");
  piePlot <<- afficher_pie(groupe,pole,taxo,année,type);
  
  print("Création d'un histogramme...");
  histoPlot <<- afficher_hist(groupe,pole,taxo,type);
  
  dispDatasForServerFct(input, output, session);
}


# Cette fonction permet d'avoir une gamme de couleurs en fonction d'un pôle.
# Elle est nécessaire lors de la création de certains graphiques.
fcouleur <- function(pole){
  colors1 <- c('#ECE0F3','#DDC8E9','#C39AD6','#A56AC2')#violet
  colors2 <- c('#F8C04F','F9BA39','EE9039','#CC7B57')#orange
  colors3 <- c('#CED760','#C5CF39','#8AC154','#399E69')#vert
  colors4 <- c('#8BD6F0','#6CCAEB','#39AFDA','#398CB7')#bleu
  if (pole =="general"){return(colors1)}
  if (pole =="Vertébrés"){return(colors4)}
  if (pole =="Invertébrés"){return(colors2)}
  if (pole =="Flore et Fongus"){return(colors3)}
}



# Cette fonction permet de décoder les pôles pour prendre en compte deux pôles
# si nécessaire. Elle est utilisée dans les foncitons de création de graphs.
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

# Cette fonction permet de décoder le groupe transmis à la création de
# graphiques. Utile si les information n'ont pas été modifiée au préalable.
fdecodeGroupe <- function(groupe) {
  switch(groupe,
         "poles" = {
           groupe <- "pole";
         }
  )
  return(groupe)
}
