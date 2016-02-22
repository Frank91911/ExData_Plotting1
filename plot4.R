x <- read.csv2("household_power_consumption.txt", header = TRUE)
x_use <- rbind(x[x$Date == "1/2/2007", ], x[x$Date == "2/2/2007", ])

x11()
par(mfrow = c(2, 2))

## Plot 1
plot(as.numeric(x_use$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power", xaxt = "n")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

## Plot 2
x_use$Voltage <- as.numeric(as.character(x_use$Voltage))
x_use$Global_reactive_power <- as.numeric(as.character(x_use$Global_reactive_power))

plot(1:2880, x_use$Voltage, type = "l", ylab = "Voltage", xaxt = "n", xlab = "datetime")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

## Plot3
x_use$Sub_metering_1 <- as.numeric(as.character(x_use$Sub_metering_1))
x_use$Sub_metering_2 <- as.numeric(as.character(x_use$Sub_metering_2))
x_use$Sub_metering_3 <- as.numeric(as.character(x_use$Sub_metering_3))

plot(1:2880, x_use$Sub_metering_1, type = "l", ylab = "Energy sub metering", xaxt = "n", xlab = "")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
points(1:2880, x_use$Sub_metering_2, type = "l", col = "red")
points(1:2880, x_use$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col = c("black", "red", "blue"))

## Plot 4
plot(1:2880, x_use$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xaxt = "n", xlab = "datetime")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

dev.copy(png, "plot4.png", width = 520, height = 480)
dev.off()