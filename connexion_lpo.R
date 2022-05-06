# . -------------------------------------------------------------------------- =============
# 0 - Objectifs ====
# . -------------------------------------------------------------------------- =============

# Le script a pour objectif de realiser la connexion la base de donnees 

# . -------------------------------------------------------------------------- =============
# 1 - Librairie ====
# . -------------------------------------------------------------------------- =============

## utilisation des librairies "RPostgreSQL", "DBI","readr"

pkgs <-  c("RPostgreSQL", "DBI","readr")

# on test si les librairies sont installé sur l'environnement, si c'est pas le cas on les installes
if (length(setdiff(pkgs, rownames(installed.packages()))) > 0) {
  # installation des packages 
  install.packages(setdiff(pkgs, rownames(installed.packages())))  
} 
# chargement des librairies (nécéssite qu'elles soient installées) 
lapply(pkgs, library, character.only = TRUE)
rm(pkgs)

# . -------------------------------------------------------------------------- =============
# 2 - Connexion BDD postGIS ====
# . -------------------------------------------------------------------------- =============

## Supressions de toutes les connexions précédentes
lapply(dbListConnections(drv = dbDriver("PostgreSQL")),
       function(x) {dbDisconnect(conn = x)})

# type de connexion PostgreSQL et information de connexion 
drv <- dbDriver("PostgreSQL")
name = "partenaires"
addresse = "bdd.lpo-aura.org"
uti = "orb_indicateurs"
mdp = read_file("C:/Users/afourneyron/Documents/orb_indicateurs/mdp.txt")
# gestion des carctères \\ \ 
mdp <- gsub("[\\]", "", mdp)

# connexion a la BDD
con_gn <- DBI::dbConnect(RPostgres::Postgres(),
                         dbname = name,
                         host = addresse,
                         port = 5432,
                         password = mdp,
                         user = uti,
                         base::list(sslmode="require", connect_timeout="10"),
                         service = NULL)

# lists des tables dans la BDD 
dbListTables(con_gn) ## permet de voir toutes les tables de la BDD, si rien ne ressors c'est que la connexion a un soucis
rm(name,addresse,uti,mdp) ## suppression des informations
