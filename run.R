library(shiny)
port <- process.env.PORT
shiny::runApp(
  appDir = getwd(),
  host = 'null',
  port = as.numeric(port)
)