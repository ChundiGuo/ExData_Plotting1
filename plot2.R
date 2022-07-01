setwd("./coursera//JHU_DS/c4_eda/week1")
dir()
library(data.table)
library(tidyverse)

# explore the dataset a little bit 
test_hpc <- fread("household_power_consumption.txt", nrows = 100, na.strings ="?")
colName <- names(test_hpc)

# import 2007-02-01 and 2007-02-02 data only using shell command
hp_consumption <- fread(cmd = "grep -E '1/2/2007|2/2/2007' household_power_consumption.txt", na.strings ="?", col.names = colName)

# plot 2
hp_consumption <- fread(cmd = "grep -E '^1/2/2007|^2/2/2007' household_power_consumption.txt", na.strings ="?", col.names = colName) %>%
    unite("Date_Time", Date : Time, sep = " ")

Date_Time <- hp_consumption$Date_Time %>% strptime("%d/%m/%Y %H:%M:%S") # change format 

png(file = "plot2.png")
plot(Date_Time, hp_consumption$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l" )
dev.off()