# Création du bandeau de gauche en mode Accueil

# Sélecteur d'indicateur unique
buttonInd1<-actionButton(inputId="ind1",
                         class="multipleInd",
                         div(class="labelMultipleInd",
                             id="ind1",
                             tags$p("Renseignements"),
                             icon(name = "caret-right")))

# Sélecteur de sous-indicateur
buttonInd11<-actionButton(inputId="ind11",
                          class="subInd",
                          label="Qui sommes-nous ?")

# Sélecteur de sous-indicateur
buttonInd12<-actionButton(inputId="ind12",
                          class="subInd",
                          label="Nos collaborateurs")

# Sélecteur de sous-indicateur
buttonInd13<-actionButton(inputId="ind13",
                          class="subInd",
                          label="Contexte des indicateurs")

# Sélecteur d'indicateur multiple
buttonInd2<-actionButton(inputId="ind2",
                         class="multipleInd",
                         div(class="labelMultipleInd",
                             id="ind2",
                             tags$p("Mode de représentation"),
                             icon(name = "caret-right")))

# Sélecteur de sous-indicateur
buttonInd21<-actionButton(inputId="ind21",
                          class="subInd",
                          label="Histogramme")

# Sélecteur de sous-indicateur
buttonInd22<-actionButton(inputId="ind22",
                          class="subInd",
                          label="Camembert")

# Sélecteur de sous-indicateur
buttonInd23<-actionButton(inputId="ind23",
                          class="subInd",
                          label="Diagramme en barres")

# Sélecteur de sous-indicateur
buttonInd24<-actionButton(inputId="ind24",
                          class="subInd",
                          label="Cartographie")

# Sélecteur d'indicateur multiple
buttonInd3<-actionButton(inputId="ind3",
                         class="multipleInd",
                         div(class="labelMultipleInd",
                             id="ind3",
                             tags$p("Indicateur de connaissance"),
                             icon(name = "caret-right")))

# Sélecteur de sous-indicateur
buttonInd31<-actionButton(inputId="ind31",
                          class="subInd",
                          label="Nombre de données")
# Sélecteur de sous-indicateur
buttonInd32<-actionButton(inputId="ind32",
                          class="subInd",
                          label="Nombre d'espèces")
# Sélecteur de sous-indicateur
buttonInd33<-actionButton(inputId="ind33",
                          class="subInd",
                          label="Indicateur de connaissances")

# Sélecteur d'indicateur unique
buttonInd4<-actionButton(inputId="ind4",
                         class="singleInd",
                         label="Indicateurs d'état de la biodiversité")

# Sélecteur d'indicateur unique
buttonInd5<-actionButton(inputId="ind5",
                         class="singleInd",
                         label="Indicateurs de pressions anthropiques")

# Boîte rassemblant les sélecteurs des sous-indicateurs
divSubNavContent1<-div(class="subNavContent",
                      id="subNavContentInd1",
                      buttonInd11,
                      buttonInd12,
                      buttonInd13)

divSubNavContent2<-div(class="subNavContent",
                       id="subNavContentInd2",
                       buttonInd21,
                       buttonInd22,
                       buttonInd23,
                       buttonInd24)

divSubNavContent3<-div(class="subNavContent",
                       id="subNavContentInd3",
                       buttonInd31,
                       buttonInd32,
                       buttonInd33)


# Navigation des sélecteurs des sous-indicateurs de l'indicateur multiple
divSubNav1<-div(class="subNav",
               id="subNavInd1",
               buttonInd1,
               divSubNavContent1)

divSubNav2<-div(class="subNav",
                id="subNavInd2",
                buttonInd2,
                divSubNavContent2)

divSubNav3<-div(class="subNav",
                id="subNavInd3",
                buttonInd3,
                divSubNavContent3)

# Navigation des sélecteurs de l'ensemble des sélecteurs des indicateurs
divNavBar <- div(id="navBar",
                 divSubNav1,
                 divSubNav2,
                 divSubNav3,
                 buttonInd4,
                 buttonInd5)

# Panneau de renseignements par rapport au sélecteur choisi
divInfo_ind1 <- div(id="info_ind1",
                    class="info",
               h1(class="indName",
                  "Renseignements"),
               tags$p(class="indExplanation",
                      "Lorem ipsum dolor sit amet, 
                      consectetur adipiscing elit. 
                      Quisque sodales nunc eu egestas 
                      dictum. Mauris maximus ante et 
                      diam lacinia sodales. Ut 
                      elementum tortor sed lorem commodo, 
                      ut aliquet mauris viverra. In vel 
                      odio ut magna pretium imperdiet eu 
                      et erat. Curabitur ornare cursus mi,
                      eget vulputate orci pellentesque vel."))

divInfo_ind11 <- div(id="info_ind11",
                    class="info",
                    h1(class="indName",
                       "Qui sommes-nous ?"),
                    tags$p(class="indExplanation",
                           "Lorem ipsum dolor sit amet, 
                      consectetur adipiscing elit. 
                      Quisque sodales nunc eu egestas 
                      dictum. Mauris maximus ante et 
                      diam lacinia sodales. Ut 
                      elementum tortor sed lorem commodo, 
                      ut aliquet mauris viverra. In vel 
                      odio ut magna pretium imperdiet eu 
                      et erat. Curabitur ornare cursus mi,
                      eget vulputate orci pellentesque vel."))

# ------- Panneau des collaborateurs --------- #

# Zone CBN
divCBN <- div(id = "CBNArea",
              class = "areaCollaborator",
              actionButton(inputId = "logoBtn",
                           tags$a(href="https://www.cbnmc.fr/",
                                  target="_blank", rel="noopener noreferrer",
                                  img(src = "Resources/logos/CBN-logo-horizontal-MC-RVB.png",
                                      height = 80,
                                      width = 130))),
              tags$p(class = "nameCollaborator",
                     "Conservatoire Botanique National Massif Central"),
              tags$p(class = "descriptionCollaborator",
                     "Lorem ipsum dolor sit amet, 
                                      consectetur adipiscing elit. 
                                      Quisque sodales nunc eu egestas 
                                      dictum. Mauris maximus ante et 
                                      diam lacinia sodales."))
# Zone DREAL
divDREAL <- div(id = "DREALArea",
                class = "areaCollaborator",
                actionButton(inputId = "logoBtn",
                             tags$a(href="https://www.prefectures-regions.gouv.fr/auvergne-rhone-alpes",
                                    target="_blank", rel="noopener noreferrer",
                                    img(src = "Resources/logos/Logo_DREAL.png",
                                        height = 80,
                                        width = 80))),
                tags$p(class = "nameCollaborator",
                       "Préfet de la Région Auvergne-Rhône-Alpes"),
                tags$p(class = "descriptionCollaborator",
                       "Lorem ipsum dolor sit amet, 
                                      consectetur adipiscing elit. 
                                      Quisque sodales nunc eu egestas 
                                      dictum. Mauris maximus ante et 
                                      diam lacinia sodales."))
# Zone Flavia
divFlavia <- div(id = "FlaviaArea",
                 class = "areaCollaborator",
                 actionButton(inputId = "logoBtn",
                              tags$a(href="http://www.flavia-ape.fr/",
                                     target="_blank", rel="noopener noreferrer",
                                     img(src = "Resources/logos/Logo_Flavia_orange.png",
                                         height = 80,
                                         width = 250))),
                 tags$p(class = "nameCollaborator",
                        "Flavia"),
                 tags$p(class = "descriptionCollaborator",
                        "Lorem ipsum dolor sit amet, 
                                      consectetur adipiscing elit. 
                                      Quisque sodales nunc eu egestas 
                                      dictum. Mauris maximus ante et 
                                      diam lacinia sodales."))

# Première ligne de collaborateurs
divHGrid1 <- div(class="horizontalGrid",
                 divCBN,
                 divDREAL,
                 divFlavia)

# Zone de LPO
divLPO <- div(id = "LPOrea",
              class = "areaCollaborator",
              actionButton(inputId = "logoBtn",
                           tags$a(href="https://www.lpo.fr/",
                                  target="_blank", rel="noopener noreferrer",
                                  img(src = "Resources/logos/logo_lpo_aura.png",
                                      height = 80,
                                      width = 230))),
              tags$p(class = "nameCollaborator",
                     "Ligue pour la Protection des Oiseaux"),
              tags$p(class = "descriptionCollaborator",
                     "Lorem ipsum dolor sit amet, 
                                      consectetur adipiscing elit. 
                                      Quisque sodales nunc eu egestas 
                                      dictum. Mauris maximus ante et 
                                      diam lacinia sodales."))

# Zone de Région AURA
divRegionAURA <- div(id = "RegionAURAArea",
                     class = "areaCollaborator",
                     actionButton(inputId = "logoBtn",
                                  tags$a(href="https://www.auvergnerhonealpes.fr/",
                                         target="_blank", rel="noopener noreferrer",
                                         img(src = "Resources/logos/Logo_region-768x178.png",
                                             height = 80,
                                             width = 320))),
                     tags$p(class = "nameCollaborator",
                            "Région Auvergne-Rhône-Alpes"),
                     tags$p(class = "descriptionCollaborator",
                            "Lorem ipsum dolor sit amet, 
                                      consectetur adipiscing elit. 
                                      Quisque sodales nunc eu egestas 
                                      dictum. Mauris maximus ante et 
                                      diam lacinia sodales."))

# Zone d'OFB
divOFB <- div(id = "OFBArea",
              class = "areaCollaborator",
              actionButton(inputId = "logoBtn",
                           tags$a(href="https://www.ofb.gouv.fr/",
                                  target="_blank", rel="noopener noreferrer",
                                  img(src = "Resources/logos/logo-ofb.png",
                                      height = 80,
                                      width = 200))),
              tags$p(class = "nameCollaborator",
                     "Office Français de la Biodiversité"),
              tags$p(class = "descriptionCollaborator",
                     "Lorem ipsum dolor sit amet, 
                                      consectetur adipiscing elit. 
                                      Quisque sodales nunc eu egestas 
                                      dictum. Mauris maximus ante et 
                                      diam lacinia sodales."))


# Deuxième ligne de collaborateurs  
divHGrid2 <- div(class="horizontalGrid",
                 divLPO,
                 divRegionAURA,
                 divOFB)

# Ligne réservée à Télécom Saint-Etienne et l'équipe de développement
divTSE <- div(id = "TSEArea",
              div(id = "TSEPresentation",
                  actionButton(inputId = "logoBtn",
                               tags$a(href="https://www.telecom-st-etienne.fr/",
                                      target="_blank", rel="noopener noreferrer",
                                      img(src = "Resources/logos/Logo_Télécom_Saint_Étienne.png",
                                          height =150))),
                  tags$p("L'équipe de développement de l'application web")),
              div(id = "membersArea",
                  div(class = "memberArea",
                      icon(lib = "font-awesome","user"),
                      tags$p("BONILLA Tomas")),
                  div(class = "memberArea",
                      icon(lib = "font-awesome","user"),
                      tags$p("BULTINGAIRE Thomas")),
                  div(class = "memberArea",
                      icon(lib = "font-awesome","user"),
                      tags$p("FERRA Laurianna")),
                  div(class = "memberArea",
                      icon(lib = "font-awesome","user"),
                      tags$p("LOGEAIS Thomas"))))

# Grille composant la page des collaborateurs
divGrid <-  div(id = "gridCollaborator",
                divHGrid1,
                divHGrid2,
                divTSE)

divInfo_ind12 <- div(id="info_ind12",
                     class="info",
                     h1(class="indName",
                        "Nos collaborateurs"),
                     divGrid)

divInfo_ind13 <- div(id="info_ind13",
                     class="info",
                     h1(class="indName",
                        "Contexte des indicateurs"),
                     tags$p(class="indExplanation",
                            "Lorem ipsum dolor sit amet, 
                      consectetur adipiscing elit. 
                      Quisque sodales nunc eu egestas 
                      dictum. Mauris maximus ante et 
                      diam lacinia sodales. Ut 
                      elementum tortor sed lorem commodo, 
                      ut aliquet mauris viverra. In vel 
                      odio ut magna pretium imperdiet eu 
                      et erat. Curabitur ornare cursus mi,
                      eget vulputate orci pellentesque vel."))

divInfo_ind2 <- div(id="info_ind2",
                     class="info",
                     h1(class="indName",
                        "Mode de représentation"),
                     tags$p(class="indExplanation",
                            "Lorem ipsum dolor sit amet, 
                      consectetur adipiscing elit. 
                      Quisque sodales nunc eu egestas 
                      dictum. Mauris maximus ante et 
                      diam lacinia sodales. Ut 
                      elementum tortor sed lorem commodo, 
                      ut aliquet mauris viverra. In vel 
                      odio ut magna pretium imperdiet eu 
                      et erat. Curabitur ornare cursus mi,
                      eget vulputate orci pellentesque vel."))

divInfo_ind21 <- div(id="info_ind21",
                    class="info",
                    h1(class="indName",
                       "Histogramme"),
                    tags$p(class="indExplanation",
                           "Lorem ipsum dolor sit amet, 
                      consectetur adipiscing elit. 
                      Quisque sodales nunc eu egestas 
                      dictum. Mauris maximus ante et 
                      diam lacinia sodales. Ut 
                      elementum tortor sed lorem commodo, 
                      ut aliquet mauris viverra. In vel 
                      odio ut magna pretium imperdiet eu 
                      et erat. Curabitur ornare cursus mi,
                      eget vulputate orci pellentesque vel."))

divInfo_ind22 <- div(id="info_ind22",
                     class="info",
                     h1(class="indName",
                        "Camembert"),
                     tags$p(class="indExplanation",
                            "Lorem ipsum dolor sit amet, 
                      consectetur adipiscing elit. 
                      Quisque sodales nunc eu egestas 
                      dictum. Mauris maximus ante et 
                      diam lacinia sodales. Ut 
                      elementum tortor sed lorem commodo, 
                      ut aliquet mauris viverra. In vel 
                      odio ut magna pretium imperdiet eu 
                      et erat. Curabitur ornare cursus mi,
                      eget vulputate orci pellentesque vel."))

divInfo_ind23 <- div(id="info_ind23",
                     class="info",
                     h1(class="indName",
                        "Diagrammes en barre"),
                     tags$p(class="indExplanation",
                            "Lorem ipsum dolor sit amet, 
                      consectetur adipiscing elit. 
                      Quisque sodales nunc eu egestas 
                      dictum. Mauris maximus ante et 
                      diam lacinia sodales. Ut 
                      elementum tortor sed lorem commodo, 
                      ut aliquet mauris viverra. In vel 
                      odio ut magna pretium imperdiet eu 
                      et erat. Curabitur ornare cursus mi,
                      eget vulputate orci pellentesque vel."))

divInfo_ind24 <- div(id="info_ind24",
                     class="info",
                     h1(class="indName",
                        "Cartographie"),
                     tags$p(class="indExplanation",
                            "Lorem ipsum dolor sit amet, 
                      consectetur adipiscing elit. 
                      Quisque sodales nunc eu egestas 
                      dictum. Mauris maximus ante et 
                      diam lacinia sodales. Ut 
                      elementum tortor sed lorem commodo, 
                      ut aliquet mauris viverra. In vel 
                      odio ut magna pretium imperdiet eu 
                      et erat. Curabitur ornare cursus mi,
                      eget vulputate orci pellentesque vel."))

divInfo_ind3 <- div(id="info_ind3",
                    class="info",
                    h1(class="indName",
                       "Indicateur de connaissance"),
                    tags$p(class="indExplanation",
                           "Lorem ipsum dolor sit amet, 
                      consectetur adipiscing elit. 
                      Quisque sodales nunc eu egestas 
                      dictum. Mauris maximus ante et 
                      diam lacinia sodales. Ut 
                      elementum tortor sed lorem commodo, 
                      ut aliquet mauris viverra. In vel 
                      odio ut magna pretium imperdiet eu 
                      et erat. Curabitur ornare cursus mi,
                      eget vulputate orci pellentesque vel."))

divInfo_ind31 <- div(id="info_ind31",
                     class="info",
                    h1(class="indName",
                       "Nombre de données"),
                    tags$p(class="indExplanation",
                           "Lorem ipsum dolor sit amet, 
                      consectetur adipiscing elit. 
                      Quisque sodales nunc eu egestas 
                      dictum. Mauris maximus ante et 
                      diam lacinia sodales. Ut 
                      elementum tortor sed lorem commodo, 
                      ut aliquet mauris viverra. In vel 
                      odio ut magna pretium imperdiet eu 
                      et erat. Curabitur ornare cursus mi,
                      eget vulputate orci pellentesque vel."))

divInfo_ind32 <- div(id="info_ind32",
                     class="info",
                    h1(class="indName",
                       "Nombre d'espèces"),
                    tags$p(class="indExplanation",
                           "Lorem ipsum dolor sit amet, 
                      consectetur adipiscing elit. 
                      Quisque sodales nunc eu egestas 
                      dictum. Mauris maximus ante et 
                      diam lacinia sodales. Ut 
                      elementum tortor sed lorem commodo, 
                      ut aliquet mauris viverra. In vel 
                      odio ut magna pretium imperdiet eu 
                      et erat. Curabitur ornare cursus mi,
                      eget vulputate orci pellentesque vel."))

divInfo_ind33 <- div(id="info_ind33",
                     class="info",
                    h1(class="indName",
                       "Indicateur de connaissances"),
                    tags$p(class="indExplanation",
                           "Lorem ipsum dolor sit amet, 
                      consectetur adipiscing elit. 
                      Quisque sodales nunc eu egestas 
                      dictum. Mauris maximus ante et 
                      diam lacinia sodales. Ut 
                      elementum tortor sed lorem commodo, 
                      ut aliquet mauris viverra. In vel 
                      odio ut magna pretium imperdiet eu 
                      et erat. Curabitur ornare cursus mi,
                      eget vulputate orci pellentesque vel."))

divInfo_ind4 <- div(id="info_ind4",
                    class="info",
                    h1(class="indName",
                       "Indicateurs d'état de la biodiversité"),
                    tags$p(class="indExplanation",
                           "Lorem ipsum dolor sit amet, 
                      consectetur adipiscing elit. 
                      Quisque sodales nunc eu egestas 
                      dictum. Mauris maximus ante et 
                      diam lacinia sodales. Ut 
                      elementum tortor sed lorem commodo, 
                      ut aliquet mauris viverra. In vel 
                      odio ut magna pretium imperdiet eu 
                      et erat. Curabitur ornare cursus mi,
                      eget vulputate orci pellentesque vel."))

divInfo_ind5 <- div(id="info_ind5",
                    class="info",
                    h1(class="indName",
                       "Indicateurs de pressions anthropiques"),
                    tags$p(class="indExplanation",
                           "Lorem ipsum dolor sit amet, 
                      consectetur adipiscing elit. 
                      Quisque sodales nunc eu egestas 
                      dictum. Mauris maximus ante et 
                      diam lacinia sodales. Ut 
                      elementum tortor sed lorem commodo, 
                      ut aliquet mauris viverra. In vel 
                      odio ut magna pretium imperdiet eu 
                      et erat. Curabitur ornare cursus mi,
                      eget vulputate orci pellentesque vel."))

# Boîte rassemblant la navigation des sélecteurs et le panneau renseignements
divBandeauAccueil <- div(id = "bandeauAccueil",
                         divNavBar,
                         divInfo_ind1)