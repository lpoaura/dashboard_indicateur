#Ce fichier charge tous les paquets nécessaires au bon fonctionnement de l'application web.

print("Loading packages...")

pkgs <-  c("RPostgres","RPostgreSQL", "DBI","dplyr","tidyverse","lubridate","stringr", "ggplot2","RColorBrewer", "plotly","sf","leaflet","plyr","sp","rgdal","devtools","RColorBrewer")

# on test si les librairies sont installees sur l'environnement, si c'est pas le cas on les installes
if (length(setdiff(pkgs, rownames(installed.packages()))) > 0) {
  # installation des packages
  install.packages(setdiff(pkgs, rownames(installed.packages())))
}
# chargement des librairies (necessite qu'elles soient installees)
lapply(pkgs, library, character.only = TRUE)
rm(pkgs)

