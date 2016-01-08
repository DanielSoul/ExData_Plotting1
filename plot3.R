# read data from 2007-02-01 and 2007-02-02
data <- read.csv("household_power_consumption.txt", skip=66636, nrows=2880, na.strings = "?", sep=";") 
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1, sep=";"))

# convert the Date and Time variables to Date/Time classes
data$Datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# plot 3
png(filename = "plot3.png", width = 480, height = 480)
plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(data$Datetime, data$Sub_metering_1, type = "l")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1)
dev.off()
