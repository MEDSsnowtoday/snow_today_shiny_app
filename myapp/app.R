# a shiny app for snow data

# list of packages required
#list.of.packages <- c("shiny", "shinythemes", "here", "raster", "leaflet", "rgdal", "tidyverse", "sf", "bslib", "thematic")

# checking missing packages from list
#new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]

# install missing ones
#if(length(new.packages)) install.packages(new.packages, dependencies = TRUE)

# attach packages
library(shiny)
library(shinythemes)
library(here)
library(raster)
library(leaflet)
library(rgdal)
library(tidyverse)
library(sf)
library(bslib)
library(thematic)


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

snow_cover_data <- read_csv(here("myapp", "data", "snow_cover_data.csv"))

# create 'ui' = "User Interface"
# widgets are things that the user interacts with to make decisions about what they want to appear as outputs
ui <- fluidPage(
  fluidRow(
    column(10,),
    column(1, tags$a(href="https://bren.ucsb.edu/masters-programs/master-environmental-data-science", tags$img(src = "bren_logo.png", height = 80))),
    column(1, tags$a(href="https://ucsb-meds.github.io/", tags$img(src = "bren_meds_hex.png", height = 80)))
    ),
  navbarPage("",
             theme = bslib::bs_theme(
               bg = "white", fg = "black",
               primary = "#0D4FBD", secondary = "green",
               base_font = font_google("Open Sans")
             ),
             tags$head(tags$style(HTML(".navbar.navbar-default {
                                       background-color: #0D4FBD !important;
                                       }",
                                       ".nav-link.active {background-color:  #gray;
                                           color: #FFFFFF;
                                       }"))),
             tabPanel(h5(style = "color:white; font-weight:bold", "MEDS Snow Today"),
                      img(src = "Picture1.jpg", width="100%"),
                      h1("Welcome to the MEDS Snow Today Shiny App!"),
                      br(),
                      p("This app presents interactive visualizations of snow cover percent and albedo for the Sierra region. Explore this app to view daily, monthly, and yearly maps; learn about remote sensing and snow data collection; and try out tutorials for working with the data presented in this app."),
                      h4(tags$b("Why do we care about snow data in the first place?")),
                      p("Snow is one of the most important natural water resources present in nature. It stores water in winter and releases it in spring during the melting season. Snow also influences our ability to participate in winter activities, such as skiing and snowboarding. As such, knowing the spatial extent of snow cover and understanding its properties is critical for water resource management and winter recreation."),
                      #br(),
                      img(src = "Albie.png", height = 100),
                      img(src = "snow_octocat.png", height = 100),
                      h5("View code on the MEDS Snow Today public", tags$a(href="https://github.com/MEDSsnowtoday", "GitHub Repository.")),
                      h5(tags$b("Note: Maps are slow to load. Please be patient"))
                      ),
             tabPanel(h5(style = "color:white; font-weight:bold", "Daily Maps"),
                      sidebarLayout(
                        # sidebarPanel is where you put your widgets
                        sidebarPanel("",
                                     dateInput("date", label = h3("Select Date"), value = "2001-01-01"),
                                     p("*data available from"),
                                     p("Oct. 1, 2000 through Sept. 30, 2019"),
                                     p("")),
                        mainPanel("",
                                  h2("Snow Cover Percent"),
                                  h4(""),
                                  leafletOutput(outputId = "daily_scp_map"),
                                  h2("Albedo"),
                                  leafletOutput(outputId = "daily_albedo_map")
                                  ))),
             tabPanel(h5(style = "color:white; font-weight:bold", "Monthly Maps"),
                      sidebarLayout(
                        sidebarPanel(selectInput("water_year_monthly", label = h3("Select Water Year"),
                                                 choices = list("Water Year 2001" = 1, "Water Year 2002" = 2, "Water Year 2003" = 3, "Water Year 2004" = 4, "Water Year 2005" = 5, 
                                                                "Water Year 2006" = 6, "Water Year 2007" = 7, "Water Year 2008" = 8, "Water Year 2009" = 9, "Water Year 2010" = 10,
                                                                "Water Year 2011" = 11, "Water Year 2012" = 12, "Water Year 2013" = 13, "Water Year 2014" = 14, "Water Year 2015" = 15,
                                                                "Water Year 2016" = 16, "Water Year 2017" = 17, "Water Year 2018" = 18, "Water Year 2019" = 19)),
                                     radioButtons("variable1", label = h3("Select a Variable"),
                                                  choices = list("Snow Cover Percent" = 1, "Albedo" = 2),
                                                  selected = 1)),
                        mainPanel(h1("Monthly Maps"),
                                  h3(textOutput("monthly_header")),
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
                                                       h3("Monthly Anomaly"), leafletOutput(outputId = "september_anomaly_map"))),
                                  br()
                      ))),
             tabPanel(h5(style = "color:white; font-weight:bold", "Annual Maps"),
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
                                  h3(textOutput("annual_header")),
                                  h3("Annual Average"), 
                                  leafletOutput(outputId = "annual_avg"),
                                  h3("Annual Anomaly"),
                                  leafletOutput(outputId = "annual_anomaly"),
                                  br()
                        ))),
             tabPanel(h5(style = "color:white; font-weight:bold", "Annual Graph"),
                      h5("In the legend, toggle years on/off to compare water years against the interquartile range"),
                      br(""),
                      includeHTML(here("myapp", "data", "snow_cover_figure.html")),
                      br()
                      #includeHTML(here("myapp", "data", "albedo_figure.html"))
                                  ),
             tabPanel(h5(style = "color:white; font-weight:bold", "Tutorials"),
                      h1("Tutorials"),
                      h4("Tutorial 1: ", tags$a(href="https://github.com/MEDSsnowtoday/Tutorials/blob/main/ST_01_Downloading_and_Exploring_Snow_Data.ipynb", "Downloading and Exploring Snow Data")),
                      h4("Tutorial 2:", tags$a(href="https://github.com/MEDSsnowtoday/Tutorials/blob/main/ST_02_Snow_Geospatial_Calculations.ipynb", "Snow Geospatial Calculations")),
                      h4("Tutorial 3:", tags$a(href="https://github.com/MEDSsnowtoday/Tutorials/blob/main/ST_03_Interactive_Charts.ipynb", "Interactive Charts")),
                      h1("Motivation"),
                      p("Three Python-based tutorials were created to help users through downloading, accessing, processing, and visualizing the National Snow and Ice Data Center's (NSIDC) Snow Today snow cover and albedo datasets. The tutorials use 19 year's (2001-2019) worth of snow cover and albedo datasets for the California Sierra Nevada Mountain Range."),
                      p("These tutorials provide steps to:"),
                      tags$li("Download snow cover and albedo datasets"),
                      tags$li("Access snow cover and albedo data and metadata"),
                      tags$li("Process and create basic visualizations of the datasets"),
                      tags$li("Convert datasets to alternative file types"),
                      tags$li("Create an interactive map of raster layers"),
                      tags$li("Create interactive charts of snow cover and albedo"),
                      h1("Usage"),
                      p("Python tutorials were created to increase the usability of the UCSB Earth Research Insitutes’s (ERI) Snow Property Inversion from Remote Sensing (SPIReS) model HDF5 files. These files contain snow cover fraction and snow albedo data. The three tutorials are intended for an audience with basic Python experience. Previous understanding of multidimensional climate data is not required. The first tutorial focuses on walking users through the steps to downloading and opening HDF5 files and exploring the metadata. The second tutorial provides instructions on how to calculate averages and anomalies, convert the data to GeoTiffs with correct projection information, and to visualize the data on a map. These GeoTiff can be either individual files or raster stacks. The third tutorial focuses on visualizing snow statistical values on charts. While the tutorials only use historic data from 2001 to 2019, the skills gained from the tutorials can be applied to present data."),
                      h4("Authors: Ryan Munnikhuis, Marie Rivers, Julia Parish"),
                      h4("References"),
                      p("Bair, E. H., Stillinger, T., & Dozier, J. (2021). Snow Property Inversion From Remote Sensing (SPIReS): A Generalized Multispectral Unmixing Approach With Examples From MODIS and Landsat 8 OLI. IEEE Transactions on Geoscience and Remote Sensing, 59(9), 7270–7284.", tags$a(href="https://ieeexplore.ieee.org/document/9290428", "https://doi.org/10.1109/TGRS.2020.3040328")),
                      p("Stillinger, T., Bair, N., Colee, M., Davis, B., Dozier, J. 2022. Remotely-sensed products. Snow research at UC Santa Barbara and The Cold Regions Research and Engineering Laboratory (CRREL) and University of California Santa Barbara (UCSB) Energy Site. Last accessed: 2022/05/22.", tags$a(href="https://snow.ucsb.edu/index.php/remotely-sensed-products/", "snow.ucsb.edu/index.php/remotely-sensed-products"))
                      ),
             tabPanel(h5(style = "color:white; font-weight:bold", "Snow Science"),
                      navlistPanel("Snow Science",
                                   tabPanel("Snow Measurements in the Field",
                                            h1("Snow Measurements in the Field"),
                                            p("Snow water equivalent (SWE) is a measure of the amount of liquid water in a snowpack. Typically units used to report SWE values are inches of water.  Think of SWE as the depth of water you would have if an entire snowpack melted.  This information is important to water supply managers and hydrologists. Simply measuring the depth of snow is not enough to estimate water quantities. As a snowpack condenses over time, its density increases, but the amount of water within the snowpack does not change. SWE is measured using snow pillows or Federal Snow Samplers. A snow pillow is an in situ device that measures the weight of a snowpack. This weight is then used to calculate an equivalent weight of water to get the snow water equivalent (SWE). A federal snow sampler is a long tube that is driven into the snowpack all the way to the ground surface below. This gets you both a depth of snow and a core sample of the snowpack. The core is then weighed using a calibrated scale that gives the corresponding SWE value. The snow density can then be calculated from the depth and weight."),
                                            p("As our group experienced firsthand, it’s not easy to collect in field snow measurements of snow and it’s properties. In March, our group had the opportunity to meet our Capstone clients in Mammoth Lakes to see how snow data is collected on the ground. It became quickly apparent that the amount of time and energy needed to collect snow data is not feasible over large areas. In addition, things like mountainous terrain, weather conditions, and equipment logistics can increase the difficulty of acquiring these measurements. Once a snowpack has melted above the elevation of the highest field monitoring station, water managers could be left without vital information. Luckily, remote sensing, or data collection  from satellites in this case, is an accurate and effective alternative for collecting snow measurements. "),
                                            fluidRow(
                                              column(3, tags$img(src = "federal_sampler.jpg", alt = "snow federal sampler", height = 400)),
                                              column(4, tags$img(src = "albedo_field.jpg", alt = "albedo measurement in the field", height = 400)),
                                              column(4, tags$img(src = "snow_density.jpg", alt = "snow pit to measures density profile", height = 400))),
                                            h4("References"),
                                            p(tags$a(href="https://www.nrcs.usda.gov/wps/portal/nrcs/detail/null/?cid=nrcseprd1314833", "NRCS: What is Now Water Equivalent?"))),
                                            tabPanel("Snow and Remote Sensing",
                                                     h1("Snow and Remote Sensing"),
                                                     p("Remote sensing is when reflected and emitted radiation are measured from a distance to detect physics characteristics of an area. Remotely sensed data, which is often collected by satellite or aircraft, provide valuable information about Earth. Active remote sensing is when a satellite or aircraft emits a signal then a sensor detects how that signal reflects off the target area. Passive remote sensing does not involve an emitted signal and instead sensors detect emitted or reflected radiation such as reflected sunlight. Remote sensing techniques can be applied to a wide variety of studies such as landuse change, forestry, wildfires, weather events, and urban development. Remotely sensed data can also provide near real-time snow data to be collected on a global scale and eliminates many of the barriers of in-field measurements. This is particularly valuable for areas such as high mountain terrain that are difficult or dangerous to access."),
                                                     p("This app visualizes MODIS satellite imagery that has been processed using the SPIReS model to estimate fractional snow cover area and albedo. Pixels from the satellite data presented in this app have a spatial resolution of approximately 500 meters x 500 meters. Snow cover percent refers to the percentage of each pixel that the model estimates to be covered in snow. "),
                                                     h4("References"),
                                                     p(tags$a(href="https://www.usgs.gov/faqs/what-remote-sensing-and-what-it-used#:~:text=Remote%20sensing%20is%20the%20process,sense%22%20things%20about%20the%20Earth.", "USGS: What is remote sensing and what is it used for?"))
                                            ),
                                   tabPanel("Albedo",
                                            h1("Albedo"),
                                            p("Albedo is a non-dimensional, unitless measurement of how much solar energy is reflected from a surface. More specifically, albedo is the ratio of reflected solar radiation to incoming solar radiation. Theoretically, albedo values can range from 0 (the surface absorbs all incoming energy) to 1 (the surface reflects all incoming energy). Land surfaces typically have albedo values between 0.1 and 0.4."),
                                            p("Albedo affects climate by determining how much radiation the planet absorbs. For this reason, snow albedo has important climate implications. In a way, albedo is a measure of the brightness of snow. Fresh, clean snow appears bright white and has high albedo, while old, dirty snow appears darker and has lower albedo. Typical albedo values for snow range between 0.65 and 0.85 but can be as low as 0.2 for dirty snow and as high as 0.9 for fresh snow. The more solar radiation snow absorbs, the faster it melts, so dark snow melts faster than clean snow. Spring snowmelt contributes to drinking water reservoirs in drier months. Earlier snowmelt can leave less water in the summer when it’s needed most."),
                                            p("A layer of fresh snow increases albedo for that area, which can result in local cooling. When snow melts, it reveals darker surfaces such as soil or grass with lower albedo which increases local temperatures and encourages more melting in a feedback loop where the surface absorbs more solar radiation. Naturally occurring dust, ash from wildfire burnt areas, and soot from fossil fuels can be transported by wind and darken snow, which lowers its albedo value. Human activities such as overgrazing can contribute to the transport of dust. A case study found that snow in some areas was cleaner during COVID lockdowns."),
                                            p("Due to the importance of albedo and variability of values over space and time, it may not be suitable to apply a single value to a broad region based solely on land cover. Since field measurements are difficult to collect, especially in mountainous terrain, albedo measurements from remotely sensed data sources are important."),
                                            img(src = "albedo.png"),
                                            h4("References"),
                                            p("Bair E, Stillinger T, Rittger K, Skiles M. COVID-19 lockdowns show reduced pollution on snow and ice in the Indus River Basin. Proc Natl Acad Sci U S A. 2021 May 4;118(18):e2101174118. doi: 10.1073/pnas.2101174118. PMID: 33903254; PMCID: PMC8106343."),
                                            p("Properties of Snow. Our Winter World. 2022.", tags$a(href="http://ourwinterworld.org/snow-science/properties-of-snow", "http://ourwinterworld.org/snow-science/properties-of-snow")),
                                            p("Snow Today. National Snow and Ice Data Center.", tags$a(href="https://nsidc.org/reports/snow-today/glossary", "https://nsidc.org/reports/snow-today/glossary")),
                                            p("")
                                            ))),
             tabPanel(h5(style = "color:white; font-weight:bold", "Data"),
                      navlistPanel("Data", widths = c(2, 10),
                                   tabPanel("Data Source",
                                            h1("Data Source"),
                                            p("The data used in this project was created by the Earth Research Institute, which hosts a repository of historical snow condition data. These files were developed applying a physically-based model called the Snow Property Inversion From Remote Sensing (SPIReS) to daily satellite data. Model outputs are in an HDF5 (.H5) format. The SPIReS HDF5 files contain 19 years of snow cover and albedo data. There is one file for each year from water year 2001 to water year 2019 with snow cover and albedo in separate files. All data are publicly available, and there are no limitations to how others can use the data."),
                                            p("The data files can be accessed here:", tags$a(href="https://snow.ucsb.edu/index.php/remotely-sensed-products/", "snow.ucsb.edu/index.php/remotely-sensed-products")),
                                            p("The files used on this Shiny app are available within the SPIRES/Sierra and SPIRES/SierraAlbedo folders."),
                                            p("The SPIReS model is a physically based model that uses multispectral unmixing to estimate snow properties from MODIS remote sensing imagery. The model uses data from the Moderate Resolution Imaging Spectroradiometer (MODIS) and calculates concentrations of light absorbing particles, grain size, albedo, and fractional snow cover. The model reduces computation time by grouping similar pixels. Since snow can be hidden by forest canopies, the model assumes that snow detected between canopy gaps is also present beneath trees."),
                                            p("Cloud cover is always a challenge when attempting to identify snow from remote sensing imagery. To help minimize this error for low-lying areas with persistent cloud cover, the SPIReS model applies a minimum elevation filter. For example, in the Sierra Nevada, pixels below an elevation of 1,000 meters are set to a fractional snow cover of zero. Time-space smoothing is also applied to reduce errors caused by clouds. Typically, snow is present for a longer duration than clouds so pixels that do not display snow for a minimum threshold number of days are classified as no snow. The model also masks out water bodies to reduce the occurrence of false positives."),
                                            h4("References"),
                                            p("National Snow and Ice Data Center's (NSIDC) Snow Today:", tags$a(href="https://nsidc.org/reports/snow-today", "nsidc.org/reports/snow-today")),
                                            p("E. H. Bair, T. Stillinger and J. Dozier, \"Snow Property Inversion From Remote Sensing (SPIReS): A Generalized Multispectral Unmixing Approach With Examples From MODIS and Landsat 8 OLI,\" in IEEE Transactions on Geoscience and Remote Sensing, vol. 59, no. 9, pp. 7270-7284, Sept. 2021, doi: 10.1109/TGRS.2020.3040328.")),
                                   tabPanel("Metadata",
                                            p("Each pixel has a spatial resolution of 500 meters x 500 meters. The spatial projection of the data is Albers Equal-Area Conic, however this information is not connected to the data in a standard format recognized by mapping softwater and open-source packages. See the tutorials for guidance  addressing this issue."),
                                            h1("Metadata"),
                                            p("Grid_angleunits: degrees"),
                                            p("Grid_aspect: normal"),
                                            p("Grid_falseeasting: 0"),
                                            p("Grid_falsenorthing: -4000000"),
                                            p("Grid_geoid: 6378137, 0.0818191908426215"),
                                            p("Grid_maplatlimit: -90, 90"),
                                            p("Grid_maplonlimit: -255, 15"),
                                            p("Grid_mapparallels: 34, 40.5"),
                                            p("Grid_mapparallels: 34, 40.5"),
                                            p("Grid_mapprojection: eqaconicstd"),
                                            p("Grid_MODIS_GRID_500m_dust_divisor: 10"),
                                            p("Grid_MODIS_GRID_500m_grain_size_divisor: 1"),
                                            p("Grid_MODIS_GRID_500m_raw_snow_fraction_divisor: 100"),
                                            p("Albedo divisor: 10000"),
                                            p("Grid_MODIS_GRID_500m_ReferencingMatrix: 0, 500, -285750, -500, 0, 500250"),
                                            p("Grid_MODIS_GRID_500m_snow_fraction_divisor: 100"),
                                            p("Grid_nparallels: 2"),
                                            p("Grid_origin: 0, -120, 0"),
                                            p("Grid_scalefactor: 1"),
                                            p("Grid_trimlat: -90, 90"),
                                            p("Grid_trimlon: -135, 135"),
                                            p("ISOdates: dates are presented in the format YYYYdoy. For example, '2017274' would be the 274th day of the year 2017."),
                                            p("")
                                 ),
                                 tabPanel("HDF5 Files",
                                          h1("HDF5 Files"),
                                          p("Hierarchical Data Format version 5 (HDF5) is an efficient way to store large quantities of numerical data. There are distinct advantages to h5 files as they store a large amount of information in a smaller dataset and multiple types of data in a single group. Metadata attached to the data is described by using attributes."),
                                          p("HDF5 simplifies the file structure to include three main types of object:"),
                                          tags$li("Datasets: multidimensional arrays of a homogeneous type"),
                                          tags$li("Groups: container structures that can hold datasets and other groups"),
                                          tags$li("Attributes: user-defined metadata that is attached to datasets and groups"),
                                          br(),
                                          p("HDF is self-describing, allowing an application to interpret the structure and contents of a file with no outside information. One HDF file can hold a mix of related objects, which can be accessed as a group or as individual objects."),
                                          img(src = "HDF5_Picture.png"),
                                          p("In Python, HDF5 files can be easily subsetted using array-like slicing operations similar to NumPy. When slicing, only the requested data is loaded into memory while the rest of the data remains on disk. This speeds up data processing. See the “Tutorials” tab in this app for more information on working with HDF5 files in Python."),
                                          h4("Reference"),
                                          p("Collette, A. (2013). Python and HDF5 (First Release). O “Reilly.", tags$a(href="https://learning.oreilly.com/library/view/python-and-hdf5/9781491944981/", "https://learning.oreilly.com/library/view/python-and-hdf5/9781491944981/"))
                                          )
                                 )),
             tabPanel(h5(style = "color:white; font-weight:bold", "About"),
                      img(src = "Picture3.jpg", width="100%"),
                      navlistPanel("About", widths = c(3, 9),
                                   tabPanel("MEDS Capstone Project",
                                            h1("MEDS Capstone Project"),
                                            p("The ", tags$a(href="https://bren.ucsb.edu/masters-programs/master-environmental-data-science/academics-meds", "Master of Environmental Data Science (MEDS)"), "program at UC Santa Barbara's", tags$a(href="https://bren.ucsb.edu", "Bren School of Environmental Science & Management"), "culminates with a 6-month group Capstone project."),
                                            p("The", tags$a(href="https://bren.ucsb.edu/projects/improving-usability-snow-data-through-web-based-visualizations-and-tutorials", "Snow Today Capstone project’s"), "primary goal was to create an open source workflow for processing and visualizing snow data. To achieve this goal, the Snow Today Group produced three deliverables:"),
                                            tags$li("Created recommendations for an information architecture plan and wireframe mockups of proposed Snow Today website;"),
                                            tags$li("Developed visuals of snow cover area and albedo on an interactive website application; and "),
                                            tags$li("Generated “How To” example tutorials to guide various end users through the process of using the data to extract meaningful insights."),
                                            br(),
                                            p("The Snow Today Capstone Project delivered recommendations to update the current Snow Today website by creating an information architecture plan, wireframe mockups, and a web application prototype that includes interactive visualizations and end-user tutorials. Revamping the existing website interface aids users in navigating the site."),
                                            p("All code generated for this project can be found on the MEDS Snow Today public", tags$a(href="https://github.com/MEDSsnowtoday", "GitHub Repository."), "Further information about this project can be found in our", tags$a(href="https://medssnowtoday.github.io/Technical_Documentation/", "Technical Documentation.")),
                                            p("Current static visuals presented on the Snow Today website were updated with interactive figures to allow users to select specific geospatial regions and temporal ranges. Interactive visualizations are presented in a Shiny application that allows users to select a specific date and view maps of snow cover and albedo, then zoom in/out on the maps to view specific areas. The Shiny app also displays annual and monthly snow cover and albedo anomalies. Users can learn more about snow science, the importance of albedo, nuances of the HDF5 file metadata, and background information on the Capstone Project and team members from supplemental tabs within the Shiny app. The “Tutorials” tab on the Shiny app directs users to notebooks on our Group repository."),
                                            p("End-user tutorials on the steps needed to access, process, and visualize snow cover extent and albedo data. These elements help the Client achieve their goals for an updated Snow Today website that enables a larger set of users to access and interpret seasonal snow condition data."),
                                            img(src = "capstone_team.jpg", height = 400, style="display: block; margin-left: auto; margin-right: auto;", alt = "capstone teammembers"),
                                            br()
                                   ),
                                   tabPanel("Snow Today",
                                            h1("Snow Today"),
                                            p(tags$a(href="https://nsidc.org/reports/snow-today", "Snow Today"), "is an existing scientific analysis website that provides a near real time snapshot and interpretation of snow conditions across the Western United States. The Snow Today Website is a collaboration between the", tags$a(href="https://www.eri.ucsb.edu/", "UCSB Earth Research Institute,"), "the University of Colorado (CU) Boulder", tags$a(href="https://cires.colorado.edu/", "Cooperative Institute for Research in Environmental Sciences (CIRES),"), tags$a(href="https://instaar.colorado.edu/", "Institute of Arctic & Alpine Research (INSTAAR),"), "and the", tags$a(href="https://nsidc.org/", "National Snow and Ice Data Center (NSIDC)."), "This website provides earth scientists, natural resource managers, and outdoor enthusiasts with valuable data from remote sensing satellites and surface observation stations. Data visualizations are presented for snow cover area, snow cover days, albedo, and snow water equivalent. Current values are compared to past days, years, and decades. Snow Today plans to expand the spatial extent of its data products to include all of North America, Greenland, and High Mountain Asia."),
                                            br(),
                                            img(src = "snow_today_example_map.png", height = 400, style="display: block; margin-left: auto; margin-right: auto;"),
                                            br()
                                            ),
                                   tabPanel("Team Bios",
                                            h1("Team Bios"),
                                            h3("Ryan Munnikhuis"),
                                            h5("Role: Project Manager"),
                                            fluidRow(column(3,
                                                            img(src = "Munnikhuis_Ryan_meds22.jpg", height = 225.4, width = 150)),
                                                     column(8, p("Ryan Munnikhuis (RYE-awn MEW-nikh-HAOUSE; he/him) graduated from the University of California, Santa Cruz, in 2017 with a Bachelor of Science in Earth Science with a Concentration in Environmental Geology. Mr. Munnikhuis’s undergraduate education provided him a foundational understanding of the interactions between the biological, physical, and geologic processes. His senior capstone project utilized geospatial data to identify active faults and the extent of glacial moraines in Eastern Sierra Nevada to better understand the region’s complex Quaternary geologic history."),
                                                            p("Since graduating, Mr. Munnikhuis has worked as a forester and environmental analyst. As a forester, he has worked on various fire-related projects, including a community wildfire plan for Santa Barbara, a fuel reduction program for the County of Fresno, and a post-fire hazard tree assessment in Big Basin State Park. As an environmental analyst, he has assessed geologic, hydrologic, air quality, and greenhouse gas-related impacts of projects throughout California, such as a seismic dam retrofit in Merced County, a quarry restoration in San Diego County, and various large-scale developments."),
                                                            p("As a Bren MEDS student, Mr. Munnikhuis hopes to integrate his background with data science to better model and predict large-scale ecological and morphological changes resulting from climate change."),
                                                            h5("website:", tags$a(href="https://ryanmunnikhuis.github.io/", "ryanmunnikhuis.github.io")))),
                                            br(),
                                            h3("Julia Parish"),
                                            h5("Role: Communication Manager"),
                                            fluidRow(column(3,
                                                            img(src = "Parish_Julia_meds22.jpg", height = 225.5, width = 150)),
                                                     column(8, p("Julia Parish is an experienced Program Director with expertise in project management and invasion biology. She is currently a candidate for a master’s in Environmental Data Science at the Bren School of Environmental Science and Management at UC Santa Barbara. Since graduating from the University of Hawaii at Manoa with a B.A. in Environmental Studies, she has led field teams to enhance biological diversity, ecosystem health, and cultural and recreational resources on islands in the Pacific region and throughout Southern California. While working at Pohakuloa Training Area on Hawaii Island, she developed and implemented an invasive plant early detection and rapid response program, which involved establishing data collection and mapping standards. This experience solidified her passion for collecting and maintaining tidy data. After obtaining her master’s, she will focus on aiding land managers and conservation organizations with developing management priorities based on data science tools and analysis."),
                                                            h5("website: ", tags$a(href="https://juliaparish.github.io/", "juliaparish.github.io")))),
                                            br(),
                                            h3("Marie Rivers"),
                                            h5("Role: Data Manager"),
                                            fluidRow(column(3,
                                                            img(src = "Rivers_Marie_meds22.jpg", height = 225.4, width = 150)),
                                                     column(8, p("Marie holds Bachelors and Masters degrees in Environmental Engineering from the University of Delaware (2009) and University of Massachusetts (2011). She is also a registered professional civil water resources engineer with 10 years of consultant experience modeling and designing municipal drinking water distribution systems. During this time, she observed the growing need for reproducible data science and visualization skills to develop innovative solutions to current and emerging environmental problems. Marie grew up on a small New England lake with high water quality in part due to a mostly forested watershed. Throughout Marie’s academic and professional career, she gained a greater understanding of the factors that contribute to water quality. An initial interest in lake ecosystems expanded to a larger awareness of the interconnectedness of environmental conditions and public health. After graduation, Marie plans to use her professional experience and new data science skills to evaluate interactions between human and natural systems and support implementation of measures that protect and improve the environment by communicating these dynamics to wider audiences."),
                                                            h5("website: ", tags$a(href="https://marierivers.github.io/", "marierivers.github.io")))),
                                            br()
                                            ),
                                   tabPanel("Acknowledgements",
                                            h1("Acknowledgements"),
                                            p("The Snow Today Capstone Team would like to express our appreciation to all those who helped support and guide our project:"),
                                            fluidRow(
                                              column(2, tags$b("Faculty Advisors:")),
                                              column(8, "Dr. Sam Stevenson, Bren School of Environmental Science & Management",
                                                     br(),
                                                     "Dr. Allison Horst, Bren School of Environmental Science & Management")),
                                            br(),
                                            fluidRow(
                                              column(2, tags$b("Clients:")),
                                              column(8, "Dr. Timbo Stillinger, UCSB Earth Research Institute",
                                                     br(),
                                                     "Dr. Ned Bair, UCSB Earth Research Institute",
                                                     br(),
                                                     "Dr. Karl Rittger, CU Boulder Institute for Arctic and Alpine Research")),
                                            br(),
                                            fluidRow(
                                              column(2, tags$b("External Advisors:")),
                                              column(8, "Kat Le, Bren School for Environmental Science & Management",
                                                     br(),
                                                     "Niklas Griessbaum, Bren School of Environmental Science & Management",
                                                     br(),
                                                     "Dr. James Frew, Bren School for Environmental Science & Management",
                                                     br(),
                                                     "Aaron Martin, UCSB General Research IT",
                                                     br(),
                                                     "Mike Colee, UCSB General Research IT")),
                                            br(),
                                            fluidRow(
                                              column(2, tags$b("Special Thanks:")),
                                              column(8, "Jamie Montgomery, Bren School of Environmental Science & Management",
                                                     br(),
                                                     "Samantha Csik, National Center for Ecological Analysis & Synthesis",
                                                     br(),
                                                     "Brad Hill, Bren School of Environmental Science & Management",
                                                     br(),
                                                     "UCSB General Research Information & Technology team",
                                                     br(),
                                                     "National Snow and Ice Data Center Information & Technology team",
                                                     br(),
                                                     "and the endlessly supportive Master of Environmental Data Science cohort.")),
                                            br()
                                            )
             ))
                        
))


# create 'server'
# the server is a function that takes in inputs which are going to be the things that the user selects and then it's going to send back outputs which the user can see.
server <- function(input, output) {
  
  # palettes
  pal_scp <- colorNumeric(c("darkblue", "darkslategray4", "cyan2", "floralwhite"), 0:100,
                          na.color = "transparent")
  
  pal_scp_anom <- colorNumeric(c("firebrick4","firebrick1", "white", "royalblue2", "royalblue4"), -100:100,
                               na.color = "transparent")
  
  pal_albedo <- colorNumeric(c("darkgoldenrod4", "goldenrod2", "floralwhite"), domain = c(0.4, 0.9), na.color = "transparent")
  
  pal_albedo_anom <- colorBin(c("chocolate4", "chocolate3", "floralwhite", "mediumpurple1", "mediumpurple4" ), domain = c(-0.45, 0.45), bins = 5, na.color = "transparent")
  
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
      addRasterImage(daily_scp_brick_i(), colors = pal_scp, opacity = 0.9) %>%
      addLegend(pal = pal_scp, values = values(daily_scp_brick_i()),
                title = "percent") %>% 
      addControl("Daily Snow Cover Percent", position = "bottomleft")
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
      addRasterImage(daily_albedo_brick_i(), colors = pal_albedo, opacity = 0.9) %>%
      addLegend(pal = pal_albedo, values = values(daily_albedo_brick_i()), title = "albedo") %>% 
      addControl("Daily Albedo", position = "bottomleft")
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
      "snow cover<br>percent"
    } else if (input$variable1 == 2) {
      "albedo"
    }
  })
  
  # output$monthly_mean_header <- renderText({
  #   if (input$water_year_monthly_means == 1) {
  #     "Water Year 2001"
  #   } else if (input$water_year_monthly_means == 2) {
  #     "Water Year 2002"
  #   } else if (input$water_year_monthly_means == 3) {
  #     "Water Year 2003"
  #   } else if (input$water_year_monthly_means == 4) {
  #     "Water Year 2004"
  #   } else if (input$water_year_monthly_means == 5) {
  #     "Water Year 2005"
  #   } else if (input$water_year_monthly_means == 6) {
  #     "Water Year 2006"
  #   } else if (input$water_year_monthly_means == 7) {
  #     "Water Year 2007"
  #   } else if (input$water_year_monthly_means == 8) {
  #     "Water Year 2008"
  #   } else if (input$water_year_monthly_means == 9) {
  #     "Water Year 2009"
  #   } else if (input$water_year_monthly_means == 10) {
  #     "Water Year 2010"
  #   } else if (input$water_year_monthly_means == 11) {
  #     "Water Year 2011"
  #   } else if (input$water_year_monthly_means == 12) {
  #     "Water Year 2012"
  #   } else if (input$water_year_monthly_means == 13) {
  #     "Water Year 2013"
  #   } else if (input$water_year_monthly_means == 14) {
  #     "Water Year 2014"
  #   } else if (input$water_year_monthly_means == 15) {
  #     "Water Year 2015"
  #   } else if (input$water_year_monthly_means == 16) {
  #     "Water Year 2016"
  #   } else if (input$water_year_monthly_means == 17) {
  #     "Water Year 2017"
  #   } else if (input$water_year_monthly_means == 18) {
  #     "Water Year 2018"
  #   } else if (input$water_year_monthly_means == 19) {
  #     "Water Year 2019"
  #   } 
  # })
  
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
      addRasterImage(oct_mean_i(), colors = pal_monthly_mean(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_mean(), values = values(oct_mean_i()),
                title = legend_title_monthly_mean()) %>% 
      addControl("October Average", position = "bottomleft")
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
      addRasterImage(nov_mean_i(), colors = pal_monthly_mean(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_mean(), values = values(nov_mean_i()),
                title = legend_title_monthly_mean()) %>% 
      addControl("November Average", position = "bottomleft")
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
      addRasterImage(dec_mean_i(), colors = pal_monthly_mean(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_mean(), values = values(dec_mean_i()),
                title = legend_title_monthly_mean()) %>% 
      addControl("December Average", position = "bottomleft")
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
      addRasterImage(jan_mean_i(), colors = pal_monthly_mean(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_mean(), values = values(jan_mean_i()),
                title = legend_title_monthly_mean()) %>% 
      addControl("January Average", position = "bottomleft")
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
      addRasterImage(feb_mean_i(), colors = pal_monthly_mean(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_mean(), values = values(feb_mean_i()),
                title = legend_title_monthly_mean()) %>% 
      addControl("February Average", position = "bottomleft")
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
      addRasterImage(mar_mean_i(), colors = pal_monthly_mean(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_mean(), values = values(mar_mean_i()),
                title = legend_title_monthly_mean()) %>% 
      addControl("March Average", position = "bottomleft")
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
      addRasterImage(apr_mean_i(), colors = pal_monthly_mean(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_mean(), values = values(apr_mean_i()),
                title = legend_title_monthly_mean()) %>% 
      addControl("April Average", position = "bottomleft")
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
      addRasterImage(may_mean_i(), colors = pal_monthly_mean(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_mean(), values = values(may_mean_i()),
                title = legend_title_monthly_mean()) %>% 
      addControl("May Average", position = "bottomleft")
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
      addRasterImage(jun_mean_i(), colors = pal_monthly_mean(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_mean(), values = values(jun_mean_i()),
                title = legend_title_monthly_mean()) %>% 
      addControl("June Average", position = "bottomleft")
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
      addRasterImage(jul_mean_i(), colors = pal_monthly_mean(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_mean(), values = values(jul_mean_i()),
                title = legend_title_monthly_mean()) %>% 
      addControl("July Average", position = "bottomleft")
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
      addRasterImage(aug_mean_i(), colors = pal_monthly_mean(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_mean(), values = values(aug_mean_i()),
                title = legend_title_monthly_mean()) %>% 
      addControl("August Average", position = "bottomleft")
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
      addRasterImage(sep_mean_i(), colors = pal_monthly_mean(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_mean(), values = values(sep_mean_i()),
                title = legend_title_monthly_mean()) %>% 
      addControl("September Average", position = "bottomleft")
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
      "snow cover<br>anomaly"
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
      addRasterImage(oct_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(oct_anomaly_i()),
                title = legend_title_monthly_anomaly()) %>% 
      addControl("October Anomaly", position = "bottomleft")
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
      addRasterImage(nov_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(nov_anomaly_i()),
                title = legend_title_monthly_anomaly()) %>% 
      addControl("November Anomaly", position = "bottomleft")
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
      addRasterImage(dec_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(dec_anomaly_i()),
                title = legend_title_monthly_anomaly()) %>% 
      addControl("December Anomaly", position = "bottomleft")
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
      addRasterImage(jan_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(jan_anomaly_i()),
                title = legend_title_monthly_anomaly()) %>% 
      addControl("January Anomaly", position = "bottomleft")
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
      addRasterImage(feb_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(feb_anomaly_i()),
                title = legend_title_monthly_anomaly()) %>% 
      addControl("February Anomaly", position = "bottomleft")
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
      addRasterImage(mar_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(mar_anomaly_i()),
                title = legend_title_monthly_anomaly()) %>% 
      addControl("March Anomaly", position = "bottomleft")
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
      addRasterImage(apr_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(apr_anomaly_i()),
                title = legend_title_monthly_anomaly()) %>% 
      addControl("April Anomaly", position = "bottomleft")
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
      addRasterImage(may_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(may_anomaly_i()),
                title = legend_title_monthly_anomaly()) %>% 
      addControl("May Anomaly", position = "bottomleft")
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
      addRasterImage(jun_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(jun_anomaly_i()),
                title = legend_title_monthly_anomaly()) %>% 
      addControl("June Anomaly", position = "bottomleft")
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
      addRasterImage(jul_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(jul_anomaly_i()),
                title = legend_title_monthly_anomaly()) %>% 
      addControl("July Anomaly", position = "bottomleft")
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
      addRasterImage(aug_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(aug_anomaly_i()),
                title = legend_title_monthly_anomaly()) %>% 
      addControl("August Anomaly", position = "bottomleft")
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
      addRasterImage(sep_anomaly_i(), colors = pal_monthly_anomaly(), opacity = 0.9) %>%
      addLegend(pal = pal_monthly_anomaly(), values = values(sep_anomaly_i()),
                title = legend_title_monthly_anomaly()) %>% 
      addControl("September Anomaly", position = "bottomleft")
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
      "snow cover<br>percent"
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
      addRasterImage(annual_avg_i(), colors = pal_annual_mean(), opacity = 0.9) %>% 
      addLegend(pal = pal_annual_mean(), values = values(annual_avg_i()),
                title = legend_title_annual_mean()) %>% 
      addControl("Annual Average", position = "bottomleft")
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
      "snow cover<br>anomaly"
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
      addRasterImage(annual_anomaly_i(), colors = pal_annual_anomaly(), opacity = 0.9) %>% 
      addLegend(pal = pal_annual_anomaly(), values = values(annual_anomaly_i()),
                title = legend_title_annual_anomaly()) %>% 
      addControl("Annual Anomaly", position = "bottomleft")
  })
  
  output$annual_header <- renderText({
    if (input$water_year_annual == 1) {
      "Water Year 2001"
    } else if (input$water_year_annual == 2) {
      "Water Year 2002"
    } else if (input$water_year_annual == 3) {
      "Water Year 2003"
    } else if (input$water_year_annual == 4) {
      "Water Year 2004"
    } else if (input$water_year_annual == 5) {
      "Water Year 2005"
    } else if (input$water_year_annual == 6) {
      "Water Year 2006"
    } else if (input$water_year_annual == 7) {
      "Water Year 2007"
    } else if (input$water_year_annual == 8) {
      "Water Year 2008"
    } else if (input$water_year_annual == 9) {
      "Water Year 2009"
    } else if (input$water_year_annual == 10) {
      "Water Year 2010"
    } else if (input$water_year_annual == 11) {
      "Water Year 2011"
    } else if (input$water_year_annual == 12) {
      "Water Year 2012"
    } else if (input$water_year_annual == 13) {
      "Water Year 2013"
    } else if (input$water_year_annual == 14) {
      "Water Year 2014"
    } else if (input$water_year_annual == 15) {
      "Water Year 2015"
    } else if (input$water_year_annual == 16) {
      "Water Year 2016"
    } else if (input$water_year_annual == 17) {
      "Water Year 2017"
    } else if (input$water_year_annual == 18) {
      "Water Year 2018"
    } else if (input$water_year_annual == 19) {
      "Water Year 2019"
    } 
  })
  
  snow_cover_area_df <- reactive({
    snow_cover_data %>% 
      filter(water_year %in% c(input$wy_checkbox))
  })
  
  output$snow_cover_area_graph <- renderPlot({
    ggplot(data = snow_cover_area_df(), aes(x = day_of_wy, y = total_snow_cover_area)) +
      geom_line(aes(color = as.factor(water_year))) +
      scale_x_continuous(breaks = c(1, 32, 62, 93, 124, 152, 183, 213, 244, 275, 306, 337),
                         labels = c("Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep")) +
      labs(x = "day of water year", color = "water year",
           title = "Total Snow Cover Area",
           subtitle = "Sierra Mountain Region") +
      ylab(bquote("total snow cover area " ("thousand"-km^2)))
  })
  

}

# Let R know that you want to combine the ui & server into an app:
shinyApp(ui = ui, server = server)