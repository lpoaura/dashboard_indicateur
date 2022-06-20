# Fonctions permettant de récupérer la bonne carte
print("Create function to get a map...");


#Création fonction de couleur pour la carte
fcouleur_carte<-function(pole,indic)
{
  colors1 <- c('#ECE0F3','#A56AC2')#violet
  colors2 <- c('#F8C04F','#CC7B57')#orange
  colors3 <- c('#CED760','#399E69')#vert
  colors4 <- c('#8BD6F0','#398CB7')#bleu
  if (pole =="general"){Palette=colors1}
  else if (pole =="Vertébrés"){Palette=colors4}
  else if (pole =="Invertébrés"){Palette=colors2}
  else if (pole =="Flore et Fongus"){Palette=colors3}
  else {print(paste("ERREUR SUR LE POLE :", pole)); Palette=colors1}
  pal <- colorQuantile(
    palette = Palette,
    domain = indic)
  return(pal)
}

afficher_carte<-function(groupe,pole,taxo,année,type)
{
  map <- NULL;
  
  if ((groupe == "general")||(groupe=="pole")) {
    base = "orb_indicateurs.mv_sraddet_ind_pole_geom"
  }
  else if (groupe == "taxo") {
    base = "orb_indicateurs.mv_sraddet_ind_taxo_geom"
  }
  # Cas par défaut : aucune carte à tracer
  else {
    map <- leaflet() %>%
      addTiles() %>%
      addProviderTiles("CartoDB.Positron") %>%
      setView( lng = 4.3871779
               , lat = 45.439695
               , zoom = 7.1 )
    return(map);
  }
  
  if (type == "données") {
    commande = paste("SELECT geom,SUM(nb_data_tot) from", base)
  }
  else if (type == "especes") {
    commande = paste("SELECT geom , SUM(nb_espece_dis) from", base)
  }
  # Cas par défaut : aucune carte à tracer
  else {
    map <- leaflet() %>%
      addTiles() %>%
      addProviderTiles("CartoDB.Positron") %>%
      setView( lng = 4.3871779
               , lat = 45.439695
               , zoom = 7.1 )
    return(map);
  }
  
  if (groupe == "general") {
  }
  else if (groupe == "taxo") {
    if (taxo != "all") {
      commande <- paste(commande, " WHERE declinaison ='",taxo,"'",sep = "")
    }
    else {
      map <- leaflet() %>%
      addTiles() %>%
      addProviderTiles("CartoDB.Positron") %>%
      setView( lng = 4.3871779
               , lat = 45.439695
               , zoom = 7.1 )
      return(map);
    }
  }
  else if (groupe == "pole") {
    commande <- paste(commande, " WHERE declinaison ='",pole,"'",sep = "")
  }
  # Cas par défaut : aucune carte à tracer
  else {
    map <- leaflet() %>%
      addTiles() %>%
      addProviderTiles("CartoDB.Positron") %>%
      setView( lng = 4.3871779
               , lat = 45.439695
               , zoom = 7.1 )
    return(map);
  }
  
  listPoles <- fdecode_poles(pole);
  # On ne peut pas afficher une carte avec plusieurs pôles
  if (listPoles[[1]] == 2) {
    map <- leaflet() %>%
      addTiles() %>%
      addProviderTiles("CartoDB.Positron") %>%
      setView( lng = 4.3871779
               , lat = 45.439695
               , zoom = 7.1 )
    return(map);
  }
  
  if (année != 0){
    annéeinf = 2001+(floor((année-2001)/5))*5
    annéesup= annéeinf+4
    créneau = paste(annéeinf,"-",annéesup)
    if (groupe == "general"){
      commande <- paste(commande, " WHERE annee_group ='",créneau,"'",sep = "")
    }
    else {
      commande <- paste(commande, " AND annee_group ='",créneau,"'",sep = "")
    }
    
    print(créneau)
    
  }
  commande <- paste(commande,"GrOUP BY geom")
  print(commande)
  
  #Chargement de la carte
  Carte <- st_read(con_gn, query = commande)
  
  #conversion des données géométriques
  poly <- st_transform(Carte[,2], "+init=epsg:4326")
  
  #Chargement des données de la cartes (nb data vertébrés entre 2021 et 2025)
  indic = Carte%>% pull(sum)
  
  map <- leaflet() %>%
    addTiles() %>%
    addProviderTiles("CartoDB.Positron") %>%
    addPolygons(data =poly ,label = ~indic, smoothFactor = 3, fillOpacity = 0.7,fillColor = ~fcouleur_carte(pole,indic)(indic),stroke = TRUE,
                weight = 0.1, color = "black",
                highlightOptions = highlightOptions(fillColor = "red",fillOpacity=1))%>%
    setView( lng = 4.3871779
             , lat = 45.439695
             , zoom = 7.1 ) %>%
    addLegend("bottomright", pal = fcouleur_carte(pole,indic), values = indic,
              title = "titre",
              labFormat = function(type, cuts, p) {
                n = length(cuts)
                paste0(floor(cuts[-n]), " &ndash; ", floor(cuts[-1]))},
              opacity = 1
    )
  
  return(map);
}

# #test
# a="general"
# b="general"
# c="Oiseaux"
# d=0
# e="données"
# 
# 
# 
# 
# ui <- fluidPage(
#   div(id="carte",
#       leafletOutput("mymap"))
# )
# server <- function(input, output, session) {
#   
#   output$mymap <- renderLeaflet({afficher_carte(a,b,c,d,e)})
# }
# shinyApp(ui, server)


