setwd("./coursera//JHU_DS/c4_eda/week1")
dir()
library(data.table)
library(tidyverse)

# explore the dataset a little bit 
test_hpc <- fread("household_power_consumption.txt", nrows = 100, na.strings ="?")
colName <- names(test_hpc)

# import 2007-02-01 and 2007-02-02 data only using shell command
hp_consumption <- fread(cmd = "grep -E '1/2/2007|2/2/2007' household_power_consumption.txt", na.strings ="?", col.names = colName)

# plot 3

png(file = "plot3.png")
plot(Date_Time, hp_consumption$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(Date_Time, hp_consumption$Sub_metering_2, col = "red")
lines(Date_Time, hp_consumption$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)
dev.off()