# a shiny app for snow data

# attach packages
library(shiny)
library(paletteer)
library(shinythemes)
library(here)
library(raster)
library(leaflet)
library(rgdal)
library(tidyverse)
library(terra)
library(maptiles)


# load data
sample_stack <- terra::rast("data/sample_stack.tif")

# create 'ui' = "User Interface"
# widgets are things that the user interacts with to make decisions about what they want to appear as outputs
ui <- fluidPage(
  navbarPage("MEDS Snow Today",
             # tags$head(tags$style(HTML('.navbar-static-top {background-color: #36648b;}',
             #                           '.navbar-default .navbar-nav>.active>a {background-color: #a9d3de;}'))),
             #theme = bslib::bs_theme(
               #bg = "#ffffff", # background color
               #fg = "#36648b", # foreground color
               #primary = "#36648b"), # primary accent color
             #theme = bslib::bs_theme(bootswatch = "minty"),
             #theme = "theme_snow_shiny.css",
             theme = shinytheme("cerulean"),
             #theme = shinytheme("cyborg"),
             tabPanel("Home",
                      sidebarLayout(
                        # sidebarPanel is where you put your widgets
                        sidebarPanel("pick a day",
                                     selectInput(inputId = "select_day",
                                                 label = h3("select a day"),
                                                 choices = list("January 1, 2001" = 93, "February 1, 2001" = 124, "March 1, 2001" = 152),
                                                 selected = 93)
                                     ),
                        mainPanel("agkgklh",
                                  textOutput("index"),
                                  h2("Home of Snow Today"),
                                  h4("This shiny app shows some cool snow stuff."),
                                  plotOutput(outputId = "snow_cover_area_2001")
                                  ))),
             tabPanel("About",
                          p("about this project"),
                          p("more text")),
             tabPanel("Snow Science"),
             tabPanel("Insights"),
             tabPanel("Data"),
             tabPanel("Tutorials")
  
))


# create 'server'
# the server is a function that takes in inputs which are going to be the things that the user selects and then it's going to send back outputs which the user can see.
server <- function(input, output) {
  
  # created a reactive dataframe that depends on the selection made in the site widget
  # site_select <- reactive({
  #   california %>% 
  #     filter(site_name == input$site) %>% 
  #     filter(water_year %in% c(input$wy_select))
  #   })
  
  # create a reactive dataframe that depends on the selection made in the site widget
  
 
  

  # plot of 2001 snow cover area
  output$snow_cover_area_2001 <- renderPlot({
    terra::plot(sample_stack, 100)
  })
  

  # running total of accumulated snow  
  # output$snow_plot <- renderPlot({
  #     # if the data that you are using is a reactive dataframe then you have to add () after data = df()
  #       ggplot(data = site_select(), aes(x = day_of_wy, y = running_wy_snow_accumulation_m)) +
  #     geom_line(aes(color = as.factor(water_year)), size = 1.5) +
  #     scale_x_continuous(breaks = c(1, 32, 62, 93, 124, 152, 183, 213, 244, 275),
  #                        labels = c("Oct 01", "Nov 01", "Dec 01", "Jan 01", "Feb 01", "Mar 01", "Apr 01", "May 01", "Jun 01", "Jul 01"))
  #   })
}


# Let R know that you want to combine the ui & server into an app:
shinyApp(ui = ui, server = server)