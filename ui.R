rm(list = ls(all = TRUE))
library(shiny)
shinyUI(fluidPage(
        titlePanel("Project Shiny"),
        sidebarLayout(
                sidebarPanel(list(HTML('<style type="text/css">
                                       .span4 .well { background-color: #B0E0E6;width:250px ; color :#F70D1A;}
                                       </style>'),
                                  navlistPanel(id="id1",selected="select",tabPanel("select"),
                                               navbarMenu('Data Science Toolkit',tabPanel("Data"),
                                                          tabPanel("Fundamentals")),
                                               navbarMenu('R Programming',tabPanel("About R"),
                                                          tabPanel("Programming")),
                                               navbarMenu('Statistical Inference',tabPanel("Formulas"),
                                                          tabPanel("Inference")),
                                               navbarMenu('Regression Models',tabPanel("Regression"),
                                                          tabPanel("Models")),
                                               navbarMenu('Getting and Cleaning data',tabPanel("Loading Data"),
                                                          tabPanel("Cleaning data"),
                                                          tabPanel("Data munging")),
                                               navbarMenu('Practical Machine Learning',tabPanel("About ML"),
                                                          tabPanel("Algorithms"))),
                                  img(src="image/16170603-social-media-concept--abstract-illustration-with-hexagons-and-icons.png",height=100,width=100)
                )),
                mainPanel(list(HTML('<style type="text/css">
                                    .span8 .well { background-color: #987654;fontzzcolor:#F70D1A;}
                                    </style>'),
                               h4("main panel"),
                               conditionalPanel(
                                       condition = "input.id1 == 'select'",
                                       wellPanel("welcome",verbatimTextOutput("welcome"),img(src="image/ana.jpg",height = 500, width = 900))
                               ),
                               conditionalPanel(  condition="input.id1 != 'select'",
                                                  tabsetPanel(type="tabs",
                                                              tabPanel("Overview",
                                                                       sidebarPanel("Data",verbatimTextOutput("Data"),width=10),
                                                                       sidebarPanel("Process",verbatimTextOutput("Process"),width=5),
                                                                       sidebarPanel("Models",verbatimTextOutput("Models"),width=5)),
                                                              tabPanel("Data",wellPanel(
                                                                      fluidRow( column(4,
                                                                                       imageOutput("Data",width="350%",height="300%",inline=FALSE))))),
                                                              tabPanel("CodeandProcess",sidebarPanel("CodeandProcess",verbatimTextOutput("CodeandProcess"))),
                                                              tabPanel("Plots",wellPanel(
                                                                      fluidRow( column(4,
                                                                                       imageOutput("Plots",width="350%",height="300%",inline=FALSE)))))
                                                  )),
                               
                               conditionalPanel(
                                       condition = "input.id1 == 'DataScienceToolkit '",
                                       helpText ( a ("ppt",href="DataScienceToolkit.pdf",target="_blank")),
                                       helpText( a ("Doc",href="DataScienceToolkitDoc.pdf",target="_blank"))
                               ),
                               conditionalPanel(  condition = "input.id1 == 'RProgramming'",
                                                  helpText ( a ("ppt",href="RProgramming.pdf",target="_blank")),
                                                  helpText( a ("Doc",href="RProgrammingDoc.pdf",target="_blank"))
                               ),
                               conditionalPanel(  condition = "input.id1 == 'StatisticalInference'",
                                                  helpText ( a ("ppt",href="StatisticalInference.pdf",target="_blank")),
                                                  helpText( a ("Doc",href="StatisticalInferenceDoc.pdf",target="_blank"))
                               ),
                               conditionalPanel(  condition = "input.id1 == 'RegressionModels'",
                                                  helpText ( a ("ppt",href="RegressionModels.pdf",target="_blank")),
                                                  helpText( a ("Doc",href="RegressionModelsDoc.pdf",target="_blank"))
                               ),
                               conditionalPanel(  condition = "input.id1 == 'GettingandCleaning data'",
                                                  helpText ( a ("ppt",href="GettingandCleaning data.pdf",target="_blank")),
                                                  helpText( a ("Doc",href="GettingandCleaning dataDoc.pdf",target="_blank"))
                               ),
                               conditionalPanel(  condition = "input.id1 == 'PracticalMachineLearning'",
                                                  helpText ( a ("ppt",href="PracticalMachineLearning.pdf",target="_blank")),
                                                  helpText( a ("Doc",href="PracticalMachineLearningDoc.pdf",target="_blank"))
                               ),
                               conditionalPanel(  condition = "input.id1 == 'ExploratoryDataAnalysis'",
                                                  helpText ( a ("ppt",href="ExploratoryDataAnalysis.pdf",target="_blank")),
                                                  helpText( a ("Doc",href="ExploratoryDataAnalysisDoc.pdf",target="_blank"))
                               ),
                               conditionalPanel(
                                       condition = "input.id1 == 'ReproducibleResearch'",
                                       helpText ( a ("ppt",href="ReproducibleResearch.pdf",target="_blank")),
                                       helpText( a ("Doc",href="ReproducibleResearchDoc.pdf",target="_blank"))
                               ),
                               
                               conditionalPanel(
                                       condition = "input.id1 == 'DevelopingDataProducts'",
                                       helpText ( a ("ppt",href="DevelopingDataProducts.pdf",target="_blank")),
                                       helpText( a ("Doc",href="DevelopingDataProductsDoc.pdf",target="_blank"))
                               ),
                               conditionalPanel(
                                       condition = "input.id1 == 'Shiny'",
                                       helpText ( a ("ppt",href="Shiny.pdf",target="_blank")),
                                       helpText( a ("Doc",href="ShinyDoc.pdf",target="_blank"))
                               ),
                               conditionalPanel(
                                       condition = "input.id1 == 'swirl'",
                                       helpText ( a ("ppt",href="swirl.pdf",target="_blank")),
                                       helpText( a ("Doc",href="swirlDoc.pdf",target="_blank"))
                               ),
                               
                                                             tabsetPanel(tabPanel("Help",htmlOutput('help')))
                ))
                ))
        )
