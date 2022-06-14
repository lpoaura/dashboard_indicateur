# Création du bandeau de gauche en mode Accueil

# Premier sélecteur d'indicateur unique
buttonInd1<-actionButton(inputId="ind1",
                         class="singleInd",
                         label="Indicateur 1")

# Premier et seul sélecteur d'indicateur multiple
buttonInd2<-actionButton(inputId="ind2",
                         class="multipleInd",
                         div(class="labelMultipleInd",
                             id="ind2",
                             tags$p("Indicateur de connaissance"),
                             icon(name = "caret-right")))

# Premier sélecteur de sous-indicateur
buttonInd21<-actionButton(inputId="ind21",
                          class="subInd",
                          label="Nombre de données")
# Second sélecteur de sous-indicateur
buttonInd22<-actionButton(inputId="ind22",
                          class="subInd",
                          label="Nombre d'espèces")
# Troisième sélecteur de sous-indicateur
buttonInd23<-actionButton(inputId="ind23",
                          class="subInd",
                          label="Indicateur de connaissances")

# Second sélecteur d'indicateur unique
buttonInd3<-actionButton(inputId="ind3",
                         class="singleInd",
                         label="Indicateur 3")

# Boîte rassemblant les sélecteurs des sous-indicateurs
divSubNavContent<-div(class="subNavContent",
                      id="subNavContentInd2",
                      buttonInd21,
                      buttonInd22,
                      buttonInd23)


# Navigation des sélecteurs des sous-indicateurs de l'indicateur multiple
divSubNav<-div(class="subNav",
               id="subNavInd2",
               buttonInd2,
               divSubNavContent)

# Navigation des sélecteurs de l'ensemble des sélecteurs des indicateurs
divNavBar <- div(id="navBar",
                 buttonInd1,
                 divSubNav,
                 buttonInd3)

# Panneau de renseignements par rapport au sélecteur choisi
divInfo_ind1 <- div(id="info_ind1",
                    class="info",
               h1(class="indName",
                  "Indicateur 1"),
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

divInfo_ind21 <- div(id="info_ind21",
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

divInfo_ind22 <- div(id="info_ind22",
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

divInfo_ind23 <- div(id="info_ind23",
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

divInfo_ind3 <- div(id="info_ind3",
                    class="info",
                    h1(class="indName",
                       "Indicateur 3"),
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