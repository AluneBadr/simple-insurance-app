library(shiny)

header <- dashboardHeader(
  title = "Claims Dashboard"
)

sidebar <- dashboardSidebar(
  dateInput(
    "value_date", 
    "Valuation Date",
    value = Sys.Date(),
    min = min(trans$accident_date),
    max = Sys.Date(),
    startview = "decade"
  ),
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Claim Changes", tabName = "changes", icon = icon("balance-scale")),
    menuItem("Claims Table", tabName = "table", icon = icon("table")),
    br(),
    fluidRow(
      column(
        width = 11,
        actionButton(
          "generate_report_modal",
          "Create Report",
          icon = icon("download"),
          style = "width: 95%; color: #111"
        )
      )
    )
  )
)

body <- dashboardBody(
  tags$head(
    tags$link( 
      rel = "shortcut icon", 
      type = "image/png", 
      href = "data/logo.png"
    ),
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
    tags$script(src = "custom.js")
  ),
  tabItems(
    source("ui/dashboard-ui.R", local = TRUE)$value,
    source("ui/changes-ui.R", local = TRUE)$value,
    source("ui/claims-ui.R", local = TRUE)$value#,
  )
)

dashboardPage(
  header,
  sidebar,
  body,
  skin = "purple"
)
