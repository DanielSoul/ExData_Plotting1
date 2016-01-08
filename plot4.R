# read data from 2007-02-01 and 2007-02-02
data <- read.csv("household_power_consumption.txt", skip=66636, nrows=2880, na.strings = "?", sep=";") 
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1, sep=";"))

# convert the Date and Time variables to Date/Time classes
data$Datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# plot 4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(data$Datetime, data$Global_active_power, type = 'l', ylab = "Global Active Power", xlab = "")

with(data, plot(Datetime, Voltage, xlab = "datetime", type = "l"))

plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(data$Datetime, data$Sub_metering_1, type = "l")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), bty="n", lwd = 1, cex = 0.7,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(data, plot(Datetime, Global_reactive_power, xlab = "datetime", type = "l"))

dev.off()