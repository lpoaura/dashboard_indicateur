# Ce script crée les div des données

print("Create divs for Datas...")
# divBouttons <- div(id="Boutons",
#                    actionButton("total", "General"),
#                    actionButton("vertebres", "Vertebres"),
#                    actionButton("flore", "Flore"),
#                    actionButton("invertebres", "Invertebres"))
# ui <- fluidPage(
# )

createDivDatas <- function() {
  divCarte <- div(id="carte",
                  leafletOutput("mymap"))
  
  divHist <- div(id="histogramme",
                 plotlyOutput('hist'))
  
  divPie <- div(id="PieChart",
                plotlyOutput('pie'))
}

divCarte <- div(id="carte",
                leafletOutput("mymap"))

divHist <- div(id="histogramme",
               plotlyOutput('hist'))

divPie <- div(id="PieChart",
              plotlyOutput('pie'))