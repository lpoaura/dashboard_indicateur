#Ce fichier crée toutes les div générales nécessaires au bon fonctionnement de l'application web.

# Carte en background
divCarteBack <- div(id = "carteBack",
                    "TEST CARTE")

# Page entière d'accueil
divTotalAccueil <- div(id = "total",
                       divCarteBack,
                       divEnTeteAccueil,
                       divBandeauCarte)

# Page entière globale
divTotalGlobal <- div(id = "total",
                      divCarteBack,
                      divEnTeteGlobal,
                      divBandeauCarteGlobal)

# Page entière globale
divTotalExpert <- div(id = "total",
                      divCarteBack,
                      divEnTeteExpert,
                      divBandeauCarte)

# Page entière globale
divTotalAdmin <- div(id = "total",
                     divCarteBack,
                     divEnTeteAdmin,
                     divBandeauCarte)