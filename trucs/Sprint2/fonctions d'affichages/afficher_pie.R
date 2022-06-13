
afficher_pie<-function(groupe,sous_groupe,année)
{
  
  colors1 <- c('#ECE0F3','#DDC8E9','#C39AD6','#A56AC2')#violet
  colors2 <- c('#F8C04F','F9BA39','EE9039','#CC7B57')#orange
  colors3 <- c('#CED760','#C5CF39','#8AC154','#399E69')#vert
  colors4 <- c('#8BD6F0','#6CCAEB','#39AFDA','#398CB7')#bleu
  qualite_labels = c('Faible', 'Moyenne', 'Bonne','Elevee')
  
  if ((groupe == "general")||(groupe=="pole")){
    base = "orb_indicateurs.ind_connaissance_pole"
  }
  
  if (groupe == "taxo"){
    base = "orb_indicateurs.ind_connaissance_taxo"
  }
  
  
  commande = paste("SELECT count(*) FROM", base, "WHERE ind_tot_group =")
  
  
  com_faible <- paste(commande,"'Faible'")
  com_moyenne <- paste(commande,"'Moyenne'")
  com_bonne <- paste(commande,"'Bonne'")
  com_elevee <- paste(commande,"'Ã‰levÃ©s'")
  
  if ((groupe == "taxo")||(groupe=="pole")){
    
    com_faible <- paste(com_faible, " AND declinaison ='",sous_groupe,"'",sep = "")
    com_moyenne <- paste(com_moyenne, " AND declinaison ='",sous_groupe,"'",sep = "")
    com_bonne <- paste(com_bonne, " AND declinaison ='",sous_groupe,"'",sep = "")
    com_elevee <- paste(com_elevee, " AND declinaison ='",sous_groupe,"'",sep = "")
  }
  
  if (année != "toute_la_periode"){
    annéeinf = 2001+(floor((année-2001)/5))*5
    annéesup= annéeinf+4
    créneau = paste(annéeinf,"-",annéesup)
    com_faible <- paste(com_faible, " AND annee_group ='",créneau,"'",sep = "")
    com_moyenne <- paste(com_moyenne, " AND annee_group ='",créneau,"'",sep = "")
    com_bonne <- paste(com_bonne, " AND annee_group ='",créneau,"'",sep = "")
    com_elevee <- paste(com_elevee, " AND annee_group ='",créneau,"'",sep = "")
    
    print(créneau)
  }
    
  print (com_faible)
  faible <- dbGetQuery(con_gn, com_faible)[,1,1]
  moyenne <- dbGetQuery(con_gn, com_moyenne)[,1,1]
  bonne <- dbGetQuery(con_gn, com_bonne)[,1,1]
  elevee <- dbGetQuery(con_gn, com_elevee)[,1,1]
  
                  
                       
  qualite = c(faible,moyenne,bonne,elevee)
  df = data.frame(qualite_labels,qualite)
  
  plot <- plot_ly(data = df, labels = ~qualite_labels, values = ~qualite, type = "pie", hole=0.6,
                textinfo = "percent", 
                marker = list(colors = colors1),
                insidetextorientation = "horizontal")  %>% layout(title = 'Proportion de mailles par niveau de connaissances')
  return(plot)
}


##Test
a="taxo"
b="Oiseaux"
c="toute_la_periode"

d <- afficher_pie(a,b,c)

ui <- fluidPage(
    plotlyOutput('plot')
  )


server <- function(input, output) {
  output$plot <- renderPlotly({afficher_pie(a,b,c)})
}

shinyApp(ui=ui,server=server)


                                          
                                          