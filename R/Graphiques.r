library(plotly)
library(shiny)
qualite_labels = c('Faible', 'Moyenne', 'Bonne','Elevee')

f1 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Faible'")
m1 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Moyenne'")
b1 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Bonne'")
e1 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Ã‰levÃ©s'")
F1=f1[,1,1]
M1=m1[,1,1]
B1=b1[,1,1]
E1=e1[,1,1]
qualite1 = c(F1,M1,B1,E1)
df1 = data.frame(qualite_labels,qualite1)

f2 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Faible' AND declinaison ='Vertébrés'")
m2 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Moyenne' AND declinaison ='Vertébrés'")
b2 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Bonne' AND declinaison ='Vertébrés'")
e2 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Ã‰levÃ©s' AND declinaison ='Vertébrés'")
F2=f2[,1,1]
M2=m2[,1,1]
B2=b2[,1,1]
E2=e2[,1,1]
qualite2 = c(F2,M2,B2,E2)
df2 = data.frame(qualite_labels,qualite2)

f3 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Faible' AND declinaison ='Flore et Fongus'")
m3 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Moyenne' AND declinaison ='Flore et Fongus'")
b3 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Bonne' AND declinaison ='Flore et Fongus'")
e3 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Ã‰levÃ©s' AND declinaison ='Flore et Fongus'")
F3=f3[,1,1]
M3=m3[,1,1]
B3=b3[,1,1]
E3=e3[,1,1]
qualite3 = c(F3,M3,B3,E3)
df3 = data.frame(qualite_labels,qualite3)

f4 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Faible' AND declinaison ='Invertébrés'")
m4 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Moyenne' AND declinaison ='Invertébrés'")
b4 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Bonne' AND declinaison ='Invertébrés'")
e4 <- dbGetQuery(con_gn, "SELECT count(*) FROM orb_indicateurs.ind_connaissance_pole  WHERE ind_tot_group ='Ã‰levÃ©s' AND declinaison ='Invertébrés'")
F4=f4[,1,1]
M4=m4[,1,1]
B4=b4[,1,1]
E4=e4[,1,1]
qualite4 = c(F4,M4,B4,E4)
df4 = data.frame(qualite_labels,qualite4)

colors1 <- c('#ECE0F3','#DDC8E9','#C39AD6','#A56AC2')
colors2 <- c('#F8C04F','F9BA39','EE9039','#CC7B57')
colors3 <- c('#CED760','#C5CF39','#8AC154','#399E69')
colors4 <- c('#8BD6F0','#6CCAEB','#39AFDA','#398CB7')

ui <- fluidPage(
  headerPanel('Connaissances'),
  
  mainPanel(
    actionButton("total", "General"),
    actionButton("vertebres", "Vertebres"),
    actionButton("flore", "Flore"),
    actionButton("invertebres", "Invertebres"),
    plotlyOutput('plot')
  )
)

server <- function(input, output) {
  
  
  observeEvent(input$total,{
    plot1 <- plot_ly(data = df1, labels = ~qualite_labels, values = ~qualite1, type = "pie", hole=0.6,
                     textinfo = "percent", 
                     marker = list(colors = colors1),
                     insidetextorientation = "horizontal")  %>% layout(title = 'Proportion de mailles par niveau de connaissances')
    output$plot <- renderPlotly({
      plot1
    })
  })
  
  observeEvent(input$vertebres,{
    plot1 <- plot_ly(data = df2, labels = ~qualite_labels, values = ~qualite2, type = "pie", hole=0.6,
                     textinfo = "percent", 
                     marker = list(colors = colors2),
                     insidetextorientation = "horizontal")  %>% layout(title = 'Proportion de mailles par niveau de connaissances')
    output$plot <- renderPlotly({
      plot1
    })
  })
  observeEvent(input$flore,{
    plot1 <- plot_ly(data = df3, labels = ~qualite_labels, values = ~qualite3, type = "pie", hole=0.6,
                     textinfo = "percent", 
                     marker = list(colors = colors3),
                     insidetextorientation = "horizontal")  %>% layout(title = 'Proportion de mailles par niveau de connaissances')
    output$plot <- renderPlotly({
      plot1
    })
  })
  observeEvent(input$invertebres,{
    plot1 <- plot_ly(data = df4, labels = ~qualite_labels, values = ~qualite4, type = "pie", hole=0.6,
                     textinfo = "percent", 
                     marker = list(colors = colors4),
                     insidetextorientation = "horizontal")  %>% layout(title = 'Proportion de mailles par niveau de connaissances')
    output$plot <- renderPlotly({
      plot1
    })
  })
  

}

shinyApp(ui,server)

