setwd("./coursera//JHU_DS/c4_eda/week1")
dir()
library(data.table)
library(tidyverse)

# explore the dataset a little bit 
test_hpc <- fread("household_power_consumption.txt", nrows = 100, na.strings ="?")
colName <- names(test_hpc)

# import 2007-02-01 and 2007-02-02 data only using shell command
hp_consumption <- fread(cmd = "grep -E '1/2/2007|2/2/2007' household_power_consumption.txt", na.strings ="?", col.names = colName)

# plot 1 
png(file = "plot1.png")
hist(hp_consumption$Global_active_power, xlab = "Global Active Power (kilowatts)",col = "red", ylab = "Frequency", 
     main = "Global Active Power")
dev.off()