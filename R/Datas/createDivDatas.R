# Ce script crée les div des données

print("Create divs for Datas...");

# Ces div seront toujours affichées dans le bandeau de gauche mais ne seront 
# remplies que si un graphique peut être affiché.

divCarte <- div(id="carte",
                leafletOutput("mymap"));

divPie <- div(id="pieChart");

divHist <- div(id="histogramme");

divBar <- div(id="barChart");

divFournProd <- div(id="dataFournProd")