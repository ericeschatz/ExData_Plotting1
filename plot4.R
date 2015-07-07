## Coursera Exploratory Data Analysis
## Assignment 1
## plot4.R


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

unzip("household_power_consumption.zip")

raw_data <- as.data.frame(read.csv("household_power_consumption.txt", sep = ";", header = TRUE))

my_data <- raw_data[which(raw_data$Date %in% c("1/2/2007", "2/2/2007")),]

my_data[,1] <- as.Date(my_data[,1], format ="%d/%m/%Y")

png("plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))
with (my_data, {
	plot(as.POSIXct(strftime(paste(my_data$Date, my_data$Time, sep = " "), 
		format = , usetz= FALSE)),as.character(my_data$Global_active_power), type = "l",
		xlab = "", ylab = "Global Active Power")
	plot(as.POSIXct(strftime(paste(my_data$Date, my_data$Time, sep = " "), 
		format = , usetz= FALSE)),as.character(my_data$Voltage), type = "l",
		xlab = "datetime", ylab = "Voltage")
	plot(as.POSIXct(strftime(paste(my_data$Date, my_data$Time, sep = " "), 
		format = , usetz= FALSE)),as.character(my_data$Sub_metering_1), type = "l",
		xlab = "", ylab = "Energy sub metering")
			points(as.POSIXct(strftime(paste(my_data$Date, my_data$Time, sep = " "), 
			format = , usetz= FALSE)),as.character(my_data$Sub_metering_2), type = "l", col = "red")
			points(as.POSIXct(strftime(paste(my_data$Date, my_data$Time, sep = " "), 
			format = , usetz= FALSE)),as.character(my_data$Sub_metering_3), type = "l", col = "blue")
		legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty = 1, bty = "n")
	plot(as.POSIXct(strftime(paste(my_data$Date, my_data$Time, sep = " "), 
		format = , usetz= FALSE)),as.character(my_data$Global_reactive_power), type = "l",
		xlab = "datetime", ylab = "Global_reactive_power")
	})
	
dev.off(which = dev.cur())