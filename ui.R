#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

ui <- dashboardPage(
    dashboardHeader(title = "TaraCyc Viral Voyager"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Welcome", tabName = "welcome", icon = icon("home")),
            menuItem("Map", tabName = "map", icon = icon("globe")),
            menuItem("Analysis", tabName = "analysis", icon = icon("flask")),
            menuItem("Future Directions", tabName = "futuredirections", icon = icon("arrow-circle-right")),
            menuItem("Team Members", tabName = "members", icon = icon("user-circle-o")),
            group_ui('group')
        )
    ),
    dashboardBody(
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
        ),
        tabItems(
            tabItem(tabName="welcome",
                    welcome_ui()),
            
            tabItem(tabName="map",
                h1('Map of Viral Metabolic Pathways'),
                fluidRow(
                    box(
                        title="Controls", width = 12, solidHeader = TRUE,
                        query_ui('query')
                    )
                ),
                fluidRow(
                    box(
                        width = 12, solidHeader = TRUE,
                        tabsetPanel(id = 'map_or_table',
                            tabPanel('Map View',
                                     value = 'map',
                                     map_ui('map')),
                            tabPanel('Table View',
                                     value = 'table',
                                     table_ui('table'))
                        )
                        
                    )
                ),
                fluidRow(
                    box(
                        title="Sample Information", width = 12, solidHeader = TRUE,
                        sample_ui('sample')
                    )
                )
            ),
            
            tabItem(tabName="analysis",
                    tabsetPanel(
                        tabPanel('Test Analysis',
                                 test_analysis_ui('tana'))
                    )),
            
            tabItem(tabName="futuredirections"),
            
            tabItem(tabName="members"
                     
            )
            
        
        )
    )
)
