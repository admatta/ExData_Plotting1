# Script Plot1.r downloads a file on electric power consumption
# It then transforms the data - Date and time specifically
# It then draws a histogram of global active power for dates between
# 2007-02-01 and 2007-02-02 and output the result in the PNG format
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="Electric_power_consumption.zip")
unzip("Electric_power_consumption.zip")
consumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
            stringsAsFactors = FALSE, na.strings = '?')
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption <- subset(consumption, Date == "2007-02-01" | Date == "2007-02-02")
consumption$timestamp <- paste(consumption$Date, consumption$Time)
consumption$timestamp <- strptime(consumption$timestamp, "%Y-%m-%d %H:%M:%S")
png("Plot1.png", width = 480, height = 480)
hist(consumption$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()