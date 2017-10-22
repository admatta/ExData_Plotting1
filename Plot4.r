# Script Plot4.r downloads a file on electric power consumption
# It then transforms the data - Date and time specifically
# It then draws 4 exploratry diagrams in PG format for dates between
# 2007-02-01 and 2007-02-02
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="Electric_power_consumption.zip")
unzip("Electric_power_consumption.zip")
consumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                          stringsAsFactors = FALSE, na.strings = '?')
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption <- subset(consumption, Date == "2007-02-01" | Date == "2007-02-02")
consumption$timestamp <- paste(consumption$Date, consumption$Time)
consumption$timestamp <- strptime(consumption$timestamp, "%Y-%m-%d %H:%M:%S")
png("Plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,1,1))
plot(consumption$timestamp, consumption$Global_active_power, type="l", 
     xlab="",ylab="Global Active Power")
plot(consumption$timestamp, consumption$Voltage, type="l", 
     xlab="datetime",ylab="Voltage")
with(consumption, plot(timestamp,Sub_metering_1,type="s", xlab=""
                       ,ylab="Energy sub metering"))
with(consumption, lines(timestamp, Sub_metering_2, col="red", type="s"))
with(consumption, lines(timestamp, Sub_metering_3, col="blue", type="s"))
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , bty="n", cex=0.7)
plot(consumption$timestamp, consumption$Global_reactive_power, type="l", 
     xlab="datetime",ylab="Global_reactive_power")
dev.off()