#This script reads in data from "household_power_consumption.txt" and plots the Global active power vs Time.
house_data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header = TRUE)
small_data<-house_data[house_data$Date=="1/2/2007" | house_data$Date=="2/2/2007",]

#After converting to character, this combines Date and Time into one value which replaces the old "Time" column.
small_data$Time<-as.POSIXct(paste(as.character(small_data$Date),as.character(small_data$Time)), format = "%d/%m/%Y %H:%M:%S")



#Plot 2
png(file="plot2.png", height = 480, width = 480)
plot(with(small_data,Global_active_power~Time),type = "l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()





