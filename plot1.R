#This script reads in data from "household_power_consumption.txt" and plots the frequency of various values of Global Active Power Readings.
house_data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header = TRUE)
small_data<-house_data[house_data$Date=="1/2/2007" | house_data$Date=="2/2/2007",]


#Plot 1
png(file="plot1.png", height = 480, width = 480)
hist(with(small_data,Global_active_power),xlab="Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")
dev.off()




