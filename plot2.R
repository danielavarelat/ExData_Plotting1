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

plot(x$fulldate,x$Global_active_power,type="l", ylab='Global Active Power (kilowatts)', xlab='')
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

