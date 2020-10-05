data <- read.table("data.txt", header = TRUE, sep = ";")
library(lubridate)
library(dplyr)

subData <- data


Data <- subData %>% filter(Date >= "2007-02-01" & 
                             Date <= as.Date("2007-02-02"))
Data <- Data %>% mutate(date_time = as.POSIXct(paste(Date, Time), 
                                               format = "%Y-%m-%d %H:%M:%S"))

png(file = "plot4.png",width = 480, height = 480)
par(mfrow= c(2,2))

#Plot 1
with(Data, plot(date_time, Global_active_power, type = "l",
                ylab = "Global Active Power (kilowatts)", xlab = " "))

#Plot2
with(Data, plot(date_time, Voltage, type = "l",
                ylab = "Voltage", xlab = "datetime"))

#plot3
plot(Data$date_time, Data$Sub_metering_1, ylab = "Energy sub metering", 
     xlab = "", type = "l")
lines(Data$date_time, Data$Sub_metering_2, type = "l", col = "red")
lines(Data$date_time, Data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

#plot4
with(Data, plot(date_time, Global_reactive_power, type = "l",
                ylab = "Global_reactive_power", xlab = "datetime"))
dev.off()
