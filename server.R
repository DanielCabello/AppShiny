# server.R

shinyServer(function(input, output) {
    
    Navacerrada <- read.table(file = "Navacerrada.CSV",header = TRUE, sep = ",",
        colClasses = c("numeric","numeric","Date", "numeric","numeric","numeric","numeric","numeric"))

    idMonth <- c(rep(1:12))
    nameMonth <- c("January", "February", "March", "April", "May", "June","July", 
                  "August","September","October","November","December")
    IdNameMonth <- data.frame (cbind(idMonth,nameMonth),stringsAsFactors = FALSE)
    
    output$Month2 <- renderPrint({IdNameMonth[IdNameMonth$idMonth ==input$Month1,2]})
    
    Navacerrada1 <- reactive({Navacerrada[Navacerrada$Year >= input$year[1] & 
                                Navacerrada$Year <= input$year[2] & 
                                Navacerrada$Month==input$Month1,]})
    

  output$plot1 <- renderPlot({
      plot(Navacerrada1()$Date,Navacerrada1()$TmA, type = "h",main = "Monthly Temperature Anomaly", xlab = "Year", 
           ylab = "Temperature Anomaly (ºC)")
  })
      
  output$plot2 <- renderPlot({
      plot(Navacerrada1()$Date,Navacerrada1()$PmA, type = "h",xlab = "Year",
           main = "Monthly Precipitation Anomaly" , ylab = "Precipitation Anomaly (mm)")
  })
      })