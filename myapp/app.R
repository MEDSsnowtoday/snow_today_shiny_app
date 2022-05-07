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
#library(terra)
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
october__mean_scp_brick <- brick(october_mean_scp_brick)

november_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "november_mean_scp_stack.tif"))
november_mean_scp_brick <- brick(november_mean_scp_brick)

december_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "december_mean_scp_stack.tif"))
december_mean_scp_brick <- brick(december_mean_scp_brick)

wy2001_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2001_monthly_mean_scp_stack.tif"))
wy2001_monthly_mean_scp_brick <- brick(wy2001_monthly_mean_scp_brick)

wy2002_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2002_monthly_mean_scp_stack.tif"))
wy2002_monthly_mean_scp_brick <- brick(wy2002_monthly_mean_scp_brick)

wy2003_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2003_monthly_mean_scp_stack.tif"))
wy2003_monthly_mean_scp_brick <- brick(wy2003_monthly_mean_scp_brick)

wy2004_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2004_monthly_mean_scp_stack.tif"))
wy2004_monthly_mean_scp_brick <- brick(wy2004_monthly_mean_scp_brick)

wy2005_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2005_monthly_mean_scp_stack.tif"))
wy2005_monthly_mean_scp_brick <- brick(wy2005_monthly_mean_scp_brick)

wy2006_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2006_monthly_mean_scp_stack.tif"))
wy2006_monthly_mean_scp_brick <- brick(wy2006_monthly_mean_scp_brick)

wy2007_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2007_monthly_mean_scp_stack.tif"))
wy2007_monthly_mean_scp_brick <- brick(wy2007_monthly_mean_scp_brick)

wy2008_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2008_monthly_mean_scp_stack.tif"))
wy2008_monthly_mean_scp_brick <- brick(wy2008_monthly_mean_scp_brick)

wy2009_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2009_monthly_mean_scp_stack.tif"))
wy2009_monthly_mean_scp_brick <- brick(wy2009_monthly_mean_scp_brick)

wy2010_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2010_monthly_mean_scp_stack.tif"))
wy2010_monthly_mean_scp_brick <- brick(wy2010_monthly_mean_scp_brick)

wy2011_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2011_monthly_mean_scp_stack.tif"))
wy2011_monthly_mean_scp_brick <- brick(wy2011_monthly_mean_scp_brick)

wy2012_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2012_monthly_mean_scp_stack.tif"))
wy2012_monthly_mean_scp_brick <- brick(wy2012_monthly_mean_scp_brick)

wy2013_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2013_monthly_mean_scp_stack.tif"))
wy2013_monthly_mean_scp_brick <- brick(wy2013_monthly_mean_scp_brick)

wy2014_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2014_monthly_mean_scp_stack.tif"))
wy2014_monthly_mean_scp_brick <- brick(wy2014_monthly_mean_scp_brick)

wy2015_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2015_monthly_mean_scp_stack.tif"))
wy2015_monthly_mean_scp_brick <- brick(wy2015_monthly_mean_scp_brick)

wy2016_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2016_monthly_mean_scp_stack.tif"))
wy2016_monthly_mean_scp_brick <- brick(wy2016_monthly_mean_scp_brick)

wy2017_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2017_monthly_mean_scp_stack.tif"))
wy2017_monthly_mean_scp_brick <- brick(wy2017_monthly_mean_scp_brick)

wy2018_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2018_monthly_mean_scp_stack.tif"))
wy2018_monthly_mean_scp_brick <- brick(wy2018_monthly_mean_scp_brick)

wy2019_monthly_mean_scp_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "mean", "wy2019_monthly_mean_scp_stack.tif"))
wy2019_monthly_mean_scp_brick <- brick(wy2019_monthly_mean_scp_brick)

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

wy2001_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2001_monthly_scp_anomaly_stack.tif"))
wy2001_monthly_scp_anomaly_brick <- brick(wy2001_monthly_scp_anomaly_brick)

wy2002_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2002_monthly_scp_anomaly_stack.tif"))
wy2002_monthly_scp_anomaly_brick <- brick(wy2002_monthly_scp_anomaly_brick)

wy2003_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2003_monthly_scp_anomaly_stack.tif"))
wy2003_monthly_scp_anomaly_brick <- brick(wy2003_monthly_scp_anomaly_brick)

wy2004_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2004_monthly_scp_anomaly_stack.tif"))
wy2004_monthly_scp_anomaly_brick <- brick(wy2004_monthly_scp_anomaly_brick)

wy2005_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2005_monthly_scp_anomaly_stack.tif"))
wy2005_monthly_scp_anomaly_brick <- brick(wy2005_monthly_scp_anomaly_brick)

wy2006_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2006_monthly_scp_anomaly_stack.tif"))
wy2006_monthly_scp_anomaly_brick <- brick(wy2006_monthly_scp_anomaly_brick)

wy2007_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2007_monthly_scp_anomaly_stack.tif"))
wy2007_monthly_scp_anomaly_brick <- brick(wy2007_monthly_scp_anomaly_brick)

wy2008_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2008_monthly_scp_anomaly_stack.tif"))
wy2008_monthly_scp_anomaly_brick <- brick(wy2008_monthly_scp_anomaly_brick)

wy2009_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2009_monthly_scp_anomaly_stack.tif"))
wy2009_monthly_scp_anomaly_brick <- brick(wy2009_monthly_scp_anomaly_brick)

wy2010_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2010_monthly_scp_anomaly_stack.tif"))
wy2010_monthly_scp_anomaly_brick <- brick(wy2010_monthly_scp_anomaly_brick)

wy2011_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2011_monthly_scp_anomaly_stack.tif"))
wy2011_monthly_scp_anomaly_brick <- brick(wy2011_monthly_scp_anomaly_brick)

wy2012_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2012_monthly_scp_anomaly_stack.tif"))
wy2012_monthly_scp_anomaly_brick <- brick(wy2012_monthly_scp_anomaly_brick)

wy2013_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2013_monthly_scp_anomaly_stack.tif"))
wy2013_monthly_scp_anomaly_brick <- brick(wy2013_monthly_scp_anomaly_brick)

wy2014_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2014_monthly_scp_anomaly_stack.tif"))
wy2014_monthly_scp_anomaly_brick <- brick(wy2014_monthly_scp_anomaly_brick)

wy2015_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2015_monthly_scp_anomaly_stack.tif"))
wy2015_monthly_scp_anomaly_brick <- brick(wy2015_monthly_scp_anomaly_brick)

wy2016_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2016_monthly_scp_anomaly_stack.tif"))
wy2016_monthly_scp_anomaly_brick <- brick(wy2016_monthly_scp_anomaly_brick)

wy2017_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2017_monthly_scp_anomaly_stack.tif"))
wy2017_monthly_scp_anomaly_brick <- brick(wy2017_monthly_scp_anomaly_brick)

wy2018_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2018_monthly_scp_anomaly_stack.tif"))
wy2018_monthly_scp_anomaly_brick <- brick(wy2018_monthly_scp_anomaly_brick)

wy2019_monthly_scp_anomaly_brick <- (here("myapp", "data", "snow_cover_percent", "monthly", "anomaly", "wy2019_monthly_scp_anomaly_stack.tif"))
wy2019_monthly_scp_anomaly_brick <- brick(wy2019_monthly_scp_anomaly_brick)

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
october__mean_albedo_brick <- brick(october_mean_albedo_brick)

november_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "november_mean_albedo_stack.tif"))
november_mean_albedo_brick <- brick(november_mean_albedo_brick)

december_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "december_mean_albedo_stack.tif"))
december_mean_albedo_brick <- brick(december_mean_albedo_brick)

wy2001_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2001_monthly_mean_albedo_stack.tif"))
wy2001_monthly_mean_albedo_brick <- brick(wy2001_monthly_mean_albedo_brick)

wy2002_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2002_monthly_mean_albedo_stack.tif"))
wy2002_monthly_mean_albedo_brick <- brick(wy2002_monthly_mean_albedo_brick)

wy2003_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2003_monthly_mean_albedo_stack.tif"))
wy2003_monthly_mean_albedo_brick <- brick(wy2003_monthly_mean_albedo_brick)

wy2004_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2004_monthly_mean_albedo_stack.tif"))
wy2004_monthly_mean_albedo_brick <- brick(wy2004_monthly_mean_albedo_brick)

wy2005_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2005_monthly_mean_albedo_stack.tif"))
wy2005_monthly_mean_albedo_brick <- brick(wy2005_monthly_mean_albedo_brick)

wy2006_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2006_monthly_mean_albedo_stack.tif"))
wy2006_monthly_mean_albedo_brick <- brick(wy2006_monthly_mean_albedo_brick)

wy2007_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2007_monthly_mean_albedo_stack.tif"))
wy2007_monthly_mean_albedo_brick <- brick(wy2007_monthly_mean_albedo_brick)

wy2008_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2008_monthly_mean_albedo_stack.tif"))
wy2008_monthly_mean_albedo_brick <- brick(wy2008_monthly_mean_albedo_brick)

wy2009_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2009_monthly_mean_albedo_stack.tif"))
wy2009_monthly_mean_albedo_brick <- brick(wy2009_monthly_mean_albedo_brick)

wy2010_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2010_monthly_mean_albedo_stack.tif"))
wy2010_monthly_mean_albedo_brick <- brick(wy2010_monthly_mean_albedo_brick)

wy2011_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2011_monthly_mean_albedo_stack.tif"))
wy2011_monthly_mean_albedo_brick <- brick(wy2011_monthly_mean_albedo_brick)

wy2012_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2012_monthly_mean_albedo_stack.tif"))
wy2012_monthly_mean_albedo_brick <- brick(wy2012_monthly_mean_albedo_brick)

wy2013_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2013_monthly_mean_albedo_stack.tif"))
wy2013_monthly_mean_albedo_brick <- brick(wy2013_monthly_mean_albedo_brick)

wy2014_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2014_monthly_mean_albedo_stack.tif"))
wy2014_monthly_mean_albedo_brick <- brick(wy2014_monthly_mean_albedo_brick)

wy2015_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2015_monthly_mean_albedo_stack.tif"))
wy2015_monthly_mean_albedo_brick <- brick(wy2015_monthly_mean_albedo_brick)

wy2016_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2016_monthly_mean_albedo_stack.tif"))
wy2016_monthly_mean_albedo_brick <- brick(wy2016_monthly_mean_albedo_brick)

wy2017_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2017_monthly_mean_albedo_stack.tif"))
wy2017_monthly_mean_albedo_brick <- brick(wy2017_monthly_mean_albedo_brick)

wy2018_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2018_monthly_mean_albedo_stack.tif"))
wy2018_monthly_mean_albedo_brick <- brick(wy2018_monthly_mean_albedo_brick)

wy2019_monthly_mean_albedo_brick <- (here("myapp", "data", "albedo", "monthly", "mean", "wy2019_monthly_mean_albedo_stack.tif"))
wy2019_monthly_mean_albedo_brick <- brick(wy2019_monthly_mean_albedo_brick)

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

wy2001_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2001_albedo_anomaly_stack.tif"))
wy2001_albedo_anomaly_brick <- brick(wy2001_albedo_anomaly_brick)

wy2002_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2002_albedo_anomaly_stack.tif"))
wy2002_albedo_anomaly_brick <- brick(wy2002_albedo_anomaly_brick)

wy2003_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2003_albedo_anomaly_stack.tif"))
wy2003_albedo_anomaly_brick <- brick(wy2003_albedo_anomaly_brick)

wy2004_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2004_albedo_anomaly_stack.tif"))
wy2004_albedo_anomaly_brick <- brick(wy2004_albedo_anomaly_brick)

wy2005_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2005_albedo_anomaly_stack.tif"))
wy2005_albedo_anomaly_brick <- brick(wy2005_albedo_anomaly_brick)

wy2006_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2006_albedo_anomaly_stack.tif"))
wy2006_albedo_anomaly_brick <- brick(wy2006_albedo_anomaly_brick)

wy2007_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2007_albedo_anomaly_stack.tif"))
wy2007_albedo_anomaly_brick <- brick(wy2007_albedo_anomaly_brick)

wy2008_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2008_albedo_anomaly_stack.tif"))
wy2008_albedo_anomaly_brick <- brick(wy2008_albedo_anomaly_brick)

wy2009_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2009_albedo_anomaly_stack.tif"))
wy2009_albedo_anomaly_brick <- brick(wy2009_albedo_anomaly_brick)

wy2010_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2010_albedo_anomaly_stack.tif"))
wy2010_albedo_anomaly_brick <- brick(wy2010_albedo_anomaly_brick)

wy2011_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2011_albedo_anomaly_stack.tif"))
wy2011_albedo_anomaly_brick <- brick(wy2011_albedo_anomaly_brick)

wy2012_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2012_albedo_anomaly_stack.tif"))
wy2012_albedo_anomaly_brick <- brick(wy2012_albedo_anomaly_brick)

wy2013_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2013_albedo_anomaly_stack.tif"))
wy2013_albedo_anomaly_brick <- brick(wy2013_albedo_anomaly_brick)

wy2014_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2014_albedo_anomaly_stack.tif"))
wy2014_albedo_anomaly_brick <- brick(wy2014_albedo_anomaly_brick)

wy2015_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2015_albedo_anomaly_stack.tif"))
wy2015_albedo_anomaly_brick <- brick(wy2015_albedo_anomaly_brick)

wy2016_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2016_albedo_anomaly_stack.tif"))
wy2016_albedo_anomaly_brick <- brick(wy2016_albedo_anomaly_brick)

wy2017_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2017_albedo_anomaly_stack.tif"))
wy2017_albedo_anomaly_brick <- brick(wy2017_albedo_anomaly_brick)

wy2018_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2018_albedo_anomaly_stack.tif"))
wy2018_albedo_anomaly_brick <- brick(wy2018_albedo_anomaly_brick)

wy2019_albedo_anomaly_brick <- (here("myapp", "data", "albedo", "monthly", "anomaly", "wy2019_albedo_anomaly_stack.tif"))
wy2019_albedo_anomaly_brick <- brick(wy2019_albedo_anomaly_brick)

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
                      sidebarLayout(
                        sidebarPanel("Select a Water Year",
                                     selectInput("water_year", label = h3("Select Water Year"),
                                                 choices = list("Water Year 2001" = 1, "Water Year 2002" = 2, "Water Year 2003" = 3, "Water Year 2004" = 4,
                                                                "Water Year 2005" = 5, "Water Year 2006" = 6, "Water Year 2007" = 7, "Water Year 2008" = 8,
                                                                "Water Year 2009" = 9, "Water Year 2010" = 10, "Water Year 2011" = 11, "Water Year 2012" = 12,
                                                                "Water Year 2013" = 13, "Water Year 2014" = 14, "Water Year 2015" = 15, "Water Year 2016" = 16,
                                                                "Water Year 2017" = 17, "Water Year 2018" = 18, "Water Year 2019" = 19))),
                        mainPanel("Annual Mean Snow Cover Percent",
                                leafletOutput(outputId = "annual_mean_scp"),
                                p(""),
                                "Monthly Mean Snow Cover Percent",
                                tabsetPanel(
                                  tabPanel("October", leafletOutput(outputId = "oct_mean_scp")),
                                  tabPanel("November", leafletOutput(outputId = "nov_mean_scp")),
                                  tabPanel("December", leafletOutput(outputId = "dec_mean_scp")),
                                  tabPanel("January", leafletOutput(outputId = "jan_mean_scp")),
                                  # tabPanel("February", leafletOutput(outputId = "feb_mean_scp")),
                                  # tabPanel("March", leafletOutput(outputId = "mar_mean_scp")),
                                  # tabPanel("April", leafletOutput(outputId = "apr_mean_scp")),
                                  # tabPanel("May", leafletOutput(outputId = "may_mean_scp")),
                                  # tabPanel("June", leafletOutput(outputId = "jun_mean_scp")),
                                  # tabPanel("July", leafletOutput(outputId = "jul_mean_scp")),
                                  # tabPanel("August", leafletOutput(outputId = "aug_mean_scp")),
                                  # tabPanel("September", leafletOutput(outputId = "sep_mean_scp")),
                                  h5("some text to explain things"),
                                  p("Citation: xxx")))
                      )),
             tabPanel("Anomalies",
                      p("add visualizations of annual and monthly snow cover and albedo anomalies"),
                      sidebarLayout(
                        sidebarPanel("Select a Water Year",
                                     selectInput("water_year", label = h3("Select Water Year"),
                                                 choices = list("Water Year 2001" = "wy2001", "Water Year 2002" = "wy2002", "Water Year 2003" = "wy2003", "Water Year 2004" = "wy2004",
                                                                "Water Year 2005" = "wy2005", "Water Year 2006" = "wy2006", "Water Year 2007" = "wy2007", "Water Year 2008" = "wy2008",
                                                                "Water Year 2009" = "wy2009", "Water Year 2010" = "wy2010", "Water Year 2011" = "wy2011", "Water Year 2012" = "wy2012",
                                                                "Water Year 2013" = "wy2013", "Water Year 2014" = "wy2014", "Water Year 2015" = "wy2015", "Water Year 2016" = "wy2016",
                                                                "Water Year 2017" = "wy2017", "Water Year 2018" = "wy2018", "Water Year 2019" = "wy2019"))),
                        mainPanel("Annual Snow Cover Percent Anomaly",
                                  leafletOutput(outputId = "annual_scp_anomaly"),
                                  p(""),
                                  "Monthly Snow Cover Percent Anomaly",
                                  tabsetPanel(
                                    tabPanel("October", leafletOutput(outputId = "oct_scp_anomaly")),
                                    tabPanel("November", leafletOutput(outputId = "nov_scp_anomaly")),
                                    tabPanel("December", leafletOutput(outputId = "dec_scp_anomaly")),
                                    tabPanel("January", leafletOutput(outputId = "jan_scp_anomaly")),
                                    tabPanel("February", leafletOutput(outputId = "feb_scp_anomaly")),
                                    tabPanel("March", leafletOutput(outputId = "mar_scp_anomaly")),
                                    tabPanel("April", leafletOutput(outputId = "apr_scp_anomaly")),
                                    tabPanel("May", leafletOutput(outputId = "may_scp_anomaly")),
                                    tabPanel("June", leafletOutput(outputId = "jun_scp_anomaly")),
                                    tabPanel("July", leafletOutput(outputId = "jul_scp_anomaly")),
                                    tabPanel("August", leafletOutput(outputId = "aug_scp_anomaly")),
                                    tabPanel("September", leafletOutput(outputId = "sep_scp_anomaly")),
                                    h5("some text to explain things"),
                                    p("Citation: xxx")))
                      )),
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
  
  # palettes
  pal_scp <- colorNumeric(c("#0C2C84", "#41B6C4", "#FFFFCC"), 1:100,
                          na.color = "transparent")
  
  pal_albedo <- colorNumeric(c("brown", "orange", "red"), 0:1,
                             na.color = "transparent")
  
  pal_mask <- colorNumeric(c("gray"), 999,
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
      addTiles() %>%
      addRasterImage(project_area_mask, colors = pal_mask, opacity = 0.5) %>%
      addRasterImage(daily_albedo_brick_i(), colors = pal_albedo, opacity = 0.75) %>%
      addLegend(pal = pal_albedo, values = values(daily_albedo_brick_i()), title = "Albedo")
  })

  annual_snow_cover_percent_i <- reactive({
    annual_snow_cover_percent_brick[[as.numeric(input$water_year)]]
  })
  
  output$annual_mean_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(annual_snow_cover_percent_i(), colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(annual_snow_cover_percent_i()),
                title = "percent")
  })
  
  oct_mean_scp_i <- reactive ({
    if (input$water_year == 1) {
      wy2001_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 2) {
      wy2002_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 3) {
      wy2003_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 4) {
      wy2004_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 5) {
      wy2005_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 6) {
      wy2006_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 7) {
      wy2007_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 8) {
      wy2008_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 9) {
      wy2009_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 10) {
      wy2010_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 11) {
      wy2011_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 12) {
      wy2012_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 13) {
      wy2013_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 14) {
      wy2014_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 15) {
      wy2015_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 16) {
      wy2016_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 17) {
      wy2017_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 18) {
      wy2018_monthly_mean_scp_brick[[9]]
    } else if (input$water_year == 19) {
      wy2019_monthly_mean_scp_brick[[9]]
    }
  })
  
  # leaflet map of monthly mean snow cover percent
  output$oct_mean_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(oct_mean_scp_i(), colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(oct_mean_scp_i()),
                title = "percent")
  })
  
  nov_mean_scp_i <- reactive ({
    if (input$water_year == 1) {
      wy2001_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 2) {
      wy2002_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 3) {
      wy2003_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 4) {
      wy2004_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 5) {
      wy2005_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 6) {
      wy2006_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 7) {
      wy2007_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 8) {
      wy2008_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 9) {
      wy2009_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 10) {
      wy2010_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 11) {
      wy2011_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 12) {
      wy2012_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 13) {
      wy2013_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 14) {
      wy2014_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 15) {
      wy2015_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 16) {
      wy2016_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 17) {
      wy2017_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 18) {
      wy2018_monthly_mean_scp_brick[[10]]
    } else if (input$water_year == 19) {
      wy2019_monthly_mean_scp_brick[[10]]
    }
  })
  
  output$nov_mean_scp <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      addRasterImage(nov_mean_scp_i(), colors = pal_scp, opacity = 0.75) %>% 
      addLegend(pal = pal_scp, values = values(nov_mean_scp_i()),
                title = "percent")
  })
  
  dec_mean_scp_i <- reactive ({
    if (input$water_year == 1) {
      wy2001_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 2) {
      wy2002_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 3) {
      wy2003_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 4) {
      wy2004_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 5) {
      wy2005_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 6) {
      wy2006_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 7) {
      wy2007_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 8) {
      wy2008_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 9) {
      wy2009_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 10) {
      wy2010_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 11) {
      wy2011_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 12) {
      wy2012_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 13) {
      wy2013_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 14) {
      wy2014_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 15) {
      wy2015_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 16) {
      wy2016_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 17) {
      wy2017_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 18) {
      wy2018_monthly_mean_scp_brick[[11]]
    } else if (input$water_year == 19) {
      wy2019_monthly_mean_scp_brick[[11]]
    }
  })

  output$dec_mean_scp <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addRasterImage(dec_mean_scp_i(), colors = pal_scp, opacity = 0.75) %>%
      addLegend(pal = pal_scp, values = values(dec_mean_scp_i()),
                title = "percent")
  })
  
  jan_mean_scp_i <- reactive ({
    if (input$water_year == 1) {
      wy2001_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 2) {
      wy2002_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 3) {
      wy2003_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 4) {
      wy2004_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 5) {
      wy2005_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 6) {
      wy2006_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 7) {
      wy2007_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 8) {
      wy2008_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 9) {
      wy2009_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 10) {
      wy2010_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 11) {
      wy2011_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 12) {
      wy2012_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 13) {
      wy2013_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 14) {
      wy2014_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 15) {
      wy2015_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 16) {
      wy2016_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 17) {
      wy2017_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 18) {
      wy2018_monthly_mean_scp_brick[[0]]
    } else if (input$water_year == 19) {
      wy2019_monthly_mean_scp_brick[[0]]
    }
  })
  
  output$jan_mean_scp_i <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addRasterImage(jan_mean_scp_i(), colors = pal_scp, opacity = 0.75) %>%
      addLegend(pal = pal_scp, values = values(jan_mean_scp_i()),
                title = "percent")
  })

  output$feb_mean_scp_i <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addRasterImage(feb_mean_scp(), colors = pal_scp, opacity = 0.75) %>%
      addLegend(pal = pal_scp, values = values(feb_mean_scp_i()),
                title = "percent")
  })

  output$mar_mean_scp_i <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addRasterImage(mar_mean_scp(), colors = pal_scp, opacity = 0.75) %>%
      addLegend(pal = pal_scp, values = values(mar_mean_scp_i()),
                title = "percent")
  })

  output$apr_mean_scp_i <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addRasterImage(apr_mean_scp(), colors = pal_scp, opacity = 0.75) %>%
      addLegend(pal = pal_scp, values = values(apr_mean_scp_i()),
                title = "percent")
  })

  output$may_mean_scp_i <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addRasterImage(may_mean_scp(), colors = pal_scp, opacity = 0.75) %>%
      addLegend(pal = pal_scp, values = values(may_mean_scp_i()),
                title = "percent")
  })

  output$jun_mean_scp_i <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addRasterImage(jun_mean_scp(), colors = pal_scp, opacity = 0.75) %>%
      addLegend(pal = pal_scp, values = values(jun_mean_scp_i()),
                title = "percent")
  })

  output$jul_mean_scp_i <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addRasterImage(jul_mean_scp(), colors = pal_scp, opacity = 0.75) %>%
      addLegend(pal = pal_scp, values = values(jul_mean_scp_i()),
                title = "percent")
  })

  output$aug_mean_scp_i <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addRasterImage(aug_mean_scp(), colors = pal_scp, opacity = 0.75) %>%
      addLegend(pal = pal_scp, values = values(aug_mean_scp_i()),
                title = "percent")
  })

  output$sep_mean_scp_i <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addRasterImage(sep_mean_scp(), colors = pal_scp, opacity = 0.75) %>%
      addLegend(pal = pal_scp, values = values(sep_mean_scp_i()),
                title = "percent")
  })


}

# Let R know that you want to combine the ui & server into an app:
shinyApp(ui = ui, server = server)