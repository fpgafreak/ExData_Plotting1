
raw_data <- read.delim("household_power_consumption.txt", sep=";", as.is = TRUE, na.strings = "?")
raw_data$Date = as.Date(raw_data$Date, "%d/%m/%Y")
plot_data <- subset(raw_data, raw_data$Date == "2007-02-01" | raw_data$Date == "2007-02-02")

plot_data$datetime <- strptime(paste(as.character(plot_data$Date), plot_data$Time), format = "%F %T")

png(filename = "plot2.png", width = 480, height = 480)
with(plot_data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab ="Global Active Power (kilowatts)"))
dev.off()
