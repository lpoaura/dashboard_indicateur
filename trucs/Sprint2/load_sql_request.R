##Carte
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

## Conaissance Camembert par pôle

qualite_labels = c('Faible', 'Moyenne', 'Bonne','Elevee')

#Données totales
total_faible <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Faible'")[,1,1]
total_moyenne <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Moyenne'")[,1,1]
total_bonne <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Bonne'")[,1,1]
total_elevee <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Ã‰levÃ©s'")[,1,1]

qualiteTotale = c(total_faible,total_moyenne,total_bonne,total_elevee)
dftotal = data.frame(qualite_labels,qualiteTotale)

#Données vertébrés
vertebres_faible <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Faible' AND declinaison ='Vertébrés'")[,1,1]
vertebres_moyenne <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Moyenne' AND declinaison ='Vertébrés'")[,1,1]
vertebres_bonne <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Bonne' AND declinaison ='Vertébrés'")[,1,1]
vertebres_élevée <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Ã‰levÃ©s' AND declinaison ='Vertébrés'")[,1,1]

qualiteVertebres = c(vertebres_faible,vertebres_moyenne,vertebres_bonne,vertebres_élevée)
dfvertebres = data.frame(qualite_labels,qualiteVertebres)

#Données flore
flore_faible <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Faible' AND declinaison ='Flore et Fongus'")[,1,1]
flore_moyenne <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Moyenne' AND declinaison ='Flore et Fongus'")[,1,1]
flore_bonne <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Bonne' AND declinaison ='Flore et Fongus'")[,1,1]
flore_élevée <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Ã‰levÃ©s' AND declinaison ='Flore et Fongus'")[,1,1]

qualiteFlore = c(flore_faible,flore_moyenne,flore_bonne,flore_élevée)
dfflore = data.frame(qualite_labels,qualiteFlore)

invertebres_faible <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Faible' AND declinaison ='Invertébrés'")[,1,1]
invertebres_moyenne <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Moyenne' AND declinaison ='Invertébrés'")[,1,1]
invertebres_bonne <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Bonne' AND declinaison ='Invertébrés'")[,1,1]
invertebres_élevée <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Ã‰levÃ©s' AND declinaison ='Invertébrés'")[,1,1]

qualiteInvertebres = c(invertebres_faible,invertebres_moyenne,invertebres_bonne,invertebres_élevée)
dfinvertebres = data.frame(qualite_labels,qualiteInvertebres)

colors1 <- c('#ECE0F3','#DDC8E9','#C39AD6','#A56AC2')#violet
colors2 <- c('#F8C04F','F9BA39','EE9039','#CC7B57')#orange
colors3 <- c('#CED760','#C5CF39','#8AC154','#399E69')#vert
colors4 <- c('#8BD6F0','#6CCAEB','#39AFDA','#398CB7')#bleu

##Histogrammes 

count <- dbGetQuery(con_gn, "select DISTINCT annee from orb_indicateurs.mv_sraddet_ind_pole ORDER BY annee ASC")[,1]
histFlore <- dbGetQuery(con_gn, "select nb_data_tot from orb_indicateurs.mv_sraddet_ind_pole WHERE declinaison = 'Flore et Fongus' ORDER BY annee ASC")[,1]
histVertebres <- dbGetQuery(con_gn, "select nb_data_tot from orb_indicateurs.mv_sraddet_ind_pole WHERE declinaison = 'Vertébrés' ORDER BY annee ASC")[,1]
histInvertebres <- dbGetQuery(con_gn, "select nb_data_tot from orb_indicateurs.mv_sraddet_ind_pole WHERE declinaison = 'Invertébrés' ORDER BY annee ASC")[,1]

dataHist <- data.frame(count,histFlore,histVertebres,histInvertebres)
