#Ce fichier charge tous les scripts nécessaires au bon fonctionnement de l'application web.

getwd() %>%
  paste0("/R/UI/head/createNavButtons.R") %>%
  source()

getwd() %>%
  paste0("/R/UI/head/createSettings.R") %>%
  source()

getwd() %>%
  paste0("/R/UI/head/createHead.R") %>%
  source()

getwd() %>%
  paste0("/R/UI/body/createLeftBandeauGlobalExpert.R") %>%
  source()

getwd() %>%
  paste0("/R/UI/body/createLeftBandeauAccueil.R") %>%
  source()

getwd() %>%
  paste0("/R/UI/createUI.R") %>%
  source()

getwd() %>%
  paste0("/R/Server/createServer.R") %>%
  source()