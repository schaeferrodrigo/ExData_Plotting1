# plot 4
source("Download_data.R")


data <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE,data <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE,na.strings = "Not Available", stringsAsFactors = FALSE))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date == "2007-02-01"| data$Date == "2007-02-02",]

date_hour <- c()
for (i in 1:length(data$Global_active_power)){
  elem <- paste(data$Date[i],data$Time[i], sep=" ")
  date_hour <- c(date_hour, elem)
}
date_hour <- strptime(date_hour,"%Y-%m-%d %H:%M:%S")

data$date_hour <- date_hour

png("plot4.png")
par(mfrow = c(2,2))
#plot a 
plot(date_hour,data$Global_active_power, type = "l" , ylab = "Global Active Power",xlab = " " )
#plot b
plot(date_hour, data$Voltage, type = 'l', ylab = "Voltage", xlab = "datetime")
#plot c
with(data, plot(date_hour, Sub_metering_1 ,ylab = "Energy sub metering",xlab = " ", type = "n"))
lines(data$date_hour , data$Sub_metering_1 )
lines(data$date_hour , data$Sub_metering_2 , col = "red")
lines(data$date_hour , data$Sub_metering_3 , col = "blue")
legend("topright" , col = c("black" , "red" , "blue") , legend= c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3") , lty=c(1,1,1),cex = 0.5, box.lty = 0 )
#plot d
plot(date_hour, data$Global_reactive_power, type= 'l', ylab = "Global_reactive_power", xlab ="datetime")
dev.off()
