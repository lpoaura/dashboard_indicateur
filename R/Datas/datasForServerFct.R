# Ce script crée une fonction qui permet de gérer les output liées au datas dans
# le server

print("Creating datas for server...");

datasForServerFct <- function(input, output, session) {
  ##affichage carte
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addProviderTiles("CartoDB.Positron") %>%
      addPolygons(data =poly ,label = ~indic, smoothFactor = 3, fillOpacity = 1, fillColor = ~pal(indic),stroke = TRUE,
                  weight = 0.1, color = "black",
                  highlightOptions = highlightOptions(fillColor = "red",fillOpacity=1))
  })
  
  ##affichage piechart
  plot <- plot_ly(data = dftotal, labels = ~qualite_labels, values = ~qualiteTotale, type = "pie", hole=0.6,
                  textinfo = "percent", 
                  marker = list(colors = colors1),
                  insidetextorientation = "horizontal")  %>% layout(title = 'Proportion de mailles par niveau de connaissances')
  output$pie <- renderPlotly({plot})
  
  observeEvent(input$total,{
    plot <- plot_ly(data = dftotal, labels = ~qualite_labels, values = ~qualiteTotale, type = "pie", hole=0.6,
                    textinfo = "percent", 
                    marker = list(colors = colors1),
                    insidetextorientation = "horizontal")  %>% layout(title = 'Proportion de mailles par niveau de connaissances')
    output$pie <- renderPlotly({plot})
  })
  
  observeEvent(input$vertebres,{
    plot <- plot_ly(data = dfvertebres, labels = ~qualite_labels, values = ~qualiteVertebres, type = "pie", hole=0.6,
                    textinfo = "percent", 
                    marker = list(colors = colors4),
                    insidetextorientation = "horizontal")  %>% layout(title = 'Proportion de mailles par niveau de connaissances')
    output$pie <- renderPlotly({plot})
  })
  
  observeEvent(input$flore,{
    plot <- plot_ly(data = dfflore, labels = ~qualite_labels, values = ~qualiteFlore, type = "pie", hole=0.6,
                    textinfo = "percent", 
                    marker = list(colors = colors3),
                    insidetextorientation = "horizontal")  %>% layout(title = 'Proportion de mailles par niveau de connaissances')
    output$pie <- renderPlotly({plot})
  })
  
  observeEvent(input$invertebres,{
    plot <- plot_ly(data = dfinvertebres, labels = ~qualite_labels, values = ~qualiteInvertebres, type = "pie", hole=0.6,
                    textinfo = "percent", 
                    marker = list(colors = colors2),
                    insidetextorientation = "horizontal")  %>% layout(title = 'Proportion de mailles par niveau de connaissances')
    output$pie <- renderPlotly({plot})
  })
  
  ##affichage hist
  plot1 <- plot_ly(dataHist, x = ~count, y = ~histFlore, type = 'bar', name = 'Flore et Fongus',marker = list(color = '#399E69')) %>%
    add_trace(y = ~histVertebres, name = 'Vertebres',marker = list(color = '#0099D0')) %>%
    add_trace(y = ~histInvertebres, name = 'Invertebres',marker = list(color = '#EA7200')) %>%
    layout(yaxis = list(title = 'Count'), barmode = 'stack')
  output$hist <- renderPlotly({plot1})
  
  observeEvent(input$total,{
    plot1 <- plot_ly(dataHist, x = ~count, y = ~histFlore, type = 'bar', name = 'Flore et Fongus',marker = list(color = '#399E69')) %>%
      add_trace(y = ~histVertebres, name = 'Vertebres',marker = list(color = '#0099D0')) %>%
      add_trace(y = ~histInvertebres, name = 'Invertebres',marker = list(color = '#EA7200')) %>%
      layout(yaxis = list(title = 'Count'), barmode = 'stack')
    output$hist <- renderPlotly({plot1})
  })
  
  
  observeEvent(input$flore,{
    plot1 <- plot_ly(dataHist, x = ~count, y = ~histFlore, type = 'bar', name = 'Flore et Fongus',marker = list(color = '#399E69')) 
    output$hist <- renderPlotly({plot1})
  })
  
  observeEvent(input$vertebres,{
    plot1 <- plot_ly(dataHist, x = ~count, y = ~histVertebres, type = 'bar', name = 'Vertebres',marker = list(color = '#0099D0')) 
    output$hist <- renderPlotly({plot1})
  })
  observeEvent(input$invertebres,{
    plot1 <- plot_ly(dataHist, x = ~count, y = ~histInvertebres, type = 'bar', name = 'Invertebres',marker = list(color = '#EA7200')) 
    output$hist <- renderPlotly({plot1})
  })
}