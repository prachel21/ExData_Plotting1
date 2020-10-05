data <- read.table("data.txt", header = TRUE, sep = ";")
library(lubridate)
library(dplyr)

subData <- data
subData[,1] <- as.Date(subData[,1], format = "%d/%m/%Y" )

Data <- subData %>% filter(Date >= "2007-02-01" & 
                             Date <= as.Date("2007-02-02"))
str(Data)
Data[,3] <-as.numeric(Data[,3])
str(Data)
hist(Data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")


png(file = "plot1.png",width = 480, height = 480)
hist(Data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
