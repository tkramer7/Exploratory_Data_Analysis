file_name = "./household_power_consumption.txt"
data <- read.table(file_name, header=T, sep=';', na.strings="?", 
                   check.names=F, stringsAsFactors=F)

#set a subset of the data to specified date range
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)
# set x and y variables for the datetime and globalActivePower, respectively
x_datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
y_globalActivePower <- as.numeric(data_subset$Global_active_power)
# Set the png file device
png(filename = "plot2.png", width=480, height=480)
# Create plot
plot(x_datetime, y_globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# Close the png file device
dev.off()