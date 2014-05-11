#Plot 4 - part of project 1 of Exploratory data analysis Coursera
# 2007 feb 1 and feb 2.

## Next line read in the data into object power.data
power.data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = classes, na.strings = "?")
feb2007.data <- subset(power.data, Date == "1/2/2007" | Date == "2/2/2007")
feb2007.data$datetime <- as.POSIXct(strptime(paste(feb2007.data$Date, feb2007.data$Time), "%d/%m/%Y %H:%M:%S" ))
x <- feb2007.data$datetime; y <- feb2007.data$Sub_metering_1; z <- feb2007.data$Voltage
a <- feb2007.data$Sub_metering_1; b <- feb2007.data$Sub_metering_2; C <- feb2007.data$Sub_Metering_3
png(filename="C:/Users/Gorway Global/Google Drive/Coursera/Data Science Specialisation/Exploratory data analysis/Project1/plot4.png")
oldpar <- par(mfrow = c(2,2))
y <- feb2007.data$Global_active_power; x <- feb2007.data$datetime
plot(x, y, xlab = "", ylab = "Global Active Power", type = "l",)
plot(x,z,xlab = "datetime", ylab = "Voltage", type = "l")
plot(x,a, type="l", xlab ="", ylab = "Energy sub metering")
lines(x, feb2007.data$Sub_metering_2, type ="l", col="red")
lines(x, feb2007.data$Sub_metering_3, type ="l", col="blue")
plot(x,y, type ="h", xlab ="datetime", ylab = "Global_active_power")
par(oldpar)
dev.off()
