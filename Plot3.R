data <- read.table("data.txt", header = TRUE, sep = ";")
library(lubridate)
library(dplyr)

subData <- data


Data <- subData %>% filter(Date >= "2007-02-01" & 
                             Date <= as.Date("2007-02-02"))
Data <- Data %>% mutate(date_time = as.POSIXct(paste(Date, Time), 
                                               format = "%Y-%m-%d %H:%M:%S"))

plot(Data$date_time, Data$Sub_metering_1, ylab = "Energy sub metering", 
     xlab = "", type = "l")
lines(Data$date_time, Data$Sub_metering_2, type = "l", col = "red")
lines(Data$date_time, Data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

png(file = "plot3.png",width = 480, height = 480)
plot(Data$date_time, Data$Sub_metering_1, ylab = "Energy sub metering", 
     xlab = "", type = "l")
lines(Data$date_time, Data$Sub_metering_2, type = "l", col = "red")
lines(Data$date_time, Data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()
