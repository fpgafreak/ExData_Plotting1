
raw_data <- read.delim("household_power_consumption.txt", sep=";", as.is = TRUE, na.strings = "?")
raw_data$Date = as.Date(raw_data$Date, "%d/%m/%Y")
plot_data <- subset(raw_data, raw_data$Date == "2007-02-01" | raw_data$Date == "2007-02-02")

plot_data$datetime <- strptime(paste(as.character(plot_data$Date), plot_data$Time), format = "%F %T")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(plot_data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab ="Global Active Power"))

with(plot_data, plot(datetime, Voltage, type = "l"))    
    
with(plot_data, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab ="Energy sub metering"))
points(plot_data$datetime,plot_data$Sub_metering_1, type = "l", lty = 1, lwd = 1, col = "black")
points(plot_data$datetime,plot_data$Sub_metering_2, type = "l", lty = 1, lwd = 1, col ="red")
points(plot_data$datetime,plot_data$Sub_metering_3, type = "l", lty = 1, lwd = 1, col ="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty ="n", col = c("black", "red", "blue"), lwd = c(1,1,1))

with(plot_data, plot(datetime, Global_reactive_power, type = "l"))    

dev.off()
