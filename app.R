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

# Next steps:
# - add year selector for monthly averages page
# - add anomaly visualizations
# - add interactive line graphs
# - play with albedo color scheme
# - add snow science text
# - Insights - add links to current Snow Today website
# - Data - include links to data and write up describing the data (modis, spires model, HDF5...)
# - Tutorials - add links and text to describe the tutorials (intended audience, instructions for getting started)
# - add About text (project background, team bios)...maybe move this tap all the way to the right
# - improve app formating and aesthetics
# - compare/contrast selected days side by side?
# - think about how to differentiate where snow wasn't calculated (boundary of model output)...bounding box
# - can you link the zoom on snow cover and albedo maps?
#  - have start zoom closer in

# load data
sample_stack <- terra::rast("data/sample_stack.tif")
#monthly_snow_cover_2001_01_raster <- raster("2001_01_mean_snow_cover.tif")
wy2001_daily_scp_stack <- raster::raster(here("data", "stacked_annual_tiffs", "wy2001_snow_cover_percent_stack.tif"))

# snow cover bricks
wy2001_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2001_snow_cover_percent_stack.tif"))
wy2001_daily_scp_brick <- brick(wy2001_daily_scp_brick)

wy2002_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2002_snow_cover_percent_stack.tif"))
wy2002_daily_scp_brick <- brick(wy2002_daily_scp_brick)

wy2003_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2003_snow_cover_percent_stack.tif"))
wy2003_daily_scp_brick <- brick(wy2003_daily_scp_brick)

wy2004_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2004_snow_cover_percent_stack.tif"))
wy2004_daily_scp_brick <- brick(wy2004_daily_scp_brick)

wy2005_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2005_snow_cover_percent_stack.tif"))
wy2005_daily_scp_brick <- brick(wy2005_daily_scp_brick)

wy2006_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2006_snow_cover_percent_stack.tif"))
wy2006_daily_scp_brick <- brick(wy2006_daily_scp_brick)

wy2007_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2007_snow_cover_percent_stack.tif"))
wy2007_daily_scp_brick <- brick(wy2007_daily_scp_brick)

wy2008_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2008_snow_cover_percent_stack.tif"))
wy2008_daily_scp_brick <- brick(wy2008_daily_scp_brick)

wy2009_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2009_snow_cover_percent_stack.tif"))
wy2009_daily_scp_brick <- brick(wy2009_daily_scp_brick)

wy2010_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2010_snow_cover_percent_stack.tif"))
wy2010_daily_scp_brick <- brick(wy2010_daily_scp_brick)

wy2011_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2011_snow_cover_percent_stack.tif"))
wy2011_daily_scp_brick <- brick(wy2011_daily_scp_brick)

wy2012_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2012_snow_cover_percent_stack.tif"))
wy2012_daily_scp_brick <- brick(wy2012_daily_scp_brick)

wy2013_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2013_snow_cover_percent_stack.tif"))
wy2013_daily_scp_brick <- brick(wy2013_daily_scp_brick)

wy2014_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2014_snow_cover_percent_stack.tif"))
wy2014_daily_scp_brick <- brick(wy2014_daily_scp_brick)

wy2015_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2015_snow_cover_percent_stack.tif"))
wy2015_daily_scp_brick <- brick(wy2015_daily_scp_brick)

wy2016_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2016_snow_cover_percent_stack.tif"))
wy2016_daily_scp_brick <- brick(wy2016_daily_scp_brick)

wy2017_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2017_snow_cover_percent_stack.tif"))
wy2017_daily_scp_brick <- brick(wy2017_daily_scp_brick)

wy2018_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2018_snow_cover_percent_stack.tif"))
wy2018_daily_scp_brick <- brick(wy2018_daily_scp_brick)

wy2019_daily_scp_brick <- (here("data", "stacked_annual_tiffs", "wy2019_snow_cover_percent_stack.tif"))
wy2019_daily_scp_brick <- brick(wy2019_daily_scp_brick)

# albedo bricks
wy2001_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2001_albedo_stack.tif"))
wy2001_daily_albedo_brick <- brick(wy2001_daily_albedo_brick)

wy2002_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2002_albedo_stack.tif"))
wy2002_daily_albedo_brick <- brick(wy2002_daily_albedo_brick)

wy2003_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2003_albedo_stack.tif"))
wy2003_daily_albedo_brick <- brick(wy2003_daily_albedo_brick)

wy2004_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2004_albedo_stack.tif"))
wy2004_daily_albedo_brick <- brick(wy2004_daily_albedo_brick)

wy2005_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2005_albedo_stack.tif"))
wy2005_daily_albedo_brick <- brick(wy2005_daily_albedo_brick)

wy2006_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2006_albedo_stack.tif"))
wy2006_daily_albedo_brick <- brick(wy2006_daily_albedo_brick)

wy2007_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2007_albedo_stack.tif"))
wy2007_daily_albedo_brick <- brick(wy2007_daily_albedo_brick)

wy2008_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2008_albedo_stack.tif"))
wy2008_daily_albedo_brick <- brick(wy2008_daily_albedo_brick)

wy2009_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2009_albedo_stack.tif"))
wy2009_daily_albedo_brick <- brick(wy2009_daily_albedo_brick)

wy2010_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2010_albedo_stack.tif"))
wy2010_daily_albedo_brick <- brick(wy2010_daily_albedo_brick)

wy2011_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2011_albedo_stack.tif"))
wy2011_daily_albedo_brick <- brick(wy2011_daily_albedo_brick)

wy2012_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2012_albedo_stack.tif"))
wy2012_daily_albedo_brick <- brick(wy2012_daily_albedo_brick)

wy2013_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2013_albedo_stack.tif"))
wy2013_daily_albedo_brick <- brick(wy2013_daily_albedo_brick)

wy2014_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2014_albedo_stack.tif"))
wy2014_daily_albedo_brick <- brick(wy2014_daily_albedo_brick)

wy2015_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2015_albedo_stack.tif"))
wy2015_daily_albedo_brick <- brick(wy2015_daily_albedo_brick)

wy2016_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2016_albedo_stack.tif"))
wy2016_daily_albedo_brick <- brick(wy2016_daily_albedo_brick)

wy2017_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2017_albedo_stack.tif"))
wy2017_daily_albedo_brick <- brick(wy2017_daily_albedo_brick)

wy2018_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2018_albedo_stack.tif"))
wy2018_daily_albedo_brick <- brick(wy2018_daily_albedo_brick)

wy2019_daily_albedo_brick <- (here("data", "stacked_annual_tiffs", "wy2019_albedo_stack.tif"))
wy2019_daily_albedo_brick <- brick(wy2019_daily_albedo_brick)

# annual and mothly means
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
# consider having 1 file with all dates, instead of a file per water year
wy2001_iso_dates <- read_csv(here("data", "iso_dates", "wy2001_iso_dates.csv"))
wy2002_iso_dates <- read_csv(here("data", "iso_dates", "wy2002_iso_dates.csv"))
wy2003_iso_dates <- read_csv(here("data", "iso_dates", "wy2003_iso_dates.csv"))
wy2004_iso_dates <- read_csv(here("data", "iso_dates", "wy2004_iso_dates.csv"))
wy2005_iso_dates <- read_csv(here("data", "iso_dates", "wy2005_iso_dates.csv"))
wy2006_iso_dates <- read_csv(here("data", "iso_dates", "wy2006_iso_dates.csv"))
wy2007_iso_dates <- read_csv(here("data", "iso_dates", "wy2007_iso_dates.csv"))
wy2008_iso_dates <- read_csv(here("data", "iso_dates", "wy2008_iso_dates.csv"))
wy2009_iso_dates <- read_csv(here("data", "iso_dates", "wy2009_iso_dates.csv"))
wy2010_iso_dates <- read_csv(here("data", "iso_dates", "wy2010_iso_dates.csv"))
wy2011_iso_dates <- read_csv(here("data", "iso_dates", "wy2011_iso_dates.csv"))
wy2012_iso_dates <- read_csv(here("data", "iso_dates", "wy2012_iso_dates.csv"))
wy2013_iso_dates <- read_csv(here("data", "iso_dates", "wy2013_iso_dates.csv"))
wy2014_iso_dates <- read_csv(here("data", "iso_dates", "wy2014_iso_dates.csv"))
wy2015_iso_dates <- read_csv(here("data", "iso_dates", "wy2015_iso_dates.csv"))
wy2016_iso_dates <- read_csv(here("data", "iso_dates", "wy2016_iso_dates.csv"))
wy2017_iso_dates <- read_csv(here("data", "iso_dates", "wy2017_iso_dates.csv"))
wy2018_iso_dates <- read_csv(here("data", "iso_dates", "wy2018_iso_dates.csv"))
wy2019_iso_dates <- read_csv(here("data", "iso_dates", "wy2019_iso_dates.csv"))

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
             tabPanel("Daily Snow Cover and Albedo",
                      sidebarLayout(
                        # sidebarPanel is where you put your widgets
                        sidebarPanel("pick a day",
                                     dateInput("date", label = h3("Date input"), value = "2001-01-01"),
                                     p("place holder for another widget")),
                        mainPanel("agkgklh",
                                  h2("Home of Snow Today"),
                                  h4("This shiny app shows some cool snow stuff."),
                                  leafletOutput(outputId = "daily_scp_map"),
                                  h2("Albedo!!!"),
                                  leafletOutput(outputId = "daily_albedo_map")
                                  ))),
             tabPanel("Monthly Averages",
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
             tabPanel("Anomalies",
                      p("add visualizations of annual and monthly snow cover and albedo anomalies"),
                      ),
             tabPanel("Snow Science"),
             tabPanel("Insights"),
             tabPanel("Data"),
             tabPanel("About",
                      p("about this project"),
                      p("more text")),
             tabPanel("Tutorials")
  
))


# create 'server'
# the server is a function that takes in inputs which are going to be the things that the user selects and then it's going to send back outputs which the user can see.
server <- function(input, output) {
  
  # date input widget

  # reactive df to select raster brick index based on date input by user
  # selected_index <- reactive({
  #   wy2001_iso_dates$index[wy2001_iso_dates$date == input$date]
  # })
  
  selected_index <- reactive({
    if (input$date <= as.Date("2001-09-30")) {
      wy2001_iso_dates$index[wy2001_iso_dates$date == input$date]  
    } else if (input$date > as.Date("2001-09-30") & input$date <= as.Date("2002-09-30")) {
      wy2002_iso_dates$index[wy2002_iso_dates$date == input$date]
    } else if (input$date > as.Date("2002-09-30") & input$date <= as.Date("2003-09-30")) {
      wy2003_iso_dates$index[wy2003_iso_dates$date == input$date]
    } else if (input$date > as.Date("2003-09-30") & input$date <= as.Date("2004-09-30")) {
      wy2004_iso_dates$index[wy2004_iso_dates$date == input$date]
    } else if (input$date > as.Date("2004-09-30") & input$date <= as.Date("2005-09-30")) {
      wy2005_iso_dates$index[wy2005_iso_dates$date == input$date]
    } else if (input$date > as.Date("2005-09-30") & input$date <= as.Date("2006-09-30")) {
      wy2006_iso_dates$index[wy2006_iso_dates$date == input$date]
    } else if (input$date > as.Date("2006-09-30") & input$date <= as.Date("2007-09-30")) {
      wy2007_iso_dates$index[wy2007_iso_dates$date == input$date]
    } else if (input$date > as.Date("2007-09-30") & input$date <= as.Date("2008-09-30")) {
      wy2008_iso_dates$index[wy2008_iso_dates$date == input$date]
    } else if (input$date > as.Date("2008-09-30") & input$date <= as.Date("2009-09-30")) {
      wy2009_iso_dates$index[wy2009_iso_dates$date == input$date]
    } else if (input$date > as.Date("2009-09-30") & input$date <= as.Date("2010-09-30")) {
      wy2010_iso_dates$index[wy2010_iso_dates$date == input$date]
    } else if (input$date > as.Date("2010-09-30") & input$date <= as.Date("2011-09-30")) {
      wy2011_iso_dates$index[wy2011_iso_dates$date == input$date]
    } else if (input$date > as.Date("2011-09-30") & input$date <= as.Date("2012-09-30")) {
      wy2012_iso_dates$index[wy2012_iso_dates$date == input$date]
    } else if (input$date > as.Date("2012-09-30") & input$date <= as.Date("2013-09-30")) {
      wy2013_iso_dates$index[wy2013_iso_dates$date == input$date]
    } else if (input$date > as.Date("2013-09-30") & input$date <= as.Date("2014-09-30")) {
      wy2014_iso_dates$index[wy2014_iso_dates$date == input$date]
    } else if (input$date > as.Date("2014-09-30") & input$date <= as.Date("2015-09-30")) {
      wy2015_iso_dates$index[wy2015_iso_dates$date == input$date]
    } else if (input$date > as.Date("2015-09-30") & input$date <= as.Date("2016-09-30")) {
      wy2016_iso_dates$index[wy2016_iso_dates$date == input$date]
    } else if (input$date > as.Date("2016-09-30") & input$date <= as.Date("2017-09-30")) {
      wy2017_iso_dates$index[wy2017_iso_dates$date == input$date]
    } else if (input$date > as.Date("2017-09-30") & input$date <= as.Date("2018-09-30")) {
      wy2018_iso_dates$index[wy2018_iso_dates$date == input$date]
    } else if (input$date > as.Date("2018-09-30") & input$date <= as.Date("2019-09-30")) {
      wy2019_iso_dates$index[wy2019_iso_dates$date == input$date]
    }
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
  val_albedo = as.numeric(c(0:1)) # this doesn't work
  pal_albedo = colorNumeric(c("yellow", "orange", "brown"), val_albedo,
                            na.color = "transparent")

  # leaflet map of daily snow cover percent
  daily_scp_brick_i <- reactive({
    if (input$date <= as.Date("2001-09-30")) {
      wy2001_daily_scp_brick[[selected_index()]]  
    } else if (input$date > as.Date("2001-09-30") & input$date <= as.Date("2002-09-30")) {
      wy2002_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2002-09-30") & input$date <= as.Date("2003-09-30")) {
      wy2003_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2003-09-30") & input$date <= as.Date("2004-09-30")) {
      wy2004_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2004-09-30") & input$date <= as.Date("2005-09-30")) {
      wy2005_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2005-09-30") & input$date <= as.Date("2006-09-30")) {
      wy2006_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2006-09-30") & input$date <= as.Date("2007-09-30")) {
      wy2007_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2007-09-30") & input$date <= as.Date("2008-09-30")) {
      wy2008_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2008-09-30") & input$date <= as.Date("2009-09-30")) {
      wy2009_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2009-09-30") & input$date <= as.Date("2010-09-30")) {
      wy2010_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2010-09-30") & input$date <= as.Date("2011-09-30")) {
      wy2011_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2011-09-30") & input$date <= as.Date("2012-09-30")) {
      wy2012_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2012-09-30") & input$date <= as.Date("2013-09-30")) {
      wy2013_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2013-09-30") & input$date <= as.Date("2014-09-30")) {
      wy2014_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2014-09-30") & input$date <= as.Date("2015-09-30")) {
      wy2015_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2015-09-30") & input$date <= as.Date("2016-09-30")) {
      wy2016_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2016-09-30") & input$date <= as.Date("2017-09-30")) {
      wy2017_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2017-09-30") & input$date <= as.Date("2018-09-30")) {
      wy2018_daily_scp_brick[[selected_index()]]
    } else if (input$date > as.Date("2018-09-30") & input$date <= as.Date("2019-09-30")) {
      wy2019_daily_scp_brick[[selected_index()]]
    }
  })
    
  output$daily_scp_map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addRasterImage(daily_scp_brick_i(), colors = pal_scp, opacity = 0.75) %>%
      addLegend(pal = pal_scp, values = values(daily_scp_brick_i()),
                title = "snow cover %")
  })
  
  # leaflet map of daily albedo
  daily_albedo_brick_i <- reactive({
    if (input$date <= as.Date("2001-09-30")) {
      wy2001_daily_albedo_brick[[selected_index()]]  
    } else if (input$date > as.Date("2001-09-30") & input$date <= as.Date("2002-09-30")) {
      wy2002_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2002-09-30") & input$date <= as.Date("2003-09-30")) {
      wy2003_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2003-09-30") & input$date <= as.Date("2004-09-30")) {
      wy2004_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2004-09-30") & input$date <= as.Date("2005-09-30")) {
      wy2005_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2005-09-30") & input$date <= as.Date("2006-09-30")) {
      wy2006_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2006-09-30") & input$date <= as.Date("2007-09-30")) {
      wy2007_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2007-09-30") & input$date <= as.Date("2008-09-30")) {
      wy2008_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2008-09-30") & input$date <= as.Date("2009-09-30")) {
      wy2009_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2009-09-30") & input$date <= as.Date("2010-09-30")) {
      wy2010_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2010-09-30") & input$date <= as.Date("2011-09-30")) {
      wy2011_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2011-09-30") & input$date <= as.Date("2012-09-30")) {
      wy2012_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2012-09-30") & input$date <= as.Date("2013-09-30")) {
      wy2013_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2013-09-30") & input$date <= as.Date("2014-09-30")) {
      wy2014_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2014-09-30") & input$date <= as.Date("2015-09-30")) {
      wy2015_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2015-09-30") & input$date <= as.Date("2016-09-30")) {
      wy2016_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2016-09-30") & input$date <= as.Date("2017-09-30")) {
      wy2017_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2017-09-30") & input$date <= as.Date("2018-09-30")) {
      wy2018_daily_albedo_brick[[selected_index()]]
    } else if (input$date > as.Date("2018-09-30") & input$date <= as.Date("2019-09-30")) {
      wy2019_daily_albedo_brick[[selected_index()]]
    }
  
  })
  
  output$daily_albedo_map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addRasterImage(daily_albedo_brick_i(), colors = pal_albedo, opacity = 0.75) %>%
      addLegend(pal = pal_albedo, values = values(daily_albedo_brick_i()), title = "Albedo")
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