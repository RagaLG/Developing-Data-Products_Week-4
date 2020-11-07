Simple Calculator - Developing Data Products Assignment
========================================================
author: L.G.Raga
date:   7th November,2020
autosize: true
Breif Introduction
========================================================


Final Assignment of Developing Data Products.
This app includes :
- Two number inputs
- Two Action Buttons

You can find the app here : https://ragalg.shinyapps.io/Simple_CalculatorR/

Widgets Used
========================================================
Calculator uses the following widgets listed below :

- numericInput: To input fields to let the user define the values to be calculated.

- actionButton: The required action will be instigated once the one actionbutton is clicked.

Front End Code
========================================================

```r
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
```

<!--html_preserve--><div class="container-fluid">
<h2>Simple Calculator</h2>
<div class="row">
<div class="col-sm-4">
<form class="well">
<span class="help-block">This app is designed for Addition and Subtraction</span>
<div class="form-group shiny-input-container">
<label class="control-label" for="fno">
<h6>Enter Your First value</h6>
</label>
<input id="fno" type="number" class="form-control" value="0"/>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="sno">
<h6>Enter Your Second value</h6>
</label>
<input id="sno" type="number" class="form-control" value="0"/>
</div>
<button id="add" type="button" class="btn btn-default action-button">Add</button>
<button id="sub" type="button" class="btn btn-default action-button">Subtract</button>
</form>
</div>
<div class="col-sm-8">
<div class="tabbable">
<ul class="nav nav-tabs" data-tabsetid="4223">
<li class="active">
<a href="#tab-4223-1" data-toggle="tab" data-value="Output">Output</a>
</li>
<li>
<a href="#tab-4223-2" data-toggle="tab" data-value="Additional Information">Additional Information</a>
</li>
</ul>
<div class="tab-content" data-tabsetid="4223">
<div class="tab-pane active" data-value="Output" id="tab-4223-1">
<p>
<h5>Calculated value:</h5>
</p>
<div id="answ" class="shiny-text-output"></div>
</div>
<div class="tab-pane" data-value="Additional Information" id="tab-4223-2">
<p>
<h4>Simple Calculator:</h4>
</p>
<span class="help-block">This app is designed to do Basic Addition and Subtraction between two values</span>
<u><b>Formulae Used: </b></u>
                                              <br> <br>
                                              <b> Addition : Answer = First Value + Second Value <br>
                                              Subtraction : Answer = First Value - Second Value </b>
</div>
</div>
</div>
</div>
</div>
</div><!--/html_preserve-->

Server End Code
========================================================

```r
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
```

Thankyou!
========================================================
I hope you liked my shiny app!
