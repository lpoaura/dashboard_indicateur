# Fonctions permettant de récupérer la bonne carte
print("Create function to get a map...");


#Création fonction de couleur pour la carte
fcouleur_carte<-function(pole,indic,type,echelle)
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
  
  pal <- NULL;
  if (type != "connaissance") {
    if (echelle == "Quartile") {
      pal <- colorQuantile(
        palette = Palette,
        domain = indic)
    }
    else if (echelle == "Numérique") {
      pal <- colorNumeric(
        palette = Palette,
        domain = indic)
    }
    else if (echelle == "Logarithmique") {
      i=10
      Bins = c(0,10)
      while (i<max(indic)){ 
        Bins <- c(Bins,i*10)
        i <- i*10
      }
      pal <- colorBin(
        palette = Palette,
        domain = indic,
        bins = Bins)
    }
    else if (echelle == "Intervalles") {
      pal <- colorBin(
        palette = Palette,
        domain = indic,
        pretty = TRUE)
    }
    else {
      pal <- colorQuantile(
        palette = Palette,
        domain = indic)
    }
  }
  else {
    pal <- colorFactor(
      palette = Palette,
      levels = c("Faible","Moyenne","Bonne","Elevées"))
  }
  return(pal)
}

afficher_carte<-function(groupe,pole,taxo,année,type)
{
  echelle <- "Quartile";
  map <- NULL;
  
  if (type == "connaissance"){
    titre = "Indicateur d’état de connaissances"
    
    if (groupe == "general"){
      base = "orb_indicateurs.ind_connaissance_general"
    }
    else if (groupe == "pole"){
      base = "orb_indicateurs.ind_connaissance_pole"
    }
    else if (groupe == "taxo"){
      base = "orb_indicateurs.ind_connaissance_taxo"
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
    commande = paste("SELECT geom,ind_tot_group from", base)
    }
  }
  else {
    if ((groupe == "general")||(groupe=="pole")){
      base = "orb_indicateurs.mv_sraddet_ind_pole_geom"
    }
    
    else if (groupe == "taxo"){
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
      commande = paste("SELECT geom,ind_tot_group from", base)
    }
    
    if (type == "données"){
      titre = "nombre de données par mailles"
      commande = paste("SELECT geom,SUM(nb_data_tot) from", base)
    }
    
    else if (type == "especes"){
      titre = "nombre d'èspèces par mailles"
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
  }
  
  if (groupe == "taxo") {
    if (taxo != "Toutes") {
      pole <- findPoleForTaxo(taxo);
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
    if (pole != "general") {
      commande <- paste(commande, " WHERE declinaison ='",pole,"'",sep = "")
    }
  }
  else {
    
  }
  
  listPoles <- fdecode_poles(pole);
  # On ne peut pas afficher une carte avec plusieurs pôles
  if (listPoles[[1]] == 2 && groupe == "pole") {
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
  }
  
  
  if (type != "connaissance"){
    commande <- paste(commande,"GrOUP BY geom")
  }
  print(commande)
  
  #Chargement de la carte
  Carte <- st_read(con_gn, query = commande)
  
  #conversion des sonnées géométriques
  poly <- st_transform(Carte[,2], "+init=epsg:4326")
  
  #Chargement des données de la cartes (nb data vertébrés entre 2021 et 2025)
  if (type != "connaissance"){
    indic = Carte%>% pull(sum)
  }
  else{
    indic = Carte%>% pull(ind_tot_group)
    indic <- gsub("Ã‰levÃ©s","Elevées",indic)
  }
  
  
  map <- leaflet(options = leafletOptions(7,11)) %>%
    addTiles() %>%
    addProviderTiles("CartoDB.Positron") %>%
    addPolygons(data =poly ,label = ~(indic), smoothFactor = 3, fillOpacity = 0.7,fillColor = ~fcouleur_carte(pole,indic,type,"Quartile")(indic),stroke = TRUE,
                weight = 0.1, color = "black",
                highlightOptions = highlightOptions(fillColor = "red",fillOpacity=1), group = "quartile")%>%
    addPolygons(data =poly ,label = ~(indic), smoothFactor = 3, fillOpacity = 0.7,fillColor = ~fcouleur_carte(pole,indic,type,"Logarithmique")(indic),stroke = TRUE,
                weight = 0.1, color = "black",
                highlightOptions = highlightOptions(fillColor = "red",fillOpacity=1), group = "logarithmique")%>%
    
    addPolygons(data =poly ,label = ~(indic), smoothFactor = 3, fillOpacity = 0.7,fillColor = ~fcouleur_carte(pole,indic,type,"Numérique")(indic),stroke = TRUE,
                weight = 0.1, color = "black",
                highlightOptions = highlightOptions(fillColor = "red",fillOpacity=1), group = "numerique")%>%
    addPolygons(data =poly ,label = ~(indic), smoothFactor = 3, fillOpacity = 0.7,fillColor = ~fcouleur_carte(pole,indic,type,"Intervalles")(indic),stroke = TRUE,
                weight = 0.1, color = "black",
                highlightOptions = highlightOptions(fillColor = "red",fillOpacity=1), group = "intervalles")%>%
    setView( lng = 4.3871779
             , lat = 45.439695
             , zoom = 7.1 )%>%
    setMaxBounds(0,42,10,48)%>%
    
    addLegend("bottomright",pal = fcouleur_carte(pole,indic,type,"Quartile"), values = indic ,
              opacity = 1, title = paste("<div>",titre,"</div><div>quartile</div>",sep = ""),
              labFormat = function(type, cuts, p) {
                n = length(cuts)
                paste0(floor(cuts[-n]), " &ndash; ", floor(cuts[-1]))},group = "quartile")%>%
    
    addLegend("bottomright",pal = fcouleur_carte(pole,indic,type,"Logarithmique"), values = indic,
              opacity = 1, title = paste("<div>",titre,"</div><div>logarithmique</div>",sep = ""),
              group = "logarithmique")%>%
    
    addLegend("bottomright",pal = fcouleur_carte(pole,indic,type,"Numérique"), values = indic,
              opacity = 1, title = paste("<div>",titre,"</div><div>numerique</div>",sep = ""),
              group = "numerique")%>%
    addLegend("bottomright",pal = fcouleur_carte(pole,indic,type,"Intervalles"), values = indic,
              opacity = 1, title = paste("<div>",titre,"</div><div>intervalles</div>",sep = ""),
              group = "intervalles")%>%
    
    addLayersControl(position = "bottomleft", baseGroups = c("quartile", "logarithmique", "numerique","intervalles"),
                     options = layersControlOptions(collapsed = FALSE))%>%
    htmlwidgets::onRender("
    function(el, x) {
      var updateLegend = function () {
          var selectedGroup = document.querySelectorAll('input:checked')[0].nextSibling.innerText.substr(1);

          document.querySelectorAll('.legend').forEach(a => a.hidden=true);
          document.querySelectorAll('.legend').forEach(l => {
      console.log(l);
      console.log(l.children[0].children[0].children[1]);
      console.log(selectedGroup);
            if (l.children[0].children[0].children[1].innerText == selectedGroup){l.hidden=false;l.children[0].children[0].children[1].hidden = true}
          });
      };
      updateLegend();
      this.on('baselayerchange', e => updateLegend());
    }")
  
  return(map)
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


