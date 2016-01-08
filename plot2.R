# read data from 2007-02-01 and 2007-02-02
data <- read.csv("household_power_consumption.txt", skip=66636, nrows=2880, na.strings = "?", sep=";") 
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1, sep=";"))

# convert the Date and Time variables to Date/Time classes
data$Datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# plot 2
png(filename = "plot2.png", width = 480, height = 480)
plot(data$Datetime, data$Global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()