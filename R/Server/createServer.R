#Ce fichier crée le serveur nécessaire au bon fonctionnement de l'application web.

print("Creating server...");

server <- function(input, output, session) {
  
  # Permet d'initialiser les indicateurs.
  session$sendCustomMessage(type = 'setIndicators', message = listIndicators)
  
  # reactiveValues permettant de se rappeler de la page précédente.
  data_page <- reactiveValues(
    page = "global"
  );
  
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
  
  # reactiveValues permettent de savoir quel onglet du mode Admin est sélectionné
  data_tabAdmin <- reactiveValues(
    tab = "RAJOUT"
  );
  
  # -------------------- BOUTONS DE NAVIGATION -------------------- #
  buttonsNavTabFct(input, output, session, data_page);
  
  # -------------------- BOUTONS DE COLLAPSE/UNCOLLAPSE -------------------- #
  buttonCollapseFct(input, output, session);
  
  # -------------------- BOUTONS DE CHOIX DE PÔLE -------------------- #
  buttonsPolesSettingsFct(input, output, session, data_polesButtons, data_polesFeux);
  
  # -------------------- BOUTONS DE PÔLE DANS LE BANDEAU -------------------- #
  buttonsPolesLeftBandeauFct(input, output, session, data_polesFeux, data_polesButtons);
  
  # -------------------- BOUTONS D'ONGLETS DANS LE MODE ADMIN -------------------- #
  buttonsAdminTabFct(input, output, session, data_tabAdmin);
  
  # -------------------- DONNEES -------------------- #
  datasForServerFct(input, output, session);
  
}