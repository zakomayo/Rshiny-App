
library(plotly)
library(ggplot2)
library(shiny)
library(shinydashboard)
library(DT) 
library(leaflet)

# Define UI for application
ui <- dashboardPage(title =  "Data Visualization Project",
    dashboardHeader(title = "EPL Analysis!"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Map", icon = icon("futbol"),tabName = "map"),
            menuItem("Champions Analysis",tabName = "champions", icon = icon("trophy")),
                menuSubItem("Champ Scoring Analysis", tabName = "champScoring"),
                menuSubItem("Champ Conceding Analysis", tabName = "champCon"),
            menuItem("Relegation Analysis", icon = icon("futbol")),
                menuSubItem("Scoring Analysis", tabName = "relScoring"),
                menuSubItem("Conceding Analysis", tabName = "relCon"),
            menuItem("EPL Standings",tabName = "Standings", icon = icon("futbol"))
            )
        
    ),
    dashboardBody(
        tabItems(
            tabItem(
                tabName = "Standings",
                h1("EPL Standings[2016-2020]"),
                fluidRow(
                    div(dataTableOutput("dataTable"), height = "100%")
                )
                
            ),
            
           
            tabItem(tabName = "champScoring",
                    fluidRow(
                        valueBox("Home Stadiums", "Stadiums where football clubs practice and 
                        host games. Teams perform better at their Home stadiums.",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("Xg", "Represents likelihood of a chance resulting ina a goal. 
                                 Higher Xg indicates a better team!",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("NsXg", "Non SHot Xg.describes the likelihood that a possession 
                        will eventually turn into a goal.",
                                 icon = icon("futbol"), color = "light-blue",width = 4)
                        
                        
                    ),
                    fluidRow(
                        box(title="Radar Chart of Scoring Stats ",status="primary",
                            solidHeader=T,background = "blue",plotlyOutput("plot1")),
                        box(title="Bar chart of Goals-Home",status="primary",
                            solidHeader=T,background = "blue",plotlyOutput("plot2"))

                    ),
                    
                    fluidRow(
                        valueBox(22, "Record held by Liverpool(2019/20) for most consecutive home wins!",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("Best Performer", "Manchester City(2018/19) is the best Performer of all 
                        the Champions by our data.",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("Worst Performer", "Chelsea is the worst Performer of all 
                        the Champions by our data.",
                                 icon = icon("futbol"), color = "light-blue",width = 4)
                        
                    ),
                    fluidRow(
                        valueBox("VERDICT", "Based on Scoring Analysis, Liverpool has performed just
                        like previous champions. It definitely 
                                 deserves to be awarded the title!",
                                 icon = icon("futbol"), color = "light-blue",width = 12)
                        
                    )
                    
                    ),
            tabItem(tabName = "champCon",
                    fluidRow(
                        valueBox("Away Stadiums", "Football clubs play games at other 
                                 club's home stadiums. Teams perform worse at Away stadiums.",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("Xg", "Represents likelihood of a chance resulting ina a goal. 
                                 Higher Xg indicates a better team!",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("NsXg", "Non SHot Xg.describes the likelihood that a possession 
                        will eventually turn into a goal.",
                                 icon = icon("futbol"), color = "light-blue",width = 4)
                    ),
                    fluidRow(
                        box(title="Radar Chart of Conceding Stats ",status="primary",
                            solidHeader=T,background = "blue",plotlyOutput("plot3")),
                        box(title="Bar chart of Goals-Away",status="primary", 
                            solidHeader=T,background = "blue",plotlyOutput("plot4"))
                        
                    ),
                    
                    fluidRow(
                        valueBox(16, "Record held by Manchester City(2017/18) for most away wins!",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("Best Performer", "Manchester City(2017/18) is the best Performer of all 
                        the Champions by our data.",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("Worst Performer", "Chelsea is again the worst Performer of all 
                        the Champions by our data.",
                                 icon = icon("futbol"), color = "light-blue",width = 4)
                        
                    ),
                    fluidRow(
                        valueBox("VERDICT", "Based on Conceding Analysis, Liverpool has performed just
                        like previous champions. It definitely 
                                 deserves to be awarded the title!",
                                 icon = icon("futbol"), color = "light-blue",width = 12)
                        
                    )
            ),
            tabItem(tabName = "relScoring",
                    fluidRow(
                        valueBox(40, "Magic number for all teams to avoid relegation. Arsenal have 
                                 been included as they've already reached 40.",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("Xg", "Represents likelihood of a chance resulting ina a goal. 
                                 Higher Xg indicates a better team!",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("NsXg", "Non SHot Xg.describes the likelihood that a possession 
                        will eventually turn into a goal.",
                                 icon = icon("futbol"), color = "light-blue",width = 4)
                        
                        
                    ),
                    fluidRow(
                        box(title="Radar Chart of Scoring Stats ",status="primary",
                            solidHeader=T,background = "blue",plotlyOutput("plot5")),
                        box(title="Bar chart of Goals-Home",status="primary",
                            solidHeader=T,background = "blue",plotlyOutput("plot6"))
                        
                    ),
                    
                    fluidRow(
                        valueBox("Goal Diference", "Only Arsenal has positive goal difference at Home.
                                 It shows how bad the bottom teams are performing.",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("Best Performer", "Arsenal is the best Performer by our data. It 
                        is expected as they're not fighting 
                                 relegation and are already safe.",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("Worst Performer", "Norwich and Aston VIlla are the worst 
                        Performers by our data.",
                                 icon = icon("futbol"), color = "light-blue",width = 4)
                        
                    ),
                    fluidRow(
                        valueBox("VERDICT", "Based on Scoring Analysis, Norwich and Aston VIlla 
                                 deserve to be relegated!",
                                 icon = icon("futbol"), color = "light-blue",width = 12)
                        
                    )
                    
            ),
            tabItem(tabName = "relCon",
                    fluidRow(
                        valueBox(40, "Magic number for all teams to avoid relegation. Arsenal have 
                                 been included as they've already reached 40.",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("Xg", "Represents likelihood of a chance resulting ina a goal. 
                                 Higher Xg indicates a better team!",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("NsXg", "Non SHot Xg.describes the likelihood that a possession 
                        will eventually turn into a goal.",
                                 icon = icon("futbol"), color = "light-blue",width = 4)
                        
                        
                    ),
                    fluidRow(
                        box(title="Radar Chart of Scoring Stats ",status="primary",
                            solidHeader=T,background = "blue",plotlyOutput("plot7")),
                        box(title="Bar chart of Goals-Home",status="primary",
                            solidHeader=T,background = "blue",plotlyOutput("plot8"))
                        
                    ),
                    
                    fluidRow(
                        valueBox("Goal Diference", "Here even Arsenal has negative goal difference 
                        . It shows how away matches are tougher.",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("Best Performer", "Arsenal is the best Performer by our data. It 
                        is expected as they're not fighting 
                                 relegation and are already safe.",
                                 icon = icon("futbol"), color = "light-blue",width = 4),
                        valueBox("Worst Performer", "Norwich and Aston VIlla are the worst 
                        Performers by our data.",
                                 icon = icon("futbol"), color = "light-blue",width = 4)
                        
                    ),
                    fluidRow(
                        valueBox("VERDICT", "Based on Scoring Analysis, Norwich and Aston VIlla 
                                 deserve to be relegated!",
                                 icon = icon("futbol"), color = "light-blue",width = 12)
                        
                    )
                    
            ),
            tabItem(tabName = "map",
                    absolutePanel(top = 10, right = 10, fixed = TRUE,
                                                  style= "opacity:0.70;z-index:10;
                                                           background: #FFFFEE; padding: 10px"
                                  ),
                    leafletOutput(outputId = "map", width = "100%", height = "900px")
                    )
            )
        )
        
    )



# Define server logic required 
server <- function(input, output,session) {
    league<-reactiveFileReader(100, session, 'league.csv', read.csv)
    data_race<-  read.csv("data_race.csv")
    
    output$dataTable <- renderDT(
        league(), # reactive data
        class = "display nowrap compact", # style
        filter = "top", # location of column filters
        
        options = list(  # options
            scrollX = TRUE # allow user to scroll wide tables horizontally
        )
    )
    output$plot1 <- renderPlotly({
        
        plot_ly(
            type = 'scatterpolar',
            mode = 'closest',
            fill = 'toself'
        ) %>%
            add_trace(
                r = c(0.68,0.54,1.69,1.36,2.25,1.89,0.68),
                theta = c("Probability of Winning-Home" , "Probability of Winning-Away" ,
                          "Xg Scoring-Home" ,"Xg Scoring-Away" ,  "Nsxg Scoring-Home", 
                          "Nsxg Scoring-Away","Probability of Winning-Home"),
                name = 'Cheslea(2016/17)'
            )  %>%
            add_trace(
                r = c(0.78,0.62,2.7,2.15,2.54,2.22,0.78),
                theta = c("Probability of Winning-Home" , "Probability of Winning-Away" ,
                          "Xg Scoring-Home" ,"Xg Scoring-Away" ,  "Nsxg Scoring-Home", 
                          "Nsxg Scoring-Away","Probability of Winning-Home"),
                name = 'Manchester City(2017/18)'
            ) %>%
            add_trace(
                r = c(0.82,0.65,2.99,2.09,3.02,2.14,0.82),
                theta = c("Probability of Winning-Home" , "Probability of Winning-Away" ,
                          "Xg Scoring-Home" ,"Xg Scoring-Away" ,  "Nsxg Scoring-Home", 
                          "Nsxg Scoring-Away","Probability of Winning-Home"),
                name = 'Manchester City(2018/19)'
            )  %>%
            add_trace(
                r = c(0.76,0.6,2.67,2.04,2.22,2.03,0.76),
                theta = c("Probability of Winning-Home" , "Probability of Winning-Away" ,
                          "Xg Scoring-Home" ,"Xg Scoring-Away" ,  "Nsxg Scoring-Home", 
                          "Nsxg Scoring-Away","Probability of Winning-Home"),
                name = 'Liverpool(2019/20)'
            )  %>%
            layout(
                polar = list(
                    radialaxis = list(
                        visible = T,
                        range = c(0,3.5)
                    )
                )
            )
        
    })
    
    teams <- c('Cheslea(2016/17)', 'Manchester City(2017/18)', 'Manchester City(2018/19)','Liverpool(2019/20)')
    
    goalsScoredAway <- c(23, 32, 31,26)
    goalsConcededAway <- c(13,10,17,9)
    goalDiffAway <- c(10,22,14,17)
    
    
    goalsScoredHome <- c(40, 51, 50,40)
    goalsConcededHome <- c(11,10,11,12)
    goalDiffHome <- c(29,41,39,28)
    data <- data.frame(teams, goalsScoredHome, goalsConcededHome, goalDiffHome,goalsScoredAway,
                       goalsConcededAway,goalDiffAway)
    
    
    output$plot2 <- renderPlotly({
        
        
        data %>% plot_ly(
            
        )%>% 
            add_trace(x = ~teams, y = ~goalsScoredHome, type = 'bar',
                      name="Goals Scored-Home", textposition = 'auto',
                      marker = list(color = 'rgb(158,202,225)',
                                    line = list(color = 'rgb(8,48,107)', width = 1.5))
            )%>% 
            add_trace(x = ~teams, y = ~goalsConcededHome, type = 'bar',
                      name="Goals Conceded-Home", textposition = 'auto',
                      marker = list(color = 'rgb(58,200,225)',
                                    line = list(color = 'rgb(8,48,107)', width = 1.5))
            )%>% 
            add_trace(x = ~teams, y = ~goalDiffHome, type = 'bar',
                      name="Goals Difference-Home", textposition = 'auto',
                      marker = list(color = 'rgb(225, 58, 58)',
                                    line = list(color = 'rgb(8,48,107)', width = 1.5))
            )%>% 
            layout(
                   barmode = 'group',
                   xaxis = list(title = ""),
                   yaxis = list(title = ""))
        
    })
    output$plot3 <- renderPlotly({
        
        plot_ly(
            type = 'scatterpolar',
            mode = 'closest',
            fill = 'toself'
        )  %>%
            add_trace(
                r = c(0.12,0.22,0.98,0.95,0.98,1.05,0.12),
                theta = c("Probability of Losing-Home" , "Probability of Losing-Away" , "Xg Conceding -Home" ,
                          "Xg Conceding-Away" ,  "Nsxg Conceding-Home", "Nsxg Conceding-Away","Probability of Losing-Home"),
                name = 'Cheslea(2016/17)'
            )  %>%
            add_trace(
                r = c(0.07,0.17,0.53,0.86,0.56,0.75,0.07),
                theta = c("Probability of Losing-Home" , "Probability of Losing-Away" , "Xg Conceding -Home" ,
                          "Xg Conceding-Away" ,  "Nsxg Conceding-Home", "Nsxg Conceding-Away","Probability of Losing-Home"),
                name = 'Manchester City(2017/18)'
            ) %>%
            add_trace(
                r = c(0.05,0.15,0.85,0.73,0.81,0.73,0.05),
                theta = c("Probability of Losing-Home" , "Probability of Losing-Away" , "Xg Conceding -Home" ,
                          "Xg Conceding-Away" ,  "Nsxg Conceding-Home", "Nsxg Conceding-Away","Probability of Losing-Home"),
                name = 'Manchester City(2018/19)'
            )  %>%
            add_trace(
                r = c(0.09,0.19,0.95,1.1,0.95,0.86,0.09),
                theta = c("Probability of Losing-Home" , "Probability of Losing-Away" , "Xg Conceding -Home" ,
                          "Xg Conceding-Away" ,  "Nsxg Conceding-Home", "Nsxg Conceding-Away","Probability of Losing-Home"),
                name = 'Liverpool(2019/20)'
            )  %>%
            layout(
                polar = list(
                    radialaxis = list(
                        visible = T,
                        range = c(0,1.2)
                    )
                )
            )
        
    })
    
    output$plot4 <- renderPlotly({
        
        
        data %>% plot_ly(
            
        )%>% 
            add_trace(x = ~teams, y = ~goalsScoredAway, type = 'bar',
                      name="Goals Scored-Away", textposition = 'auto',
                      marker = list(color = 'rgb(158,202,225)',
                                    line = list(color = 'rgb(8,48,107)', width = 1.5))
            )%>% 
            add_trace(x = ~teams, y = ~goalsConcededAway, type = 'bar',
                      name="Goals Conceded-AWay", textposition = 'auto',
                      marker = list(color = 'rgb(58,200,225)',
                                    line = list(color = 'rgb(8,48,107)', width = 1.5))
            )%>% 
            add_trace(x = ~teams, y = ~goalDiffAway, type = 'bar',
                      name="Goals Difference-Away", textposition = 'auto',
                      marker = list(color = 'rgb(225, 58, 58)',
                                    line = list(color = 'rgb(8,48,107)', width = 1.5))
            )%>% 
            layout(
                   barmode = 'group',
                   xaxis = list(title = ""),
                   yaxis = list(title = ""))
        
    })
    
    output$plot5 <- renderPlotly({
        
        plot_ly(
            type = 'scatterpolar',
            mode = 'closest',
            fill = 'toself'
        ) %>%
            add_trace(
                r = c(0.49,0.33,1.49,1.30,1.64,1.28,0.49),
                theta = c("Probability of Winning-Home" , "Probability of Winning-Away" ,
                          "Xg Scoring-Home" ,"Xg Scoring-Away" ,  "Nsxg Scoring-Home", 
                          "Nsxg Scoring-Away","Probability of Winning-Home"),
                name = 'Arsenal'
            )  %>%
            add_trace(
                r = c(0.30,0.16,1.09,1.06,1.07,1.14,0.30),
                theta = c("Probability of Winning-Home" , "Probability of Winning-Away" ,
                          "Xg Scoring-Home" ,"Xg Scoring-Away" ,  "Nsxg Scoring-Home", 
                          "Nsxg Scoring-Away","Probability of Winning-Home"),
                name = 'Norwich'
            ) %>%
            add_trace(
                r = c(0.32,0.19,1.48,1.16,1.58,0.91,0.32),
                theta = c("Probability of Winning-Home" , "Probability of Winning-Away" ,
                          "Xg Scoring-Home" ,"Xg Scoring-Away" ,  "Nsxg Scoring-Home", 
                          "Nsxg Scoring-Away","Probability of Winning-Home"),
                name = 'Aston VIlla'
            )  %>%
            add_trace(
                r = c(0.37,0.21,1.35,1.15,1.07,1.16,0.37),
                theta = c("Probability of Winning-Home" , "Probability of Winning-Away" ,
                          "Xg Scoring-Home" ,"Xg Scoring-Away" ,  "Nsxg Scoring-Home", 
                          "Nsxg Scoring-Away","Probability of Winning-Home"),
                name = 'Bournemouth'
            )  %>%
            layout(
                polar = list(
                    radialaxis = list(
                        visible = T,
                        range = c(0,2)
                    )
                )
            )
        
    })
    
    teams_rel <- c('Norwich City', 'Aston Villa', 'Bournemouth','Arsenal')
    goalsScoredAway_rel <- c(6,16,12,14)
    goalsConcededAway_rel <- c(26,32,26,16)
    goalDiffAway_rel <- c(-20,-16,-14,-2)
    goalsScoredHome_rel <- c(19,18,17,26)
    goalsConcededHome_rel <- c(26,24,21,20)
    goalDiffHome_rel <- c(-7,-6,-4,6)
    
    data_rel <- data.frame(teams_rel, goalsScoredAway_rel, goalsConcededAway_rel, goalDiffAway_rel,
                           goalsScoredHome_rel,goalsConcededHome_rel,goalDiffHome_rel)
    
    output$plot6 <- renderPlotly({
        
        
        data_rel %>% plot_ly(
            
        )%>% 
            add_trace(x = ~teams_rel, y = ~goalsScoredHome_rel, type = 'bar',
                      name="Goals Scored-Home", textposition = 'auto',
                      marker = list(color = 'rgb(158,202,225)',
                                    line = list(color = 'rgb(8,48,107)', width = 1.5))
            )%>% 
            add_trace(x = ~teams_rel, y = ~goalsConcededHome_rel, type = 'bar',
                      name="Goals Conceded-Home", textposition = 'auto',
                      marker = list(color = 'rgb(58,200,225)',
                                    line = list(color = 'rgb(8,48,107)', width = 1.5))
            )%>% 
            add_trace(x = ~teams_rel, y = ~goalDiffHome_rel, type = 'bar',
                      name="Goals Difference-Home", textposition = 'auto',
                      marker = list(color = 'rgb(225, 58, 58)',
                                    line = list(color = 'rgb(8,48,107)', width = 1.5))
            )%>% 
            layout(title = "Goal Scoring Performance",
                   barmode = 'group',
                   xaxis = list(title = "Teams"),
                   yaxis = list(title = "Goals"))
        
    })
    
    output$plot7 <- renderPlotly({
        
        plot_ly(
            type = 'scatterpolar',
            mode = 'closest',
            fill = 'toself'
        ) %>%
            add_trace(
                r = c(0.28,0.42,1.59,1.49,1.38,1.58,0.28),
                theta = c("Probability of Losing-Home" , "Probability of Losing-Away" , "Xg Conceding -Home" ,
                          "Xg Conceding-Away" ,  "Nsxg Conceding-Home", "Nsxg Conceding-Away","Probability of Losing-Home"),
                name = 'Arsenal'
            )  %>%
            add_trace(
                r = c(0.45,0.63,1.96,1.78,1.67,1.76,0.45),
                theta = c("Probability of Losing-Home" , "Probability of Losing-Away" , "Xg Conceding -Home" ,
                          "Xg Conceding-Away" ,  "Nsxg Conceding-Home", "Nsxg Conceding-Away","Probability of Losing-Home"),
                name = 'Norwich'
            ) %>%
            add_trace(
                r = c(0.44,0.58,2.13,2.32,1.65,2.05,0.44),
                theta = c("Probability of Losing-Home" , "Probability of Losing-Away" , 
                          "Xg Conceding -Home" , "Xg Conceding-Away" ,  "Nsxg Conceding-Home", 
                          "Nsxg Conceding-Away","Probability of Losing-Home"),
                name = 'Aston VIlla'
            )  %>%
            add_trace(
                r = c(0.38,0.57,1.68,1.87,1.32,1.54,0.38),
                theta = c("Probability of Losing-Home" , "Probability of Losing-Away" ,
                          "Xg Conceding -Home" ,"Xg Conceding-Away" ,  "Nsxg Conceding-Home",
                          "Nsxg Conceding-Away","Probability of Losing-Home"),
                name = 'Bournemouth'
            )  %>%
            layout(
                polar = list(
                    radialaxis = list(
                        visible = T,
                        range = c(0,2.5)
                    )
                )
            )
        
    })
    
    output$plot8 <- renderPlotly({
        
        
        data_rel %>% plot_ly(
            
        )%>% 
            add_trace(x = ~teams_rel, y = ~goalsScoredAway_rel, type = 'bar',
                      name="Goals Scored-Away", textposition = 'auto',
                      marker = list(color = 'rgb(158,202,225)',
                                    line = list(color = 'rgb(8,48,107)', width = 1.5))
            )%>% 
            add_trace(x = ~teams_rel, y = ~goalsConcededAway_rel, type = 'bar',
                      name="Goals Conceded-AWay", textposition = 'auto',
                      marker = list(color = 'rgb(58,200,225)',
                                    line = list(color = 'rgb(8,48,107)', width = 1.5))
            )%>% 
            add_trace(x = ~teams_rel, y = ~goalDiffAway_rel, type = 'bar',
                      name="Goals Difference-Away", textposition = 'auto',
                      marker = list(color = 'rgb(225, 58, 58)',
                                    line = list(color = 'rgb(8,48,107)', width = 1.5))
            )%>% 
            layout(title = "Goal Scoring Performance",
                   barmode = 'group',
                   xaxis = list(title = "Teams"),
                   yaxis = list(title = "Goals"))
        
    })
    
    champ<- read.csv("champ.csv")
    
    champ$Latitude<- as.numeric(champ$Latitude)
    champ$Longitude<- as.numeric(champ$Longitude)
    
    myicons <- iconList(
        ManchesterUnited = makeIcon(iconUrl = "municon.png",iconWidth = 35,iconHeight = 35,shadowWidth = 10, shadowHeight = 10),
        ManchesterCity = makeIcon(iconUrl = "mciicon.png",iconWidth = 35,iconHeight = 35,shadowWidth = 10, shadowHeight = 10),
        LeicesterCity = makeIcon(iconUrl = "lciicon.png",iconWidth = 35,iconHeight = 35,shadowWidth = 10, shadowHeight = 10),
        Chelsea = makeIcon(iconUrl = "claicon.png",iconWidth = 35,iconHeight = 35,shadowWidth = 10, shadowHeight = 10),
        Arsenal = makeIcon(iconUrl = "arsicon.png",iconWidth = 35,iconHeight = 35,shadowWidth = 10, shadowHeight = 10),
        Liverpool = makeIcon(iconUrl = "livicon.png",iconWidth = 35,iconHeight = 35,shadowWidth = 10, shadowHeight = 10),
        BlackburnRovers = makeIcon(iconUrl = "bbricon.png",iconWidth = 35,iconHeight = 35,shadowWidth = 10, shadowHeight = 10)
        
    )
    
    output$map <- renderLeaflet({
        
        leaflet()%>%
             addMarkers(
                data = champ, lng= ~Longitude, lat = ~Latitude,icon = ~myicons[champ$Team],
                             popup   = ~paste("<h3>",champ$Team,"</h3>" , "<b>Times Won:</b>",champ$Times.Won,"<br>",
                                              "<b>Last Year of Winning:</b>",champ$Year,champ$video,sep=" ")
                )%>%
            addProviderTiles(providers$Stamen.Watercolor,
                             options = providerTileOptions(noWrap = TRUE))%>% 
            setView(lng = -1.17, lat = 52.35, zoom = 7)
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
