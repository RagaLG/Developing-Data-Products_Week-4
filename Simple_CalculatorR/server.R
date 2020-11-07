library(shiny)

shinyServer(function(input, output) {
    values <- reactiveValues(aa = 0, ss = 0, a=0, s=0)
    # Calculating    
    observeEvent(input$add,{
        values$aa <- 1
        values$ss <- 0
        values$a <- input$fno + input$sno
    })
    
    observeEvent(input$sub,{
        values$aa <- 0
        values$ss <- 1
        values$s <- input$fno - input$sno
    })
    
    # Display calculated answer
    
    output$answ <- renderText({
        if(values$aa){paste("Answer : " , isolate(values$a))}
        else if(values$ss){paste("Answer : " , isolate(values$s))}
        else paste("")
    })
    
    
    
})