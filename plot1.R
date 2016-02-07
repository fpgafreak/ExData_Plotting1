
raw_data <- read.delim("household_power_consumption.txt", sep=";", as.is = TRUE, na.strings = "?")
raw_data$Date = as.Date(raw_data$Date, "%d/%m/%Y")
plot_data <- subset(raw_data, raw_data$Date == "2007-02-01" | raw_data$Date == "2007-02-02")

png(filename = "plot1.png", width = 480, height = 480)
hist(plot_data$Global_active_power, col = "red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)")
dev.off()
