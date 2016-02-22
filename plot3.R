x <- read.csv2("household_power_consumption.txt", header = TRUE)
x_use <- rbind(x[x$Date == "1/2/2007", ], x[x$Date == "2/2/2007", ])

x_use$Sub_metering_1 <- as.numeric(as.character(x_use$Sub_metering_1))
x_use$Sub_metering_2 <- as.numeric(as.character(x_use$Sub_metering_2))
x_use$Sub_metering_3 <- as.numeric(as.character(x_use$Sub_metering_3))
x11()

plot(1:2880, x_use$Sub_metering_1, type = "l", ylab = "Energy sub metering", xaxt = "n", xlab = "")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
points(1:2880, x_use$Sub_metering_2, type = "l", col = "red")
points(1:2880, x_use$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col = c("black", "red", "blue"))

dev.copy(png, "plot3.png", width = 520, height = 480)
dev.off()