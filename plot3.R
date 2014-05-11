# Plot 2 a line plot of Global Active Power against time for the 2 days
# 2007 feb 1 and feb 2.
## Next line read in the data into object power.data
power.data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = classes, na.strings = "?")
feb2007.data <- subset(power.data, Date == "1/2/2007" | Date == "2/2/2007")
feb2007.data$datetime <- as.POSIXct(strptime(paste(feb2007.data$Date, feb2007.data$Time), "%d/%m/%Y %H:%M:%S" ))
x <- feb2007.data$datetime; y <- feb2007.data$Sub_metering_1
png(filename="C:/Users/Gorway Global/Google Drive/Coursera/Data Science Specialisation/Exploratory data analysis/Project1/plot3.png")
plot(x,y, type="l", xlab ="", ylab = "Energy sub metering")
lines(x, feb2007.data$Sub_metering_2, type ="l", col="red")
lines(x, feb2007.data$Sub_metering_3, type ="l", col="blue")
dev.off()
