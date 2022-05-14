# . -------------------------------------------------------------------------- =============
# 0 - Objectifs ====
# . -------------------------------------------------------------------------- =============

# Le script a pour objectif de realiser des requetes sur la BDD

# . -------------------------------------------------------------------------- =============
# 1 - Librairie ====
# . -------------------------------------------------------------------------- =============

## differentes librairies utiles
# gestion de connexion BDD : "RPostgreSQL", "DBI"
# manipulation de données : "tidyverse","lubridate","stringr"
# visualisation de données : "ggplot2","RColorBrewer", "plotly"
# manipulation de données géographique : "sf"

pkgs <-  c("RPostgreSQL", "DBI","dplyr","tidyverse","lubridate","stringr", "ggplot2","RColorBrewer", "plotly","sf")

# on test si les librairies sont installees sur l'environnement, si c'est pas le cas on les installes
if (length(setdiff(pkgs, rownames(installed.packages()))) > 0) {
  # installation des packages 
  install.packages(setdiff(pkgs, rownames(installed.packages())))  
} 
# chargement des librairies (necessite qu'elles soient installees) 
lapply(pkgs, library, character.only = TRUE)
rm(pkgs)

# . -------------------------------------------------------------------------- =============
# 2 - connexion à la BDD ====
# . -------------------------------------------------------------------------- =============

## Connexion a la base de donnee LPO AURA
getwd() %>% ## prise du chemin de dossier actuelle 
  paste0("/R/connexion_lpo.R") %>% ## indication du nom du fichier 
  source() ## lecture du fichier 

## autres options similaires : 
# source("C:/Users/afourneyron/Documents/dashboard_indicateur/connexion_lpo.R")


# . -------------------------------------------------------------------------- =============
# 3 - lectures des donnees par requete ====
# . -------------------------------------------------------------------------- =============

## TAB_Info va etre la variable qui va recuperer les donnees 
## dbGetQuery c'est la fonction qui permet de recuperer les donnees
## con_gn c'est la variable de connexion a la base de donnees (defini dans le script connexion_lpo.R)
## Puis apres c'est simplement votre requetes SQL
TAB_Info <- dbGetQuery(con_gn, "select * from orb_indicateurs.mv_sraddet_ind_pole") 




# . -------------------------------------------------------------------------- =============
# 4 - lectures des donnees spatiales par requete ====
# . -------------------------------------------------------------------------- =============

## si on veux recuperer des entites geometriques il est necessaires de passer par le package "sf" et la fonction st_read
## elle marche de la meme manieres mais la variable ne seras pas un tableau mais un tableau d'entites spatiales.
GEOM_Info <- st_read(con_gn, query = "select * from orb_indicateurs.mv_sraddet_ind_pole_geom" ) 

# plot(GEOM_Info$geom[1])
