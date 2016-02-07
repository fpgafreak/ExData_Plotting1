
raw_data <- read.delim("household_power_consumption.txt", sep=";", as.is = TRUE, na.strings = "?")
raw_data$Date = as.Date(raw_data$Date, "%d/%m/%Y")
plot_data <- subset(raw_data, raw_data$Date == "2007-02-01" | raw_data$Date == "2007-02-02")

plot_data$POSIXDate <- strptime(paste(as.character(plot_data$Date), plot_data$Time), format = "%F %T")

png(filename = "plot3.png", width = 480, height = 480)
with(plot_data, plot(POSIXDate, Sub_metering_1, type = "n", xlab = "", ylab ="Energy sub metering"))
points(plot_data$POSIXDate,plot_data$Sub_metering_1, type = "l", lty = 1, lwd = 1, col = "black")
points(plot_data$POSIXDate,plot_data$Sub_metering_2, type = "l", lty = 1, lwd = 1, col ="red")
points(plot_data$POSIXDate,plot_data$Sub_metering_3, type = "l", lty = 1, lwd = 1, col ="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = c(1,1,1))
dev.off()
