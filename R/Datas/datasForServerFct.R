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
dataFournProd <- list(0,NULL,NULL);

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
  
  
  # Actualisation du barChart
  removeUI(selector = "#bar");
  if (barPlot[[1]]) {
    insertUI(selector = "#barChart",
             ui = plotlyOutput('bar'));
    output$bar <- renderPlotly({barPlot[[2]]});
    output$barCopy <- renderPlotly({barPlot[[2]]});
  }
  
  
  # Actualisation des données pour les fournisseurs/producteurs
  removeUI(selector = "#graphFournProd1");
  removeUI(selector = "#graphFournProd2");
  if (dataFournProd[[1]] == 1) {
    insertUI(selector = "#dataFournProd",
             ui = plotlyOutput('graphFournProd1'));
    output$graphFournProd1 <- renderPlotly({dataFournProd[[2]]});
    output$graphFournProd1Copy <- renderPlotly({dataFournProd[[2]]});
  }
  else if (dataFournProd[[1]] == 2) {
    insertUI(selector = "#dataFournProd",
             ui = plotlyOutput('graphFournProd1'));
    output$graphFournProd1 <- renderPlotly({dataFournProd[[2]]});
    output$graphFournProd1Copy <- renderPlotly({dataFournProd[[2]]});
    
    insertUI(selector = "#dataFournProd",
             ui = plotlyOutput('graphFournProd2'));
    output$graphFournProd2 <- renderPlotly({dataFournProd[[3]]});
    output$graphFournProd2Copy <- renderPlotly({dataFournProd[[3]]});
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
  
  print("Création d'un barChart...");
  barPlot <<- afficher_bar(groupe,pole,type,taxo,année);
  
  print("Création de données pour producteur/fournisseur...");
  dataFournProd <<- afficher_fournisseur_producteur(groupe,type);
  
  dispDatasForServerFct(input, output, session);
}


# Affichage des nombres associés aux feux
# Création des nombres
listPolesStr = c("'Flore et Fongus'", "'Invertébrés'", "'Vertébrés'");
nombresDonnees <- c();
nombresEspeces <- c();
# !!! ATTENTION CE NE SONT PAS LES BONNES REQUETES IL SEMBLERAIT !!! #
commandeDonnees = "SELECT SUM(nb_data_tot) FROM orb_indicateurs.mv_sraddet_ind_pole WHERE declinaison =";
commandeEspeces = "SELECT SUM(nb_espece_dis) FROM orb_indicateurs.mv_sraddet_ind_pole WHERE declinaison =";
for (el in listPolesStr) {
  nombresDonnees <- c(nombresDonnees, dbGetQuery(con_gn,paste(commandeDonnees, el)));
  nombresEspeces <- c(nombresEspeces, dbGetQuery(con_gn,paste(commandeEspeces, el)));
}

# Fonction qui s'occupe de changer le nombre affiché
dispNumbersForServerFct <- function(input, output, session,
                                  feuFlore, feuInvertebre, feuVertebre)
{
  print("Showing numbers...");
  
  nbrDonnees <- 0;
  nbrEspeces <- 0;
  
  # Calcul des nouveaux nombres à afficher
  if (feuFlore) {
    nbrDonnees <- nbrDonnees + nombresDonnees[[1]];
    nbrEspeces <- nbrEspeces + nombresEspeces[[1]];
  }
  if (feuInvertebre) {
    nbrDonnees <- nbrDonnees + nombresDonnees[[2]];
    nbrEspeces <- nbrEspeces + nombresEspeces[[2]];
  }
  if (feuVertebre) {
    nbrDonnees <- nbrDonnees + nombresDonnees[[3]];
    nbrEspeces <- nbrEspeces + nombresEspeces[[3]];
  }
  
  # Changement de l'affichage
  session$sendCustomMessage(type = 'actualizeFeuxNumbers', message = c(nbrDonnees, nbrEspeces));
}



# --------------- FONCTIONS AUXILIAIRES --------------- #

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
