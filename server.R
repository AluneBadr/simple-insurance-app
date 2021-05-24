
function(input, output, session) {
  
  
  val_tbl <- reactive({
    req(input$value_date)
    loss_run(input$value_date)
  })
  
  source("server/dashboard-srv.R", local = TRUE)
  source("server/changes-srv.R", local = TRUE)
  source("server/claims-srv.R", local = TRUE)


}
