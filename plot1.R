# Fist plot
source("Download_data.R")

data <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE,data <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE,na.strings = "Not Available", stringsAsFactors = FALSE))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date == "2007-02-01"| data$Date == "2007-02-02",]
data$Global_active_power <- as.numeric(data$Global_active_power)


png("plot1.png")
hist(data$Global_active_power, col = "red" , xlab = "Global Active Power (kilowatts)" , 
     main = "Global Active Power")
dev.off()