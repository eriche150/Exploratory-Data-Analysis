#Loading the Data 
library(tidyverse)
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";",stringsAsFactors = FALSE)
#stringsAsFactors is super important when reading in as read.csv. always have this or else subsequent code won't work 
cmbne<-subset(household_power_consumption,Date== "1/2/2007" | Date=="2/2/2007") #subset bc only use data from these two dates
cmbne$Global_active_power<-as.numeric(cmbne$Global_active_power)
cmbne$Date<-as.Date(cmbne$Date,format= "%d/%m/%y")

#Making the Plots
dd<-cmbne$Time #extract data from df put time into 1 vector
dd1<-cmbne$Date #extract data from df and put dates into 1 vector 
dateandtime<-paste(dd1,dd) #conjoins the two vectors together, aligning by cell number 
#str(dateandtime) #chr [1:2880]
xaxis<-strptime(dateandtime, format="%Y-%m-%d %H:%M:%S") #converts the vector of characters into POSIXlt format. 
png("Plot2.png", width=480, height=480)
plot(xaxis,cmbne$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
#type l ensures linear graph, connects data points. 
dev.off()

