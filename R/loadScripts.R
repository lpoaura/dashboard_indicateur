#Ce fichier charge tous les scripts nécessaires au bon fonctionnement de l'application web.

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/UI/accueil/createEnTete.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/UI/accueil/createLeftBandeau.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/UI/global/createEnTete.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/UI/global/createLeftBandeau.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/UI/expert/createEnTete.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/UI/expert/createLeftBandeau.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/UI/admin/createEnTete.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/UI/admin/createLeftBandeau.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/UI/createDivTotal.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/UI/createUIs.R") %>%
  source()

getwd() %>% ## prise du chemin de dossier actuelle
  paste0("/R/Server/createServer.R") %>%
  source()