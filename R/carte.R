library(plotly)
library(shiny)
library(leaflet)
library(plyr)
library(sf)
library(sp)
library(rgdal)
library("devtools")
library("RColorBrewer")

a <- dbGetQuery(con_gn, "select * from orb_indicateurs.mv_sraddet_ind_pole_geom ")

#Chargement de la carte
Carte <- st_read(con_gn, query = "select * from orb_indicateurs.mv_sraddet_ind_pole_geom WHERE annee_group = '2021 - 2025' AND declinaison ='Vertébrés'" ) [,1][,2]
#conversion des sonnées géométriques
poly <- st_transform(Carte, "+init=epsg:4326")

#Chargement des données de la cartes (nb data vertébrés entre 2021 et 2025)
indic <- dbGetQuery(con_gn, "select nb_data_tot from orb_indicateurs.mv_sraddet_ind_pole_geom WHERE annee_group = '2021 - 2025' AND declinaison = 'Vertébrés'")[,1]

#Création fonction de couleur pour la carte
pal <- colorFactor(
  palette = topo.colors(5),
  domain = indic)






ui <- fluidPage(
  div(id="carte",
      leafletOutput("mymap"))
)
server <- function(input, output, session) {

output$mymap <- renderLeaflet({
  leaflet() %>%
    addTiles() %>%
    addProviderTiles("CartoDB.Positron") %>%
    addPolygons(data =poly ,label = ~indic, smoothFactor = 3, fillOpacity = 1, fillColor = ~pal(indic),stroke = TRUE,
                weight = 0.1, color = "black",
                highlightOptions = highlightOptions(fillColor = "red",fillOpacity=1))
})
}
shinyApp(ui, server)

