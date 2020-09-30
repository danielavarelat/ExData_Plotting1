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

p1 <- hist(x$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()





