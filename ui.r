library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  theme = "united.css", 
  
  # Application title
  h3("Cost Escalation estimation in construction projects (in M€)"), #headerPanel
  br(),
  
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(
    
    helpText("Give the length of time to complete the project (in months)",
             "and the original budgeted amount (in K€)."),
    br(),
    
    numericInput("D_months", "Project duration (months):", 36),
    numericInput("A_kEuro", "Original budgeted amount (K€):", 100000, step=1000),
    
    selectInput("confLevel", "Confidence level (%) for the estmated interval:", 
                choices = c(80, 90, 95)),
    br()
   
  ),
  
  # Show a summary of the dataset and an HTML table with the requested
  # number of observations
  mainPanel(
    tabsetPanel(
      tabPanel("Results", 
               plotOutput("scatterPlot",height="650px"),
               #h5(textOutput("caution")),
               #p(HTML('<center>'),textOutput("info"),HTML('</center>')),
               #br(),
               p("The confidence region is shown in grey color. The turquoise line indicates the point of slope change with an 80% level of confidence for its position."),
               p(HTML('<center><b>'),textOutput("caution"),HTML('</b></center><br>')),
               tableOutput("tablePred")
      ),
      
      tabPanel("Diagnostics", h4(textOutput("diagTitle")),
               verbatimTextOutput("summary"),
               plotOutput("diagPlot")
      ),
      
      tabPanel("Documentation",
               p("This application estimates the total amount of cost escalation for a construction project (in M€), based on historical data maintained by some company in that field, using as parameters a) the length of time to complete the project and b) the original budgeted amount.",
                 "The user can also select the desired level of confidence for the prediction interval of the response (between the values 80%, 90% or 95%).",
                 br(),br(),
                 "For the calculation of the predictions a", strong("segmented single linar regression"), "model is used, where the point of slope change is estimated automatically.",
                 "The application was implemented in", a("R,", href="http://www.r-project.org/", target="_blank"),'using the',
                 a("Shiny", href="http://www.rstudio.com/shiny/", target="_blank"),"platform."),
               
               br(),
               
               strong('Implementation'), p('hwhd'),
               
               br(),
               
               strong('References'),
               p(HTML('<ul>'),
                 HTML('<li>'),a('R,', href="http://www.r-project.org/", target="_blank"),'a free, open source programming language and software environment for statistical computing, bioinformatics and graphics.',HTML('</li>'),
                 HTML('<li>'),'Easy web applications in R with', a("Shiny.", href="http://www.rstudio.com/shiny/", target="_blank"),HTML('</li>'),
                 HTML('<li>'),'Muggeo, V.M.R. (2003) Estimating regression models with unknown break-points. Statistics in Medicine 22, 3055–3071',HTML('</li>'),
                 HTML('<li>'),'Muggeo, V.M.R. (2008) Segmented: an R package to fit regression models with broken-line relationships. R News 8/1, 20–25.',HTML('</li>'),
                 HTML('</ul>'))
      ) 

    )
  )
))