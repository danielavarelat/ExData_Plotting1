library(dplyr)
files_dir = "C:\\Users\\danie\\Documents\\data_science_spe\\ExploratoryAnalysis"

setwd(files_dir)
d = read.table("household_power_consumption.txt", 
               sep=";", 
               fill=FALSE, 
               strip.white=TRUE, 
               header=TRUE, na.strings = "?")

d$Date <- as.Date(d$Date, format= "%d/%m/%Y")
x$fulldate <- strptime(paste(x$Date, x$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

x<- d %>% filter(d$Date >= as.Date("2007-02-01") &  d$Date <= as.Date("2007-02-02"))

par(mfrow=c(2,2))
plot(x$fulldate,x$Global_active_power,type="l", ylab='Global Active Power (kilowatts)', xlab='')
plot(x$fulldate,x$Voltage,type="l", ylab='Voltage', xlab='')
plot(x$fulldate, x$Sub_metering_1, type='n', ylab="Energu sub metering")
lines(x$fulldate,x$Sub_metering_1,col="black", type="l", ylab='Global Active Power (kilowatts)', xlab='')
lines(x$fulldate,x$Sub_metering_2,col="red", type="l", ylab='Global Active Power (kilowatts)', xlab='')
lines(x$fulldate,x$Sub_metering_3,col="blue", type="l", ylab='Global Active Power (kilowatts)', xlab='')
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lty=1)
plot(x$fulldate,x$Global_reactive_power,type="l", ylab='Global reactive Power (kilowatts)', xlab='')

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
