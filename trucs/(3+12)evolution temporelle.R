library(plotly)
library(shiny)

 

count <- dbGetQuery(con_gn, "select DISTINCT annee from orb_indicateurs.mv_sraddet_ind_pole ORDER BY annee ASC")[,1]

Flore <- dbGetQuery(con_gn, "select nb_data_tot from orb_indicateurs.mv_sraddet_ind_pole WHERE declinaison = 'Flore et Fongus' ORDER BY annee ASC")[,1]
Vertebres <- dbGetQuery(con_gn, "select nb_data_tot from orb_indicateurs.mv_sraddet_ind_pole WHERE declinaison = 'Vertébrés' ORDER BY annee ASC")[,1]
Invertebres <- dbGetQuery(con_gn, "select nb_data_tot from orb_indicateurs.mv_sraddet_ind_pole WHERE declinaison = 'Invertébrés' ORDER BY annee ASC")[,1]
data <- data.frame(count,Flore,Vertebres,Invertebres)

fig <- plot_ly(data, x = ~count, y = ~Flore, type = 'bar', name = 'Flore et Fongus',marker = list(color = '#399E69')) %>%
  add_trace(y = ~Vertebres, name = 'Vertebres',marker = list(color = '#0099D0')) %>%
  add_trace(y = ~Invertebres, name = 'Invertebres',marker = list(color = '#EA7200')) %>%
  layout(yaxis = list(title = 'Count'), barmode = 'stack')

fig

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
plot1 <- plot_ly(data, x = ~count, y = ~Flore, type = 'bar', name = 'Flore et Fongus',marker = list(color = '#399E69')) %>%
      add_trace(y = ~Vertebres, name = 'Vertebres',marker = list(color = '#0099D0')) %>%
      add_trace(y = ~Invertebres, name = 'Invertebres',marker = list(color = '#EA7200')) %>%
      layout(yaxis = list(title = 'Count'), barmode = 'stack')
    output$plot <- renderPlotly({
      plot1
    })
  })

  
  observeEvent(input$flore,{
    plot1 <- plot_ly(data, x = ~count, y = ~Flore, type = 'bar', name = 'Flore et Fongus',marker = list(color = '#399E69')) 
    output$plot <- renderPlotly({
      plot1
    })
  })
  observeEvent(input$vertebres,{
    plot1 <- plot_ly(data, x = ~count, y = ~Vertebres, type = 'bar', name = 'Vertebres',marker = list(color = '#0099D0')) 
    output$plot <- renderPlotly({
      plot1
    })
  })
  observeEvent(input$invertebres,{
    plot1 <- plot_ly(data, x = ~count, y = ~Invertebres, type = 'bar', name = 'Invertebres',marker = list(color = '#EA7200')) 
      output$plot <- renderPlotly({
        plot1
      })
  })
  
}


shinyApp(ui=ui,server=server)

