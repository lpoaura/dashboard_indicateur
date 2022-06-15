# Ce script crée les div des données

print("Create divs for Datas...");

createDivDatas <- function() {
  divCarte <- div(id="carte",
                  leafletOutput("mymap"))
  
  divHist <- div(id="histogramme",
                 plotlyOutput('hist'))
  
  divPie <- div(id="pieChart",
                plotlyOutput('pie1'),
                plotlyOutput('pie2'))
}

divCarte <- div(id="carte",
                leafletOutput("mymap"))

divHist <- div(id="histogramme",
               plotlyOutput(outputId = 'hist'))

divPie <- div(id="pieChart",
              plotlyOutput('pie1'),
              plotlyOutput('pie2'))