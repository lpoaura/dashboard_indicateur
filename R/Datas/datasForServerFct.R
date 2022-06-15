# Ce script crée une fonction qui permet de gérer les output liées au datas dans
# le server

print("Creating datas for server...");

datasForServerFct <- function(input, output, session,
                              type = "données",
                              groupe = "general", pole = "general", taxo = "Oiseaux",
                              année = 0) {
  
  print("New datas to show...");
  
  
  # Actualisation de la carte
  mapPlot <- afficher_carte(groupe,pole,taxo,année,type);
  output$mymap <- renderLeaflet({mapPlot});
  
  
  
  # Actualisation du pie chart
  piePlot <- afficher_pie(groupe,pole,taxo,année,type);
  removeUI(selector = "#pie1");
  removeUI(selector = "#pie2");
  if (piePlot[[1]] >= 1) {
    insertUI(selector = "#pieChart",
             ui = plotlyOutput('pie1'));
    output$pie1 <- renderPlotly({piePlot[[2]]});
  }
  if (piePlot[[1]] >= 2) {
    insertUI(selector = "#pieChart",
             ui = plotlyOutput('pie2'));
    output$pie2 <- renderPlotly({piePlot[[3]]});
  }
  
  
  
  # Actualisation de l'histogramme
  histoPlot <- afficher_hist(groupe,pole,taxo,type);
  removeUI(selector = "#hist");
  if (histoPlot[[1]]) {
    insertUI(selector = "#histogramme",
             ui = plotlyOutput('hist'));
    output$hist <- renderPlotly({histoPlot[[2]]});
  }
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