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
library(sf)
library(gridExtra)

# Next steps:
# - add interactive line graphs
# - play with albedo color scheme
# - add snow science text
# - Insights - add links to current Snow Today website
# - Data - include links to data and write up describing the data (modis, spires model, HDF5...)
# - Tutorials - add links and text to describe the tutorials (intended audience, instructions for getting started)
# - add About text (project background, team bios)...maybe move this tab all the way to the right
# - improve app formating and aesthetics
# - compare/contrast selected days side by side?
# - can you link the zoom on snow cover and albedo maps?
#  - have start zoom closer in
# plot cahsing so speed things up

# load data

# daily snow cover bricks
wy2001_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2001_snow_cover_percent_stack.tif"))
wy2001_daily_scp_brick <- brick(wy2001_daily_scp_brick)

wy2002_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2002_snow_cover_percent_stack.tif"))
wy2002_daily_scp_brick <- brick(wy2002_daily_scp_brick)

wy2003_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2003_snow_cover_percent_stack.tif"))
wy2003_daily_scp_brick <- brick(wy2003_daily_scp_brick)

wy2004_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2004_snow_cover_percent_stack.tif"))
wy2004_daily_scp_brick <- brick(wy2004_daily_scp_brick)

wy2005_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2005_snow_cover_percent_stack.tif"))
wy2005_daily_scp_brick <- brick(wy2005_daily_scp_brick)

wy2006_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2006_snow_cover_percent_stack.tif"))
wy2006_daily_scp_brick <- brick(wy2006_daily_scp_brick)

wy2007_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2007_snow_cover_percent_stack.tif"))
wy2007_daily_scp_brick <- brick(wy2007_daily_scp_brick)

wy2008_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2008_snow_cover_percent_stack.tif"))
wy2008_daily_scp_brick <- brick(wy2008_daily_scp_brick)

wy2009_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2009_snow_cover_percent_stack.tif"))
wy2009_daily_scp_brick <- brick(wy2009_daily_scp_brick)

wy2010_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2010_snow_cover_percent_stack.tif"))
wy2010_daily_scp_brick <- brick(wy2010_daily_scp_brick)

wy2011_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2011_snow_cover_percent_stack.tif"))
wy2011_daily_scp_brick <- brick(wy2011_daily_scp_brick)

wy2012_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2012_snow_cover_percent_stack.tif"))
wy2012_daily_scp_brick <- brick(wy2012_daily_scp_brick)

wy2013_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2013_snow_cover_percent_stack.tif"))
wy2013_daily_scp_brick <- brick(wy2013_daily_scp_brick)

wy2014_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2014_snow_cover_percent_stack.tif"))
wy2014_daily_scp_brick <- brick(wy2014_daily_scp_brick)

wy2015_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2015_snow_cover_percent_stack.tif"))
wy2015_daily_scp_brick <- brick(wy2015_daily_scp_brick)

wy2016_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2016_snow_cover_percent_stack.tif"))
wy2016_daily_scp_brick <- brick(wy2016_daily_scp_brick)

wy2017_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2017_snow_cover_percent_stack.tif"))
wy2017_daily_scp_brick <- brick(wy2017_daily_scp_brick)

wy2018_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2018_snow_cover_percent_stack.tif"))
wy2018_daily_scp_brick <- brick(wy2018_daily_scp_brick)

wy2019_daily_scp_brick <- (here("myapp", "data", "snow_cover_percent", "daily", "wy2019_snow_cover_percent_stack.tif"))
wy2019_daily_scp_brick <- brick(wy2019_daily_scp_brick)

# daily albedo bricks
wy2001_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2001_albedo_stack.tif"))
wy2001_daily_albedo_brick <- brick(wy2001_daily_albedo_brick)

wy2002_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2002_albedo_stack.tif"))
wy2002_daily_albedo_brick <- brick(wy2002_daily_albedo_brick)

wy2003_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2003_albedo_stack.tif"))
wy2003_daily_albedo_brick <- brick(wy2003_daily_albedo_brick)

wy2004_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2004_albedo_stack.tif"))
wy2004_daily_albedo_brick <- brick(wy2004_daily_albedo_brick)

wy2005_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2005_albedo_stack.tif"))
wy2005_daily_albedo_brick <- brick(wy2005_daily_albedo_brick)

wy2006_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2006_albedo_stack.tif"))
wy2006_daily_albedo_brick <- brick(wy2006_daily_albedo_brick)

wy2007_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2007_albedo_stack.tif"))
wy2007_daily_albedo_brick <- brick(wy2007_daily_albedo_brick)

wy2008_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2008_albedo_stack.tif"))
wy2008_daily_albedo_brick <- brick(wy2008_daily_albedo_brick)

wy2009_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2009_albedo_stack.tif"))
wy2009_daily_albedo_brick <- brick(wy2009_daily_albedo_brick)

wy2010_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2010_albedo_stack.tif"))
wy2010_daily_albedo_brick <- brick(wy2010_daily_albedo_brick)

wy2011_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2011_albedo_stack.tif"))
wy2011_daily_albedo_brick <- brick(wy2011_daily_albedo_brick)

wy2012_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2012_albedo_stack.tif"))
wy2012_daily_albedo_brick <- brick(wy2012_daily_albedo_brick)

wy2013_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2013_albedo_stack.tif"))
wy2013_daily_albedo_brick <- brick(wy2013_daily_albedo_brick)

wy2014_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2014_albedo_stack.tif"))
wy2014_daily_albedo_brick <- brick(wy2014_daily_albedo_brick)

wy2015_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2015_albedo_stack.tif"))
wy2015_daily_albedo_brick <- brick(wy2015_daily_albedo_brick)

wy2016_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2016_albedo_stack.tif"))
wy2016_daily_albedo_brick <- brick(wy2016_daily_albedo_brick)

wy2017_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2017_albedo_stack.tif"))
wy2017_daily_albedo_brick <- brick(wy2017_daily_albedo_brick)

wy2018_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2018_albedo_stack.tif"))
wy2018_daily_albedo_brick <- brick(wy2018_daily_albedo_brick)

wy2019_daily_albedo_brick <- (here("myapp", "data", "albedo", "daily", "wy2019_albedo_stack.tif"))
wy2019_daily_albedo_brick <- brick(wy2019_daily_albedo_brick)

# annual snow cover percent
annual_snow_cover_percent_brick <- (here("myapp", "data", "snow_cover_percent", "annual", "annual_snow_cover_percent_stack.tif"))
annual_snow_cover_percent_brick <- brick(annual_snow_cover_percent_brick)

# annual snow cover anomaly
annual_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "annual", "annual_scp_anomaly_stack.tif"))
annual_scp_anomaly_brick <- brick(annual_scp_anomaly_brick)

# monthly mean snow cover percent
january_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "january_mean_scp_stack.tif"))
january_mean_scp_brick <- brick(january_mean_scp_brick)

february_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "february_mean_scp_stack.tif"))
february_mean_scp_brick <- brick(february_mean_scp_brick)

march_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "march_mean_scp_stack.tif"))
march_mean_scp_brick <- brick(march_mean_scp_brick)

april_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "april_mean_scp_stack.tif"))
april_mean_scp_brick <- brick(april_mean_scp_brick)

may_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "may_mean_scp_stack.tif"))
may_mean_scp_brick <- brick(may_mean_scp_brick)

june_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "june_mean_scp_stack.tif"))
june_mean_scp_brick <- brick(june_mean_scp_brick)

july_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "july_mean_scp_stack.tif"))
july_mean_scp_brick <- brick(july_mean_scp_brick)

august_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "august_mean_scp_stack.tif"))
august_mean_scp_brick <- brick(august_mean_scp_brick)

september_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "september_mean_scp_stack.tif"))
september_mean_scp_brick <- brick(september_mean_scp_brick)

october_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "october_mean_scp_stack.tif"))
october_mean_scp_brick <- brick(october_mean_scp_brick)

november_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "november_mean_scp_stack.tif"))
november_mean_scp_brick <- brick(november_mean_scp_brick)

december_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "december_mean_scp_stack.tif"))
december_mean_scp_brick <- brick(december_mean_scp_brick)

# monthly snow cover percent anomaly
january_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "january_scp_anomaly_stack.tif"))
january_scp_anomaly_brick <- brick(january_scp_anomaly_brick)

february_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "february_scp_anomaly_stack.tif"))
february_scp_anomaly_brick <- brick(february_scp_anomaly_brick)

march_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "march_scp_anomaly_stack.tif"))
march_scp_anomaly_brick <- brick(march_scp_anomaly_brick)

april_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "april_scp_anomaly_stack.tif"))
april_scp_anomaly_brick <- brick(april_scp_anomaly_brick)

may_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "may_scp_anomaly_stack.tif"))
may_scp_anomaly_brick <- brick(may_scp_anomaly_brick)

june_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "june_scp_anomaly_stack.tif"))
june_scp_anomaly_brick <- brick(june_scp_anomaly_brick)

july_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "july_scp_anomaly_stack.tif"))
july_scp_anomaly_brick <- brick(july_scp_anomaly_brick)

august_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "august_scp_anomaly_stack.tif"))
august_scp_anomaly_brick <- brick(august_scp_anomaly_brick)

september_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "september_scp_anomaly_stack.tif"))
september_scp_anomaly_brick <- brick(september_scp_anomaly_brick)

october_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "october_scp_anomaly_stack.tif"))
october_scp_anomaly_brick <- brick(october_scp_anomaly_brick)

november_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "november_scp_anomaly_stack.tif"))
november_scp_anomaly_brick <- brick(november_scp_anomaly_brick)

december_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "december_scp_anomaly_stack.tif"))
december_scp_anomaly_brick <- brick(december_scp_anomaly_brick)


# ALBEDO
# annual albedo
annual_mean_albedo_brick <- (here("myapp", "data", "albedo", "annual", "annual_mean_albedo_stack.tif"))
annual_mean_albedo_brick <- brick(annual_mean_albedo_brick)

# annual albedo anomaly
annual_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "annual", "annual_albedo_anomaly_stack.tif"))
annual_albedo_anomaly_brick <- brick(annual_albedo_anomaly_brick)

# monthly mean albedo
january_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "january_mean_albedo_stack.tif"))
january_mean_albedo_brick <- brick(january_mean_albedo_brick)

february_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "february_mean_albedo_stack.tif"))
february_mean_albedo_brick <- brick(february_mean_albedo_brick)

march_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "march_mean_albedo_stack.tif"))
march_mean_albedo_brick <- brick(march_mean_albedo_brick)

april_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "april_mean_albedo_stack.tif"))
april_mean_albedo_brick <- brick(april_mean_albedo_brick)

may_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "may_mean_albedo_stack.tif"))
may_mean_albedo_brick <- brick(may_mean_albedo_brick)

june_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "june_mean_albedo_stack.tif"))
june_mean_albedo_brick <- brick(june_mean_albedo_brick)

july_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "july_mean_albedo_stack.tif"))
july_mean_albedo_brick <- brick(july_mean_albedo_brick)

august_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "august_mean_albedo_stack.tif"))
august_mean_albedo_brick <- brick(august_mean_albedo_brick)

september_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "september_mean_albedo_stack.tif"))
september_mean_albedo_brick <- brick(september_mean_albedo_brick)

october_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "october_mean_albedo_stack.tif"))
october_mean_albedo_brick <- brick(october_mean_albedo_brick)

november_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "november_mean_albedo_stack.tif"))
november_mean_albedo_brick <- brick(november_mean_albedo_brick)

december_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "december_mean_albedo_stack.tif"))
december_mean_albedo_brick <- brick(december_mean_albedo_brick)

# monthly albedo anomaly
january_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "january_albedo_anomaly_stack.tif"))
january_albedo_anomaly_brick <- brick(january_albedo_anomaly_brick)

february_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "february_albedo_anomaly_stack.tif"))
february_albedo_anomaly_brick <- brick(february_albedo_anomaly_brick)

march_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "march_albedo_anomaly_stack.tif"))
march_albedo_anomaly_brick <- brick(march_albedo_anomaly_brick)

april_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "april_albedo_anomaly_stack.tif"))
april_albedo_anomaly_brick <- brick(april_albedo_anomaly_brick)

may_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "may_albedo_anomaly_stack.tif"))
may_albedo_anomaly_brick <- brick(may_albedo_anomaly_brick)

june_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "june_albedo_anomaly_stack.tif"))
june_albedo_anomaly_brick <- brick(june_albedo_anomaly_brick)

july_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "july_albedo_anomaly_stack.tif"))
july_albedo_anomaly_brick <- brick(july_albedo_anomaly_brick)

august_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "august_albedo_anomaly_stack.tif"))
august_albedo_anomaly_brick <- brick(august_albedo_anomaly_brick)

september_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "september_albedo_anomaly_stack.tif"))
september_albedo_anomaly_brick <- brick(september_albedo_anomaly_brick)

october_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "october_albedo_anomaly_stack.tif"))
october_albedo_anomaly_brick <- brick(october_albedo_anomaly_brick)

november_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "november_albedo_anomaly_stack.tif"))
november_albedo_anomaly_brick <- brick(november_albedo_anomaly_brick)

december_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "december_albedo_anomaly_stack.tif"))
december_albedo_anomaly_brick <- brick(december_albedo_anomaly_brick)

# project area mask
project_area_mask <- (here("myapp", "data", "project_area_mask.tif"))
project_area_mask <- brick(project_area_mask)
project_area_mask <- project_area_mask[[1]]

# date for raster brick indices
# consider having 1 file with all dates, instead of a file per water year
wy2001_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2001_iso_dates.csv"))
wy2002_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2002_iso_dates.csv"))
wy2003_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2003_iso_dates.csv"))
wy2004_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2004_iso_dates.csv"))
wy2005_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2005_iso_dates.csv"))
wy2006_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2006_iso_dates.csv"))
wy2007_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2007_iso_dates.csv"))
wy2008_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2008_iso_dates.csv"))
wy2009_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2009_iso_dates.csv"))
wy2010_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2010_iso_dates.csv"))
wy2011_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2011_iso_dates.csv"))
wy2012_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2012_iso_dates.csv"))
wy2013_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2013_iso_dates.csv"))
wy2014_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2014_iso_dates.csv"))
wy2015_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2015_iso_dates.csv"))
wy2016_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2016_iso_dates.csv"))
wy2017_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2017_iso_dates.csv"))
wy2018_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2018_iso_dates.csv"))
wy2019_iso_dates <- read_csv(here("myapp", "data", "iso_dates", "wy2019_iso_dates.csv"))

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
                        sidebarPanel("",
                                     dateInput("date", label = h3("Date input"), value = "2001-01-01"),
                                     p("")),
                        mainPanel("",
                                  h2("Snow Cover Percent"),
                                  h4(""),
                                  leafletOutput(outputId = "daily_scp_map"),
                                  h2("Albedo"),
                                  leafletOutput(outputId = "daily_albedo_map")
                                  ))),
             tabPanel("Monthly Maps",
                      sidebarLayout(
                        sidebarPanel(selectInput("water_year_monthly", label = h3("Select Water Year"),
                                                 choices = list("Water Year 2001" = 1, "Water Year 2002" = 2, "Water Year 2003" = 3, "Water Year 2004" = 4, "Water Year 2005" = 5, 
                                                                "Water Year 2006" = 6, "Water Year 2007" = 7, "Water Year 2008" = 8, "Water Year 2009" = 9, "Water Year 2010" = 10,
                                                                "Water Year 2011" = 11, "Water Year 2012" = 12, "Water Year 2013" = 13, "Water Year 2014" = 14, "Water Year 2015" = 15,
                                                                "Water Year 2016" = 16, "Water Year 2017" = 17, "Water Year 2018" = 18, "Water Year 2019" = 19)),
                                     radioButtons("variable1", label = h3("Select a Variable"),
                                                  choices = list("Snow Cover Percent" = 1, "Albedo" = 2),
                                                  selected = 1)),
                        mainPanel(h1("Monthly Maps",
                                     #"add reactive text for selected variables or convey this in the legend",
                                     h3(textOutput("monthly_header"))),
                                  tabsetPanel(
                                              tabPanel("October",
                                                       h3("Monthly Average"), leafletOutput(outputId = "october_mean_map"),
                                                       p(),
                                                       h3("Monthly Anomaly"), leafletOutput(outputId = "october_anomaly_map")),
                                              tabPanel("November",
                                                       h3("Monthly Average"), leafletOutput(outputId = "november_mean_map"),
                                                       p(),
                                                       h3("Monthly Anomaly"), leafletOutput(outputId = "november_anomaly_map")),
                                              tabPanel("December",
                                                       h3("Monthly Average"), leafletOutput(outputId = "december_mean_map"),
                                                       p(),
                                                       h3("Monthly Anomaly"), leafletOutput(outputId = "december_anomaly_map")),
                                              tabPanel("January",
                                                       h3("Monthly Average"), leafletOutput(outputId = "january_mean_map"),
                                                       p(),
                                                       h3("Monthly Anomaly"), leafletOutput(outputId = "january_anomaly_map")),
                                              tabPanel("February",
                                                       h3("Monthly Average"), leafletOutput(outputId = "february_mean_map"),
                                                       p(),
                                                       h3("Monthly Anomaly"), leafletOutput(outputId = "february_anomaly_map")),
                                              tabPanel("March",
                                                       h3("Monthly Average"), leafletOutput(outputId = "march_mean_map"),
                                                       p(),
                                                       h3("Monthly Anomaly"), leafletOutput(outputId = "march_anomaly_map")),
                                              tabPanel("April",
                                                       h3("Monthly Average"), leafletOutput(outputId = "april_mean_map"),
                                                       p(),
                                                       h3("Monthly Anomaly"), leafletOutput(outputId = "april_anomaly_map")),
                                              tabPanel("May",
                                                       h3("Monthly Average"), leafletOutput(outputId = "may_mean_map"),
                                                       p(),
                                                       h3("Monthly Anomaly"), leafletOutput(outputId = "may_anomaly_map")),
                                              tabPanel("June",
                                                       h3("Monthly Average"), leafletOutput(outputId = "june_mean_map"),
                                                       p(),
                                                       h3("Monthly Anomaly"), leafletOutput(outputId = "june_anomaly_map")),
                                              tabPanel("July",
                                                       h3("Monthly Average"), leafletOutput(outputId = "july_mean_map"),
                                                       p(),
                                                       h3("Monthly Anomaly"), leafletOutput(outputId = "july_anomaly_map")),
                                              tabPanel("August",
                                                       h3("Monthly Average"), leafletOutput(outputId = "august_mean_map"),
                                                       p(),
                                                       h3("Monthly Anomaly"), leafletOutput(outputId = "august_anomaly_map")),
                                              tabPanel("September",
                                                       h3("Monthly Average"), leafletOutput(outputId = "september_mean_map"),
                                                       p(),
                                                       h3("Monthly Anomaly"), leafletOutput(outputId = "september_anomaly_map"))))
                      )),
             tabPanel("Annual Maps",
                      sidebarLayout(
                        sidebarPanel(selectInput("water_year_annual", label = h3("Select Water Year"),
                                                 choices = list("Water Year 2001" = 1, "Water Year 2002" = 2, "Water Year 2003" = 3, "Water Year 2004" = 4, "Water Year 2005" = 5, 
                                                                "Water Year 2006" = 6, "Water Year 2007" = 7, "Water Year 2008" = 8, "Water Year 2009" = 9, "Water Year 2010" = 10,
                                                                "Water Year 2011" = 11, "Water Year 2012" = 12, "Water Year 2013" = 13, "Water Year 2014" = 14, "Water Year 2015" = 15,
                                                                "Water Year 2016" = 16, "Water Year 2017" = 17, "Water Year 2018" = 18, "Water Year 2019" = 19)),
                                     radioButtons("variable_annual", label = h3("Select a Variable"),
                                                  choices = list("Snow Cover Percent" = 1, "Albedo" = 2),
                                                  selected = 1)),
                        mainPanel(h1("Annual Maps"),
                                  h3("Annual Average"), 
                                  leafletOutput(outputId = "annual_avg"),
                                  h3("Annual Anomaly"),
                                  leafletOutput(outputId = "annual_anomaly")
                        ))),
             navbarMenu("Snow Science",
                        tabPanel("Remotely Sensed Snow Data"),
                        tabPanel("Albedo")),
             tabPanel("Insights"),
             navbarMenu("Data",
                        tabPanel("HDF5 Files"),
                        tabPanel("Data Source"),
                        tabPanel("Metadata")),
             navbarMenu("About",
                        tabPanel("MEDS Capstone Project"),
                        tabPanel("Team Bios",
                                 p("about this project"),
                                 p("more text"))
                        ),
             tabPanel("Tutorials")
  
))


# create 'server'
# the server is a function that takes in inputs which are going to be the things that the user selects and then it's going to send back outputs which the user can see.
server <- function(input, output) {
  
  # palettes
  pal_scp <- colorNumeric(c("#0C2C84", "#41B6C4", "#FFFFCC"), 1:100,
                          na.color = "transparent")
  
  pal_scp_anom <- colorNumeric(c("firebrick4", "white", "dodgerblue4"), -100:100, # xxx...adjust the value range as needed
                          na.color = "transparent")
  # "firebrick4","firebrick1", "white", "dodgerblue1", "dodgerblue4"
  pal_albedo <- pal_albedo <- colorBin(c("goldenrod4", "goldenrod3", "goldenrod2", "goldenrod1", "floralwhite"), 
                                       domain = c(0.4, 0.9), bins = 5, na.color = "transparent")
  
  pal_albedo_anom <- colorBin(c("gray10", "gray40", "floralwhite", "mediumpurple1", "mediumpurple4"), domain = c(-0.45, 0.45), bins = 5, na.color = "transparent")
 
  pal_mask <- colorNumeric(c("lightgray"), 999,
                           na.color = "transparent")
  
  # takes date input widget and selects the correct index for the daily raster stacks
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
  
  # select file and layer for map of daily snow cover percent
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
  
  # leaflet map of daily snow cover percent  
  output$daily_scp_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(daily_scp_brick_i(), colors = pal_scp, opacity = 0.75) %>%
      addLegend(pal = pal_scp, values = values(daily_scp_brick_i()),
                title = "percent")
  })
  
  # select file and layer for map of  daily albedo
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
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(daily_albedo_brick_i(), colors = pal_albedo, opacity = 0.75) %>%
      addLegend(pal = pal_albedo, values = values(daily_albedo_brick_i()), title = "Albedo")
  })
  
  # leaflet maps of monthly means where user selects water year and variable
  pal_monthly_mean <- reactive({
    if(input$variable1 == 1) {
      pal_scp
    } else if (input$variable1 == 2) {
      pal_albedo
    }
  })
  
  legend_title_monthly_mean <- reactive({
    if(input$variable1 == 1) {
      "percent"
    } else if (input$variable1 == 2) {
      "albedo"
    }
  })
  
  output$monthly_mean_header <- renderText({
    if (input$water_year_monthly_means == 1) {
      "Water Year 2001"
    } else if (input$water_year_monthly_means == 2) {
      "Water Year 2002"
    } else if (input$water_year_monthly_means == 3) {
      "Water Year 2003"
    } else if (input$water_year_monthly_means == 4) {
      "Water Year 2004"
    } else if (input$water_year_monthly_means == 5) {
      "Water Year 2005"
    } else if (input$water_year_monthly_means == 6) {
      "Water Year 2006"
    } else if (input$water_year_monthly_means == 7) {
      "Water Year 2007"
    } else if (input$water_year_monthly_means == 8) {
      "Water Year 2008"
    } else if (input$water_year_monthly_means == 9) {
      "Water Year 2009"
    } else if (input$water_year_monthly_means == 10) {
      "Water Year 2010"
    } else if (input$water_year_monthly_means == 11) {
      "Water Year 2011"
    } else if (input$water_year_monthly_means == 12) {
      "Water Year 2012"
    } else if (input$water_year_monthly_means == 13) {
      "Water Year 2013"
    } else if (input$water_year_monthly_means == 14) {
      "Water Year 2014"
    } else if (input$water_year_monthly_means == 15) {
      "Water Year 2015"
    } else if (input$water_year_monthly_means == 16) {
      "Water Year 2016"
    } else if (input$water_year_monthly_means == 17) {
      "Water Year 2017"
    } else if (input$water_year_monthly_means == 18) {
      "Water Year 2018"
    } else if (input$water_year_monthly_means == 19) {
      "Water Year 2019"
    } 
  })
  
  oct_mean_i <- reactive({
    if (input$variable1 == 1) {
      october_mean_scp_brick[[as.numeric(input$water_year_monthly)]]
    } else if (input$variable1 == 2) {
      october_mean_albedo_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$october_mean_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>% 
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(oct_mean_i(), colors = pal_monthly_mean(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_mean(), values = values(oct_mean_i()),
                title = legend_title_monthly_mean())
  })
  
  nov_mean_i <- reactive({
    if(input$variable1 == 1) {
      november_mean_scp_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      november_mean_albedo_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$november_mean_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(nov_mean_i(), colors = pal_monthly_mean(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_mean(), values = values(nov_mean_i()),
                title = legend_title_monthly_mean())
  })
  
  dec_mean_i <- reactive({
    if(input$variable1 == 1) {
      december_mean_scp_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      december_mean_albedo_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$december_mean_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(dec_mean_i(), colors = pal_monthly_mean(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_mean(), values = values(dec_mean_i()),
                title = legend_title_monthly_mean())
  })
  
  jan_mean_i <- reactive({
    if(input$variable1 == 1) {
      january_mean_scp_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      january_mean_albedo_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$january_mean_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(jan_mean_i(), colors = pal_monthly_mean(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_mean(), values = values(jan_mean_i()),
                title = legend_title_monthly_mean())
  })
  
  feb_mean_i <- reactive({
    if(input$variable1 == 1) {
      february_mean_scp_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      february_mean_albedo_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$february_mean_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(feb_mean_i(), colors = pal_monthly_mean(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_mean(), values = values(feb_mean_i()),
                title = legend_title_monthly_mean())
  })
  
  mar_mean_i <- reactive({
    if(input$variable1 == 1) {
      march_mean_scp_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      march_mean_albedo_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$march_mean_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(mar_mean_i(), colors = pal_monthly_mean(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_mean(), values = values(mar_mean_i()),
                title = legend_title_monthly_mean())
  })
  
  apr_mean_i <- reactive({
    if(input$variable1 == 1) {
      april_mean_scp_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      april_mean_albedo_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$april_mean_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(apr_mean_i(), colors = pal_monthly_mean(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_mean(), values = values(apr_mean_i()),
                title = legend_title_monthly_mean())
  })
  
  may_mean_i <- reactive({
    if(input$variable1 == 1) {
      may_mean_scp_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      may_mean_albedo_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$may_mean_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(may_mean_i(), colors = pal_monthly_mean(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_mean(), values = values(may_mean_i()),
                title = legend_title_monthly_mean())
  })
  
  jun_mean_i <- reactive({
    if(input$variable1 == 1) {
      june_mean_scp_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      june_mean_albedo_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$june_mean_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(jun_mean_i(), colors = pal_monthly_mean(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_mean(), values = values(jun_mean_i()),
                title = legend_title_monthly_mean())
  })
  
  jul_mean_i <- reactive({
    if(input$variable1 == 1) {
      july_mean_scp_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      july_mean_albedo_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$july_mean_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(jul_mean_i(), colors = pal_monthly_mean(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_mean(), values = values(jul_mean_i()),
                title = legend_title_monthly_mean())
  })
  
  aug_mean_i <- reactive({
    if(input$variable1 == 1) {
      august_mean_scp_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      august_mean_albedo_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$august_mean_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(aug_mean_i(), colors = pal_monthly_mean(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_mean(), values = values(aug_mean_i()),
                title = legend_title_monthly_mean())
  })
  
  sep_mean_i <- reactive({
    if(input$variable1 == 1) {
      september_mean_scp_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      september_mean_albedo_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$september_mean_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(sep_mean_i(), colors = pal_monthly_mean(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_mean(), values = values(sep_mean_i()),
                title = legend_title_monthly_mean())
  })
  
  # leaflet maps of monthly anomalies where user selects water year and variable
  pal_monthly_anomaly <- reactive({
    if (input$variable1 == 1) {
      pal_scp_anom
    } else if (input$variable1 == 2) {
      pal_albedo_anom
    }
  })
  
  legend_title_monthly_anomaly <- reactive({
    if (input$variable1 == 1) {
      "anomaly"
    } else if (input$variable1 == 2) {
      "albedo anomaly"
    }
  })
  
  output$monthly_header <- renderText({
    if (input$water_year_monthly == 1) {
      "Water Year 2001"
    } else if (input$water_year_monthly == 2) {
      "Water Year 2002"
    } else if (input$water_year_monthly == 3) {
      "Water Year 2003"
    } else if (input$water_year_monthly == 4) {
      "Water Year 2004"
    } else if (input$water_year_monthly == 5) {
      "Water Year 2005"
    } else if (input$water_year_monthly == 6) {
      "Water Year 2006"
    } else if (input$water_year_monthly == 7) {
      "Water Year 2007"
    } else if (input$water_year_monthly == 8) {
      "Water Year 2008"
    } else if (input$water_year_monthly == 9) {
      "Water Year 2009"
    } else if (input$water_year_monthly == 10) {
      "Water Year 2010"
    } else if (input$water_year_monthly == 11) {
      "Water Year 2011"
    } else if (input$water_year_monthly == 12) {
      "Water Year 2012"
    } else if (input$water_year_monthly == 13) {
      "Water Year 2013"
    } else if (input$water_year_monthly == 14) {
      "Water Year 2014"
    } else if (input$water_year_monthly == 15) {
      "Water Year 2015"
    } else if (input$water_year_monthly == 16) {
      "Water Year 2016"
    } else if (input$water_year_monthly == 17) {
      "Water Year 2017"
    } else if (input$water_year_monthly == 18) {
      "Water Year 2018"
    } else if (input$water_year_monthly == 19) {
      "Water Year 2019"
    } 
  })
  
  oct_anomaly_i <- reactive({
    if (input$variable1 == 1) {
      october_scp_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      october_albedo_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$october_anomaly_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(oct_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(oct_anomaly_i()),
                title = legend_title_monthly_anomaly())
  })
  
  nov_anomaly_i <- reactive({
    if (input$variable1 == 1) {
      november_scp_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      november_albedo_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$november_anomaly_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(nov_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(nov_anomaly_i()),
                title = legend_title_monthly_anomaly())
  })
  
  dec_anomaly_i <- reactive({
    if(input$variable1 == 1) {
      december_scp_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      december_albedo_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$december_anomaly_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(dec_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(dec_anomaly_i()),
                title = legend_title_monthly_anomaly())
  })
  
  jan_anomaly_i <- reactive({
    if(input$variable1 == 1) {
      january_scp_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      january_albedo_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$january_anomaly_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(jan_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(jan_anomaly_i()),
                title = legend_title_monthly_anomaly())
  })
  
  feb_anomaly_i <- reactive({
    if(input$variable1 == 1) {
      february_scp_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      february_albedo_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$february_anomaly_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(feb_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(feb_anomaly_i()),
                title = legend_title_monthly_anomaly())
  })
  
  mar_anomaly_i <- reactive({
    if(input$variable1 == 1) {
      march_scp_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      march_albedo_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$march_anomaly_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(mar_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(mar_anomaly_i()),
                title = legend_title_monthly_anomaly())
  })
  
  apr_anomaly_i <- reactive({
    if(input$variable1 == 1) {
      april_scp_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      april_albedo_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$april_anomaly_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(apr_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(apr_anomaly_i()),
                title = legend_title_monthly_anomaly())
  })
  
  may_anomaly_i <- reactive({
    if(input$variable1 == 1) {
      may_scp_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      may_albedo_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$may_anomaly_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(may_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(may_anomaly_i()),
                title = legend_title_monthly_anomaly())
  })
  
  jun_anomaly_i <- reactive({
    if(input$variable1 == 1) {
      june_scp_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      june_albedo_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$june_anomaly_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(jun_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(jun_anomaly_i()),
                title = legend_title_monthly_anomaly())
  })
  
  jul_anomaly_i <- reactive({
    if(input$variable1 == 1) {
      july_scp_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      july_albedo_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$july_anomaly_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(jul_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(jul_anomaly_i()),
                title = legend_title_monthly_anomaly())
  })
  
  aug_anomaly_i <- reactive({
    if(input$variable1 == 1) {
      august_scp_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      august_albedo_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$august_anomaly_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(aug_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(aug_anomaly_i()),
                title = legend_title_monthly_anomaly())
  })
  
  sep_anomaly_i <- reactive({
    if(input$variable1 == 1) {
      september_scp_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    } else if(input$variable1 == 2) {
      september_albedo_anomaly_brick[[as.numeric(input$water_year_monthly)]]
    }
  })
  
  output$september_anomaly_map <- renderLeaflet({
    leaflet() %>%
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(sep_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.75) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(sep_anomaly_i()),
                title = legend_title_monthly_anomaly())
  })
  
  
  # ANNUAL MAPS
  
  pal_annual_mean <- reactive({
    if(input$variable_annual == 1) {
      pal_scp
    } else if (input$variable_annual == 2) {
      pal_albedo
    }
  })
  
  legend_title_annual_mean <- reactive({
    if(input$variable_annual == 1) {
      "percent"
    } else if (input$variable_annual == 2) {
      "albedo"
    }
  })
  
  annual_avg_i <- reactive({
    if(input$variable_annual == 1) {
      annual_snow_cover_percent_brick[[as.numeric(input$water_year_annual)]]
    } else if (input$variable_annual == 2) {
      annual_mean_albedo_brick[[as.numeric(input$water_year_annual)]]
    }
  })
  
  output$annual_avg <- renderLeaflet({
    leaflet() %>% 
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>% 
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(annual_avg_i(), colors = pal_annual_mean(), opacity = 0.8) %>% 
      addLegend(pal = pal_annual_mean(), values = values(annual_avg_i()),
                title = legend_title_annual_mean())
  })
  
  pal_annual_anomaly <- reactive({
    if (input$variable_annual == 1) {
      pal_scp_anom
    } else if (input$variable_annual == 2) {
      pal_albedo_anom
    }
  })
  
  legend_title_annual_anomaly <- reactive({
    if (input$variable_annual == 1) {
      "anomaly"
    } else if (input$variable_annual == 2) {
      "albedo anomaly"
    }
  })
  
  annual_anomaly_i <- reactive({
    if(input$variable_annual == 1) {
      annual_scp_anomaly_brick[[as.numeric(input$water_year_annual)]]
    } else if (input$variable_annual == 2) {
      annual_albedo_anomaly_brick[[as.numeric(input$water_year_annual)]]
    }
  })
  
  output$annual_anomaly <- renderLeaflet({
    leaflet() %>% 
      setView(lat = 39, lng = -120, zoom = 6) %>%
      addTiles() %>% 
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(annual_anomaly_i(), colors = pal_annual_anomaly(), opacity = 0.8) %>% 
      addLegend(pal = pal_annual_anomaly(), values = values(annual_anomaly_i()),
                title = legend_title_annual_anomaly())
  })

}

# Let R know that you want to combine the ui & server into an app:
shinyApp(ui = ui, server = server)