library(shiny)
library(ggplot2)

grades <- read.csv("Grades.csv", sep = ";")

# Define UI for random distribution app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("G. Bardi's Grades of last 8 semsters"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar inputs ----
    sidebarPanel(
      radioButtons("course","University Course",
                   c("Bachelor"="bac", "Master"="msc", "All"="all"),
                   selected = "all"),
    br()
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Tabset w/ plot, summary, and table ----
      plotOutput("plot")
      
    )
  )
)

# Define server logic for random distribution app ----
server <- function(input, output) {
  
  semester <-  grades[c(47:54),1]
  avg <- grades[c(47:54),3]
  entry <- data.frame(semester, avg)
  
  graph <- function(entry,i,f) {
    result <-ggplot(entry[c(i:f),], aes(x=semester, y=avg, group=1)) +
      geom_line(color="blue") +
      geom_point(colour="black", size=2) +
      ylim(6.8,8.2)
    return(result)
  }

  output$plot <- renderPlot({
    
    if (input$course == "bac"){
      start <-1
      fine <- 6
    } else if (input$course == "msc"){
    start <- 7
    fine <- 8
    } else {
      start <- 1
      fine <- 8
    }
    graph(entry,start,fine)
    
  })
  
}

# Create Shiny app ----
shinyApp(ui, server)
