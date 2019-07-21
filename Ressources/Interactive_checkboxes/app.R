#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(shinyWidgets)

# Define UI for application that draws a histogram
ui <- fluidPage(
   dashboardPage(
     header = dashboardHeader(title = "CAS Exams"),
     sidebar = dashboardSidebar(disable = T),
     body = dashboardBody(
       checkboxGroupButtons(
         inputId = "exams",
         direction = "vertical",
         label = "Label",
         choices = c("P", "FM", "IFM"),
         checkIcon = list(
           yes = tags$i(class = "fa fa-check-square", 
                        style = "color: steelblue"),
           no = tags$i(class = "fa fa-square-o", 
                       style = "color: steelblue"))
       ),
       actionBttn(
         inputId = "exam_one",
         label = "Exam 1: Probability",
         style = "simple", 
         color = "primary",
         icon = icon("sticky-note")
       ),
       # actionBttn(
       #   inputId = "exam_two",
       #   label = "Exam 2: Financial Mathematics",
       #   style = "simple", 
       #   color = "primary",
       #   icon = icon("sticky-note")
       # ),
       actionBttn(
         inputId = "exam_three",
         label = "Exam 3: Financial Economics",
         style = "simple",
         color = "primary",
         icon = icon("sticky-note"),
         no_outline = T
       ),
       awesomeRadio(checkbox = T,inputId = "go",label = NULL, choices =  "process", status = "primary")
     )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  observeEvent(input$exams, ({
    e <- input$exams

#
#     updateActionButton(session, "exam_one",
#                  color =
#                    if(e == "P")
#                    {
#                      color = "danger"
#                    }
#     )
    updateAwesomeRadio(session, inputId = "go",choices =  {if(e == "IFM")  choices = "danger"})
    
}))

}

# Run the application 
shinyApp(ui = ui, server = server)

