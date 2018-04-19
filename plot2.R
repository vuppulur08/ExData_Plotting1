
##Before running this file, make sure the file "household_power_consumption.txt" is within your working directory


Datafile1 <- "household_power_consumption.txt"
datatable1 <- read.table(Datafile1, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SSD <- datatable1[datatable1$Date %in% c("1/2/2007","2/2/2007") ,]

##str(SSD = SubSetData)
timevar <- strptime(paste(SSD$Date, SSD$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(timevar, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()