#Plot 4:

# Graphic device with 2 rows, 2 columns:
par(mfrow = c(2, 2))

# plot a (top left)
plot(Global_active_power ~ dateTime, data, type = "l", ylab = "Global Active Power (kilowatts)",xlab = "")

# plot b (top right)
plot(Voltage ~ dateTime, data, type = "l")

# plot c (bottom left)
plot(Sub_metering_1 ~ dateTime, data, type = "l", ylab = "Energy sub metering",xlab = "")
lines(Sub_metering_2 ~ dateTime, data, type = "l", col = "red")
lines(Sub_metering_3 ~ dateTime, data, type = "l", col = "blue")
legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty = 1,bty = "n")

# plot c (bottom right)
plot(Global_reactive_power ~ dateTime, data, type = "l")

#saving the plot as png file
dev.copy(png,"plot4.png", width=480, height=480)

#closing the device
dev.off()
