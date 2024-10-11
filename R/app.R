library(bslib)
library(DT)
library(ggplot2)
library(heleramcar5)
library(shiny)


#' @title Graphical User Interface definition.
#'
#' @return Shiny UI object.
#'
#' @importFrom shiny h3 textInput textOutput helpText code
#' @importFrom bslib page_sidebar
ui <- function() {

  ui_ <- page_sidebar(

    fillable = TRUE,

    # App title
    title = "Wordcount Analysis for Riksdag's documents",

    # Sidebar panel for text input.
    sidebar = sidebar(

      h3('Start here'),
      textInput("queryInput", "Search a document"),

      helpText("Insert document ID to trigger the word count analysis."),
      textInput("documentID", "Document ID", value = "sfs-2016-1091"),

      card_header('About'),
      helpText(
        "This app demonstrates a simple workflow of fethcing data from
        SVERIGES RIKSGAG's database and displaying a simple wordcount analysis.
        You can download it using: "
        ),
      code('shiny::runGitHub(crmaedo, heleramcar5)')
      ),

    # Upper double column layout.
    layout_columns(
      card(card_header("Document text"),
           textOutput("documentID"),
           textOutput("documentText"),
           max_height = 500),

      card(card_header("Word count analysis"),
           plotOutput("wordPlot", width = "100%"))
      ),

    # Bottom single card.
    card(card_header("Search results"),
         DT::dataTableOutput("queryResult")))

  return(ui_)
}


#' @title Define Shiny server logic.
#'
#' @param input Shiny input environment
#' @param output Shiny output environment
#'
#' @importFrom shiny renderText renderPlot
#' @importFrom DT renderDT datatable
#' @importFrom ggplot2 ggplot aes geom_bar labs theme_minimal theme
#' @importFrom heleramcar5 queryDocuments getDocument wordsFrequency
server <- function(input, output) {

  # Render output table from `heleramcar::queryDocuments`
  output$queryResult <- renderDT({

    queryResult <- queryDocuments(query = input$queryInput)

    dt <- datatable(
      queryResult,
      options = list(scrollX = TRUE, pageLength = 10, autoWidth = TRUE),
      rownames = FALSE
    )

    return(dt)
  })

  # Render user selected document ID.
  output$documentID <- renderText({
    paste("You have selected document ID:", input$documentID)
  })

  # Render output document from `heleramcar::getDocument`
  output$documentText <- renderText({
    getDocument(input$documentID)

  })

  # Render barplot for word count analysis
  output$wordPlot <- renderPlot({
    # Fetch the document text
    document_text <- getDocument(input$documentID)

    # Perform word frequency analysis
    freqDF <- wordsFrequency(document_text)

    # Filter top 10 words
    top10 <- freqDF[1:10, ]

    # Create ggplot barplot
    ggplot(top10, aes(x = reorder(word, -times), y = times)) +
      geom_bar(stat = "identity", fill = "#C4D8F3") +
      #coord_flip() +  # use if we want our plot to have horizontal lines
      labs(x = "Words", y = "Frequency") +
      theme_minimal() +
      theme(
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12)
      )
  })
}


#' Create Shiny app.
createShiny <- function() {
  shinyApp(ui = ui(), server = server)
}


createShiny()
