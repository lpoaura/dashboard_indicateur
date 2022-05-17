# Création du bandeau de gauche

# Bandeau de gauche
divBandeau <- div(id = "bandeau",
                  "bandeau")

# Zone de la carte
divCarte <- div(id = "carte",
                img(src="Logo_DREAL.png",
                    width = 70,
                    height = 70))

divBandeauCarte <- div(id = "bandeauCarte",
                       divBandeau,
                       divCarte)
rm(divBandeau, divCarte)