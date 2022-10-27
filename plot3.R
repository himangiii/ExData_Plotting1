#creating plot 3:

#plot for sub metering 1
plot(Sub_metering_1 ~ dateTime, data, type = "l", ylab = "Energy sub metering",xlab = "")

#adding line type plot for sub metering 2
lines(Sub_metering_2 ~ dateTime, data, type = "l", col = "red")

#adding line type plot for sub metering 3
lines(Sub_metering_3 ~ dateTime, data, type = "l", col = "blue")

#adding legend at the top right corner to represent the sub meter with line type as 1(solid)
legend("topright", col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1)

#saving the plot as png file
dev.copy(png,"plot3.png", width=480, height=480)

#closing the device
dev.off()
