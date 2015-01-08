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

#Make Plot 2
plot(x,y,xlab="",ylab="Global Active Power (kilowatts)",type="l")

#Save plot as a PNG file, reset graphics to quartz
dev.copy(png,'plot2.png', width=480, height=480)
dev.set(2)