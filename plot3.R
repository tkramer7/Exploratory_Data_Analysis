file_name = "./household_power_consumption.txt"
data <- read.table(file_name, header=T, sep=';', na.strings="?", 
                   check.names=F, stringsAsFactors=F)

#set a subset of the data to specified date range
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)

# set x and y variables for the datetime and globalActivePower, respectively
x_datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
y_subMeter1 <- as.numeric(data_subset$Sub_metering_1)
y_subMeter2 <- as.numeric(data_subset$Sub_metering_2)
y_subMeter3 <- as.numeric(data_subset$Sub_metering_3)
# Set the png file device
png(filename="plot3.png", width=480, height=480)
# Create plot
plot(x_datetime, y_subMeter1, type="l", xlab="", ylab="Energy sub metering")
lines(x_datetime, y_subMeter2, col = "red")
lines(x_datetime, y_subMeter3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Close the png file device
dev.off()
