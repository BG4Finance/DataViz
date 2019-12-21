library(shiny)

# Define UI for random distribution app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Tabsets"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Select the random distribution type ----
      radioButtons("dist", "Distribution type:",
                   c("Normal" = "norm",
                     "Uniform" = "unif",
                     "Log-normal" = "lnorm",
                     "Exponential" = "exp",
                     "Chi-Squared" = "chisq")),
      
      # br() element to introduce extra vertical spacing ----
      br(),
      
      # Input: Slider for the number of observations to generate ----
      sliderInput("n",
                 "Number of observations:",
                 value = 500,
                 min = 1,
                 max = 1000),
      sliderInput("df",
                "Degree of Freeeeeeedom",
                 value = 1,
                 min = 1,
                 max = 100),
      checkboxInput('useNorm', 'Add Normal Distribution', value = FALSE, width = NULL)
      ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotOutput("plot")),
                  tabPanel("Summary", verbatimTextOutput("summary")),
                  tabPanel("Table", tableOutput("table"))
      )
      
    )
  )
)

# Define server logic for random distribution app ----
server <- function(input, output) {
  
  # Reactive expression to generate the requested distribution ----
  # This is called whenever the inputs change. The output functions
  # defined below then use the value computed from this expression

  
  # Generate a plot of the data ----
  # Also uses the inputs to build the plot label. Note that the
  # dependencies on the inputs and the data reactive expression are
  # both tracked, and all expressions are called in the sequence
  # implied by the dependency graph.
  output$plot <- renderPlot({
    dist <- input$dist
    n <- input$n
    
    if (input$dist == "chisq") {
      df <- input$df
      data <- rchisq(n,df)
      hist(data, main="Chi-Squared", col = "#75AADB", border = "white")
      if (input$useNorm==TRUE){
      
      }
        }
    else if (input$dist == "norm"){
      hist(rnorm(n), main="Normal Distribution", col = "#75AADB", border = "white")
      if (input$useNorm==TRUE){
        X = rnorm(n)
        curve(dnorm(X, mean=mean(X), sd=sd(X)), add=TRUE,col="red",n=500,lwd=2)
      }
    }
    else if (input$dist == "unif"){
      hist(rnorm(n), main="Uniform Distribution", col = "#75AADB", border = "white")
      if (input$useNorm==TRUE){
        X = rnorm(n)
        curve(dnorm(X, mean=mean(X), sd=sd(X)), add=TRUE,col="red",n=500,lwd=2)
      }
    }
    else if (input$dist == "lnorm"){
      hist(rnorm(n), main="Log-Normal Distribution", col = "#75AADB", border = "white")
      if (input$useNorm==TRUE){
        X = rnorm(n)
        curve(dnorm(X, mean=mean(X), sd=sd(X)), add=TRUE,col="red",n=500,lwd=2)
      }
    }
    else if (input$dist == "exp"){
      hist(rnorm(n), main="Exponential Distribution", col = "#75AADB", border = "white")
      if (input$useNorm==TRUE){
        X = rnorm(n)
        curve(dnorm(X, mean=mean(X), sd=sd(X)), add=TRUE,col="red",n=500,lwd=2)
      }
    }
  })
  
  # Generate a summary of the data ----
  output$summary <- renderPrint({
    summary(data)
  })
  
  # Generate an HTML table view of the data ----
  output$table <- renderTable({
    d()
  })
  
}

# Create Shiny app ----
shinyApp(ui, server)
