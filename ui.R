library(shiny)

shinyUI(fluidPage(
  titlePanel("Monthly Average Temperature and Precipitation anomalies in Guadarrama Mountain (Madrid, Spain)"),
  br(),
  br(),
  
  sidebarLayout(
    
    sidebarPanel(
    
        br(), 
        
    sliderInput('year','Select range of years', min = 1947, 
                             max = 2010, value = c(1947, 2010), step = 1),
    
     br(),
    
     selectInput("Month1", label = "Select Month:", 
                choices = list("January" = 1, "February" = 2,
                               "March" = 3,  "April" = 4,
                               "May" = 5,  "June" = 6,
                               "July" = 7,  "August" = 8,
                               "September" = 9,  "October" = 10,
                               "November" = 11,  "December" =12 ), selected = 1),
    br(),
    br(),
    
    strong("Interpretation of the Anomalies:"),
    
    br(),
    br(),
    
    p("The term anomaly means a departure from a reference value or long-term
      average (monthly mean temperature and precipitation for the period 1947-1976)"),
    
    br(),
    
    p("A positive anomaly (>0)indicates that the observed temperature (precipitation) 
      was warmer (wetter) than the reference value."),
    
    br(),
    
    p("A negative anomaly (<0) indicates that the observed temperature (precipitation)
      was cooler (dryer) than the reference value.")
    
    #img(src = "Navacerrada.png")
    
  ),
    
    mainPanel(
            
        plotOutput("plot2"),
        plotOutput("plot1")
        )
  )
))