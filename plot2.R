#-----Peer-graded Assignment Week 1-----


#---Import dataset into environment---
household_power_consumption <- read.csv("~/Data//household_power_consumption.txt", sep=";")

#---Creating a subset of the data based on the relevant dates---
hhpowercons <- subset.data.frame(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

#---Combining "Date" and "Time" variables into one "DateTime" variable---
hhpowercons$DateTime <- strptime(paste(hhpowercons$Date, hhpowercons$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
hhpowercons <- subset(hhpowercons, select = -c(Date, Time))

#---Convert variables into numeric variables---
hhpowercons$Global_active_power <- as.numeric(hhpowercons$Global_active_power)
hhpowercons$Global_reactive_power <- as.numeric(hhpowercons$Global_reactive_power)
hhpowercons$Voltage <- as.numeric(hhpowercons$Voltage)
hhpowercons$Global_intensity <- as.numeric(hhpowercons$Global_intensity)
hhpowercons$Sub_metering_1 <- as.numeric(hhpowercons$Sub_metering_1)
hhpowercons$Sub_metering_2 <- as.numeric(hhpowercons$Sub_metering_2)
hhpowercons$Sub_metering_3 <- as.numeric(hhpowercons$Sub_metering_3)

#---Contstructing plot 2---
png("plot2.png", height = 480, width = 480)
with(hhpowercons, plot(DateTime, Global_active_power, type = "l"))
dev.off()
