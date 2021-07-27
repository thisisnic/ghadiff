library(diffr)
server <- function(input, output, session){
  
  file1_path = tempfile()
  file2_path = tempfile()
  
  downloaded <- reactiveVal(FALSE)
  
  observeEvent(input$go, {
    download.file(input$url1, file1_path)
    download.file(input$url2, file2_path)
    downloaded(TRUE)
  })
  
  output$diff_display <- renderDiffr({
    validate(need(downloaded(), message = 'Enter URLs and click "compare"', label = ""))
    isolate(diffr(file1_path, file2_path, before = input$url1, after = input$url2))
  })
  
}
