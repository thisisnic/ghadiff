library(shinydashboard)
library(diffr)
dashboardPage(
  dashboardHeader(title = "GHA diff"),
  dashboardSidebar(
    textInput("url1", label = "URL 1"),
    textInput("url2", label = "URL 2"),
    actionButton("go", "compare")
  ),
  dashboardBody(
    fluidRow(
      diffrOutput(
        "diff_display"
      )
    )
  )
)
