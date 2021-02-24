#Loading the Data 
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";")
dim(household_power_consumption)
str(household_power_consumption) #tells me Date is in chr format 
table(household_power_consumption$Date)
household_power_subset<-subset(household_power_consumption,Date== "1/2/2007" | Date=="2/2/2007")
household_power_subset$Date<-as.Date(household_power_subset$Date)
household_power_subset$Global_active_power<-as.numeric(household_power_subset$Global_active_power)
#Making Plots 
png("Plot 1.png", width=480, height=480)
hist(household_power_subset$Global_active_power, col="red", main="Global Active Power",
     xlab= "Global Active Power (kilowatts)")
dev.off()
