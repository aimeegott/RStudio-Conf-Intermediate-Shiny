library(shiny)

# Define UI for bookmarking demo app --------------------------------
ui <- fluidPage(
    sidebarPanel(
      sliderInput("n", "Value to add", min = 0, max = 100, value = 50),
      actionButton("add", "Add"), 
      br(), br()
    ),
    mainPanel(
      h4("Sum:", textOutput("sum"))
    )
  )

# Define server logic for bookmarking demo app ----------------------
server <- function(input, output, session) {
  vals <- reactiveValues(sum = 0)

  observeEvent(input$add, {
    vals$sum <- vals$sum + input$n
  })
  output$sum <- renderText({
    vals$sum
  })
}

# Run the app -------------------------------------------------------
shinyApp(ui, server, enableBookmarking = "url")
