#creating the histogram of global active power as x axis and frequency as y axis
hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

#saving the plot as png file
dev.copy(png,"plot1.png", width=480, height=480)

#closing the device
dev.off()
