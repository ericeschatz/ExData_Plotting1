## Coursera Exploratory Data Analysis
## Assignment 1
## plot1.R

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

unzip("household_power_consumption.zip")

raw_data <- as.data.frame(read.csv("household_power_consumption.txt", sep = ";", header = TRUE))

my_data <- raw_data[which(raw_data$Date %in% c("1/2/2007", "2/2/2007")),]

my_data[,1] <- as.Date(my_data[,1], format ="%d/%m/%Y")

png("plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(as.character(my_data[,3])), xlab = "Global Active Power (kilowatts)",  ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off(which = dev.cur())