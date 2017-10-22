# Script Plot2.r downloads a file on electric power consumption
# It then transforms the data - Date and time specifically
# It then plots global active power movements for dates between
# 2007-02-01 and 2007-02-02 and output the result in PNG format
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="Electric_power_consumption.zip")
unzip("Electric_power_consumption.zip")
consumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                          stringsAsFactors = FALSE, na.strings = '?')
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption <- subset(consumption, Date == "2007-02-01" | Date == "2007-02-02")
consumption$timestamp <- paste(consumption$Date, consumption$Time)
consumption$timestamp <- strptime(consumption$timestamp, "%Y-%m-%d %H:%M:%S")
png("Plot2.png", width = 480, height = 480)
plot(consumption$timestamp, consumption$Global_active_power, type="l", 
     xlab="",ylab="Global Active Power (kilowatts)")
dev.off()