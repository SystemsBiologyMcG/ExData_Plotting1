#Read Data into R
setwd('/Users/cmcginni/Desktop/Coursera')
Data <- "household_power_consumption.txt"
ElecData <- read.table(Data, header=TRUE, sep=";", dec=".", na.strings="?", nrows=72000)
ElecData <- subset(ElecData, Date == "1/2/2007" | Date == "2/2/2007")

#Set Variables
Dates <- as.Date(ElecData$Date, format="%d/%m/%Y")
Times <- ElecData$Time
DateTime <- as.POSIXct(paste(as.character(Dates),as.character(Times)))
x <- DateTime
y <- ElecData$Global_active_power
y1 <- ElecData$Sub_metering_1
y2 <- ElecData$Sub_metering_2
y3 <- ElecData$Sub_metering_3
v <- ElecData$Voltage
rp <- ElecData$Global_reactive_power

#Create multi-paneled plotting window
par(mfrow=c(2,2))

#Make Plot 4
plot(x,y,xlab="",ylab="Global Active Power (kilowatts)",type="l")
plot(x,v,xlab="datetime",ylab="Voltage", type="l")
plot(x,y1,type="n",xlab="",ylab="Energy sub metering")
points(x,y1,type="l",col="black")
points(x,y2,type="l",col="red")
points(x,y3,type="l",col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
	lty=c(1,1,1), col=c("black","red","blue"), bty="n")
plot(x,rp,xlab="datetime",ylab="Global_reactive_power", type="l")

#Save plot as a PNG file, reset graphics to quartz
dev.copy(png,'plot4.png', width=480, height=480)
dev.set(2)