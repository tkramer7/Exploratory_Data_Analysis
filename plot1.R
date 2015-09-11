data <- read.table("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      check.names=F, stringsAsFactors=F)

data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# remove original, large data set to free up memory
rm(data)

png(filename="plot1.png", width=480, height=480)

## Create the plot
hist(data_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="Red")

# Close the png file device
dev.off()