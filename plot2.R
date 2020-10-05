data <- read.table("data.txt", header = TRUE, sep = ";")
library(lubridate)
library(dplyr)

subData <- data


Data <- subData %>% filter(Date >= "2007-02-01" & 
                             Date <= as.Date("2007-02-02"))
Data <- Data %>% mutate(date_time = as.POSIXct(paste(Date, Time), 
                                                format = "%Y-%m-%d %H:%M:%S"))
with(Data, plot(date_time, Global_active_power, type = "l",
                ylab = "Global Active Power (kilowatts)", xlab = " "))

png(file = "plot2.png",width = 480, height = 480)
with(Data, plot(date_time, Global_active_power, type = "l",
                ylab = "Global Active Power (kilowatts)", xlab = " "))
dev.off()
