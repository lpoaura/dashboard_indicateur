# Ce script crée les div des données

print("Create divs for Datas...");

divCarte <- div(id="carte",
                leafletOutput("mymap"));

divPie <- div(id="pieChart");

divHist <- div(id="histogramme");

divBar <- div(id="barChart")