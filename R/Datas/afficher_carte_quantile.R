
#Création fonction de couleur pour la carte
fcouleur_carte<-function(pole,indic)
{
  colors1 <- c('#ECE0F3','#A56AC2')#violet
  colors2 <- c('#F8C04F','#CC7B57')#orange
  colors3 <- c('#CED760','#399E69')#vert
  colors4 <- c('#8BD6F0','#398CB7')#bleu
  if (pole =="general"){Palette=colors1}
  if (pole =="Vertébrés"){Palette=colors4}
  if (pole =="Invertébrés"){Palette=colors2}
  if (pole =="Flore et Fongus"){Palette=colors3}
  pal <- colorQuantile(
    palette = Palette,
    domain = indic)
  return(pal)
  }

afficher_carte<-function(groupe,pole,taxo,année,type)
{
  if ((groupe == "general")||(groupe=="pole")){
    base = "orb_indicateurs.mv_sraddet_ind_pole_geom"
  }
  
  if (groupe == "taxo"){
    base = "orb_indicateurs.mv_sraddet_ind_taxo_geom"
  }
  
  if (type == "données"){
    commande = paste("SELECT geom,SUM(nb_data_tot) from", base)
  }
  
  if (type == "especes"){
    commande = paste("SELECT geom , SUM(nb_espece_dis) from", base)
  }
  
  if (groupe == "taxo"){
    
    commande <- paste(commande, " WHERE declinaison ='",taxo,"'",sep = "")
  }
  
  if (groupe == "pole"){
    
    commande <- paste(commande, " WHERE declinaison ='",pole,"'",sep = "")

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
  

  #conversion des sonnées géométriques
  poly <- st_transform(Carte[,2], "+init=epsg:4326")
  
  #Chargement des données de la cartes (nb data vertébrés entre 2021 et 2025)
  indic = Carte%>% pull(sum)
  
  map <- leaflet(options = leafletOptions(7,11)) %>%
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
    )%>%
    setMaxBounds(0,42,10,48)
  map
  
  return(map)
}

#test
a="general"
b="general"
c="Oiseaux"
d=0
e="données"




ui <- fluidPage(
  div(id="carte",
      leafletOutput("mymap"))
)
server <- function(input, output, session) {
  
  output$mymap <- renderLeaflet({afficher_carte(a,b,c,d,e)})
}
shinyApp(ui, server)


