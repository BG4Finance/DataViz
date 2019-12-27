library(shiny)
library(ggplot2)

data <- read.csv("Grades.csv", sep = ";")

# Define UI for random distribution app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("G. Bardi's Grades of last 8 semsters"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar inputs ----
    sidebarPanel(
      radioButtons("type","Graph by University or Minor", c("University"="uni",
                                                            "Minor"="min"), selected = "uni"),
      conditionalPanel(condition = "input.type == 'uni",
                       radioButtons("course","University Course",
                                    c("All"="all", "Bachelor"="bac", "Master"="msc"),
                                    selected = "all")),
      
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
  #Dataset layout
  semester <-  data[c(47:54),1]
  grades <- data[1:43,]
  avg <- data[47:54,1:3]
  entry <- data.frame(semester, avg$Grade)
  eco <- 0
  c_eco <- 0
  fin <- 0
  c_fin <- 0
  inf <- 0
  c_inf <- 0
  sci <- 0
  c_sci <- 0
  
  #Function for graphical plot
  graph <- function(entry,i,f) {
    result <-ggplot(avg[c(i:f),], aes(x=avg$Course[c(i:f)], y=avg$Grade[c(i:f)], group=1)) +
      geom_line(color="blue") +
      geom_point(colour="black", size=2) +
      ylim(6.8,8.2) + labs(x = "Semester", y = "Average Grade")
    return(result)
  }
  #Evaluating average grade per minor
  for (i in seq(1,43)) {
    if (grades$Major[i] == "Economics"){
      eco <- eco + grades$GradeXECTS[i]
      c_eco <- c_eco + grades$ECTS[i]
    }
    if (grades$Major[i] == "Finance"){
      fin <- fin + grades$GradeXECTS[i]
      c_fin <- c_fin + grades$ECTS[i]
    }
    if (grades$Major[i] == "Informatics"){
      inf <- inf + grades$GradeXECTS[i]
      c_inf <- c_inf + grades$ECTS[i]
    }
    if (grades$Major[i] == "Science"){
      sci <- sci + grades$GradeXECTS[i]
      c_sci <- c_sci + grades$ECTS[i]
    }
  }
  #Stacking data togheter
  minor_df <- cbind.data.frame(rbind.data.frame("Econimics","Finance","Informatics","Science"),
                               rbind.data.frame(eco/c_eco, fin/c_fin, inf/c_inf, sci/c_sci))
  names(minor_df) <- c("Minor","Mean")

  output$plot <- renderPlot({
  # If user is interested in knowing the historical performance....
    if (input$type == "uni"){
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
      # Final Graphical representation of each semester average grade
      graph(entry,start,fine)
    } else {
      # If the user is interested in knowing the average performanance
      # in each of the four minors...
      ggplot(minor_df, aes(y = minor_df$Mean, x=minor_df$Minor)) + 
        geom_col(fill = 'dark blue') +
        labs(x = 'Minor', y = 'Mean')
    }
    
  })

}

# Create Shiny app ----
shinyApp(ui, server)
