#Ce fichier charge tous les scripts nécessaires au bon fonctionnement de l'application web.

print("Loading scripts...");

# -------------------- Chargement et création des données -------------------- #
getwd() %>%
  paste0("/R/Datas/connexion_lpo.R") %>%
  source()

getwd() %>%
  paste0("/R/Datas/requetesSQL.R") %>%
  source()

getwd() %>%
  paste0("/R/Datas/datasForServerFct.R") %>%
  source()

getwd() %>%
  paste0("/R/Datas/createDivDatas.R") %>%
  source()

# -------------------- Création du UI -------------------- #
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
  paste0("/R/UI/body/createListIndicators.R") %>%
  source()

getwd() %>%
  paste0("/R/UI/body/createLeftBandeauGlobalExpert.R") %>%
  source()

getwd() %>%
  paste0("/R/UI/body/createLeftBandeauAccueil.R") %>%
  source()

getwd() %>%
  paste0("/R/UI/body/createLeftBandeauAdmin.R") %>%
  source()

getwd() %>%
  paste0("/R/UI/createUI.R") %>%
  source()

# -------------------- Création du server -------------------- #
getwd() %>%
  paste0("/R/Server/buttonsNavTabFct.R") %>%
  source()

getwd() %>%
  paste0("/R/Server/buttonsCollapseFct.R") %>%
  source()

getwd() %>%
  paste0("/R/Server/buttonsPolesSettingsFct.R") %>%
  source()

getwd() %>%
  paste0("/R/Server/buttonsPolesLeftBandeauFct.R") %>%
  source()

getwd() %>%
  paste0("/R/Server/selectIndicatorsFct.R") %>%
  source()

getwd() %>%
  paste0("/R/Server/buttonsAdminTabFct.R") %>%
  source()

getwd() %>%
  paste0("/R/Server/createServer.R") %>%
  source()



print("Scripts loaded !")