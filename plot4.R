file_name = "./household_power_consumption.txt"
data <- read.table(file_name, header=T, sep=';', na.strings="?", 
                   check.names=F, stringsAsFactors=F, colClasses=c("character", "character", "numeric",
                                                                   "numeric", "numeric", "numeric",
                                                                   "numeric", "numeric", "numeric"))

#set a subset of the data to specified date range
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)

# set x and y variables for the datetime and globalActivePower, respectively
x_datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Set the png file device
png(filename="plot4.png", width=480, height=480)
#Set the layout, inner and outer margins
par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))


# Create plots
with(data_subset, {
    # First plot, top left
    plot(x_datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    # Second plot, bottom left
    plot(x_datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(x_datetime, Sub_metering_2, col = "red")
    lines(x_datetime, Sub_metering_3, col = "blue")
    #legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")
    # Third plot - Voltage, top right
    plot(x_datetime, Voltage, type="l",
       xlab="datetime", ylab="Voltage")
    
    # Fourth plot - Reactive Power, bottom right
    plot(x_datetime, Global_reactive_power, type="l",
       xlab="datetime", ylab="Global_reactive_power")
})

# Close the png file device
dev.off()
