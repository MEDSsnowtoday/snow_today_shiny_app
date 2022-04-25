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
library(sf)


# load data
sample_stack <- terra::rast("data/sample_stack.tif")
#monthly_snow_cover_2001_01_raster <- raster("2001_01_mean_snow_cover.tif")
wy2001_daily_scp_stack <- raster::raster(here("data", "stacked_annual_tiffs", "wy2001_snow_cover_percent_stack.tif"))
wy2001_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2001_snow_cover_percent_stack.tif"))
wy2001_daily_scp_brick <- brick(wy2001_daily_scp_brick)

wy2001_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2001_albedo_stack.tif"))
wy2001_daily_albedo_brick <- brick(wy2001_daily_albedo_brick)


wy2001_mean_annual_scp <- raster::raster(here("data", "wy2001", "wy2001_annual_mean_snow_cover_percent.tif"))
oct2000_mean_scp <- raster::raster(here("data", "wy2001", "2000_10_mean_snow_cover_percent.tif"))
nov2000_mean_scp <- raster::raster(here("data", "wy2001", "2000_11_mean_snow_cover_percent.tif"))
dec2000_mean_scp <- raster::raster(here("data", "wy2001", "2000_12_mean_snow_cover_percent.tif"))
jan2001_mean_scp <- raster::raster(here("data", "wy2001", "2001_01_mean_snow_cover_percent.tif"))
feb2001_mean_scp <- raster::raster(here("data", "wy2001", "2001_02_mean_snow_cover_percent.tif"))
mar2001_mean_scp <- raster::raster(here("data", "wy2001", "2001_03_mean_snow_cover_percent.tif"))
apr2001_mean_scp <- raster::raster(here("data", "wy2001", "2001_04_mean_snow_cover_percent.tif"))
may2001_mean_scp <- raster::raster(here("data", "wy2001", "2001_05_mean_snow_cover_percent.tif"))
jun2001_mean_scp <- raster::raster(here("data", "wy2001", "2001_06_mean_snow_cover_percent.tif"))
jul2001_mean_scp <- raster::raster(here("data", "wy2001", "2001_07_mean_snow_cover_percent.tif"))
aug2001_mean_scp <- raster::raster(here("data", "wy2001", "2001_08_mean_snow_cover_percent.tif"))
sep2001_mean_scp <- raster::raster(here("data", "wy2001", "2001_09_mean_snow_cover_percent.tif"))

# date for raster brick indices
# consider havering 1 file with all dates, instead of a file per water year
wy2001_iso_dates <- read_csv(here("data", "wy2001_iso_dates.csv"))

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
                                     dateInput("date", label = h3("Date input"), value = "2001-01-01"),
                                     # selectInput(inputId = "select_day",
                                     #             label = h3("select a day"),
                                     #             choices = list("January 1, 2001" = 93, "February 1, 2001" = 124, "March 1, 2001" = 152),
                                     #             selected = 93)
                                     ),
                        mainPanel("agkgklh",
                                  h2("Home of Snow Today"),
                                  h4("This shiny app shows some cool snow stuff."),
                                  #plotOutput(outputId = "snow_cover_area_2001")
                                  leafletOutput(outputId = "wy2001_daily_scp"),
                                  h2("Albedo!!!"),
                                  leafletOutput(outputId = "wy2001_daily_albedo")
                                  ))),
             tabPanel("wy2001",
                      mainPanel("Annual Mean Snow Cover Percent",
                                leafletOutput(outputId = "wy2001_mean_scp"),
                                p(""),
                                "Monthly Mean Snow Cover Percent",
                                tabsetPanel(
                                  tabPanel("October", leafletOutput(outputId = "oct2000_scp")),
                                  tabPanel("November", leafletOutput(outputId = "nov2000_scp")),
                                  tabPanel("December", leafletOutput(outputId = "dec2000_scp")),
                                  tabPanel("January", leafletOutput(outputId = "jan2001_scp")),
                                  tabPanel("February", leafletOutput(outputId = "feb2001_scp")),
                                  tabPanel("March", leafletOutput(outputId = "mar2001_scp")),
                                  tabPanel("April", leafletOutput(outputId = "apr2001_scp")),
                                  tabPanel("May", leafletOutput(outputId = "may2001_scp")),
                                  tabPanel("June", leafletOutput(outputId = "jun2001_scp")),
                                  tabPanel("July", leafletOutput(outputId = "jul2001_scp")),
                                  tabPanel("August", leafletOutput(outputId = "aug2001_scp")),
                                  tabPanel("September", leafletOutput(outputId = "sep2001_scp")),
                                  h5("some text to explain things"),
                                  p("Citation: xxx")))
                      ),
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
  
  # date input widget

  # reactive df to select raster brick index based on date input by user
  selected_index <- reactive({
    wy2001_iso_dates$index[wy2001_iso_dates$date == input$date]
  })
    
  
  # created a reactive dataframe that depends on the selection made in the site widget
  
  # plot a daily snow over based on day selected by user
  # output$snow_cover_area_2001 <- renderPlot({
  #   terra::plot(sample_stack, as.numeric(input$select_day))
  # })
  
  # snow cover percent palettes
  pal_scp <- colorNumeric(c("#0C2C84", "#41B6C4", "#FFFFCC"), values(wy2001_mean_annual_scp),
                      na.color = "transparent")
  
  # albedo palettes
  val_albedo = as.numeric(c(0:1))
  pal_albedo = colorNumeric(c("yellow", "orange", "red"), val_albedo,
                            na.color = "transparent")

  # leaflet map of wy2001 daily snow cover percent
  wy2001_daily_scp_brick_i <- reactive({
    wy2001_daily_scp_brick[[selected_index()]]
  })
    
  output$wy2001_daily_scp <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addRasterImage(wy2001_daily_scp_brick_i(), colors = pal_scp, opacity = 0.75) %>%
      addLegend(pal = pal_scp, values = values(wy2001_daily_scp_brick_i()),
                title = "snow cover %")
  })
  
  # leaflet map of wy2001 daily albedo
  wy2001_daily_albedo_brick_i <- reactive({
    wy2001_daily_albedo_brick[[selected_index()]]
  })
  
  output$wy2001_daily_albedo <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addRasterImage(wy2001_daily_albedo_brick_i(), colors = pal_albedo, opacity = 0.75) %>%
      addLegend(pal = pal_albedo, values = val_albedo, title = "Albedo")
  })
  
  # leaflet map of wy2001 mean snow cover percent
  output$wy2001_mean_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(wy2001_mean_annual_scp, colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(wy2001_mean_annual_scp),
                title = "snow cover %")
  })
  
  output$oct2000_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(oct2000_mean_scp, colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(oct2000_mean_scp),
                title = "snow cover %")
  })
  
  output$nov2000_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(nov2000_mean_scp, colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(nov2000_mean_scp),
                title = "percent")
  })
    output$dec2000_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(dec2000_mean_scp, colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(dec2000_mean_scp),
                title = "percent")
  })
    output$jan2001_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(jan2001_mean_scp, colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(jan2001_mean_scp),
                title = "percent")
  })
  output$feb2001_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(feb2001_mean_scp, colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(feb2001_mean_scp),
                title = "percent")
  })
  output$mar2001_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(mar2001_mean_scp, colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(mar2001_mean_scp),
                title = "percent")
  })
  output$apr2001_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(apr2001_mean_scp, colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(apr2001_mean_scp),
                title = "percent")
  })
  output$may2001_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(may2001_mean_scp, colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(may2001_mean_scp),
                title = "percent")
  })
  output$jun2001_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(jun2001_mean_scp, colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(jun2001_mean_scp),
                title = "percent")
  })
  output$jul2001_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(jul2001_mean_scp, colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(jul2001_mean_scp),
                title = "percent")
  })
  output$aug2001_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(aug2001_mean_scp, colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(aug2001_mean_scp),
                title = "percent")
  })
  output$sep2001_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(sep2001_mean_scp, colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(sep2001_mean_scp),
                title = "percent")
  })


}

# Let R know that you want to combine the ui & server into an app:
shinyApp(ui = ui, server = server)