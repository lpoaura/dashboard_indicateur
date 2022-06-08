#Ce fichier crée le serveur nécessaire au bon fonctionnement de l'application web.

print("Creating server...");

server <- function(input, output, session) {
  
  # reactiveValues permettant de se rappeler de la page précédente.
  data_page <- reactiveValues(
    page = "global"
  );
  
  # -------------------- BOUTONS DE NAVIGATION -------------------- #
  buttonsNavTabFct(input, output, session, data_page);
  
  # -------------------- BOUTONS DE COLLAPSE/UNCOLLAPSE -------------------- #
  buttonCollapseFct(input, output, session);
  
  # -------------------- BOUTONS DE CHOIX DE PÔLE -------------------- #
  buttonsPolesSettingsFct(input, output, session);
  
  # -------------------- BOUTONS DE PÔLE DANS LE BANDEAU -------------------- #
  buttonsPolesLeftBandeauFct(input, output, session);
  
  # -------------------- DONNEES -------------------- #
  datasForServerFct(input, output, session);
}