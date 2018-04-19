
##Before running this file, make sure the file "household_power_consumption.txt" is within your working directory


Datafile1 <- "household_power_consumption.txt"
datatable1 <- read.table(Datafile1, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SSD <- datatable1[datatable1$Date %in% c("1/2/2007","2/2/2007") ,]

##str(SSD = SubSetData)
timevar <- strptime(paste(SSD$Date, SSD$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(SSD$Global_active_power)
globalReactivePower <- as.numeric(SSD$Global_reactive_power)
voltage <- as.numeric(SSD$Voltage)
subMetering1 <- as.numeric(SSD$Sub_metering_1)
subMetering2 <- as.numeric(SSD$Sub_metering_2)
subMetering3 <- as.numeric(SSD$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(timevar, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(timevar, voltage, type="l", xlab="timevar", ylab="Voltage")

plot(timevar, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(timevar, subMetering2, type="l", col="red")
lines(timevar, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(timevar, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()