#This script reads in data from "household_power_consumption.txt" and plots 3 different Sub_meterings over time.
house_data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header = TRUE)
small_data<-house_data[house_data$Date=="1/2/2007" | house_data$Date=="2/2/2007",]

#After converting to character, this combines Date and Time into one value which replaces the old "Time" column.
small_data$Time<-as.POSIXct(paste(as.character(small_data$Date),as.character(small_data$Time)), format = "%d/%m/%Y %H:%M:%S")



#Plot 3
png(file="plot3.png", height = 480, width = 480)
plot(with(small_data, Sub_metering_1 ~ Time),type = "l", xlab="", ylab = "Energy sub metering")
lines(with(small_data,Sub_metering_2 ~Time),col="red")
lines(with(small_data,Sub_metering_3 ~Time),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
dev.off()

