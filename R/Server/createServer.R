#Ce fichier crée le serveur nécessaire au bon fonctionnement de l'application web.

print("Creating server...");

server <- function(input, output, session) {
  
  # reactiveValues permettant de se rappeler de la page précédente.
  data_page <- reactiveValues(
    page = "global"
  );
  
  # reactiveValues permettant de mémoriser l'année à oberver.
  data_year <- reactiveValues(
    year = 0,
    loading = FALSE
  )
  
  # reactiveValues permettent de savoir quels boutons de pôles sont actifs
  data_polesButtons <- reactiveValues(
    flore = TRUE,
    invertebre = TRUE,
    vertebre = TRUE
  );
  
  # reactiveValues permettent de savoir quels feux de pôles sont actifs
  data_polesFeux <- reactiveValues(
    flore = TRUE,
    invertebre = TRUE,
    vertebre = TRUE
  );
  
  # Permet d'initialiser les indicateurs.
  data_currentInd <- reactiveValues(
    indicator = valIndicators[[1]],
    indicatorName = listIndicators[[1]]
  );
  initSelectorsFct(input, output, session,
                   isolate(data_currentInd$indicator), isolate(data_currentInd$indicatorName));
  
  # reactiveValues permettent de savoir quel onglet du mode Admin est sélectionné
  data_tabAdmin <- reactiveValues(
    tab = "RAJOUT"
  );
  
  data_tabAccueil <- reactiveValues(
    tab = "ind1"
  );
  
  
  # -------------------- BOUTONS DE NAVIGATION -------------------- #
  buttonsNavTabFct(input, output, session, data_page, data_currentInd, data_polesButtons, data_polesFeux, data_year);
  
  # -------------------- BOUTONS DE COLLAPSE/UNCOLLAPSE -------------------- #
  buttonCollapseFct(input, output, session, data_currentInd, data_polesButtons, data_polesFeux, data_year);
  
  # -------------------- CHOIX DE L'ANNÉE -------------------- #
  yearsSettingsFct(input, output, session, data_year, data_currentInd, data_polesButtons);
  
  # -------------------- BOUTONS DE CHOIX DE PÔLE -------------------- #
  buttonsPolesSettingsFct(input, output, session, data_polesButtons, data_polesFeux, data_currentInd, data_year);
  
  # -------------------- BOUTONS DE PÔLE DANS LE BANDEAU -------------------- #
  buttonsPolesLeftBandeauFct(input, output, session, data_polesFeux, data_polesButtons);
  
  # -------------------- MENU DE SELECTION -------------------- #
  selectIndicatorsFct(input, output, session, data_currentInd, data_polesButtons, data_year);
  
  # -------------------- BOUTONS D'ONGLETS DANS LE MODE ADMIN -------------------- #
  buttonsAdminTabFct(input, output, session, data_tabAdmin);
  
  # -------------------- BOUTONS D'ONGLETS DANS LE MODE ACCUEIL -------------------- #
  buttonsAccueilTabFct(input, output, session, data_tabAccueil);
  
  # -------------------- INITIALISATION DES DONNEES -------------------- #
  datasForServerFct(input, output, session);
  
}