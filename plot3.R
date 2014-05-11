# Plot 2 a line plot of Global Active Power against time for the 2 days
# 2007 feb 1 and feb 2.
## Next line read in the data into object power.data
power.data <- read.table("C:/Users/Gorway Global/Google Drive/Coursera/Data Science Specialisation/Exploratory data analysis/Project1/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
feb2007.data <- subset(power.data, Date == "1/2/2007" | Date == "2/2/2007")
feb2007.data$datetime <- as.POSIXct(strptime(paste(feb2007.data$Date, feb2007.data$Time), "%d/%m/%Y %H:%M:%S" ))
x <- feb2007.data$datetime; a <- feb2007.data$Sub_metering_1
b <- feb2007.data$Sub_metering_2; c <- feb2007.data$Sub_metering_3
png(filename="plot3.png")
plot(x,a, type="n", xlab ="", ylab = "Energy sub metering")
lines(x, a, type ="l", col ="black")
lines(x, b, type ="l", col="red")
lines(x, c, type ="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), lwd = c(2,2,2), col = c("black", "red", "blue"))
dev.off()
