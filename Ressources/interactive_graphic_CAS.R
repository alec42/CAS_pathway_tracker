if (interactive()) {
  library(shiny)
  library(ECharts2Shiny)
  
  
  # Prepare sample data for plotting --------------------------
  dat <- "
  [
  {
    name: 'Foundational Requirements',
    value: 13,
    children: 
  [
    {
    name: 'Preliminary Exams',
    value: 9,
    children:
      [
        {
        name: 'Exam 1: Probability',
        value: 3
        },
        {
        name: 'Exam 2: Financial Mathematics',
        value: 3
        },
        {
        name: 'Exam 3: Financial Economics',
        value: 3
        }
      ]
    },
    {
    name: 'VEE',
    value: 4,
    children: 
      [
        {
        name: 'Accounting and Corporate Finance',
        value: 2
        },
        {
        name: 'Economics',
        value: 2
        }
      ]
    },
  
  ]
  },
  {
    name: 'ACAS requirements',
    value: 22,
    children: 
      [
        {
          name : 'Exams before OC',
          value: 8,
          children:
            [
              {
                name : 'MAS-I',
                value: 4
              },
              {
                name : 'MAS-II',
                value: 4
              },
            ]
        },
        {
          name : 'Online Courses',
          value: 2,
          children:
            [
              {
                name : 'OC 1: Risk mgtm., ...',
                value: 1
              },
              {
                name : 'OC 2: Insurance acctng.,...',
                value: 1
              }
            ]
        },
        {
          name : 'Exams after OC',
          value: 10,
          children:
            [
              {
                name : 'Exam 5',
                value: 5
              },
              {
                name : 'Exam 6',
                value: 5
              },
            ]
        },
        {
          name : 'Courses',
          value: 2,
          children:
            [
              {
              name : 'Professionalism Workshop',
              value: 1
              },
              {
              name : 'Practice Education Course',
              value: 1
              },
            ]
        }
      ]
  },
  {
    name: 'FSA Requirements',
    value: 4,
    children:
      [
        {
          name : 'Exams',
          value: 15,
          children:
            [
              {
                name : 'Exam 7',
                value: 5
              },
              {
                name : 'Exam 8',
                value: 5
              },
              {
                name : 'Exam 9',
                value: 5
              },
            ]
        }
      ]
  }
  ]"

  # Server function -------------------------------------------
  server <- function(input, output) {
    # Call functions from ECharts2Shiny to render charts
    renderTreeMap(div_id = "test",name = "Fellow of the CAS",
                  data = dat)
    
  }
  
  # UI layout -------------------------------------------------
  ui <- fluidPage(
    # We MUST load the ECharts javascript library in advance
    loadEChartsLibrary(),
    
    tags$div(id="test", style="width:100%;height:500px;"),
    deliverChart(div_id = "test")
  )
  
  # Run the application --------------------------------------
  shinyApp(ui = ui, server = server)
  
  }