tab5rows <- read.table("household_power_consumption.txt", sep=";", header = TRUE, nrows = 5) # read top 5 rows
classes <- sapply(tab5rows, class) # understand what the class of the columns are
classes[1] <- "character"; classes[2] <- "character" # change the 2 factors to character so we can use as.date
## Next line read in the data into object power.data
power.data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = classes, na.strings = "?")
power.data$Date <- as.Date(power.data$Date, format = "%d/%m/%Y")
#nrow(subset(power.data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02")))
# open plotting device to write plot output to
png(filename="C:/Users/Gorway Global/Google Drive/Coursera/Data Science Specialisation/Exploratory data analysis/Project1/plot1.png")
hist( subset(power.data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))$Global_active_power, 
      col ="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
