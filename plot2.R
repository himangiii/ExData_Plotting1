#creating the plot2 
plot(data$Global_active_power~data$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#saving the plot as png file
dev.copy(png,"plot2.png", width=480, height=480)

#closing the device
dev.off()

