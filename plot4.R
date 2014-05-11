#Plot 4 - part of project 1 of Exploratory data analysis Coursera
# 2007 feb 1 and feb 2.

## Next line read in the data into object power.data
power.data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = classes, na.strings = "?")
feb2007.data <- subset(power.data, Date == "1/2/2007" | Date == "2/2/2007")
feb2007.data$datetime <- as.POSIXct(strptime(paste(feb2007.data$Date, feb2007.data$Time), "%d/%m/%Y %H:%M:%S" ))
x <- feb2007.data$datetime
y <- feb2007.data$Global_active_power
z <- feb2007.data$Voltage
a <- feb2007.data$Sub_metering_1
b <- feb2007.data$Sub_metering_2
C <- feb2007.data$Sub_Metering_3
png(filename="plot4.png")
oldpar <- par(mfrow = c(2,2))
plot(x, y, xlab = "", ylab = "Global Active Power", type = "l",) # this is the first plot
plot(x,z,xlab = "datetime", ylab = "Voltage", type = "l") # this is the second plot
plot(x,a, type="n", xlab ="", ylab = "Energy sub metering")
lines(x, a, type ="l", col ="black")
lines(x, b, type ="l", col="red")
lines(x, c, type ="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), lwd = c(2,2,2), col = c("black", "red", "blue"))

plot(x,y, type ="h", xlab ="datetime", ylab = "Global_active_power") # the 4th plot
par(oldpar)
dev.off()
# end of code

