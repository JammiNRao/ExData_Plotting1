# Plot 2 a line plot of Global Active Power against time for the 2 days
# 2007 feb 1 and feb 2.
tab5rows <- read.table("household_power_consumption.txt", sep=";", header = TRUE, nrows = 5) # read top 5 rows
classes <- sapply(tab5rows, class) # understand what the class of the columns are
classes[1] <- "character"; classes[2] <- "character" # change the 2 factors to character so we can use as.date
## Next line read in the data into object power.data
power.data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = classes, na.strings = "?")
feb2007.data <- subset(power.data, Date == "1/2/2007" | Date == "2/2/2007")
#power.data$Date <- as.Date(power.data$Date, format = "%d/%m/%Y")
#hist( subset(power.data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))$Global_active_power, 
      #col ="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#feb2007.data <- subset(power.data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
nrow(feb2007.data)
feb2007.data$datetime <- as.POSIXct(strptime(paste(feb2007.data$Date, feb2007.data$Time), "%d/%m/%Y %H:%M:%S" ))
class(feb2007.data$datetime)
png(filename="C:/Users/Gorway Global/Google Drive/Coursera/Data Science Specialisation/Exploratory data analysis/Project1/plot2.png")
plot(feb2007.data$datetime, feb2007.data$Global_active_power, type="l")
