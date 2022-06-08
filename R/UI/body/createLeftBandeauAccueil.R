# Création du bandeau de gauche en mode Accueil

# Premier sélecteur d'indicateur unique
buttonInd1<-actionButton(inputId="ind1",
                         class="singleInd",
                         label="Indicateur 1")

# Premier et seul sélecteur d'indicateur multiple
buttonInd2<-actionButton(inputId="ind2",
                         class="multipleInd",
                         div(class="labelMultipleInd",
                             id="labelMultipleInd2",
                             tags$p("Indicateur 2"),
                             icon(name = "caret-right")))

# Premier sélecteur de sous-indicateur
buttonInd21<-actionButton(inputId="ind21",
                          label="Indicateur 2.1")
# Second sélecteur de sous-indicateur
buttonInd22<-actionButton(inputId="ind22",
                          label="Indicateur 2.2")
# Troisième sélecteur de sous-indicateur
buttonInd23<-actionButton(inputId="ind23",
                          label="Indicateur 2.3")

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
divInfo <- div(id="info",
               h1(id="indName",
                  "Nom de l'indicateur"),
               tags$p(id="indExplanation",
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
                         divInfo)