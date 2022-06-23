# Création du bandeau de gauche en mode Accueil

print('BAccueil');

#---!!! Position de buttonInd : modify_suppress_button_tab_accueil !!!---#

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
  
#---!!! Position de buttonInd : add_button_tab_accueil !!!---#

#---!!! Position de buttonInd : modify_suppress_button_tab_accueil !!! END ---#

# Boîte rassemblant les sélecteurs des sous-indicateurs
divSubNavContent1<-div(class="subNavContent"
                      , id="subNavContentInd1"
                      , buttonInd11
                      , buttonInd12
                      , buttonInd13
                      #---!!! Position de subNavContent : add_preexisting_ind1_categorie !!!---#
                      )

divSubNavContent2<-div(class="subNavContent"
                       , id="subNavContentInd2"
                       , buttonInd21
                       , buttonInd22
                       , buttonInd23
                       , buttonInd24
                       #---!!! Position de subNavContent : add_preexisting_ind2_categorie !!!---#
                       )

divSubNavContent3<-div(class="subNavContent"
                       ,id="subNavContentInd3"
                       ,buttonInd31
                       ,buttonInd32
                       ,buttonInd33
                       #---!!! Position de subNavContent : add_preexisting_ind3_categorie !!!---#
                       )

#---!!! Position de subNavContent : add_categorie !!!---#


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

#---!!! Position de subNav : add_categorie !!!---#

# Navigation des sélecteurs de l'ensemble des sélecteurs des indicateurs
divNavBar <- div(id="navBar"
                 , divSubNav1
                 , divSubNav2
                 , divSubNav3#---!!! Position de NavBar : modify_single_en_multiply_ind4 !!!---#
                 , buttonInd4#---!!! Position de NavBar : modify_single_en_multiply_ind5 !!!---#
                 , buttonInd5
#---!!! Position de NavBar : add_newInfo_OrInd !!!---#
                 )

# Panneau de renseignements par rapport au sélecteur choisi
divInfo_ind1 <- div(id="info_ind1",
                    class="info",
               h1(class="indName",
                  "Renseignements"),
               tags$p(class="indExplanation",
                      "Cet onglet rassemble toutes les informations nécessaires sur le
                      contexte de ce dashboard : sa raison d'être, l'équipe et ses collaborateurs
                      qui l'ont mis en place ainsi que le genre d'informations délivrées par les 
                      indicateurs."))

divInfo_ind11 <- div(id="info_ind11",
                    class="info",
                    h1(class="indName",
                       "Qui sommes-nous ?"),
                    tags$p(class="indExplanation",
                           "L’Observatoire régional de la Biodiversité est un dispositif 
                           piloté par l’État et la Région pour rassembler, diffuser et 
                           valoriser les données et démarches en lien avec la connaissance 
                           sur la biodiversité dans la région Auvergne-Rhône-Alpes."),
                    br(),
                    tags$p(class="indExplanation",
                           "Financées par la DREAL et la Région, les missions de l’ORB 
                           sont assurées par les animateurs des pôles thématiques 
                           (Conservatoires Botaniques Nationaux Alpins et du Massif Central, 
                           association Flavia APE, Ligue pour la Protection des Oiseaux et 
                           Fédération régionale des chasseurs) avec l’appui technique de 
                           l’Office Fançais de la Biodiversité. "))

# ------- Panneau des collaborateurs --------- #

# Zone CBN Massif Central
divCBNMC<- div(id = "CBNMCArea",
              class = "areaCollaborator",
              actionButton(inputId = "logoBtn",
                           tags$a(href="https://www.cbnmc.fr/",
                                  target="_blank", rel="noopener noreferrer",
                                  img(src = "Resources/logos/CBN-logo-horizontal-MC-RVB.png",
                                      height = 80,
                                      width = 120))))

# Zone CBN Massif Central
divCBNALPIN <- div(id = "CBNALPINArea",
                 class = "areaCollaborator",
                 actionButton(inputId = "logoBtn",
                              tags$a(href="http://www.cbn-alpin.fr/",
                                     target="_blank", rel="noopener noreferrer",
                                     img(src = "Resources/logos/CBN-logo-horizontal-ALPIN-RVB.png",
                                         height = 80,
                                         width = 120))))

# Zone DREAL
divDREAL <- div(id = "DREALArea",
                class = "areaCollaborator",
                actionButton(inputId = "logoBtn",
                             tags$a(href="https://www.prefectures-regions.gouv.fr/auvergne-rhone-alpes",
                                    target="_blank", rel="noopener noreferrer",
                                    img(src = "Resources/logos/Logo_DREAL.png",
                                        height = 80,
                                        width = 80))))
# Zone Flavia
divFlavia <- div(id = "FlaviaArea",
                 class = "areaCollaborator",
                 actionButton(inputId = "logoBtn",
                              tags$a(href="http://www.flavia-ape.fr/",
                                     target="_blank", rel="noopener noreferrer",
                                     img(src = "Resources/logos/Logo_Flavia_orange.png",
                                         height = 80,
                                         width = 250))))

# Zone de LPO
divLPO <- div(id = "LPOrea",
              class = "areaCollaborator",
              actionButton(inputId = "logoBtn",
                           tags$a(href="https://www.lpo.fr/",
                                  target="_blank", rel="noopener noreferrer",
                                  img(src = "Resources/logos/logo_lpo_aura.png",
                                      height = 80,
                                      width = 230))))

# Zone de Région AURA
divRegionAURA <- div(id = "RegionAURAArea",
                     class = "areaCollaborator",
                     actionButton(inputId = "logoBtn",
                                  tags$a(href="https://www.auvergnerhonealpes.fr/",
                                         target="_blank", rel="noopener noreferrer",
                                         img(src = "Resources/logos/Logo_region-768x178.png",
                                             height = 80,
                                             width = 320))))

# Zone d'OFB
divOFB <- div(id = "OFBArea",
              class = "areaCollaborator",
              actionButton(inputId = "logoBtn",
                           tags$a(href="https://www.ofb.gouv.fr/",
                                  target="_blank", rel="noopener noreferrer",
                                  img(src = "Resources/logos/logo-ofb.png",
                                      height = 80,
                                      width = 200))))

# Première ligne de collaborateurs
divHGrid1 <- div(class="horizontalGrid",
                 divDREAL,
                 divRegionAURA,
                 divOFB)


# Deuxième ligne de collaborateurs  
divHGrid2 <- div(class="horizontalGrid",
                 divCBNALPIN,
                 divCBNMC,
                 divFlavia)

# Troisième ligne de collaborateurs  
divHGrid3 <- div(class="horizontalGrid",
                 divLPO)

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
                divHGrid3,
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
                            "L’Observatoire de la biodiversité est un observatoire 
                            de l'environnement, spécifiquement destiné à l'observation 
                            de la diversité biologique à l’échelle régionale, et à 
                            l’évaluation des politiques engagées pour la protéger. 
                            Son objectif est d’analyser et fournir au plus grand nombre 
                            des informations objectives et pertinentes sur l’état de 
                            santé de la nature en région."),
                     br(),
                     tags$p(class="indExplanation",
                            "Quel est l’état de la biodiversité en Auvergne-Rhône-Alpes, comment évolue-t-elle,
                            quel est le niveau de connaissance de la biodiversité, quels sont les principaux 
                            facteurs influençant la biodiversité, quelles solutions sont apportées par la société, 
                            quels moyens sont mis en œuvre pour préserver notre environnement ?"),
                     br(),
                     tags$p(class="indExplanation",
                            "Pour répondre à ces questions, l’Observatoire s’appuie sur la production d’indicateurs
                            d’état et d’évolution de la biodiversité régionale.
                            Les informations produites par l’observatoire se destinent à la fois aux décideurs, 
                            aux acteurs de l’environnement ou aux citoyens."))


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
  
#---!!! Position de Info_ind : add_description !!!---#

# Boîte rassemblant la navigation des sélecteurs et le panneau renseignements
divBandeauAccueil <- div(id = "bandeauAccueil",
                         divNavBar,
                         divInfo_ind1)

print("fin accueil")
