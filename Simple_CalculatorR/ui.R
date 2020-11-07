library(shiny)

shinyUI(fluidPage(
    titlePanel("Simple Calculator"),
    sidebarLayout(
        sidebarPanel(
            helpText("This app is designed for Addition and Subtraction"),            
            numericInput("fno", label = h6("Enter Your First value"), value = 0),
            numericInput("sno", label = h6("Enter Your Second value"), value = 0),
            actionButton("add", label = "Add"),
            actionButton("sub", label = "Subtract")        
        ),
        
        mainPanel(
            tabsetPanel(
                tabPanel("Output",
                         p(h5("Calculated value:")),
                         textOutput("answ")
                ),
                tabPanel("Additional Information",
                         p(h4("Simple Calculator:")),
                         helpText("This app is designed to do Basic Addition and Subtraction between two values"),
                         HTML("<u><b>Formulae Used: </b></u>
                                              <br> <br>
                                              <b> Addition : Answer = First Value + Second Value <br>
                                              Subtraction : Answer = First Value - Second Value </b>")
                         
                )
            )
        )
    )
))