#This script reads in data from "household_power_consumption.txt" and plots 4 different comparisons in one figure.
#Plot 1 (Upper left) is a frequency reading of various values for Global active power.
#Plot 2 (Lower left) is a plot of different sub_meterings over time.
#Plot 3 (Upper right) is a plot of Voltage over time.
#Plot 4 (Lower right) is a plot of Global reactive power over time.

house_data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header = TRUE)
small_data<-house_data[house_data$Date=="1/2/2007" | house_data$Date=="2/2/2007",]

#After converting to character, this combines Date and Time into one value which replaces the old "Time" column.
small_data$Time<-as.POSIXct(paste(as.character(small_data$Date),as.character(small_data$Time)), format = "%d/%m/%Y %H:%M:%S")


#Plot4
png(file="plot4.png", height = 480, width = 480)
par(mfcol=c(2,2))
plot(with(small_data,Global_active_power~Time),type = "l",ylab="Global Active Power (kilowatts)",xlab="")

plot(with(small_data, Sub_metering_1 ~ Time),type = "l", xlab="", ylab = "Energy sub metering")
lines(with(small_data,Sub_metering_2 ~Time),col="red")
lines(with(small_data,Sub_metering_3 ~Time),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))

plot(with(small_data,Voltage ~ Time), xlab="datetime", ylab="Voltage", type="l", yaxt="n")
axis(2,at=seq(234,246,2), labels=c("234","","238","","242","","246"))


plot(with(small_data,Global_reactive_power ~ Time), xlab="datetime", type="l")
dev.off()