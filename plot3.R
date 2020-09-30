library(dplyr)
files_dir = "C:\\Users\\danie\\Documents\\data_science_spe\\ExploratoryAnalysis"

setwd(files_dir)
d = read.table("household_power_consumption.txt", 
               sep=";", 
               fill=FALSE, 
               strip.white=TRUE, 
               header=TRUE, na.strings = "?")

d$Date <- as.Date(d$Date, format= "%d/%m/%Y")

x<- d %>% filter(d$Date >= as.Date("2007-02-01") &  d$Date <= as.Date("2007-02-02") )

x$day<-as.factor(weekdays(x$Date))

x$fulldate <- strptime(paste(x$Date, x$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

plot(x$fulldate, x$Sub_metering_1, type='n', ylab="Energu sub metering")
lines(x$fulldate,x$Sub_metering_1,col="black", type="l", ylab='Global Active Power (kilowatts)', xlab='')
lines(x$fulldate,x$Sub_metering_2,col="red", type="l", ylab='Global Active Power (kilowatts)', xlab='')
lines(x$fulldate,x$Sub_metering_3,col="blue", type="l", ylab='Global Active Power (kilowatts)', xlab='')
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lty=1)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
