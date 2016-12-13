# Second plot
source("Download_data.R")


data <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE,na.strings = "Not Available", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date == "2007-02-01"| data$Date == "2007-02-02",]
data$Global_active_power <- as.numeric(data$Global_active_power)

date_hour <- c()
for (i in 1:length(data$Global_active_power)){
   elem <- paste(data$Date[i],data$Time[i], sep=" ")
   date_hour <- c(date_hour, elem)
}
date_hour <- strptime(date_hour,"%Y-%m-%d %H:%M:%S")

png("plot2.png")
plot(date_hour,data$Global_active_power, type = "l" , ylab = "Global Active Power (kilowatts)",xlab = " " )
dev.off()
