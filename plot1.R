#Read Data into R
setwd('/Users/cmcginni/Desktop/Coursera')
Data <- "household_power_consumption.txt"
ElecData <- read.table(Data, header=TRUE, sep=";", dec=".", na.strings="?", nrows=72000)
ElecData <- subset(ElecData, Date == "1/2/2007" | Date == "2/2/2007")


#Make Plot 1
hist(ElecData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
	main = "Global Active Power")

#Save plot as a PNG file, reset graphics to quartz
dev.copy(png,'plot1.png', width=480, height=480)
dev.set(2)