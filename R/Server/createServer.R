#Ce fichier crée le serveur nécessaire au bon fonctionnement de l'application web.

print("Creating server...");

server <- function(input, output, session) {
  
  # reactiveValues permettant de se rappeler de la page précédente.
  data_page <- reactiveValues(
    page = "accueil",
    fromPage = "accueil"
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
    typeInd = listTypesIndicators[[1]],
    indicator = tabIndicators[1,2],
    indicatorName = tabIndicators[1,1],
    declinaison = declinaisonIndicator[1,2],
    groupe = tabGroupe[1,1],
    hasChanged = FALSE
  );
  
  # Initialisation des selectors
  initTypeIndSelectFct(input = input, output = output, session = session,
                       data_currentInd = data_currentInd, data_polesButtons = data_polesButtons,
                       data_page = data_page, fromPrgm = "CREATE SERVER")
  
  # reactiveValues permettent de savoir quel onglet du mode Admin est sélectionné
  data_tabAdmin <- reactiveValues(
    tab = "RAJOUT"
  );
  
  data_tabAccueil <- reactiveValues(
    tab = "ind13"
  );
  session$sendCustomMessage(type = "actualizeNewTabAccueil", message = isolate(data_tabAccueil$tab));
  
  
  
  
  # -------------------- TOUTES LES INITIALISATIONS -------------------- #
  
  # -------------------- INITIALISATION DES MOTS DE PASSE -------------------- #
  mdpAdmin = read_file("mdpAdmin.txt")
  # gestion des carctères \\ \ 
  mdpAdmin <- gsub("[\\]", "", mdpAdmin)
  
  # -------------------- INITIALISATION DES SELECTORS -------------------- #
  # initTypeIndSelectFct(input = input, output = output, session = session,
  #                      data_currentInd = data_currentInd, data_polesButtons = data_polesButtons,
  #                      data_page = data_page, fromPrgm = "CREATE SERVER");
  
  # -------------------- INITIALISATION DES DONNEES -------------------- #
  # dispNumbersForServerFct(input, output, session,
  #                         isolate(data_polesFeux$flore),
  #                         isolate(data_polesFeux$invertebre),
  #                         isolate(data_polesFeux$vertebre));
  
  
  
  
  # -------------------- TOUS LES OBSERVER -------------------- #
  
  # -------------------- BOUTONS DE NAVIGATION -------------------- #
  buttonsNavTabFct(input, output, session, data_page, data_currentInd, data_polesButtons, data_polesFeux, data_year, data_tabAccueil);
  
  # -------------------- BOUTONS DE COLLAPSE/UNCOLLAPSE -------------------- #
  buttonCollapseFct(input, output, session, data_page, data_currentInd, data_polesButtons, data_polesFeux, data_year);
  
  # -------------------- CHOIX DE L'ANNÉE -------------------- #
  yearsSettingsFct(input, output, session, data_year, data_currentInd, data_polesButtons);
  
  # -------------------- BOUTONS DE CHOIX DE PÔLE -------------------- #
  buttonsPolesSettingsFct(input, output, session, data_polesButtons, data_polesFeux, data_currentInd, data_year, data_page);
  
  # -------------------- BOUTONS DE PÔLE DANS LE BANDEAU -------------------- #
  buttonsPolesLeftBandeauFct(input, output, session, data_polesFeux, data_polesButtons);
  
  # -------------------- MENU DE SELECTION -------------------- #
  selectIndicatorsFct(input, output, session, data_currentInd, data_polesButtons, data_year, data_page);
  
  # -------------------- BOUTONS DE LOGIN DANS LE MODE ADMIN -------------------- #
  buttonLogInAdminFct(input, output, session, mdpAdmin);
  
  # -------------------- BOUTONS D'ONGLETS DANS LE MODE ADMIN -------------------- #
  buttonsAdminTabFct(input, output, session, data_tabAdmin);
  
  # -------------------- BOUTONS D'ONGLETS DANS LE MODE ACCUEIL -------------------- #
  buttonsAccueilTabFct(input, output, session, data_tabAccueil);
  
  # -------------------- BOUTON D'AIDE DANS LE MODE GLOBAL/EXPERT -------------------- #
  buttonHelpFct(input, output, session, data_page, data_tabAccueil, data_currentInd);
  
  # -------------------- POP UP DES DATA VIZ DANS LE MODE GLOBAL/EXPERT -------------------- #
  popUpDataVizFct(input, output, session);
  
  # -------------------- DYNAMIQUE DE LA FONCTION RAJOUT DU MODE ADMIN -------------------- #
  addPanelAccueilFct(input, output, session);
}
