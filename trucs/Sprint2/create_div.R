divBouttons <- div(id="Boutons",
  actionButton("total", "General"),
  actionButton("vertebres", "Vertebres"),
  actionButton("flore", "Flore"),
  actionButton("invertebres", "Invertebres"))

divCarte <- div(id="carte",
    leafletOutput("mymap"))

divHist <- div(id="histogramme",
    plotlyOutput('hist'))

divPie <- div(id="PieChart",
    plotlyOutput('pie'))