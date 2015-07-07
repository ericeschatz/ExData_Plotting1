## Coursera Exploratory Data Analysis
## Assignment 1
## plot2.R


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

unzip("household_power_consumption.zip")

raw_data <- as.data.frame(read.csv("household_power_consumption.txt", sep = ";", header = TRUE))

my_data <- raw_data[which(raw_data$Date %in% c("1/2/2007", "2/2/2007")),]

my_data[,1] <- as.Date(my_data[,1], format ="%d/%m/%Y")

png("plot2.png", width = 480, height = 480, units = "px")
with(my_data,plot(as.POSIXct(strftime(paste(my_data$Date, my_data$Time, sep = " "), 
	format = , usetz= FALSE)),as.character(my_data$Global_active_power), type = "l",
	xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off(which = dev.cur())