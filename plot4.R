#-----Peer-graded Assignment Week 1-----


#---Import dataset into environment---
household_power_consumption <- read.csv("~/Data//household_power_consumption.txt", sep=";")

#---Creating a subset of the data based on the relevant dates---
hhpowercons <- subset.data.frame(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

#---Combining "Date" and "Time" variables into one "DateTime" variable---
hhpowercons$DateTime <- strptime(paste(hhpowercons$Date, hhpowercons$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
hhpowercons <- subset(hhpowercons, select = -c(Date, Time))
DateTime <- strptime(paste(hhpowercons$Date, hhpowercons$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#---Convert variables into numeric variables---
hhpowercons$Global_active_power <- as.numeric(hhpowercons$Global_active_power)
hhpowercons$Global_reactive_power <- as.numeric(hhpowercons$Global_reactive_power)
hhpowercons$Voltage <- as.numeric(hhpowercons$Voltage)
hhpowercons$Global_intensity <- as.numeric(hhpowercons$Global_intensity)
hhpowercons$Sub_metering_1 <- as.numeric(hhpowercons$Sub_metering_1)
hhpowercons$Sub_metering_2 <- as.numeric(hhpowercons$Sub_metering_2)
hhpowercons$Sub_metering_3 <- as.numeric(hhpowercons$Sub_metering_3)


#---Contstructing plot 4---
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(hhpowercons, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(hhpowercons, plot(DateTime, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
with(hhpowercons, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(hhpowercons$DateTime, hhpowercons$Sub_metering_2,type="l", col= "red")
lines(hhpowercons$DateTime, hhpowercons$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(hhpowercons, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()

      