if(!exists("./data")){dir.create(("./data"))}

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url , destfile = "./data/first_week.zip")
data_version <- date() #"Fri Dec 09 13:09:27 2016"

library(utils)
unzip("./data/first_week.zip", exdir = "./data")