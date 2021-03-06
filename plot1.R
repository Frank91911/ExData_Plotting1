x <- read.csv2("household_power_consumption.txt", header = TRUE)
x_use <- rbind(x[x$Date == "1/2/2007", ], x[x$Date == "2/2/2007", ])
x11()
x_use$Global_active_power <- as.numeric(as.character(x_use$Global_active_power))
hist(x_use$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()