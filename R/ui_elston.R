#' UI for Elston Analysis in HiDAP
#' Returns user friendly ui
#' @author Omar Benites
#' @param type type of UI element, deault is a tab in a shinydashboard
#' @param title diaply title name
#' @param name UI TabName
#' @export
#' 

elston_ui <- function(type = "tab", title = "Elston", name = "analysis_elston"){
  
  shinydashboard::tabItem(tabName = name,
                h2(title),   
                          
                box(
                    title = "Elston", status = "primary", solidHeader = TRUE,
                    collapsible = TRUE, width = NULL,
                    #tabsetPanel(
                    tabBox(width = 12,
                          tabPanel("elston", #begin tabset "CHECK"
                                fluidRow( 
                                column(width = 6,
                                shinyFiles::shinyFilesButton('file_elston', 'Select File', 'Please select your files',multiple = TRUE),
                                      infoBoxOutput("file_message_elston",width = NULL),
                                       #selectInput('trait_elston', 'Select Trait', c(Choose='', elston_select_options()   ), selectize=TRUE),
                                       #selectInput('rep_elston', 'Select Repetition', c(Choose='', names(iris)), selectize=TRUE),
                                       #selectInput('genotypes_elston', 'Select Treatment', c(Choose='', names(iris)), selectize=TRUE),
                                       uiOutput("genotypes_elston"),
                  #                    selectInput(inputId = 'means_elston', label='Select type of means', choices=c("single","fitted"), 
                  #                    selected = "single", selectize = FALSE),
                  #                    selectInput(inputId = 'means_elston', label='Select type of means', choices=c("single","fitted"), 
                  #                                selected = "single", selectize = FALSE),
                                       selectInput(inputId = 'model_elston', label = 'Select Model', 
                                                              c('gxe (interaction)'='gxe',"g+e (no-interaction)"='g+e'),
                                                              selectize=TRUE, multiple = FALSE),
                                       shiny::conditionalPanel("input.model_elston == 'gxe'|
                                                                               input.model_elston == 'g+e'",
                                                                             
                                       selectInput(inputId = 'means_elston', label='Select type of means',
                                                                             choices=c("single","fitted"), 
                                                                             selected = "single", selectize = FALSE),
                                       #begin
                                       shiny::conditionalPanel("input.means_elston == 'fitted'|
                                                                input.means_elston == 'single'",  
                                                                 uiOutput("env_elston")#,
                                                              ),#end
                                                             shiny::conditionalPanel("input.means_elston == 'fitted'",  
                                                                                   uiOutput("rep_elston")#,
                                                              )#,#end
                                        ),
                                        # uiOutput("env_elston"),
                                        # uiOutput("rep_elston"),
                                        uiOutput("trait_posElston"),
                                        uiOutput("trait_negElston"),
                                                     #  uiOutput("model_elston"),
                                        radioButtons(inputId = "format_elston", label="Report format", choices= c("html","word"), 
                                                                  selected = "html", inline = TRUE, width = NULL),
                                        actionButton(inputId = "elston_button", label= "Analyze", icon = icon("play-circle"),
                                                                  width = NULL, height = NULL)
                                                      #uiOutput("run_elston")
                                              )#end column
                                            )#, end fluidow
                                   )#,#end tab Panel "CHECK"
                                   
                            )
                          ),
                          
                          br(),
                          br(),
                          br()
                          
  )#End data_processing tabItem
  
}